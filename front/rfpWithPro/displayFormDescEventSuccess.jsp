<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="${staticSite}/js/SpryValidationTextField.js"></script>
<script type="text/javascript" src="${staticSite}/js/SpryValidationRadio.js"></script>
<script type="text/javascript" src="${staticSite}/js/SpryValidationConfirm.js"></script>
<script type="text/javascript" src="${staticSite}/js/SpryValidationCheckbox.js"></script>
<script type="text/javascript" src="/bitc/static/front/js/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="/bitc/static/front/js/jquery.ui.datepicker-fr.js"></script>
<script type="text/javascript" src="/bitc/static/front/js/jquery.ui.widget.js"></script>

<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationTextField.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationRadio.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationSelect.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationConfirm.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="/bitc/static/front/css/jquery.ui.datepicker-events.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="/bitc/static/front/css/jquery.ui.theme-events.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="/bitc/static/front/css/jquery.ui.datepicker.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="/bitc/static/front/css/jquery.ui.theme.css" media="screen, projection"/>
<link href="/bitc/static/front/css/datepicker.css" rel="stylesheet" type="text/css" media="screen" />
 




<script>
function subscribe_user() {
	FB.ensureInit (  function () {
		FB.Connect.showPermissionDialog("email,publish_stream",
			function(result) {
				//alert("test");
                if(!result){
				FB.Facebook.apiClient.requireLogin(function(exception){
						FB.Facebook.apiClient.users_getInfo ([FB.Facebook.apiClient.get_session().uid],["contact_email"],function(result, exception){
							//alert("test");
							
							FB.Connect.ifUserConnected("${context}/${site}/user/DoFacebookLogin/facebookType/subscribe/uid/" + FB.Facebook.apiClient.get_session().uid + "/email/" + result[0]['contact_email'] + ".do", null);
							});
					}); 	
				}
                else{
					FB.Facebook.apiClient.requireLogin(function(exception){
						FB.Facebook.apiClient.users_getInfo ([FB.Facebook.apiClient.get_session().uid],["contact_email"],function(result, exception){
							//alert("test");
							FB.Connect.ifUserConnected("${context}/${site}/user/DoFacebookLogin/facebookType/subscribe/uid/" + FB.Facebook.apiClient.get_session().uid + "/email/" + result[0]['contact_email'] + ".do", null);
							});
					}); 										
	 			}
            });
     });
}

</script>
<script>
function sendForm(){
var errorFlag=false;
	for(var i=1; i<=13;i++){
		if((typeof this["spry"+i] != "undefined") && (!this["spry"+i].validate())){
			errorFlag=true;
		}
	}
	//alert(errorFlag);
	if(!errorFlag){
		$("#errorForm").hide();
		getCheckedAndReload();
		$("#rfpForm").submit()
	}else{
		$("#errorForm").show();
	}
}
</script>

<div id="content_main">
    <wa:include URI="${site}/content/introForm" />
    
   <form class="form" id="rfpForm" action="<wa:url URI="${site}/${module}/displaySaveEvent"/>" method="post">
        
     <fieldset>
     <legend align="top"><wa:mls>Your event</wa:mls></legend>
      <c:if test="${not empty ERROR_SAVE_REQFORPROPOSAL}"><p class="error"><wa:mls>${ERROR_SAVE_REQFORPROPOSAL}</wa:mls></p></c:if>
        <div class="clr"></div>
        
        <span id="tfv_meetingName">
        	<label for="f_meetingName"><wa:mls>Nom du Meeting * :</wa:mls></label>
        	<input name="f_meetingName" type="text" maxlength="50" value="${wa:nullFree(reqforproposal.meetingName)}"/>
        	<img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        	<div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        
        <div class="clr"></div>
        
        <span id="tfv_meetingType">
       		<label for="f_meetingType" class="label_radio"><wa:mls>Type de Meeting* :</wa:mls></label>
	       	<select name="f_meetingType" id="f_meetingType">
	         <option value=""><wa:mls>Choisissez</wa:mls></option>
	         <option value="convCongr" <c:if test="${reqforproposal.meetingType == 'convCongr'}">selected="selected"</c:if>><wa:mls>Convention/Congress</wa:mls></option>
	         <option value="corpMeet" <c:if test="${reqforproposal.meetingType == 'corpMeet'}">selected="selected"</c:if>><wa:mls>Corporate Meeting</wa:mls></option>
	         <option value="incent" <c:if test="${reqforproposal.meetingType == 'incent'}">selected="selected"</c:if>><wa:mls>Incentive travel</wa:mls></option>
	         <option value="product" <c:if test="${reqforproposal.meetingType == 'product'}">selected="selected"</c:if>><wa:mls>Product launch</wa:mls></option>
	         <option value="exhib" <c:if test="${reqforproposal.meetingType == 'exhib'}">selected="selected"</c:if>><wa:mls>Exhibition</wa:mls></option>
	         <option value="other" <c:if test="${reqforproposal.meetingType == 'other'}">selected="selected"</c:if>><wa:mls>Other</wa:mls></option>
	       </select>     
	       <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
	       <div class="selectRequiredMsg clr"><wa:mls>Veuillez faire un choix</wa:mls></div>
       </span>
         <div class="clr"></div>
        <span id="tfv_prefArrivaldate">
	        <label  for="f_prefArrivaldate"><wa:mls>Date debut :</wa:mls></label>
	         <script>
           	$(function() {
           		$("#f_prefArrivaldate").datepicker({
					showOn: 'button',
					buttonImage: '${static}/front/img/ml/calendar.gif',
					buttonImageOnly: true,		
					minDate: '+0D', 
					maxDate: '+2Y',
					onSelect: function(dateText, inst) { 			 	
						var day=dateText.substr(0,2);
						var month=dateText.substr(3,2);
						var year=dateText.substr(6,4);
						var monthYear=year+"-"+month;
							}
							})
					  	  });
			</script>
	        <input name="f_prefArrivaldate" type="text" id= "f_prefArrivaldate"  class="datepicker"  <c:choose>
           	<c:when test="${reqforproposal.prefArrivaldate==null}">value="<fmt:formatDate pattern="dd/MM/yyyy" value="${f_prefArrivaldate}"/>"
           	</c:when><c:otherwise>value="<fmt:formatDate pattern="dd/MM/yyyy" value="${reqforproposal.prefArrivaldate}"/>"</c:otherwise></c:choose>/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
	        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
	  
        </span>
        <div class="clr"></div>
       <span id="tfv_prefDepartdate">
	        <label  for="f_prefDepartdate"><wa:mls>Date fin :</wa:mls></label>
	         <script>
           	$(function() {
           		$("#f_prefDepartdate").datepicker({
					showOn: 'button',
					buttonImage: '${static}/front/img/ml/calendar.gif',
					buttonImageOnly: true,		
					minDate: '+0D', 
					maxDate: '+2Y',
					onSelect: function(dateText, inst) { 			 	
						var day=dateText.substr(0,2);
						var month=dateText.substr(3,2);
						var year=dateText.substr(6,4);
						var monthYear=year+"-"+month;
							}
							})
					  	  });
			</script>
	        <input name="f_prefDepartdate" type="text" id= "f_prefDepartdate"  class="datepicker"  <c:choose>
           	<c:when test="${reqforproposal.prefDepartdate==null}">value="<fmt:formatDate pattern="dd/MM/yyyy" value="${f_prefDepartdate}"/>"
           	</c:when><c:otherwise>value="<fmt:formatDate pattern="dd/MM/yyyy" value="${reqforproposal.prefDepartdate}"/>"</c:otherwise></c:choose>/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
	        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
	  
        </span>
           <div class="clr"></div>
        <span id="tfv_flexDate">
       		<label for="f_flexDate" class="label_radio"><wa:mls>Dates Flexible* :</wa:mls></label>
	       	<select name="f_flexDate" id="f_flexDate">
	         <option value=""><wa:mls>Choisissez</wa:mls></option>
	         <option value="yes" <c:if test="${reqforproposal.flexDate == true}">selected="selected"</c:if>><wa:mls>yes</wa:mls></option>
	         <option value="no" <c:if test="${reqforproposal.flexDate == false}">selected="selected"</c:if>><wa:mls>no</wa:mls></option>
	       </select>     
	       <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
	       <div class="selectRequiredMsg clr"><wa:mls>Veuillez faire un choix</wa:mls></div>
       </span>
       
        
     </fieldset>
     
     <fieldset>
	   	 <legend align="top"><wa:mls>Venue</wa:mls></legend>

     	<span id="tfv_largestRoom">
		        <label for="f_largestRoom"><wa:mls>Largest meeting rooms's capacity :</wa:mls></label>
		        <input name="f_largestRoom" type="text" maxlength="10" value="${wa:nullFree(reqforproposal.largestRoom)}"/>
		         <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
		        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
		        <div class="textfieldInvalidFormatMsg textfieldMinValueMsg clr"><wa:mls>Le format est invalide !</wa:mls></div>
        </span>
        <div class="clr"></div>
     	<span id="tfv_numRooms">
		        <label for="f_numRooms"><wa:mls>Nombre de salles de réunion :</wa:mls></label>
		        <input name="f_numRooms" type="text" maxlength="10" value="${wa:nullFree(reqforproposal.numRooms)}"/>
		         <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
		        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
		        <div class="textfieldInvalidFormatMsg textfieldMinValueMsg clr"><wa:mls>Le format est invalide !</wa:mls></div>
        </span>
        <div class="clr"></div>
        <div style="float: left;">
	        <span id="tfv_exhibSpace">
			        <label  for="f_exhibSpace"><wa:mls>Taille de la salle :</wa:mls></label> 
			        <input name="f_exhibSpace" type="text" maxlength="10" value="${wa:nullFree(reqforproposal.exhibSpace)}"/> 
			        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
	        </span>
        </div>
        <div style="float:left; width: 70px; margin: 5px 0 0 3px;">
	        <c:choose>
	        	<c:when test="${culture.language eq 'en'}">
	        		<span id="tfv_sizeUnit">
				       <select name="f_sizeUnit" id="f_sizeUnit" style="width: 70px; height: 24px;">
				         <option value="m²">(m²)</option>
				         <option value="sq.ft">sq.ft</option>
				       </select>     
				       <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
				       <div class="selectRequiredMsg clr"><wa:mls>Veuillez faire un choix</wa:mls></div>
			       </span>
			       <div class="clr"></div>
	        	</c:when>
	        	<c:otherwise>
	        	 	<input type="hidden" name="f_sizeUnit" value="m²" />
	        	</c:otherwise>
	        </c:choose>
        </div> 
       <div class="clr"></div>
    </fieldset>
    
    <fieldset>
        <legend align="top"><wa:mls>Accomodation</wa:mls></legend>
        	<span id="tfv_hotelNumrooms">
		        <label  for="f_hotelNumrooms"><wa:mls>Nombre de chambres requises :</wa:mls></label>
		        <input name="f_hotelNumrooms" type="text" maxlength="10" value="${wa:nullFree(reqforproposal.hotelNumrooms)}"/>
        	</span>
        	<div class="clr"></div>
    </fieldset>
    
    <fieldset>
        <legend align="top"><wa:mls>Social Program</wa:mls></legend>
        	<span id="tfv_socialProgram">
		       <label for="f_socialProgram" class="label_radio"><wa:mls>Social Program :</wa:mls></label>
			       <select name="f_socialProgram" id="f_socialProgram">
			         <option value=""><wa:mls>Choisissez</wa:mls></option>
			         <option value="yes" <c:if test="${reqforproposal.socialProgram == true}">selected="selected"</c:if>><wa:mls>yes</wa:mls></option>
			         <option value="no" <c:if test="${reqforproposal.socialProgram == false}">selected="selected"</c:if>><wa:mls>no</wa:mls></option>
			       </select>     
			       <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
			       <div class="selectRequiredMsg clr"><wa:mls>Veuillez faire un choix</wa:mls></div>
	       </span>
	       <div class="clr"></div>
    </fieldset>
    <fieldset>
        <legend align="top"><wa:mls>Budget</wa:mls></legend>
        <span id="tfv_budget">
	        <label for="f_budget" style="margin-right: 15px; width: 240px;"><wa:mls>Approximate budget per person per day :</wa:mls></label>
	        <input name="f_budget" type="text" maxlength="10" value="${wa:nullFree(reqforproposal.budget)}" /><p style="padding-top: 15px;">&nbsp; &euro;</p>
       	</span>
       	<div class="clr"></div>
       	
       <span id="tfv_overnightStay">
		       <label for="f_overnightStay" class="label_radio"><wa:mls>With overnight stay :</wa:mls></label>
			       <select name="f_overnightStay" id="f_overnightStay">
			         <option value=""><wa:mls>Choisissez</wa:mls></option>
			         <option value="yes" <c:if test="${reqforproposal.overnightStay == true}">selected="selected"</c:if>><wa:mls>yes</wa:mls></option>
			         <option value="no" <c:if test="${reqforproposal.overnightStay == false}">selected="selected"</c:if>><wa:mls>no</wa:mls></option>
			       </select>     
			       <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
			       <div class="selectRequiredMsg clr"><wa:mls>Veuillez faire un choix</wa:mls></div>
	       </span>
   	</fieldset>
   	
   	 <fieldset>
        <legend align="top"><wa:mls>Additional comments</wa:mls></legend>
   			<span id="tfv_infos">
		        <label for="f_infos"><wa:mls>Additional comments :</wa:mls></label>
		        <textarea name="f_infos" type="text" maxlength="1000"/><c:if test="${reqforproposal.infos != null}">${reqforproposal.infos}</c:if></textarea>
	     	</span>
   	</fieldset>
   	
   	<fieldset>
        <legend align="top"><wa:mls>Contact Details</wa:mls></legend>
   			<span id="tfv_company_name">
	        <label for="f_company"><wa:mls>Nom de la société* :</wa:mls></label>
	        <input name="f_company" type="text" maxlength="100" value="${wa:nullFree2(reqforproposal.company,user.companyName)}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
	        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
	        </span>
	        <div class="clr"></div>
   			<span id="radio_greeting">
	        <label for="f_greetings" class="label_radio"><wa:mls>Titre* :</wa:mls></label>
	        <div class="box_input_radio"><div  class="list_input_radio">
	          <input name="f_greetings" type="radio" value="Mr" class="radio" <c:if test="${reqforproposal.greetings == 'Mr' or (empty reqforproposal.greetings   and user.greeting == 'Mr')}">checked="checked"</c:if>/>
	          <span class="radioTxt"><wa:mls>Mr</wa:mls></span>
	          <input name="f_greetings" type="radio" value="Mrs" class="radio" <c:if test="${reqforproposal.greetings == 'Mrs' or (empty reqforproposal.greetings   and user.greeting == 'Mrs')}">checked="checked"</c:if>/>
	          <span class="radioTxt"><wa:mls>Mme</wa:mls></span>
	          <input name="f_greetings" type="radio" value="Miss" class="radio" <c:if test="${reqforproposal.greetings == 'Miss' or (empty reqforproposal.greetings   and user.greeting == 'Miss')}">checked="checked"</c:if>/>
	          <span class="radioTxt"><wa:mls>Mlle</wa:mls></span> </div></div>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg"/> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
	        <div class="radioRequiredMsg clr"><wa:mls>Veuillez faire un choix</wa:mls></div>
	        </span>
	        <div class="clr"></div>
	        <span id="tfv_lastname">
	        <label for="f_lastname"><wa:mls>Nom* :</wa:mls></label>
	        <input name="f_lastname" type="text" maxlength="50" value="${wa:nullFree2(reqforproposal.lastname,user.lastname)}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
	        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
	        </span>
	        <div class="clr"></div>
	        <span id="tfv_firstname">
	        <label for="f_firstname"><wa:mls>Prénom* :</wa:mls></label>
	        <input name="f_firstname" type="text" maxlength="50" value="${wa:nullFree2(reqforproposal.firstname,user.firstname)}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
	        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
	        </span>
	        <div class="clr"></div>
	        <span id="tfv_position">
	        <label for="f_position"><wa:mls>Position :</wa:mls></label>
	        <input name="f_position" type="text" maxlength="50" value="${wa:nullFree(reqforproposal.position)}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
	        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
	        </span>
	        <div class="clr"></div>
	          <span id="tfv_phone">
	        <label for="f_phone"><wa:mls>Phone* :</wa:mls></label>
	        <input name="f_phone" type="text" maxlength="50" value="${wa:nullFree(reqforproposal.phone)}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
	        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
	        </span>
	        <div class="clr"></div>
   			<span id="tfv_email">
	        <label  for="f_email"><wa:mls>E-mail* :</wa:mls></label>
	        <input name="f_email" type="text" id="f_email" maxlength="80" value="${wa:nullFree2(reqforproposal.email,user.email)}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
	        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
	        <div class="textfieldInvalidFormatMsg clr"><wa:mls>Le format de votre adresse n'est pas valide !</wa:mls></div>
	        </span>
	         <div class="clr"></div>
   			<span id="tfv_confirm">
	        <label  for="f_confirm"><wa:mls>confirm Email * :</wa:mls></label>
	        <input name="f_confirm" type="text" maxlength="80" value="${wa:nullFree(reqforproposal.email)}" />
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
	        <div class="confirmRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
	        <div class="confirmInvalidMsg clr"><wa:mls>La confirmation est invalide !</wa:mls></div>
	        </span>
	        <div class="clr"></div>
   			<span id="tfv_url">
	        <label  for="f_url"><wa:mls>Website:</wa:mls></label>
	        <input name="f_url" type="text" maxlength="80" value="${wa:nullFree2(reqforproposal.url,user.website)}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
	        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
	        <div class="textfieldInvalidFormatMsg clr"><wa:mls>Le format de votre adresse n'est pas valide !</wa:mls></div>
	        </span>
	        <div class="clr"></div>
     	<wa:include URI="front/boxes/captcha" />
     	 <div class="clr"></div>
     	
     	
            <input type="button" value="<wa:mls>Envoyer</wa:mls>" id="form_send" onclick="sendForm()" style="text-align: center; padding-bottom: 3px; " />
        <div class="clr"></div>
        <p><wa:mls>* Champs obligatoires à compléter</wa:mls></p>
        <p class="remark"><wa:mls>« All data of a personal nature passed on to Brussels International is recorded in the files of Brussels International - or those of third parties (professionals) acting on its behalf - for the purposes of managing marketing communication mailings. Further information may be obtained from the 'Commission pour la protection de la vie privée' (Commission for the Protection of Privacy) (Rue de la Régence 63, 1000 Brussels). Every individual has the right to access his/her personal data. Brussels International, 2-4 rue Royale, 1000 Brussels, owns and manages the file. »</wa:mls></p>
      </fieldset>
    </form>
  </div>
<script type="text/javascript">
function getCheckedAndReload(){
	var id = "";
	var stars = "";
	var count = 0;
	var count2 = 0;
	var path='${context}/${site}/${module}';
	var valeurs = [];
	$('input:checked[name=checkbox1]').each(function() {
		if(count > 0)
			id += ',';
		 id += $(this).val();
		 count++;
		 //valeurs.push($(this).val());
	});

	$('input:checked[name=checkbox2]').each(function() {
		if(count2 > 0)
			stars += ',';
		stars += $(this).val();
		 count2++;
		 //valeurs.push($(this).val());
	});
	$("#items").val(id);
	$("#stars").val(stars); 
//location.href=path+'/displaySaveEvent/items/'+id+'/stars/'+stars+'.do';
}


var spry1 = new Spry.Widget.ValidationTextField("tfv_meetingName", "none", {validateOn:["blur"],isRequired:true});
var spry2 = new Spry.Widget.ValidationSelect("tfv_meetingType", "none", {validateOn:["blur"],isRequired:true});
var spry3 = new Spry.Widget.ValidationTextField("tfv_prefArrivaldate", "date", {format:"dd/MM/yyyy", validateOn:["change"]});
var spry4 = new Spry.Widget.ValidationTextField("tfv_prefDepartdate", "date", {format:"dd/MM/yyyy", validateOn:["change"]});
var spry5 = new Spry.Widget.ValidationSelect("tfv_flexDate", "none", {validateOn:["blur"],isRequired:true});
var spry6 = new Spry.Widget.ValidationTextField("tfv_company_name", "none", {validateOn:["blur"],isRequired:true});
var spry7 = new Spry.Widget.ValidationRadio("radio_greeting", "none", {validateOn:["blur"],isRequired:true});
var spry8 = new Spry.Widget.ValidationTextField("tfv_lastname", "none", {validateOn:["blur"],isRequired:true});
var spry9 = new Spry.Widget.ValidationTextField("tfv_firstname", "none", {validateOn:["blur"],isRequired:true});
var spry10 = new Spry.Widget.ValidationTextField("tfv_email", "email", {validateOn:["blur","change"],isRequired:true});
var spry11 = new Spry.Widget.ValidationConfirm("tfv_confirm", "f_email", {validateOn: ['blur'],isRequired:true});
var spry12 = new Spry.Widget.ValidationTextField("tfv_largestRoom", "integer", {validateOn:["blur","change"],isRequired:true,minValue:0});
var spry13 = new Spry.Widget.ValidationTextField("tfv_numRooms", "integer", {validateOn:["blur","change"],isRequired:true,minValue:0});
var spry14 = new Spry.Widget.ValidationTextField("tfv_phone", "none", {validateOn:["blur","change"],isRequired:true});




</script>
  <!--contentMain:end-->
