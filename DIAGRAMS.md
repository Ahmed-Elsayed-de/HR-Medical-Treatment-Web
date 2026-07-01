# System Diagrams / الرسومات البيانية

## HR-Medical-Treatment-Web

---

### 1. Entity Relationship Diagram (ERD)

```mermaid
erDiagram
    MtTickets ||--o{ MtItems : "TreatTypeId"
    MtTickets ||--o{ HRdata : "code"
    MtTickets ||--o{ MtContractors : "Contractors"
    MtTickets ||--o{ MtContractors : "Contractors2"
    MtTickets ||--o{ MtCategorization : "categorization"
    MtTickets ||--o{ MtRelatives : "relatives"

    MtContractors ||--o{ City : "CityID"

    MtRules }o--|| MtJobType : "job-level"
    MtItems }o--|| MtJobType : "SpecialNeedLevel"

    HRdata ||--o{ MedicalNotes : "Code"
    HRdata ||--o{ Children : "Code"
    HRdata ||--o{ Wives : "Code"

    MtTickets {
        int Id_3101 PK
        datetime TarnsDate
        datetime TreatDate
        string Contractors FK
        string TreatType
        int TreatTypeId FK
        string TreatKind
        string relatives FK
        string DokConfirm
        datetime DokConfirmDate
        string Contractors2 FK
        string pharmConfirm
        datetime pharmConfirmDate
        string notes
        int code FK
        real Localdeduct
        real ForeignDeduct
        real CoSharehold
        real EmpSharehold
        real Check
        real Localdeduct1
        real ForeignDeduct1
        real CoSharehold1
        real EmpSharehold1
        real Check1
        real Localdeduct2
        real ForeignDeduct2
        real CoSharehold2
        real EmpSharehold2
        real Check2
        real LocaldeductF
        real ForeignDeductF
        real CoShareholdF
        real EmpShareholdF
        real CheckF
        real LocaldeductS
        real ForeignDeductS
        real CoShareholdS
        real EmpShareholdS
        real CheckS
        real CoShareholdNet
        real EmpShareholdNet
        real CoShareholdSurgNet
        string CaseName
        int BillingNo
        int BillingNo1
        string PharmMemo
        smallint YearMT
        string HospitalLevel
        bit FamilyBox
        string categorization FK
        string CreatedBy
        datetime CreatedDate
        string WinHostName
        string WinUserName
        string LastModifiedBy
        datetime LastModifiedDate
        bit IsDeleated
        string DeletedBy
    }

    MtItems {
        int id PK
        string TreatType
        string SpecialNeed
        real EmpMax
        real WifeMax
        real SonMax
        string SpecialNeedVersion
        string Notes
        string SpecialNeedLevel
        string Rang
        string GenTreatType
        string CreatedBy
        datetime CreatedDate
        bit IsDeleted
    }

    MtContractors {
        int id PK
        string Contractors
        string Address
        string District
        int CityID FK
        string Notes
        string Phone
        string Special
        string Kind
        bit isactive
        string BankName
        string BankBranch
        string BankAccountName
        string BankAccountNumber
        string BankSwiftCode
        string BankName2
        string BankBranch2
        string BankAccountName2
        string BankAccountNumber2
        string BankSwiftCode2
        bit IsDeleted
    }

    MtRules {
        int id PK
        real MaxBefore
        real Max
        real EmpPercent
        real Max1
        real MaxAfter1
        real EmpPercent1
        real EmpPercentAfter1
        real LocaldeductPercent
        real ForeignDeductPercent
        real FamilySpecified
        real MaxBefore66
        real Max66
        real EmpPercent66
        real Max166
        real MaxAfter166
        real EmpPercent166
        real EmpPercentAfter166
        real Wife11
        real WifePlus111
        real WifePlus211
        real WifePlus311
        real Wife22
        real WifePlus122
        real WifePlus222
        real WifePlus322
        real Wife33
        real WifePlus133
        real WifePlus233
        real WifePlus333
        real Wife44
        real WifePlus144
        real WifePlus244
        real WifePlus344
        real Wife55
        real WifePlus155
        real WifePlus255
        real WifePlus355
        real Wife66
        real WifePlus166
        real WifePlus266
        real WifePlus366
        string YearMt
    }

    HRdata {
        int Code PK
        string Regist_No1
        string E_Name
        string Name
        string الموقف_الحالي
        string نوع_الوظيفة
        string نوع_التعاقد
        string PetroGasNotes
        string Endemic
        string Notes
        string BoardMember
        string JOB_NAME
        string YearsOld
        string Sex_A
        string Marital_Status_A
        datetime D_Birth
        string Picture
        string sl
        string إستلام_دفتر
        string كشف_بتروجاس
        string كشف_اول
        string كشف_ثاني
    }

    MedicalNotes {
        int MedicalNotesID PK
        int Code FK
        string Notes
    }

    City {
        int ID_1102 PK
        string District_A
        int Nationality_A
        bit IsDeleted
    }

    Children {
        int CODE FK
        string CHILD_NAME
        string SEX
        datetime D_BIRTH
        int age
    }

    MtTicketRpt {
        int Id_3101
        datetime TarnsDate
        string TreatType
        string ContractorName
        string EmployeeName
        string EmployeeCode
        string ContractorAddress
        string ContractorPhone
        string DoctorConfirm
        string PharmConfirm
        real Localdeduct
        real ForeignDeduct
        real CoSharehold
        real EmpSharehold
    }

    MtJobType {
        string نوع_الوظيفة
        tinyint الرقم PK
    }
```

---

### 2. Data Flow Diagram

```mermaid
flowchart TD
    HRDB[("HR Database\n(Linked Server)")]

    subgraph "Data Sources"
        HRDB
        MTDB[("MT Database")]
    end

    subgraph "Views"
        direction LR
        HRVIEW[("HRdata View")]
        CHILD[("Children View")]
        TICKETRPT[("MtTicketRpt View")]
        MAXFAM[("MaxFamilyEmp View")]
    end

    subgraph "Lookup Tables"
        ITEMS[("MtItems\nTreatment Catalog")]
        RULES[("MtRules\nAnnual Policy")]
        CONTR[("MtContractors\nProviders")]
        CAT[("MtCategorization")]
        REL[("MtRelatives")]
        JOB[("MtJobType")]
        CITY[("City")]
    end

    subgraph "Core Transaction Table"
        TICKETS[("MtTickets")]
    end

    subgraph "Application Pages"
        NEWTKT["MtNewTickets.aspx\nCreate Ticket"]
        EDITKT["MtTicketsByID.aspx\nProcess Ticket"]
        LISTKT["MtTickets.aspx\nSearch/Edit"]
        PRINT["MtPrint.aspx\nPDF Report"]
        FAMILY["MtFamilyDataNew.aspx\nFamily Dashboard"]
        EMPDATA["MtEmployeeData.aspx\nUpdate Employee"]
        ITEMS_PAGE["MtItems.aspx\nManage Catalog"]
        RULES_PAGE["MtRules.aspx\nConfigure Policy"]
        CONTR_PAGE["MtContractors.aspx\nManage Providers"]
    end

    subgraph "Output"
        PDF["PDF Treatment Ticket\n(Litters.rdlc / Litters2.rdlc)"]
    end

    HRDB -->|"SELECT"| HRVIEW
    HRDB -->|"SELECT"| CHILD
    HRVIEW -->|"employee data"| NEWTKT
    HRVIEW -->|"employee data"| EDITKT
    HRVIEW -->|"employee data"| LISTKT
    HRVIEW -->|"employee data"| FAMILY
    HRVIEW -->|"employee data"| EMPDATA
    CHILD -->|"dependents"| FAMILY

    ITEMS -->|"treatment types"| NEWTKT
    ITEMS -->|"treatment types"| EDITKT
    RULES -->|"financial policy"| EDITKT
    RULES -->|"financial policy"| FAMILY
    CONTR -->|"providers"| NEWTKT
    CONTR -->|"providers"| EDITKT
    CAT -->|"categories"| NEWTKT
    REL -->|"relatives"| NEWTKT

    NEWTKT -->|"INSERT 19 cols"| TICKETS
    EDITKT -->|"UPDATE 50+ cols"| TICKETS
    LISTKT -->|"SELECT/UPDATE/DELETE"| TICKETS

    TICKETS -->|"SELECT"| TICKETRPT
    TICKETS -->|"SELECT"| MAXFAM
    TICKETRPT -->|"data"| PRINT
    PRINT -->|"Render PDF"| PDF

    MAXFAM -->|"family totals"| FAMILY

    ITEMS_PAGE -->|"CRUD"| ITEMS
    RULES_PAGE -->|"SELECT"| RULES
    CONTR_PAGE -->|"CRUD"| CONTR
    EMPDATA -->|"UPDATE"| HRVIEW
```

---

### 3. DocAndPharmcy State Machine

```mermaid
flowchart LR
    START(["Financial Fields State Machine"])

    START --> CHECK{SpecialNeed?}

    CHECK -->|"نعم (Yes)"| SN_YES{Dr Confirm?}
    CHECK -->|"لا (No)"| SN_NO{Dr Confirm?}

    SN_YES -->|"1"| SN_DR_YES{Pharm Confirm?}
    SN_YES -->|"0"| SN_DR_NO{Pharm Confirm?}

    SN_DR_YES -->|"1"| S1["State 1: CheckS, LocDedS, ForDedS\n✅ Enabled\n❌ All others disabled"]
    SN_DR_YES -->|"0"| S2["State 2: CheckS, LocDedS\n✅ Enabled\n❌ ForDed*, Pharm fields"]

    SN_DR_NO -->|"1"| S3["State 3: LocDedS, ForDedS\n✅ Enabled\n❌ Check*, Dr fields"]
    SN_DR_NO -->|"0"| S4["State 4: ALL DISABLED"]

    SN_NO -->|"1"| NO_DR_YES{TreatKind?}
    SN_NO -->|"0"| NO_DR_NO{TreatKind?}

    NO_DR_YES -->|"شخصى"| NO_DR_PH{Pharm Confirm?}
    NO_DR_YES -->|"أسرى"| NO_FAM_DR_PH{Pharm Confirm?}

    NO_DR_PH -->|"1"| S5["State 5: Personal ALL\nCheck1,2, LocDed1,2, ForDed1,2"]
    NO_DR_PH -->|"0"| S6["State 6: Checks Only\nCheck, Check1, Check2"]

    NO_DR_NO -->|"شخصى"| NO_DR_NO_PH{Pharm Confirm?}
    NO_DR_NO -->|"أسرى"| NO_FAM_DR_NO_PH{Pharm Confirm?}

    NO_DR_NO_PH -->|"1"| S7["State 7: Deductions Only\nLocDed1,2, ForDed1,2"]
    NO_DR_NO_PH -->|"0"| S8["State 8: ALL DISABLED"]

    NO_FAM_DR_PH -->|"1"| S9["State 9: Family ALL\nCheckF, LocDedF, ForDedF"]
    NO_FAM_DR_PH -->|"0"| S10["State 10: Family Check Only\nCheckF"]

    NO_FAM_DR_NO_PH -->|"1"| S11["State 11: Family Ded Only\nLocDedF, ForDedF"]
    NO_FAM_DR_NO_PH -->|"0"| S12["State 12: ALL DISABLED"]

    S1 --> END(["Update UI & Calculate\nCoSharehold / EmpSharehold"])
    S2 --> END
    S3 --> END
    S4 --> END
    S5 --> END
    S6 --> END
    S7 --> END
    S8 --> END
    S9 --> END
    S10 --> END
    S11 --> END
    S12 --> END
```

---

### 4. Ticket Lifecycle

```mermaid
stateDiagram-v2
    [*] --> DRAFT : Create Ticket\n(MtNewTickets.aspx)

    DRAFT --> PENDING_DOCTOR : Enter financial fields\n& select provider

    PENDING_DOCTOR --> DOCTOR_CONFIRMED : Doctor confirms\n(ddlDokConfirm=1)
    PENDING_DOCTOR --> PENDING_PHARMACY : Skip doctor,\ngo to pharmacy

    DOCTOR_CONFIRMED --> DOCTOR_CONFIRMED : BillingNo assigned\nDokConfirmDate set
    DOCTOR_CONFIRMED --> PENDING_PHARMACY : Forward to pharmacy

    PENDING_PHARMACY --> PHARMACY_CONFIRMED : Pharmacy confirms\n(ddlPharmConfirm0=1)
    PENDING_PHARMACY --> FINANCIAL_CALC : No confirmation\n(minimal fields)

    PHARMACY_CONFIRMED --> FINANCIAL_CALC : BillingNo1 assigned\npharmConfirmDate set

    FINANCIAL_CALC --> FINALIZED : Calculate CoSharehold\n& EmpSharehold
    FINALIZED --> PRINTED : PDF Generated\n(MtPrint.aspx)

    PRINTED --> [*]

    note right of FINANCIAL_CALC : DocAndPharmcy()\n16-branch decision matrix\nenables/disables fields
    note right of PENDING_DOCTOR : Only Check fields active\nNo deductions yet
    note right of PENDING_PHARMACY : Only Deduction fields active\nNo checks
    note right of FINALIZED : Soft-delete allowed\n(IsDeleated=1)
```

---

### 5. Employee Eligibility Flowchart

```mermaid
flowchart TD
    START(["Employee Lookup\nEnter Regist_No1"])

    START --> QUERY["Query HRdata\nvia Linked Server"]

    QUERY --> CHECK_STATUS{Employment Status?}

    CHECK_STATUS -->|"NOT = إنهاء عمل\n(Not Terminated)"| ELIGIBLE["✅ ELIGIBLE\nInclude in employee list"]
    CHECK_STATUS -->|"= إنهاء عمل\n(Terminated)"| CHECK_EOS{End-of-Service Type?}

    CHECK_EOS -->|"معاش (Pension)"| ELIGIBLE
    CHECK_EOS -->|"عجز (Disability)"| ELIGIBLE
    CHECK_EOS -->|"بدون (Without)"| ELIGIBLE
    CHECK_EOS -->|"Other"| NOT_ELIGIBLE["❌ NOT ELIGIBLE\nExclude from list"]

    ELIGIBLE --> DISPLAY["Display Employee\nGreen Status Indicator"]

    NOT_ELIGIBLE --> HIDE["Hidden from System\nNo Tickets Possible"]

    DISPLAY --> NAV["Employee Navigation\n(Prev/Next/First/Last)"]
    NAV --> CREATE["Create Treatment Ticket\n(MtNewTickets.aspx)"]
```

---

### 6. Screen Flow / User Navigation

```mermaid
flowchart TD
    LOGIN["Login Page\n(Forms Auth)"] --> HOME["MtHome.aspx\nHome Dashboard"]

    HOME --> NEWTKT["MtNewTickets.aspx\nNew Ticket"]
    HOME --> SEARCH["MtTickets.aspx\nSearch/Edit Tickets"]
    HOME --> PROCESS["MtTicketsByID.aspx\nProcess Ticket"]
    HOME --> FAMILY["MtFamilyDataNew.aspx\nFamily Dashboard"]
    HOME --> EMP["MtEmployeeData.aspx\nEmployee Medical Data"]
    HOME --> ITEMS["MtItems.aspx\nTreatment Items Catalog"]
    HOME --> RULES["MtRules.aspx\nAnnual Policy Config"]
    HOME --> CONTR["MtContractors.aspx\nMedical Providers"]

    NEWTKT -->|"Auto-Print"| PRINT["MtPrint.aspx\nPDF Ticket"]
    SEARCH -->|"Select Ticket"| PROCESS
    PROCESS -->|"Print Button"| PRINT
    PROCESS -->|"Navigate"| PROCESS

    PRINT --> PDF["PDF Output\n(Browser Download/Popup)"]
```

---

### 7. Financial Field Matrix

```mermaid
flowchart LR
    subgraph "5 Categories × 5 Variants = 25 Fields"
        direction TB
        CAT1["Check\n(Doctor Check Amount)"]
        CAT2["Localdeduct\n(Local Pharmacy Deduction)"]
        CAT3["ForeignDeduct\n(Imported Pharmacy Deduction)"]
        CAT4["CoSharehold\n(Company Share)"]
        CAT5["EmpSharehold\n(Employee Share)"]
    end

    subgraph "Variants"
        V1["(base)\nPersonal Level 0"]
        V2["1\nPersonal Level 1"]
        V3["2\nPersonal Level 2"]
        V4["F\nFamily"]
        V5["S\nSpecial Need"]
    end

    subgraph "Net Aggregates"
        NET1["CoShareholdNet"]
        NET2["EmpShareholdNet"]
        NET3["CoShareholdSurgNet"]
    end

    CAT1 & CAT2 & CAT3 & CAT4 & CAT5 --- VARIANTS["Combined: 25 Fields"]
    VARIANTS --> NET1
    VARIANTS --> NET2
    VARIANTS --> NET3
```

---

### Legend / المفتاح

```
PK  = Primary Key
FK  = Foreign Key
→   = One-to-Many Relationship
✅  = Enabled / Active
❌  = Disabled / Inactive
```
