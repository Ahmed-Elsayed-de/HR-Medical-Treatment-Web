# Business Logic Document / وثيقة منطق الأعمال

## HR-Medical-Treatment-Web — Petromint Medical Treatment Management System

---

# English Section

---

## 1. System Overview

**HR-Medical-Treatment-Web** is a corporate medical treatment management system for **Petromint** company. It enables HR and medical claims staff to create, process, confirm, and print medical treatment tickets (خطابات علاج) for employees and their eligible dependents.

| Aspect | Detail |
|---|---|
| **Technology** | ASP.NET Web Forms (VB.NET) + SQL Server |
| **Authentication** | Forms Authentication + ASP.NET Membership |
| **Reporting** | Microsoft Report Viewer (RDLC local reports) → PDF |
| **Database** | MT database + Linked Server to HR database |
| **Audience** | HR administrators, medical claims processors |

### Core Value

The system automates the medical benefit administration workflow — from employee eligibility verification through ticket creation, doctor/pharmacy confirmation, financial calculation (company vs. employee cost sharing), and final PDF printing.

---

## 2. Core Business Entities

| Entity (Table) | Role |
|---|---|
| **MtTickets** | Central transactional record — every medical treatment request. Stores financial breakdown (40+ fields), confirmations, patient type, audit trail. |
| **MtItems** | Catalog of covered medical treatments. Each item has per-person max limits and a `SpecialNeed` flag that triggers different financial routing. |
| **MtContractors** | Medical providers — hospitals, clinics, pharmacies. Classified by `Kind`, with bank details for payments. |
| **MtRules** | Annual financial policy: ceilings, copay percentages, drug deduction rates, wife-tiered limits. One row per year. |
| **HRdata** (View) | Employee master data from HR database via Linked Server. Contains `Code`, `Regist_No1`, name, employment status, job type. |
| **MedicalNotes** | Per-employee medical notes maintained by HR. |
| **MtCategorization** | Ticket categorization lookup. |
| **MtRelatives** | Family relationship types (son, daughter, wife). |
| **MtJobType** | Job-level classification for wife-tiered limits. |
| **City** | City/district lookup for contractors. |
| **Children** (View) | Employee dependents from HR database. |
| **MaxFamilyEmp** (View) | Pre-calculated yearly totals per employee of family co-sharehold used. |
| **MtTicketRpt** (View) | Denormalized view joining tickets + employees + contractors for PDF reports. |

---

## 3. Business Processes

### 3.1 Employee Eligibility

Employees appear in the system via a Linked Server query to `HR.dbo.HrData`. They are eligible for medical treatment if:

- Their employment status is NOT `إنهاء عمل` (terminated), OR
- They ARE terminated but their end-of-service type is one of:
  - `معاش` (Pension)
  - `عجز` (Disability)
  - `بدون` (Without reason)

This ensures terminated employees who retain medical benefits remain in the system.

**Implementation** (`MtNewTickets.aspx.vb`):
```sql
SELECT HRdata.Regist_No1
FROM HRdata
INNER JOIN MedicalNotes m ON HRdata.Code = m.Code
INNER JOIN HR..[1112] x ON HRdata.Code = x.Code
WHERE (
  (HRdata.الموقف_الحالي <> N'إنهاء عمل')
  OR (HRdata.الموقف_الحالي = N'إنهاء عمل' AND x.إنهاء_عمل IN (N'معاش', N'عجز', N'بدون'))
)
```

### 3.2 Ticket Creation Workflow

```
Step 1: Employee Selection
  ├── Navigate employee list (prev/next/first/last)
  ├── Employee data displayed (name, status, job, dependents)
  └── Visual status indicator: Green (active) / Red (terminated)

Step 2: Select Treatment Item
  ├── Open modal popup with searchable MtItems grid
  ├── Select treatment type → code resolves TreatType name
  └── SpecialNeed flag cached for financial routing

Step 3: Enter Ticket Details
  ├── Select medical provider (Contractors dropdown)
  ├── Select pharmacy (Contractors2 dropdown, filtered to صيدلية kind)
  ├── Choose TreatKind: Personal (شخصى) or Family (أسرى)
  ├── If Family: select relative type from MtRelatives
  ├── Enter notes, pharmacy memo, hospital level
  └── Enter financial fields (if any initial deductions)

Step 4: Insert
  ├── 19 columns inserted into MtTickets
  ├── TreatType name denormalized into ticket for fast display
  ├── @@identity captured for auto-print
  └── Audit fields auto-populated

Step 5: Auto-Print
  └── Immediate popup opens MtPrint.aspx?id=<newId>
```

**Batch Creation**: HR can create N identical tickets (e.g., for recurring monthly treatments). The system inserts in a loop, collecting all IDs for batch printing.

### 3.3 Ticket Processing — The DocAndPharmcy State Machine

This is the **core business logic** (~900 lines in `MtTicketsByID.aspx.vb`). It controls which 15 financial fields are enabled/disabled based on **4 input variables**:

| Variable | Values | Meaning |
|---|---|---|
| `SpecialNeed` | نعم / لا | Whether treatment item is flagged as special need |
| `ddlDokConfirm` | 0 / 1 | Doctor confirmation status |
| `ddlPharmConfirm0` | 0 / 1 | Pharmacy confirmation status |
| `ddlTreatKind` | 0 (شخصى) / 1 (أسرى) | Personal vs. Family treatment |

#### Decision Matrix

| # | SpecialNeed | Dr | Pharm | TreatKind | Active Fields | Disabled/Zeroed |
|---|---|---|---|---|---|---|
| 1 | نعم | 1 | 1 | Any | CheckS, LocaldeductS, ForeignDeductS | All other Check/Local/Foreign fields |
| 2 | نعم | 1 | 0 | Any | CheckS, LocaldeductS | ForeignDeduct* + Pharm fields |
| 3 | نعم | 0 | 1 | Any | LocaldeductS, ForeignDeductS | Check* + Dr fields |
| 4 | نعم | 0 | 0 | Any | ALL DISABLED | All financial fields |
| 5 | لا | 1 | 1 | شخصى | Check, Check1, Check2, Localdeduct, Localdeduct1, Localdeduct2, ForeignDeduct, ForeignDeduct1, ForeignDeduct2 | F & S fields |
| 6 | لا | 1 | 0 | شخصى | Check, Check1, Check2 | Localdeduct*, ForeignDeduct* |
| 7 | لا | 0 | 1 | شخصى | Localdeduct, Localdeduct1, Localdeduct2, ForeignDeduct, ForeignDeduct1, ForeignDeduct2 | Check* |
| 8 | لا | 0 | 0 | شخصى | ALL DISABLED | All financial fields |
| 9 | لا | 1 | 1 | أسرى | CheckF, LocaldeductF, ForeignDeductF | Personal (Check, Check1, Check2) |
| 10 | لا | 1 | 0 | أسرى | CheckF | LocaldeductF, ForeignDeductF |
| 11 | لا | 0 | 1 | أسرى | LocaldeductF, ForeignDeductF | CheckF |
| 12 | لا | 0 | 0 | أسرى | ALL DISABLED | All financial fields |

#### Financial Field Structure

Each of the 5 categories has 5 variants, forming a **5×5 matrix**:

```
            Personal  Personal1  Personal2  Family  Special
            (base)    (Level 1)  (Level 2)  (F)     (S)
───────     ────────  ─────────  ─────────  ──────  ───────
Check        Check     Check1     Check2     CheckF  CheckS
Localdeduct  LocDed    LocDed1    LocDed2    LocDedF  LocDedS
ForeignDed   ForDed    ForDed1    ForDed2    ForDedF  ForDedS
CoSharehold  CoSh      CoSh1      CoSh2      CoShF    CoShS
EmpSharehold EmpSh     EmpSh1     EmpSh2     EmpShF   EmpShS
```

**Plus aggregated net fields**: `CoShareholdNet`, `EmpShareholdNet`, `CoShareholdSurgNet`

#### Additional Side Effects

- **Confirmation dates**: Auto-filled with `Date.Now` when respective dropdown set to confirmed
- **Billing numbers**: `BillingNo` (doctor) / `BillingNo1` (pharmacy) enabled/disabled with confirmation
- **Family Box checkbox** (`chbFamilyBox`): Enabled only for non-special family treatments
- **CoShareholdSurgNet**: Aggregated surgery co-sharehold net amount

### 3.4 Annual Rules Configuration

Each year an administrator configures a row in `MtRules` defining:

**Two-tier ceiling system:**
- **Level 1** (regular employees): `MaxBefore` / `Max` with `EmpPercent` copay
- **Level 2** (executives, الرقم 66): `MaxBefore66` / `Max66` with separate `EmpPercent66`

**Drug deduction rates:**
- `LocaldeductPercent`: Local pharmacy deduction percentage
- `ForeignDeductPercent`: Imported pharmacy deduction percentage

**Wife-tiered limits** — 6 job levels × 4 tiers each (base, +1, +2, +3):
- Chairman (الرقم 11) → `Wife11`, `WifePlus111`, `WifePlus211`, `WifePlus311`
- Asst Chairman (الرقم 22) → `Wife22`, `WifePlus122`, `WifePlus222`, `WifePlus322`
- General Manager (الرقم 33) → `Wife33`, `WifePlus133`, `WifePlus233`, `WifePlus333`
- Asst GM (الرقم 44) → `Wife44`, `WifePlus144`, `WifePlus244`, `WifePlus344`
- Level 1 (الرقم 55) → `Wife55`, `WifePlus155`, `WifePlus255`, `WifePlus355`
- Level 2 (الرقم 66) → `Wife66`, `WifePlus166`, `WifePlus266`, `WifePlus366`

### 3.5 Printing Workflow

**Trigger**: After ticket creation (auto-print) or manual print button.

**Process** (`MtPrint.aspx.vb`):
```
1. Accept ticket ID(s) via query string: ?id=123,124,125[&typ=mngr]
2. Query MtTicketRpt view WHERE Id_3101 IN (ids)
3. Select report definition:
   - Litters.rdlc → standard ticket
   - Litters2.rdlc → manager-specific format (when typ=mngr)
4. Bind data to DataSet1 in RDLC
5. Render to PDF via LocalReport.Render("PDF")
6. Stream raw PDF to browser via Response.BinaryWrite
```

**MtTicketRpt View** joins:
- `MtTickets` (full ticket data)
- `HRdata` (employee name, code, registration number, photo)
- `MtContractors` (provider address, phone, notes)

---

## 4. Financial Calculation Model

### 4.1 Cost Sharing Logic

Treatment costs are split between **Company** (`CoSharehold*`) and **Employee** (`EmpSharehold*`):

```
If treatment total ≤ yearly ceiling (Max):
  Company pays = total (or total × (1 - EmpPercent))
  Employee pays = 0 (or total × EmpPercent)

If treatment total > yearly ceiling:
  Company pays = ceiling
  Employee pays = total - ceiling (plus any copay on excess)
```

### 4.2 Family Maximum Tracking

Two views track family benefit usage:

1. **`MaxFamilyEmp` view**: Pre-calculated `SUM(CoShareholdF)` per employee per year
2. **Direct query**: `SUM(CoShareholdF)` FROM `MtTickets WHERE FamilyBox=1`

Displayed in the Family Data page to show used vs. remaining allocation.

---

## 5. Security & Audit Model

### 5.1 Authentication
- Forms Authentication with ASP.NET Membership (`aspnet_Membership`, `aspnet_Roles`)
- Session guard: Master page checks `Session("pcName")` — redirects to login if null

### 5.2 Authorization
- Custom `WebUserSecurityManager` control on every page
- Controls New/Edit/Delete button visibility based on user permissions for `MedicalTreatment` application

### 5.3 Audit Trail

Every table carries audit columns:
- `CreatedDate` / `CreatedBy`
- `LastModifiedDate` / `LastModifiedBy`
- `WinHostName` / `WinUserName`
- `IsDeleted` / `DeletedBy` / `DeleteDate` (soft delete)

### 5.4 Error Handling
- All pages implement `Page_Error`
- `ExceptionHelper.HandleException` logs to `~/Logs/Log.log`
- Redirects to `Error.aspx`

---

## 6. Integration: Linked Server to HR Database

The MT database connects to a separate **HR database** via SQL Server Linked Server:

| HR Object | Purpose in MT |
|---|---|
| `HR.dbo.HrData` | Employee master data (name, status, job, personal info) |
| `HR..Children` | Employee children with age calculation |
| `HR..[1112]` | End-of-service types for eligibility filtering |
| `HR..Wives` | Employee spouse data |

**Direction**: Read-only from HR → MT. The MT system never writes to the HR database.

---

## 7. Soft-Delete Pattern

All major entities use logical deletion:

```sql
-- Tickets
UPDATE MtTickets SET IsDeleated = 1, DeletedBy = @DeletedBy WHERE Id_3101 = @Id_3101

-- Items
UPDATE MtItems SET IsDeleted = 1, DeletedBy = @DeletedBy WHERE id = @id

-- Contractors
UPDATE MtContractors SET IsDeleted = 1, DeletedBy = @DeletedBy, DeleteDate = GETDATE() WHERE id = @id
```

All queries filter `WHERE IsDeleted = 0` (or `IsDeleated = 0`).

---

## 8. State Management

The application uses ASP.NET `ViewState` extensively:

| ViewState Key | Type | Purpose |
|---|---|---|
| `emps` | ArrayList | Employee registration numbers for navigation |
| `empIndx` | Integer | Current employee index |
| `indx` | Integer | Current ticket page index |
| `SpecialNeed` | String | Cached SpecialNeed flag from MtItems |
| `TransID` | Integer | Last inserted ticket ID (for auto-print) |
| `hasData` | Boolean | Whether ticket query returned rows |
| `changed` | Boolean | Whether update is needed |
| `cancle` | String | Cancellation flag |

---

# Arabic Section / القسم العربي

---

## 1. نظرة عامة على النظام

**نظام إدارة العلاج الطبي** هو نظام مؤسسي لإدارة ملفات العلاج الطبي لموظفي شركة **بترومنت**. يتيح لموظفي الموارد البشرية وشؤون العاملين إنشاء ومتابعة وطباعة خطابات العلاج للموظفين والمستحقين.

| العنصر | التفاصيل |
|---|---|
| **التقنية** | ASP.NET Web Forms (VB.NET) + SQL Server |
| **المصادقة** | Forms Authentication + ASP.NET Membership |
| **التقارير** | Microsoft Report Viewer → PDF |
| **قاعدة البيانات** | قاعدة بيانات MT + Linked Server إلى قاعدة بيانات الموارد البشرية |
| **المستخدمون** | مسئولي الموارد البشرية ومعالجي المطالبات الطبية |

### القيمة الأساسية

يقوم النظام بأتمتة سير عمل إدارة المنافع العلاجية — بدءًا من التحقق من أهلية الموظف مرورًا بإنشاء خطاب العلاج، تأكيد الطبيب والصيدلية، الحسابات المالية (تقسيم التكلفة بين الشركة والموظف)، والطباعة النهائية بصيغة PDF.

---

## 2. الكيانات الأساسية

| الكيان (الجدول) | الدور |
|---|---|
| **MtTickets** | السجل المركزي — كل طلب علاج هو "خطاب". يخزن التفاصيل المالية (40+ حقل)، التأكيدات، نوع المريض، سجل التدقيق. |
| **MtItems** | كتالوج أنواع العلاج. لكل بند حدود قصوى لكل فرد وعلامة `SpecialNeed` (بند خاص). |
| **MtContractors** | مقدمي الخدمة — مستشفيات، عيادات، صيدليات. مصنفة حسب `Kind` مع بيانات بنكية للدفع. |
| **MtRules** | سياسة العلاج السنوية: سقوف، نسب تحمل، خصم الأدوية، حدود الزوجات. صف واحد لكل سنة. |
| **HRdata** (View) | بيانات الموظفين الرئيسية من قاعدة بيانات الموارد البشرية عبر Linked Server. |
| **MedicalNotes** | ملاحظات طبية لكل موظف. |
| **MtCategorization** | قائمة تصنيفات الخطابات. |
| **MtRelatives** | أنواع صلة القرابة (ابن، ابنة، زوجة). |
| **MtJobType** | تصنيف المستوى الوظيفي لتحديد حدود الزوجات. |
| **City** | قائمة المدن/المناطق للمتعاقدين. |
| **Children** (View) | أبناء الموظفين من قاعدة بيانات الموارد البشرية. |
| **MaxFamilyEmp** (View) | إجمالي السنوي المستخدم لكل موظف من حصة العائلة. |
| **MtTicketRpt** (View) | عرض التقارير: يضم الخطابات + الموظفين + المتعاقدين. |

---

## 3. العمليات

### 3.1 أهلية الموظف

يظهر الموظفون في النظام عبر استعلام Linked Server إلى `HR.dbo.HrData`. الموظف مؤهل للعلاج إذا:

- حالته الوظيفية ليست `إنهاء عمل`، أو
- تم إنهاء عمله ولكن نوع الإنهاء هو أحد:
  - `معاش`
  - `عجز`
  - `بدون`

وهذا يضمن بقاء الموظفين المنتهى خدمتهم والذين لهم حقوق علاجية في النظام.

### 3.2 سير عمل إنشاء خطاب العلاج

```
الخطوة 1: اختيار الموظف
  ├── التنقل في قائمة الموظفين (السابق/التالي/الأول/الأخير)
  ├── عرض بيانات الموظف (الاسم، الحالة، الوظيفة، التابعين)
  └── مؤشر الحالة: أخضر (نشط) / أحمر (منتهى خدمته)

الخطوة 2: اختيار بند العلاج
  ├── نافذة منبثقة للبحث في MtItems
  ├── اختيار نوع العلاج → النظام يستخرج الاسم
  └── يتم تخزين علامة SpecialNeed مؤقتًا للتوجيه المالي

الخطوة 3: إدخال بيانات الخطاب
  ├── اختيار جهة العلاج (Contractors)
  ├── اختيار الصيدلية (Contractors2 — صيدليات فقط)
  ├── اختيار نوع الخطاب: شخصى أو أسرى
  ├── إذا أسرى: اختيار نوع الصلة من MtRelatives
  ├── إدخال الملاحظات والملاحظات الصيدلية ومستوى المستشفى
  └── إدخال الحقول المالية

الخطوة 4: الحفظ
  ├── إدراج 19 عمودًا في MtTickets
  ├── يتم تخزين اسم نوع العلاج في الخطاب للعرض السريع
  └── يتم تسجيل بيانات التدقيق تلقائيًا

الخطوة 5: الطباعة التلقائية
  └── فتح نافذة طباعة MtPrint.aspx?id=<id>
```

**الإنشاء الدفعي**: يمكن إدخال N خطاب متماثل (للعلاجات الشهرية المتكررة).

### 3.3 معالجة الخطاب — آلة الحالة DocAndPharmcy

هذا هو **منطق الأعمال الأساسي** (حوالي 900 سطر في `MtTicketsByID.aspx.vb`). يتحكم في أي من الحقول المالية الـ 15 مفعلة بناءً على **4 متغيرات مدخلة**:

| المتغير | القيم | المعنى |
|---|---|---|
| `SpecialNeed` | نعم / لا | هل البند من نوع "بند خاص" |
| `ddlDokConfirm` | 0 / 1 | حالة تأكيد الطبيب |
| `ddlPharmConfirm0` | 0 / 1 | حالة تأكيد الصيدلية |
| `ddlTreatKind` | 0 (شخصى) / 1 (أسرى) | نوع العلاج |

#### مصفوفة القرارات

| # | SpecialNeed | دكتور | صيدلية | النوع | الحقول المفعلة | الحقول المعطلة |
|---|---|---|---|---|---|---|
| 1 | نعم | 1 | 1 | أي | CheckS, LocaldeductS, ForeignDedS | كل الحقول الأخرى |
| 2 | نعم | 1 | 0 | أي | CheckS, LocaldeductS | ForeignDed + الصيدلية |
| 3 | نعم | 0 | 1 | أي | LocaldeductS, ForeignDedS | Check* + الطبيب |
| 4 | نعم | 0 | 0 | أي | الكل معطل | الكل |
| 5 | لا | 1 | 1 | شخصى | Check1,2, LocDed1,2, ForDed1,2 | F و S |
| 6 | لا | 1 | 0 | شخصى | Check, Check1, Check2 | LocDed*, ForDed* |
| 7 | لا | 0 | 1 | شخصى | LocDed1,2, ForDed1,2 | Check* |
| 8 | لا | 0 | 0 | شخصى | الكل معطل | الكل |
| 9 | لا | 1 | 1 | أسرى | CheckF, LocDedF, ForDedF | الشخصى |
| 10 | لا | 1 | 0 | أسرى | CheckF | LocDedF, ForDedF |
| 11 | لا | 0 | 1 | أسرى | LocDedF, ForDedF | CheckF |
| 12 | لا | 0 | 0 | أسرى | الكل معطل | الكل |

#### هيكل الحقول المالية — مصفوفة 5×5

```
            شخصى     شخصى1    شخصى2    أسرة    خاص
───────     ──────   ───────  ───────  ─────  ─────
Check        C        C1       C2       CF     CS
Localdeduct  L        L1       L2       LF     LS
ForeignDed   F        F1       F2       FF     FS
CoSharehold  CS       CS1      CS2      CSF    CSS
EmpSharehold ES       ES1      ES2      ESF    ESS
```

بالإضافة إلى: `CoShareholdNet`, `EmpShareholdNet`, `CoShareholdSurgNet`

#### الآثار الجانبية

- **تواريخ التأكيد**: تُملأ تلقائيًا بتاريخ اليوم عند تأكيد الطبيب أو الصيدلية
- **أرقام الفاتورة**: `BillingNo` (طبيب) / `BillingNo1` (صيدلية) تُفعل مع التأكيد
- **خانة بوكس العائلة** (`chbFamilyBox`): مفعلة فقط للعلاج الأسري غير الخاص
- **CoShareholdSurgNet**: صافي حصة الشركة للعمليات

### 3.4 إعداد اللائحة السنوية

يقوم المسئول بإدخال صف في `MtRules` كل سنة يحدد:

**نظام السقف ثنائي المستوى:**
- **المستوى 1** (موظف عادي): `MaxBefore` / `Max` مع `EmpPercent` نسبة تحمل الموظف
- **المستوى 2** (تنفيذي، الرقم 66): سقوف منفصلة

**نسبة خصم الأدوية:**
- `LocaldeductPercent`: خصم الأدوية المحلية
- `ForeignDeductPercent`: خصم الأدوية المستوردة

**حدود الزوجات** — 6 مستويات وظيفية × 4 شرائح:
- رئيس مجلس إدارة (الرقم 11)
- نائب رئيس مجلس إدارة (الرقم 22)
- مدير عام (الرقم 33)
- مساعد مدير عام (الرقم 44)
- المستوى الأول (الرقم 55)
- المستوى الثاني (الرقم 66)

### 3.5 طباعة الخطاب

**المشغل**: بعد إنشاء الخطاب (طباعة تلقائية) أو زر الطباعة اليدوي.

**العملية** (`MtPrint.aspx.vb`):
```
1. استقبال رقم الخطاب من رابط الاستعلام: ?id=123,124,125[&typ=mngr]
2. الاستعلام من MtTicketRpt WHERE Id_3101 IN (ids)
3. اختيار التقرير:
   - Litters.rdlc → خطاب عادي
   - Litters2.rdlc → خطاب مدير (عند typ=mngr)
4. ربط البيانات بـ DataSet1
5. تحويل إلى PDF عبر LocalReport.Render("PDF")
6. إرسال PDF إلى المتصفح
```

---

## 4. نموذج الحسابات المالية

### 4.1 تقسيم التكلفة

تقسم تكاليف العلاج بين **الشركة** (`CoSharehold*`) و**الموظف** (`EmpSharehold*`):

```
إذا إجمالي العلاج ≤ السقف السنوي:
  تدفع الشركة = الإجمالي
  يدفع الموظف = 0

إذا إجمالي العلاج > السقف السنوي:
  تدفع الشركة = السقف
  يدفع الموظف = الإجمالي - السقف (بالإضافة إلى نسبة التحمل)
```

### 4.2 تتبع الحد الأقصى للعائلة

يتم تتبع استهلاك حصة العائلة بطريقتين:
1. **عرض `MaxFamilyEmp`**: إجمالي محسوب مسبقًا لكل موظف
2. **استعلام مباشر**: `SUM(CoShareholdF)` من `MtTickets WHERE FamilyBox=1`

---

## 5. الأمان والتدقيق

### 5.1 المصادقة
- Forms Authentication مع ASP.NET Membership
- التحقق من الجلسة في الصفحة الرئيسية: إذا `Session("pcName")` = فارغ → تحويل إلى تسجيل الدخول

### 5.2 الصلاحيات
- عنصر تحكم `WebUserSecurityManager` في كل صفحة
- يتحكم في ظهور أزرار إضافة/تعديل/حذف حسب صلاحيات المستخدم

### 5.3 سجل التدقيق

كل جدول يحتوي على أعمدة تدقيق:
- `CreatedDate` / `CreatedBy`
- `LastModifiedDate` / `LastModifiedBy`
- `WinHostName` / `WinUserName`
- `IsDeleted` / `DeletedBy` / `DeleteDate` (الحذف المنطقي)

### 5.4 معالجة الأخطاء
- كل الصفحات تحتوي على `Page_Error`
- `ExceptionHelper.HandleException` يسجل في `~/Logs/Log.log`
- تحويل إلى `Error.aspx`

---

## 6. التكامل مع قاعدة بيانات الموارد البشرية

قاعدة بيانات MT تتصل بقاعدة بيانات الموارد البشرية المنفصلة عبر SQL Server Linked Server:

| كائن HR | الاستخدام في MT |
|---|---|
| `HR.dbo.HrData` | بيانات الموظفين (الاسم، الحالة، الوظيفة) |
| `HR..Children` | أبناء الموظفين مع حساب العمر |
| `HR..[1112]` | أنواع إنهاء الخدمة لفلترة الأهلية |
| `HR..Wives` | زوجات الموظفين |

**الاتجاه**: قراءة فقط من HR → MT. لا يكتب النظام في قاعدة بيانات الموارد البشرية.

---

## 7. نمط الحذف المنطقي

جميع الكيانات الرئيسية تستخدم الحذف المنطقي بدلاً من الحذف المادي. جميع الاستعلامات تستخدم `WHERE IsDeleted = 0` (أو `IsDeleated = 0`).

---

## 8. Glossary / مسرد المصطلحات

| English | العربية | Description |
|---|---|---|
| Ticket / Voucher | خطاب علاج | Medical treatment approval document |
| Treatment Type | بند علاج / نوع المعاملة | Type of medical procedure covered |
| Contractor | جهة تعاقد / متعاقد | Medical service provider |
| Doctor Confirmation | تأكيد الطبيب | Doctor's confirmation of treatment |
| Pharmacy Confirmation | تأكيد الصيدلية | Pharmacy's confirmation |
| Co-Sharehold | حصة الشركة | Company's share of treatment cost |
| Employee Sharehold | حصة الموظف | Employee's share of treatment cost |
| Special Need | بند خاص | Specialty treatment item |
| Deduction | خصم | Amount deducted from employee |
| Categorization | تصنيف | Ticket classification category |
| Treatment Kind | نوع العلاج | Personal (شخصى) vs. Family (أسرى) |
| Family Box | بوكس العائلة | Family treatment allocation box |
| Eligibility | أهلية | Employee qualification for benefits |
| Soft Delete | حذف منطقي | Logical deletion via IsDeleted flag |
| Audit Trail | سجل التدقيق | Created/Modified/Deleted tracking |
| Linked Server | خادم مرتبط | Cross-database connection to HR |
| Ceiling / Max | سقف / حد أقصى | Maximum annual coverage amount |
| Copay / EmpPercent | نسبة تحمل الموظف | Employee cost-sharing percentage |
| Wife-Tiered Limits | حدود الزوجات | Per-wife coverage limits by job level |
