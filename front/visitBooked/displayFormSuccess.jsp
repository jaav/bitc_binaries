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
<script type="text/javascript" src="${staticSite}/js/SpryValidationSelect.js"></script>
<script type="text/javascript" src="${staticSite}/js/SpryValidationCheckbox.js"></script>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationTextField.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationRadio.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationPassword.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationConfirm.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationTextarea.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationSelect.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationCheckbox.css" media="screen, projection"/>
<div id="content_main">
    
    <wa:include URI="${site}/content/introForm" />
    <form class="form" action="<wa:url URI="${site}/${module}/saveVisitBooked"/>" method="post">
      <fieldset>
      <p class="error">${ERROR_SAVE_VISIT_BOOKED}</p>
      <span id="tfv_titre">
	        <label for="f_titre"><wa:mls>Titre de l'évenement :</wa:mls></label>
	        <input name="f_titre" type="text" disabled="disabled" value="${wa:nullFree(event.mainTitle)}"/>
      </span>
      <input name="f_titre" type="hidden" value="${wa:nullFree(event.mainTitle)}"/>
      <div class="clr"></div>
      <span id="tfv_culture">
	        <label for="f_culture"><wa:mls>Culture de l'évenement :</wa:mls></label>
	        <input name="f_culture" type="text" disabled="disabled" value="${wa:nullFree(event.language)}"/>
        </span>
      <div class="clr"></div>
      <span id="tfv_periodFromDate">
	        <label for="f_periodFromDate"><wa:mls>Date de l'évenement :</wa:mls></label>
	       <input name="f_periodFromDate" type="text" disabled="disabled" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${event.periodFromDate}"/>"/>
	   </span>
	   <div class="clr"></div>
      <span id="tfv_price">
	        <label for="f_price"><wa:mls>Prix de l'évenement :</wa:mls></label>
	        <input name="f_price" type="text" disabled="disabled" value="${wa:nullFree(event.mainPrice)}"/>
        </span>
        <input name="eventId" type="hidden"  value="${wa:nullFree(event.id)}"/>
      <div class="clr"></div>
      <span id="tfv_comment">
	        <label for="f_comment"><wa:mls>Message de réservation :</wa:mls></label><textarea name="f_comment" type="text" maxlength="1000" value=""/></textarea>
	  </span>
	   <div class="clr"></div>
	    <span id="tfv_numParticipant">
	        <label  for="f_numParticipant"><wa:mls>Nombre de participants* :</wa:mls></label>
	        <input name="f_numParticipant" type="text" maxlength="3" value=""/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
	        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
	    </span>
	    <div class="clr"></div>
        <span id="radio_greeting">
	        <label for="f_greeting" class="label_radio"><wa:mls>Titre* :</wa:mls></label>
	        <div class="box_input_radio">
	          <input name="f_greeting" type="radio" value="Mr" class="radio" <c:if test="${user.greeting == 'Mr'}">checked="checked"</c:if>/>
	          <span class="radioTxt"><wa:mls>Mr</wa:mls></span>
	          <div class="clr"></div>
	          <input name="f_greeting" type="radio" value="Mrs" class="radio" <c:if test="${user.greeting == 'Mrs'}">checked="checked"</c:if>/>
	          <span class="radioTxt"><wa:mls>Mme</wa:mls></span>
	          <div class="clr"></div>
	          <input name="f_greeting" type="radio" value="Miss" class="radio" <c:if test="${user.greeting == 'Miss'}">checked="checked"</c:if>/>
	          <span class="radioTxt"><wa:mls>Mlle</wa:mls></span> </div>
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
        <span id="tfv_email">
        <label  for="f_email"><wa:mls>E-mail* :</wa:mls></label>
	        <input name="f_email" type="text" maxlength="80" value="${wa:nullFree(user.email)}"/>
	       <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
	       <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
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
       </span>
       <div class="clr"></div>
       <span id="tfv_box">
	       <label  for="f_box"><wa:mls>Boîte :</wa:mls></label>
	       <input name="f_box" type="text" maxlength="10" value="${wa:nullFree(user.box)}" />
	   </span>
       <div class="clr"></div>
       <span id="tfv_zipcode">
	       <label  for="f_zipcode"><wa:mls>Code Postal* :</wa:mls></label>
	       <input name="f_zipcode" type="text" maxlength="4" value="${wa:nullFree(user.zipcode)}"/>
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
       <div class="clr"></div>
        <span id="tfv_phone">
	        <label for="f_phone"><wa:mls>Téléphone* :</wa:mls></label>
	        <input name="f_phone" type="text" maxlength="20" value=""/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
	       <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
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
var spryGreeting = new Spry.Widget.ValidationRadio("radio_greeting", {validateOn:["blur", "change"]});
var spryEmail = new Spry.Widget.ValidationTextField("tfv_culture", "none", {validateOn:["blur"]});
var spryLastname = new Spry.Widget.ValidationTextField("tfv_lastname", "none", {validateOn:["blur"]});
var spryFirstname = new Spry.Widget.ValidationTextField("tfv_firstname", "none", {validateOn:["blur"]});
var spryEmail = new Spry.Widget.ValidationTextField("tfv_email", "email", {validateOn:["blur"]});
var spryStreet = new Spry.Widget.ValidationTextField("tfv_street", "none", {validateOn:["blur"]});
var spryStreet = new Spry.Widget.ValidationTextField("tfv_phone", "none", {validateOn:["blur"]});	
var spryZipcode = new Spry.Widget.ValidationTextField("tfv_zipcode", "zip_code", {useCharacterMasking:true, format:"zip_custom", pattern:"0000",minChars:4, maxChars:4, validateOn:["blur"]});
var spryCity = new Spry.Widget.ValidationTextField("tfv_city", "none", {validateOn:["blur"]})
var spryCountry = new Spry.Widget.ValidationTextField("tfv_country", "none", {validateOn:["blur"]})
var spryNumParticipant = new Spry.Widget.ValidationTextField("tfv_numParticipant", "integer", {useCharacterMasking:true, validateOn:["blur"] });
</script>
  <!--contentMain:end-->
