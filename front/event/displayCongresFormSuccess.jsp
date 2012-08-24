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
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationTextField.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationRadio.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationPassword.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationConfirm.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationTextarea.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationSelect.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationCheckbox.css" media="screen, projection"/>

<script>
function sendForm(){

var errorFlag=false;
	for(var i=1; i<=15;i++){
		
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
		$("#congressForm").submit()
	}else{
		$("#errorForm").show();
	}
}
</script>

<div id="content_main">
    <wa:include URI="${site}/content/introForm" />
    
    <form class="form" id="congressForm" action="<wa:url URI="${site}/${module}/saveCongres"/>" method="post">
      <fieldset>
      <p class="error">${ERROR_SAVE_CONGRES}</p>
        <span id="radio_culture">
        <label for="f_culture" class="label_radio"><wa:mls>Culture* :</wa:mls></label>
        <div class="box_input_radio"><div  class="list_input_radio">
          <input name="f_culture" type="radio" value="BE_fr" class="radio" <c:if test="${culture == 'BE_fr'}">checked="checked"</c:if>/>
          <span class="radioTxt"><wa:mls>Fr</wa:mls></span>
          <input name="f_culture" type="radio" value="BE_nl" class="radio" <c:if test="${culture == 'BE_nl'}">checked="checked"</c:if>/>
          <span class="radioTxt"><wa:mls>Nl</wa:mls></span>
          <input name="f_culture" type="radio" value="BE_en" class="radio" <c:if test="${culture == 'BE_en'}">checked="checked"</c:if>/>
          <span class="radioTxt"><wa:mls>En</wa:mls></span></div></div>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg"/> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="radioRequiredMsg clr"><wa:mls>Veuillez faire un choix</wa:mls></div>
        </span>
   
        <div class="clr"></div>
        
        <span id="tfv_title">
        <label for="f_title"><wa:mls>Titre* : </wa:mls></label>
        <textarea name="f_title" id="f_title" maxlength="200">${wa:nullFree(congresEvent.title)}</textarea>
        <span id="Counttextarea_counter_title" class="counter">&nbsp;</span>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <span class="textareaRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></span> </span>
        <div class="clr"></div>
        
        <span id="tfv_abstract">
        <label for="f_abstract_"><wa:mls>Abstract* : </wa:mls></label>
        <textarea name="f_abstract_" id="f_abstract_" maxlength="2000">${wa:nullFree(congresEvent.abstract_)}</textarea>
        <span id="Counttextarea_counter_abstract" class="counter">&nbsp;</span>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <span class="textareaRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></span> </span>
        <div class="clr"></div>
        
        <span id="tfv_periodFromDate">
        <label  for="f_periodFromDate"><wa:mls>Date début periode* :</wa:mls></label>
        <input name="f_periodFromDate" type="text"  value="<fmt:formatDate pattern="dd/MM/yyyy" value="${congresEvent.periodFromDate}"/>"/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        <div class="textfieldInvalidFormatMsg clr"><wa:mls>Veuillez entrer une date au format JJ/MM/AAAA</wa:mls></div>
        </span>
        <div class="clr"></div>
        
        <span id="tfv_periodToDate">
        <label  for="f_periodToDate"><wa:mls>Date fin periode* :</wa:mls></label>
        <input name="f_periodToDate" type="text"  value="<fmt:formatDate pattern="dd/MM/yyyy" value="${congresEvent.periodToDate}"/>"/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        <div class="textfieldInvalidFormatMsg clr"><wa:mls>Veuillez entrer une date au format JJ/MM/AAAA</wa:mls></div>
        </span>
        <div class="clr"></div>
        
        <span id="tfv_numParticipation">
        <label  for="f_numParticipation"><wa:mls>Nombre de participants :</wa:mls></label>
        <input name="f_numParticipation" type="text" maxlength="3" value="${wa:nullFree(congresEvent.numParticipation)}"/>
        </span>
        <div class="clr"></div>
        
        <span id="tfv_adresseFr">
        <label  for="f_adresseFr"><wa:mls>Adresse* :</wa:mls></label>
        <input name="f_adresseFr" type="text" maxlength="150" value="${wa:nullFree(congresEvent.adresseFr)}"/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        <div class="clr"></div>
        
        <span id="tfv_zipcode">
        <label  for="f_zipcode"><wa:mls>Code Postal* :</wa:mls></label>
        <input name="f_zipcode" type="text" maxlength="4" value="${wa:nullFree(congresEvent.zipcode)}"/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        <div class="textfieldInvalidFormatMsg clr"><wa:mls>Veuillez encoder 4 chiffres</wa:mls></div>
        </span>
        <div class="clr"></div>
        
        <span id="tfv_cityFr">
        <label for="f_cityFr"><wa:mls>Ville* :</wa:mls></label>
        <input name="f_cityFr" type="text" maxlength="50" value="${wa:nullFree(congresEvent.cityFr)}"/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        <div class="clr"></div>
        
        <span id="tfv_email">
        <label  for="f_email"><wa:mls>E-mail* :</wa:mls></label>
        <input name="f_email" type="text" maxlength="80" value="${wa:nullFree(congresEvent.email)}"/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        <div class="textfieldInvalidFormatMsg clr"><wa:mls>Le format de votre adresse n'est pas valide !</wa:mls></div>
        </span>
        <div class="clr"></div>
        
        <span id="tfv_phone">
        <label for="f_phone"><wa:mls>Téléphone :</wa:mls></label>
        <input name="f_phone" type="text" maxlength="20" value="${wa:nullFree(congresEvent.phone)}"/>
        </span>
        <div class="clr"></div>
        
        <span id="tfv_mobile">
        <label for="f_mobile"><wa:mls>Mobile :</wa:mls></label>
        <input name="f_mobile" type="text" maxlength="20" value="${wa:nullFree(congresEvent.mobile)}"/>
        </span>
        <div class="clr"></div>
        
        <span id="tfv_fax">
        <label for="f_fax"><wa:mls>Fax :</wa:mls></label>
        <input name="f_fax" type="text" maxlength="20" value="${wa:nullFree(congresEvent.fax)}"/>
        </span>
        <div class="clr"></div>
        
        <span id="tfv_website">
        <label  for="f_website"><wa:mls>URL site :</wa:mls></label>
        <input name="f_website" type="text" maxlength="100" value="${wa:nullFree(congresEvent.website)}"/>
        <div class="textfieldInvalidFormatMsg clr"><wa:mls>L'adresse web n'est pas valide</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_organisationInformation">
        <label for="f_organisationInformation"><wa:mls>Informations organisateur : </wa:mls></label>
        <textarea name="f_organisationInformation" id="f_organisationInformation" maxlength="2000">${wa:nullFree(infosOrganisateur)}</textarea>
        <span id="Counttextarea_counter" class="counter">&nbsp;</span>
        </span>
        <div class="clr"></div>
        
        
        <wa:include URI="front/boxes/captcha" />
        
         <div class="clr"></div>
        <div class="error" id="errorForm" style="display:none" ><wa:mls>erreur dans un des champs du formulaire</wa:mls></div>
        
        <input type="button" value="<wa:mls>Envoyer</wa:mls>" id="form_send" onclick="sendForm();" />
        <div class="clr"></div>
        <p><wa:mls>* Champs obligatoires à compléter</wa:mls></p>
        <p class="remark"><wa:mls>« All data of a personal nature passed on to Brussels International is recorded in the files of Brussels International - or those of third parties (professionals) acting on its behalf - for the purposes of managing marketing communication mailings. Further information may be obtained from the 'Commission pour la protection de la vie privée' (Commission for the Protection of Privacy) (Rue de la Régence 63, 1000 Brussels). Every individual has the right to access his/her personal data. Brussels International, 2-4 rue Royale, 1000 Brussels, owns and manages the file. »</wa:mls></p>
      </fieldset>
    </form>
  </div>
  <script type="text/javascript">

var spry1 = new Spry.Widget.ValidationRadio("radio_culture", {validateOn:["blur", "change"]});
var spry2 = new Spry.Widget.ValidationTextarea("tfv_title", {maxChars:200, counterType:"chars_remaining", counterId:"Counttextarea_counter_title", validateOn:["blur"], isRequired:true});
var spry3 = new Spry.Widget.ValidationTextarea("tfv_abstract", {maxChars:2000, counterType:"chars_remaining", counterId:"Counttextarea_counter_abstract", validateOn:["blur"], isRequired:true});
var spry4 = new Spry.Widget.ValidationTextField("tfv_periodFromDate", "date", {format:"dd/mm/yyyy", pattern:"00/00/0000", validateOn:["blur"], useCharacterMasking:true, isRequired:true});
var spry5 = new Spry.Widget.ValidationTextField("tfv_periodToDate", "date", {format:"dd/mm/yyyy", pattern:"00/00/0000", validateOn:["blur"], useCharacterMasking:true, isRequired:true});
var spry6 = new Spry.Widget.ValidationTextField("tfv_numParticipation", "integer", {useCharacterMasking:true, validateOn:["blur"], isRequired:false});
var spry7 = new Spry.Widget.ValidationTextField("tfv_adresseFr", "none", {validateOn:["blur"]});
var spry8 = new Spry.Widget.ValidationTextField("tfv_zipcode", "zip_code", {useCharacterMasking:true, format:"zip_custom", pattern:"0000",minChars:4, maxChars:4, validateOn:["blur"]});
var spry9 = new Spry.Widget.ValidationTextField("tfv_cityFr", "none", {validateOn:["blur"]})
var spry10 = new Spry.Widget.ValidationTextField("tfv_email", "email", {validateOn:["blur"]});
var spry11 = new Spry.Widget.ValidationTextField("tfv_phone", "integer", {useCharacterMasking:true, validateOn:["blur"], isRequired:false});
var spry12 = new Spry.Widget.ValidationTextField("tfv_mobile", "integer", {useCharacterMasking:true, validateOn:["blur"], isRequired:false});
var spry13 = new Spry.Widget.ValidationTextField("tfv_fax", "integer", {useCharacterMasking:true, validateOn:["blur"], isRequired:false});
var spry14 = new Spry.Widget.ValidationTextField("tfv_website", "url", {validateOn:["blur"],hint:"http://", isRequired:false});
var spry15 = new Spry.Widget.ValidationTextarea("tfv_organisationInformation", {maxChars:2000, counterType:"chars_remaining", counterId:"Counttextarea_counter", validateOn:["blur"], isRequired:false});

</script>
  <!--contentMain:end-->
