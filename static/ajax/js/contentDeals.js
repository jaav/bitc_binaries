function loadListVenueFromDb( ){
	var type=	 document.getElementsByName("f_type")[0].value ;
	var name=	 document.getElementsByName("f_name")[0].value ;
	 
	document.getElementById("idVenue").options.length = 0;
	$("#listVenue").show();
		$.ajax({
		url:"/bitc/front/ajax/loadListVenueByTypeAndName.do?type="+type+"&name="+name,
		type:'POST',
		dataType: "json",
		success: function(msg) {
			var i=0;
            $.each(msg.d, function(index, item) {
            $("#idVenue").get(0).options[$("#idVenue").get(0).options.length] = new Option(item.name, item.id);
            i=i+1;
            });
        
        }
	});
}
function validateExpPrice(value)
{       var regExp = /^[\+\-]?[0-9]+([\.,][0-9]+)?([eE]{0,1}[\-\+]?[0-9]+)?$/;
			if (!regExp.test(value)) {
				return false;
			}
		return true;

}
function validateExpPhone(value)
{       var regExp = /^([0-9\(\)\/\+ \-]*)$/i;
			if (!regExp.test(value)) {
				return false;
			}
		return true;

}
function validateExpEmail(value)
{       var regExp = /[^!# ]+@[^!# ]+\.\w{2,}$/i;
			if (!regExp.test(value)) {
				return false;
			}
		return true;

}
function visibleSearch()
{    
	var type=	 document.getElementsByName("f_type")[0].value ;
	var name=	 document.getElementsByName("f_name")[0].value ;
	if(type!=null&& type!=""&&name!=null&&name!="")
     $("#buttonsearch").show();
	else
		{$("#buttonsearch").hide();
	     $("#listVenue").hide();
		}
}
function controleJS()
{
	   var value=document.getElementsByName("f_type")[0].value ;
	   if(value=='')
		  $("#tv_type").show();
	   else
		  $("#tv_type").hide();
	   value=document.getElementById("name").value ;
	   if(value=='')
		  $("#tv_name").show();
	   else
		 $("#tv_name").hide();
	   value=document.getElementById("price").value ;
	    if(value==''||!validateExpPrice(value))
		    $("#tv_price").show();
		else
			$("#tv_price").hide();
	    value=document.getElementById("abstract").value ;
	    if(value=='')
		   $("#tv_abstract").show();
		else
			$("#tv_abstract").hide();
	    value=document.getElementById("periodValid").value ;
	    if(value=='')
		    $("#tv_periodValid").show();
		else
		   $("#tv_periodValid").hide();
  value=document.getElementById("f_periodFromDate").value ;
	    if(value=='')
		     $("#tv_fromDate").show();
		else
			$("#tv_fromDate").hide();
 value=document.getElementById("f_periodToDate").value ;
	    if(value=='')
		    $("#tv_toDate").show();
		else
			$("#tv_toDate").hide(); 
  value=document.getElementById("body").value ;
	    if(value=='')
		  $("#tv_body").show();
		else
			$("#tv_body").hide(); 
 value=document.getElementById("author").value ;
	    if(value=='')
		    $("#tv_contact").show();
		else
			$("#tv_contact").hide(); 
 value=document.getElementById("phone").value ;
	   if(value==''||!validateExpPhone(value))
		  $("#tv_phone").show();
       else
		  $("#tv_phone").hide(); 
 value=document.getElementById("email").value ;
	   if(value==''||!validateExpEmail( value))
		   $("#tv_email").show();
	   else
		  $("#tv_email").hide(); 
 value=document.getElementById("Cemail").value ;
       if(value==''||!validateExpEmail( value)||value!=document.getElementById("email").value)
		   $("#tv_Cemail").show();
	   else
		  $("#tv_Cemail").hide(); 	
 value=document.getElementById("valid").checked ;
       if(value==null||value==false)
		   $("#tv_valid").show();
	   else
		  $("#tv_valid").hide(); 	


 value=document.getElementById("captcha").value ;
	   if(value=='')
		   $("#tv_captcha").show();
	   else
		  $("#tv_captcha").hide(); 

}
