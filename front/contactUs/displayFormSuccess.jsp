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
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationTextField_contact.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationRadio_contact.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationPassword.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationConfirm.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationTextarea.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationSelect_contact.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationCheckbox.css" media="screen, projection"/>
<div id="content_main">
	<wa:include URI="${site}/content/introForm" />
    <form class="form_contact_us" action="<wa:url URI="${site}/${module}/saveContactUs"/>" method="post">
      <fieldset>
      <p class="error">${ERROR_SAVE_CONTACT_US}</p>
        <div class="clr"></div>
        <span id="radio_greeting">
	        <label for="f_greeting" class="label_radio"><wa:mls>Votre titre* :</wa:mls></label>
	        <div class="box_input_radio">
                <div  class="list_input_radio">
	          <input name="f_greeting" type="radio" value="Mr" class="radio" <c:if test="${contactUs.greeting == 'Mr'}">checked="checked"</c:if>/>
	          <span class="radioTxt"><wa:mls>Mr</wa:mls></span>
	          <input name="f_greeting" type="radio" value="Mrs" class="radio" <c:if test="${contactUs.greeting == 'Mrs'}">checked="checked"</c:if>/>
	          <span class="radioTxt"><wa:mls>Mme</wa:mls></span>
	          <input name="f_greeting" type="radio" value="Miss" class="radio" <c:if test="${contactUs.greeting == 'Miss'}">checked="checked"</c:if>/>
	          <span class="radioTxt"><wa:mls>Mlle</wa:mls></span>
	        </div></div>
	         <img src="${staticSite}/img/ml/ok.png" class="validMsg"/> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        	<div class="radioRequiredMsg clr"><wa:mls>Veuillez faire un choix</wa:mls></div>
	    </span>
	      <div class="clr"></div>
          <span id="tfv_lastname">
	        <label for="f_lastname"><wa:mls>Nom* :</wa:mls></label>
	        <input name="f_lastname" type="text" maxlength="50" value="${wa:nullFree(contactUs.lastname)}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
            <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>

        </span>
        <div class="clr"></div>
        <span id="tfv_firstname">
	        <label for="f_firstname"><wa:mls>Prénom* :</wa:mls></label>
	        <input name="f_firstname" type="text" maxlength="50" value="${wa:nullFree(contactUs.firstname)}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
            <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>

	    </span>
	     <div class="clr"></div>
        <span id="radio_culture">
        <label for="f_culture" class="label_radio"><wa:mls>votre langue* :</wa:mls></label>
        <div class="box_input_radio">
            <div  class="list_input_radio">
          <input name="f_languageid" type="radio" value="FR" class="radio" <c:if test="${contactUs.languageid == 'FR'}">checked="checked"</c:if>/>
          <span class="radioTxt"><wa:mls>Fr</wa:mls></span>
          <input name="f_languageid" type="radio" value="NL" class="radio" <c:if test="${contactUs.languageid == 'NL'}">checked="checked"</c:if>/>
          <span class="radioTxt"><wa:mls>Nl</wa:mls></span>
          <input name="f_languageid" type="radio" value="EN" class="radio" <c:if test="${contactUs.languageid == 'EN'}">checked="checked"</c:if>/>
          <span class="radioTxt"><wa:mls>En</wa:mls></span> </div></div>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg"/> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="radioRequiredMsg clr"><wa:mls>Veuillez faire un choix</wa:mls></div>
        </span>
        <div class="clr"></div>
              <span id="tfv_email">
        <label  for="f_email"><wa:mls>E-mail* :</wa:mls></label>
	        <input name="f_email" type="text" maxlength="80" value="${wa:nullFree(contactUs.email)}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
                 <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        <div class="textfieldInvalidFormatMsg clr"><wa:mls>Le format de votre adresse n'est pas valide !</wa:mls></div>
        </span>
       <div class="clr"></div>
       <span id="tfv_street">
	       <label  for="f_street"><wa:mls>Rue :</wa:mls></label>
	       <input name="f_street" type="text" maxlength="100" value="${wa:nullFree(contactUs.street)}"/>
       </span>
       <div class="clr"></div>
       <span id="tfv_num">
	       <label  for="f_num"><wa:mls>N° :</wa:mls></label>
	       <input name="f_num" type="text" maxlength="10" value="${wa:nullFree(contactUs.num)}"/>
	   </span>
       <div class="clr"></div>
       <span id="tfv_box">
	       <label  for="f_box"><wa:mls>Boîte :</wa:mls></label>
	       <input name="f_box" type="text" maxlength="10" value="${wa:nullFree(contactUs.box)}" />
	   </span>
       <div class="clr"></div>
       <span id="tfv_zipcode">
	       <label  for="f_zipcode"><wa:mls>Code Postal :</wa:mls></label>
	       <input name="f_zipcode" type="text" maxlength="20" value="${wa:nullFree(contactUs.zipcode)}"/>

	   </span>
       <div class="clr"></div>
       <span id="tfv_city">
	       <label for="f_city"><wa:mls>Ville :</wa:mls></label>
	       <input name="f_city" type="text" maxlength="50" value="${wa:nullFree(contactUs.city)}"/>
       </span>
       <div class="clr"></div>
       <span id="tfv_country">
	       <label for="f_country"><wa:mls>Pays :</wa:mls></label>
	       <input name="f_country" type="text" maxlength="50" value="${wa:nullFree(contactUs.country)}"/>
       </span>
       <div class="clr"></div>
  
        <span id="tfv_phone">
	        <label for="f_phone"><wa:mls>Téléphone :</wa:mls></label>
	        <input name="f_phone" type="text" maxlength="20" value="${wa:nullFree(contactUs.phone)}"/>
       </span>
        <div class="clr"></div>
	   <div>
		        <span id="tfv_question_type">
			<label for="f_contactUsTypeQuestion_id"><wa:mls>Type de question</wa:mls>* :</label>
			<wa:include URI="${site}/dropdown/dropList">
				<wa:param name="class" value="com.bitc.hdata.ContactUsTypeQuestion" />
				<wa:param name="manager" value="com.bitc.hdata.manager.ContactUsTypeQuestionManager" />
				<wa:param name="method" value="listAll" />
				<wa:param name="identity" value="id" />
				<wa:param name="display" value="name" />
				<wa:param name="name" value="f_contactUsTypeQuestion_id"/>
				<wa:param name="selectedValues" value="${contactUs.contactUsTypeQuestion.id}"/>
			</wa:include>
		        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
		        <div class="selectRequiredMsg clr"><wa:mls>Veuillez faire un choix</wa:mls></div>            </span>
		</div>
         <div class="clr"></div>
         <span id="tfv_message">
	        <label for="f_message"><wa:mls>Votre message :</wa:mls></label>
	        <textarea name="f_message" type="text" maxlength="1000"/><c:if test="${contactUs.message != null}">${contactUs.message}</c:if></textarea>
	     </span>
	     
	   <div class="clr"></div>
         <wa:include URI="front/boxes/captcha" />
         <div class="clr"></div>
        <input type="submit" value="<wa:mls>Envoyer</wa:mls>" id="form_send" />
        <div class="clr"></div>
        <p><wa:mls>* Champs obligatoires à compléter</wa:mls></p>
        <p class="remark"><wa:mls>« All data of a personal nature passed on to Brussels International is recorded in the files of Brussels International - or those of third parties (professionals) acting on its behalf - for the purposes of managing marketing communication mailings. Further information may be obtained from the 'Commission pour la protection de la vie privée' (Commission for the Protection of Privacy) (Rue de la Régence 63, 1000 Brussels). Every individual has the right to access his/her personal data. Brussels International, 2-4 rue Royale, 1000 Brussels, owns and manages the file. »</wa:mls></p>
        <div class="clr"></div>
       </fieldset>
    </form>
  </div>
  <script type="text/javascript">
var spryQuestionType = new Spry.Widget.ValidationSelect("tfv_question_type", {validateOn:["blur, change"]});
var spryGreeting = new Spry.Widget.ValidationRadio("radio_greeting", {validateOn:["blur", "change"]});
var spryCulture = new Spry.Widget.ValidationRadio("radio_culture", {validateOn:["blur", "change"]});
var spryLastname = new Spry.Widget.ValidationTextField("tfv_lastname", "none", {validateOn:["blur"]});
var spryFirstname = new Spry.Widget.ValidationTextField("tfv_firstname", "none", {validateOn:["blur"]});
var spryEmail = new Spry.Widget.ValidationTextField("tfv_email", "email", {validateOn:["blur"]});
</script>
  <!--contentMain:end-->
