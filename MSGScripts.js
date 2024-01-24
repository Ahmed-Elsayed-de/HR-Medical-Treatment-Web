function confirmDeleteTicket()
{
 return confirm('متأكد من حذف الجواب?');
}
function checkdate(input) {

    //  alert("Start");
    var validformat = /^\d{1,2}\/\d{1,2}\/?\d{0,4}$/; //Basic check for format validity
    var returnval = false;

    if (!validformat.test(input.value)) 
    {
        alert("تأكد من كتابة التاريخ بشكل صحيح !");
    }
    else 
    { //Detailed check for valid date ranges
        var monthfield = input.value.split("/")[1];
        var dayfield = input.value.split("/")[0];
        var yearfield = input.value.split("/")[2];

        if (yearfield != null) 
        {
            var dayobj = new Date(yearfield, monthfield - 1, dayfield);
            if ((dayobj.getMonth() + 1 != monthfield) || (dayobj.getDate() != dayfield) || (dayobj.getFullYear() != yearfield)) {
                returnval = false;
                alert("اليوم او الشهر او السنة غير صحيح من فضلك اعد كتابتهم !");
            }
            else
            {
                returnval = true;
            }
        }
        else 
        {

            if (monthfield > 0 && monthfield < 12 && dayfield > 0 && dayfield < 31)
             {
                // var dayobj = new Date(new Date().getFullYear(), monthfield - 1, dayfield);
                var dt = dayfield + "/" + monthfield + "/" + new Date().getFullYear();
                input.value = dt;
                returnval = true;
            }
            else 
            {
                returnval = false;
                alert("اليوم او الشهر غير صحيح من فضلك اعد كتابتهم !");
            }
        }
    }
   // alert(returnval);
  //  alert("test");
    if (returnval == false)
     { 
        input.focus();
        input.select();
     }
  
    return returnval;
}
 
 

