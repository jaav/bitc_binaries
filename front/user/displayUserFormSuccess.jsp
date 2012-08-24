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
<script type="text/javascript" src="${staticSite}/js/SpryValidationPassword.js"></script>
<script type="text/javascript" src="${staticSite}/js/SpryValidationConfirm.js"></script>
<script type="text/javascript" src="${staticSite}/js/SpryValidationTextarea.js"></script>
<script type="text/javascript" src="${staticSite}/js/SpryValidationCheckbox.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.nyroModal-1.6.2.min.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.core.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.widget.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.datepicker-${culture.language}.js"></script>
<link rel="stylesheet" type="text/css" href="${static}/front/css/nyroModal.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/jquery.ui.datepicker.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/jquery.ui.theme.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationTextField.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationRadio.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationPassword.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationConfirm.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationTextarea.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationSelect.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationCheckbox.css" media="screen, projection"/>

<script type="text/javascript">

	$(function() {		


		$("#datePicker01").datepicker({
			showOn: 'button',
			buttonImage: '${static}/front/img/ml/calendar.gif',
			buttonImageOnly: true,		
		
			onSelect: function(dateText, inst) { 			 	
				var day=dateText.substr(0,2);
				var month=dateText.substr(3,2);
				var year=dateText.substr(6,4);
				var monthYear=year+"-"+month;
				//alert(day +" "+monthYear)
				
			}
		})

	});
	

	
</script>
<script>
function log_user() {
	//alert("begin log_user");
	window.location = "${context}/${site}/user/doFacebookLogin.do" ;
}
</script>
<script>
function sendForm(){

var errorFlag=false;
	for(var i=1; i<=24;i++){
		
		if((typeof this["spry"+i] != "undefined") && (!this["spry"+i].validate())){
			errorFlag=true;
		}
	}
	if(!this["spryCaptcha"].validate()){
		errorFlag=true;
	}
	//alert(errorFlag);
	if(!errorFlag){
		$("#errorForm").hide();
		$("#userForm").submit()
	}else{
		$("#errorForm").show();
	}
}
</script>




<div id="content_main">
    <wa:include URI="${site}/content/introForm" />
    
        <form class="form" id="userForm" action="<wa:url URI="${site}/${module}/saveUser"/>" method="post">
        
        <c:if test="${user.fbUid!=null}">
            <input type="hidden" name="f_facebookUid" id="f_facebookUid" value="${user.fbUid}" />
        </c:if>
        
      <fieldset>
      <p class="error"><wa:mls>${NO_DEMAND}</wa:mls></p>
      <c:if test="${user.loginStatus ne 'HARD LOGIN'}">
      	<div id="fbButton"><fb:login-button perms="email,user_birthday,publish_stream" onlogin="log_user()"></fb:login-button></div>
      	<div id="fbButton2"></div>
      </c:if>
      <c:if test="${user.loginStatus eq 'NOT LOGGED'}">
      <p><a href="<wa:url URI="${site}/${module}/displayLogin"/>"><wa:mls>Déjà inscrit connectez vous ?</wa:mls></a></p>
      </c:if>
      <p class="error">${ERROR_SAVE_USER}</p>
        <span id="radio_greeting">
        <label for="f_greeting" class="label_radio"><wa:mls>Titre* :</wa:mls></label>
        <div class="box_input_radio"><div  class="list_input_radio">
          <input name="f_greeting" type="radio" value="Mr" class="radio" <c:if test="${user.greeting == 'Mr'}">checked="checked"</c:if>/>
          <span class="radioTxt"><wa:mls>Mr</wa:mls></span>
          <input name="f_greeting" type="radio" value="Mrs" class="radio" <c:if test="${user.greeting == 'Mrs'}">checked="checked"</c:if>/>
          <span class="radioTxt"><wa:mls>Mme</wa:mls></span>
          <input name="f_greeting" type="radio" value="Miss" class="radio" <c:if test="${user.greeting == 'Miss'}">checked="checked"</c:if>/>
          <span class="radioTxt"><wa:mls>Mlle</wa:mls></span> </div></div>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg"/> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="radioRequiredMsg clr"><wa:mls>Veuillez faire un choix</wa:mls></div>
        </span>
        <div class="clr"></div>
        
        <span id="tfv_lastname">
        <label for="f_lastname"><wa:mls>Nom* :</wa:mls></label>
        <input name="f_lastname" type="text" maxlength="50" value="${wa:nullFree(user.lastname)}"/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_firstname">
        <label for="f_firstname"><wa:mls>Prénom* :</wa:mls></label>
        <input name="f_firstname" type="text" maxlength="50" value="${wa:nullFree(user.firstname)}"/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="radio_culture">
        <label for="f_languageid" class="label_radio"><wa:mls>Langue* :</wa:mls></label>
        <div class="box_input_radio">
        <div  class="list_input_radio">
           <input name="f_languageid" type="radio" value="FR" class="radio" <c:if test="${culture == 'BE_fr'}">checked="checked"</c:if>/>
          <span class="radioTxt"><wa:mls>Fr</wa:mls></span>
          <input name="f_languageid" type="radio" value="NL" class="radio" <c:if test="${culture == 'BE_nl'}">checked="checked"</c:if>/>
          <span class="radioTxt"><wa:mls>Nl</wa:mls></span>
          <input name="f_languageid" type="radio" value="EN" class="radio" <c:if test="${culture == 'BE_en'}">checked="checked"</c:if>/>
          <span class="radioTxt"><wa:mls>En</wa:mls></span> </div></div>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg"/> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="radioRequiredMsg clr"><wa:mls>Veuillez faire un choix</wa:mls></div>
        </span>
        <div class="clr"></div>
         <span id="tfv_birthdate">
        <label  for="f_birthdate"><wa:mls>Date de naissance* :</wa:mls></label>
        <input id="f_birthdate" name="f_birthdate" type="text" <%-- id="datePicker01" class="datepicker"  --%> value="<c:if test="${ empty user.birthdate}">DD/MM/YYYY</c:if><c:if test="${ not empty user.birthdate}"><fmt:formatDate pattern="dd/MM/yyyy" value="${user.birthdate}"/></c:if>"/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        <div class="textfieldInvalidFormatMsg clr"><wa:mls>Veuillez entrer une date au format JJ/MM/AAAA</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_pseudo">
        <label for="f_pseudo"><wa:mls>Pseudo utilisé pour les commentaires* :</wa:mls></label>
        <input name="f_pseudo" type="text" maxlength="50" value="${wa:nullFree(user.pseudo)}"/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_email">
        <label  for="f_email"><wa:mls>E-mail* :</wa:mls></label>
        <input name="f_email" type="text" maxlength="80" value="${wa:nullFree(user.email)}"/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        <div class="textfieldInvalidFormatMsg clr"><wa:mls>Le format de votre adresse n'est pas valide !</wa:mls></div>
        </span>
        <div class="clr"></div>
       
        <c:if test="${user.fbUid == null}">
	        <div class="clr"></div>
	        <span id="tfv_password">
	        <label  for="f_password"><wa:mls>Mot de passe* :</wa:mls></label>
	        <input name="f_password" type="password" maxlength="50" value="${wa:nullFree(user.password)}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" /> <span class="passwordRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></span> </span>
	        <div class="clr"></div>
	        <span id="tfv_password2">
	        <label  for="f_password2"><wa:mls>Confirmer mot de passe* :</wa:mls></label>
	        <input name="f_password2" type="password" maxlength="50" value="${wa:nullFree(user.password)}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" /> <span class="confirmRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></span> <span class="confirmInvalidMsg clr"><wa:mls>Ce champ ne correspond pas au Mot de passe</wa:mls></span> </span>
        
        	<script>
	        	var spry1 = new Spry.Widget.ValidationPassword("tfv_password", {validateOn:["blur"]});
	        	var spry2 = new Spry.Widget.ValidationConfirm("tfv_password2", "tfv_password", {validateOn: ['blur']});	
        	</script>
        </c:if>
        
        <div class="clr"></div>
        <c:if test="${origin eq  'SALES_GUIDE' || origin eq  'PHOTOTHEQUE' || origin eq  'sendRFPAlone' || origin eq 'sendRFPWithPro' || origin eq  'sendRFPPro' || not empty user.companyName }">
                <input type="hidden" name="origin" value="${origin}"/>
                <div class="clr"></div>
		        <span id="tfv_company_name">
		        <label for="f_companyName"><wa:mls>Nom de la société* :</wa:mls></label>
		        <input name="f_companyName" type="text" maxlength="100" value="${wa:nullFree(user.companyName)}"/>
		        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
		        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
		        </span>
		        <div class="clr"></div>
		        <span id="tfv_company_type">
		        <label for="f_companyType" class="label_radio"><wa:mls>Type de société* :</wa:mls></label>
		        <select name="f_companyType" id="f_startDate">
		          <option value=""><wa:mls>Choisissez</wa:mls></option>
		          <option value="Press" <c:if test="${user.companyType == 'Press'}">SELECTED</c:if>>Press</option>
		          <option value="Tour" <c:if test="${user.companyType == 'Tour'}">SELECTED</c:if>>Tour</option>
		          <option value="Mice" <c:if test="${user.companyType == 'Mice'}">SELECTED</c:if>>Mice</option>
		          <option value="Travel" <c:if test="${user.companyType == 'Travel'}">SELECTED</c:if>>Travel</option>
		          <option value="Public" <c:if test="${user.companyType == 'Public'}">SELECTED</c:if>>Public</option>
		          <option value="Other" <c:if test="${user.companyType == 'Other'}">SELECTED</c:if>>Other</option>
		        </select>     
		        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
		        <div class="selectRequiredMsg clr"><wa:mls>Veuillez faire un choix</wa:mls></div>
		        </span>
		        <div class="clr"></div>
		        <span id="tfv_street">
		        <label  for="f_street"><wa:mls>Rue* :</wa:mls></label>
		        <input name="f_street" type="text" maxlength="100" value="${wa:nullFree(user.street)}"/>
		        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
		        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
		        </span>
		        <div class="clr"></div>
		        <span id="tfv_num">
		        <label  for="f_num"><wa:mls>N° :</wa:mls></label>
		        <input name="f_num" type="text" maxlength="10" value="${wa:nullFree(user.num)}"/>
		        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
		        </span>
		        <div class="clr"></div>
		        <span id="tfv_box">
		        <label  for="f_box"><wa:mls>Boîte :</wa:mls></label>
		        <input name="f_box" type="text" maxlength="10" value="${wa:nullFree(user.box)}" />
		        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
		        </span>
		        <div class="clr"></div>
		        <span id="tfv_zipcode">
		        <label  for="f_zipcode"><wa:mls>Code Postal* :</wa:mls></label>
		        <input name="f_zipcode" type="text" maxlength="20" value="${wa:nullFree(user.zipcode)}"/>
		        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
		        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
		        
		        </span>
		        <div class="clr"></div>
		        <span id="tfv_city">
		        <label for="f_city"><wa:mls>Ville* :</wa:mls></label>
		        <input name="f_city" type="text" maxlength="50" value="${wa:nullFree(user.city)}"/>
		        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
		        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
		        </span>
		        <div class="clr"></div>
		        <span id="tfv_country">
		        <label for="f_country"><wa:mls>Pays* :</wa:mls></label>
		        <input name="f_country" type="text" maxlength="50" value="${wa:nullFree(user.country)}"/>
		        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
		        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
		        </span>
                
					<script type="text/javascript">
		     		var spry3 = new Spry.Widget.ValidationTextField("tfv_street", "none", {validateOn:["blur"]});	
					var spry4 = new Spry.Widget.ValidationTextField("tfv_num", "none", {validateOn:["blur"], isRequired:false});	
					var spry5 = new Spry.Widget.ValidationTextField("tfv_box", "none", {validateOn:["blur"], isRequired:false});
					var spry6 = new Spry.Widget.ValidationTextField("tfv_zipcode", "none", {validateOn:["blur"], isRequired:false});
					var spry7 = new Spry.Widget.ValidationTextField("tfv_city", "none", {validateOn:["blur"]})
					var spry8 = new Spry.Widget.ValidationTextField("tfv_country", "none", {validateOn:["blur"]})
					var spry9 = new Spry.Widget.ValidationTextField("tfv_company_name", "none", {validateOn:["blur"]});
					var spry10 = new Spry.Widget.ValidationSelect("tfv_company_type", {validateOn:["blur, change"]});
					</script>
		      </c:if>
		        <div class="clr"></div>
		        
		 <c:if test="${origin eq  'SALES_GUIDE'}">
		            <span id="tfv_comment">
			        <label for="f_access_userComment"><wa:mls>Message de demande d'accès à Sales Guide :</wa:mls></label>
			        <textarea name="f_access_userComment" type="text" maxlength="1000" value=""/>${wa:nullFree(commentAccess)}</textarea>
			        <span id="Counttextarea_counter" class="counter">&nbsp;</span> 
        			<div class="textareaRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
			        </span>
		        <div class="clr"></div>
					<script type="text/javascript">
					var spry11 = new Spry.Widget.ValidationTextarea("tfv_comment", {validateOn:["blur"], isRequired:false});
					</script>

        </c:if>
        <c:if test="${origin eq  'PHOTOTHEQUE'}">
		            <span id="tfv_comment">
			        <label for="f_access_userComment"><wa:mls>Message de demande d'accès à la Photothéque :</wa:mls></label>
			        <textarea name="f_access_userComment" type="text" maxlength="1000" value=""/>${wa:nullFree(commentAccess)}</textarea>
			        <span id="Counttextarea_counter" class="counter">&nbsp;</span> 
        			<div class="textareaRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
			        </span>
		        <div class="clr"></div>
					<script type="text/javascript">
					var spry12 = new Spry.Widget.ValidationTextarea("tfv_comment", {validateOn:["blur"], isRequired:false});
					</script>
           
        </c:if>
        <c:if test="${origin eq  'sendRFPAlone'}">
         <div class="clr"></div>
	        <span id="tfv_arrivaldate">
	        <label  for="f_arrivaldate"><wa:mls>Date d'arrivée :</wa:mls></label>
	        <input name="f_arrivaldate" type="text"  value="${arrivaldate}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
	        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
	        <div class="textfieldInvalidFormatMsg clr"><wa:mls>Veuillez entrer une date au format JJ/MM/AAAA</wa:mls></div>
	        </span>
	         <div class="clr"></div>
	         <span id="tfv_departdate">
	        <label  for="f_departdate"><wa:mls>Date de départ :</wa:mls></label>
	        <input name="f_departdate" type="text"  value="${departdate}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
	        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
	        <div class="textfieldInvalidFormatMsg clr"><wa:mls>Veuillez entrer une date au format JJ/MM/AAAA</wa:mls></div>
	        </span>
	         <div class="clr"></div>
	        <span id="tfv_numaccpersons">
	        <label  for="f_numaccpersons"><wa:mls>Num ACC persons :</wa:mls></label>
	        <input name="f_numaccpersons" type="text"  value="${numaccpersons}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
	        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
	        </span>
	         <div class="clr"></div>
	        <span id="tfv_space">
	        <label  for="f_space"><wa:mls>Exhibition space (m2) :</wa:mls></label>
	        <input name="f_space" type="text"  value="${space}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
	        </span>
	         <div class="clr"></div>
	        <span id="tfv_numrooms">
	        <label  for="f_numrooms"><wa:mls>Number of rooms :</wa:mls></label>
	        <input name="f_numrooms" type="text"  value="${numrooms}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
	        </span>
	         <div class="clr"></div>
	        <span id="tfv_translation">
		        <label  for="f_translation"><wa:mls>Translation :</wa:mls></label>
		        <div class="box_input_radio"> 
				          <input type="radio" class="radio" value="1" name="f_translation">
				          <span class="radioTxt_news"><wa:mls>yes</wa:mls></span>
				          <div class="clr"></div>
				          <input type="radio" checked="checked" class="radio" value="0" name="f_translation">
				          <span class="radioTxt_news"><wa:mls>no</wa:mls></span>
				</div>
	        </span>
	         <div class="clr"></div>
	        <span id="tfv_hotelNumrooms">
	        <label  for="f_hotelNumrooms"><wa:mls>Number of Hotel rooms :</wa:mls></label>
	        <input name="f_hotelNumrooms" type="text"  value="${hotelNumrooms}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
	        </span>
	         <div class="clr"></div>
	        <span id="tfv_dinerLargest">
	        <label  for="f_dinerLargest"><wa:mls>Nombre de couverts :</wa:mls></label>
	        <input name="f_dinerLargest" type="text"  value="${dinerLargest}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
	        </span>
	         <div class="clr"></div>
	        <span id="tfv_catering">
	        <label  for="f_catering"><wa:mls>Catering :</wa:mls></label>
		        <div class="box_input_radio"> 
				          <input type="radio" class="radio" value="1" name="f_catering">
				          <span class="radioTxt_news"><wa:mls>yes</wa:mls></span>
				          <div class="clr"></div>
				          <input type="radio" checked="checked" class="radio" value="0" name="f_catering">
				          <span class="radioTxt_news"><wa:mls>no</wa:mls></span>
				</div>
	        </span>
	        <script type="text/javascript">
	        	var spry13 = new Spry.Widget.ValidationTextField("tfv_numaccpersons", "integer", {useCharacterMasking:true, validateOn:["blur"], isRequired:false});
	        	var spry14 = new Spry.Widget.ValidationTextField("tfv_space", "integer", {useCharacterMasking:true, validateOn:["blur"], isRequired:false});
	        	var spry15 = new Spry.Widget.ValidationTextField("tfv_numrooms", "integer", {useCharacterMasking:true, validateOn:["blur"], isRequired:false});
	        	var spry16 = new Spry.Widget.ValidationTextField("tfv_hotelNumrooms", "integer", {useCharacterMasking:true, validateOn:["blur"], isRequired:false});
	        	var spry17 = new Spry.Widget.ValidationTextField("tfv_dinerLargest", "integer", {useCharacterMasking:true, validateOn:["blur"], isRequired:false});
	        </script>
        </c:if>
        <div class="clr"></div><br>
        <span id="tfv_optins"><wa:mls>Voulez vous vous inscrire aux newsletters suivantes ?</wa:mls>
		 </span>
		<div class="clr"></div>
        	<wa:include URI="front/user/optins" />
        
            <wa:include URI="front/boxes/captcha" />
        <div class="clr"></div>
        <div class="error" id="errorForm" style="display:none" ><wa:mls>erreur dans un des champs du formulaire</wa:mls></div>
        
        
        
        
        <input type="button" value="<wa:mls>Envoyer</wa:mls>" onclick="sendForm();" id="form_send" />
        <div class="clr"></div>
        <p><wa:mls>* Champs obligatoires à compléter</wa:mls></p>
        <p class="remark"><wa:mls>« All data of a personal nature passed on to Brussels International is recorded in the files of Brussels International - or those of third parties (professionals) acting on its behalf - for the purposes of managing marketing communication mailings. Further information may be obtained from the 'Commission pour la protection de la vie privée' (Commission for the Protection of Privacy) (Rue de la Régence 63, 1000 Brussels). Every individual has the right to access his/her personal data. Brussels International, 2-4 rue Royale, 1000 Brussels, owns and manages the file. »</wa:mls></p>
      </fieldset>
    </form>
  </div>
<script type="text/javascript">
	$('#f_birthdate').focus(function() {
		 if($('#f_birthdate').val() == 'DD/MM/YYYY'){
			 $('#f_birthdate').val('');
		 }
	});
function continueHideButton(url){
	
	//alert(url);
	
	$("#fbButton").attr("style","display:none;");
	$("#fbButton2").html(url);
	$("#fbButton2").attr("style","display:block;"); 
}


 
function showButton() {
  $("#fbButton").attr("style","display:block;");
  $("#fbButton2").attr("style","display:none;");
}


var spry18 = new Spry.Widget.ValidationRadio("radio_greeting", {validateOn:["blur", "change"]});
var spry19 = new Spry.Widget.ValidationRadio("radio_culture", {validateOn:["blur", "change"]});
var spry20 = new Spry.Widget.ValidationTextField("tfv_lastname", "none", {validateOn:["blur"]});
var spry21 = new Spry.Widget.ValidationTextField("tfv_firstname", "none", {validateOn:["blur"]});
var spry22 = new Spry.Widget.ValidationTextField("tfv_pseudo", "none", {validateOn:["blur"]});
var spry23 = new Spry.Widget.ValidationTextField("tfv_email", "email", {validateOn:["blur"]});
var spry24 = new Spry.Widget.ValidationTextField("tfv_birthdate", "date", {format:"dd/mm/yyyy", pattern:"00/00/0000", validateOn:["blur"], useCharacterMasking:true, isRequired:true});
</script>
  <!--contentMain:end-->
