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
    
    <form class="form">
      <fieldset>
      <p class="error">${errorMsg}</p>
        <span id="radio_greeting">
        <label for="f_greeting" class="label_radio"><wa:mls>Titre* :</wa:mls></label>
        <div class="box_input_radio">
          <input name="f_greeting" type="radio" value="Mr" class="radio" />
          <span class="radioTxt"><wa:mls>Mr</wa:mls></span>
          <div class="clr"></div>
          <input name="f_greeting" type="radio" value="Mme" class="radio" />
          <span class="radioTxt"><wa:mls>Mme</wa:mls></span>
          <div class="clr"></div>
          <input name="f_greeting" type="radio" value="Mlle" class="radio" />
          <span class="radioTxt"><wa:mls>Mlle</wa:mls></span> </div>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg"/> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="radioRequiredMsg clr"><wa:mls>Veuillez faire un choix</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="radio_gender">
        <label for="f_gender" class="label_radio"><wa:mls>Genre* :</wa:mls></label>
        <div class="box_input_radio">
          <input name="f_gender" type="radio" value="M" class="radio" />
          <span class="radioTxt"><wa:mls>Homme</wa:mls></span>
          <div class="clr"></div>
          <input name="f_gender" type="radio" value="W" class="radio" />
          <span class="radioTxt"><wa:mls>Femme</wa:mls></span> </div>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg"/> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="radioRequiredMsg clr"><wa:mls>Veuillez faire un choix</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="radio_culture">
        <label for="f_greeting" class="label_radio"><wa:mls>Langue* :</wa:mls></label>
        <div class="box_input_radio">
          <input name="f_greeting" type="radio" value="Fr" class="radio" />
          <span class="radioTxt"><wa:mls>Fr</wa:mls></span>
          <div class="clr"></div>
          <input name="f_greeting" type="radio" value="Nl" class="radio" />
          <span class="radioTxt"><wa:mls>Nl</wa:mls></span>
          <div class="clr"></div>
          <input name="f_greeting" type="radio" value="En" class="radio" />
          <span class="radioTxt"><wa:mls>En</wa:mls></span> </div>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg"/> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="radioRequiredMsg clr"><wa:mls>Veuillez faire un choix</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_lastname">
        <label for="f_lastname"><wa:mls>Nom* :</wa:mls></label>
        <input name="f_lastname" type="text" maxlength="50" value=""/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_firstname">
        <label for="f_firstname"><wa:mls>Prénom* :</wa:mls></label>
        <input name="f_firstname" type="text" maxlength="50" value=""/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_pseudo">
        <label for="f_pseudo"><wa:mls>Pseudo utilisé pour les commentaires* :</wa:mls></label>
        <input name="f_pseudo" type="text" maxlength="50" value=""/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_email">
        <label  for="f_email"><wa:mls>E-mail* :</wa:mls></label>
        <input name="f_email" type="text" maxlength="80" value=""/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        <div class="textfieldInvalidFormatMsg clr"><wa:mls>Le format de votre adresse n'est pas valide !</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_birthdate">
        <label  for="f_birthdate"><wa:mls>Date de naissance* :</wa:mls></label>
        <input name="f_birthdate" type="text"  value=""/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        <div class="textfieldInvalidFormatMsg clr"><wa:mls>Veuillez entrer une date au format JJ/MM/AAAA</wa:mls></div>
        </span>
        <div class="clr"></div>
        <div class="clr"></div>
        <span id="tfv_password">
        <label  for="f_password"><wa:mls>Mot de passe* :</wa:mls></label>
        <input name="f_password" type="password" maxlength="50" value=""/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" /> <span class="passwordRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></span> </span>
        <div class="clr"></div>
        <span id="tfv_password2">
        <label  for="f_password2"><wa:mls>Confirmer mot de passe* :</wa:mls></label>
        <input name="f_password2" type="password" maxlength="50" value=""/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" /> <span class="confirmRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></span> <span class="confirmInvalidMsg clr"><wa:mls>Ce champ ne correspond pas au Mot de passe</wa:mls></span> </span>
        <div class="clr"></div>
        <span id="tfv_street">
        <label  for="f_street"><wa:mls>Rue* :</wa:mls></label>
        <input name="f_street" type="text" maxlength="100" value=""/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_num">
        <label  for="f_num"><wa:mls>N° :</wa:mls></label>
        <input name="f_num" type="text" maxlength="10" value=""/>
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_box">
        <label  for="f_box"><wa:mls>Boîte :</wa:mls></label>
        <input name="f_box" type="text" maxlength="10" value="" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_zipcode">
        <label  for="f_zipcode"><wa:mls>Code Postal* :</wa:mls></label>
        <input name="f_zipcode" type="text" maxlength="4" value=""/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        <div class="textfieldInvalidFormatMsg clr"><wa:mls>Veuillez encoder 4 chiffres</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_city">
        <label for="f_city"><wa:mls>Ville* :</wa:mls></label>
        <input name="f_city" type="text" maxlength="50" value=""/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_country">
        <label for="f_country"><wa:mls>Pays* :</wa:mls></label>
        <input name="f_country" type="text" maxlength="50" value=""/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_comment">
        <label for="f_comment"><wa:mls>Remarque :</wa:mls></label>
        <textarea name="f_comment" type="text" maxlength="1000" value=""/>
        </textarea>
        <div class="textareaRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_numParticipation">
        <label  for="f_numParticipation"><wa:mls>Nombre de participants* :</wa:mls></label>
        <input name="f_numParticipation" type="text" maxlength="3" value=""/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_phone">
        <label for="f_phone"><wa:mls>Téléphone :</wa:mls></label>
        <input name="f_phone" type="text" maxlength="20" value=""/>
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_gsm">
        <label for="f_gsm"><wa:mls>Mobile :</wa:mls></label>
        <input name="f_gsm" type="text" maxlength="20" value=""/>
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_fax">
        <label for="f_fax"><wa:mls>Fax :</wa:mls></label>
        <input name="f_fax" type="text" maxlength="20" value=""/>
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_website">
        <label  for="f_website"><wa:mls>URL site :</wa:mls></label>
        <input name="f_website" type="text" maxlength="100" value=""/>
        <div class="textfieldInvalidFormatMsg clr"><wa:mls>L'adresse web n'est pas valide</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_message">
        <label for="f_message"><wa:mls>Message : </wa:mls></label>
        <textarea name="f_message" id="f_message" maxlength="1000"></textarea>
        <span id="Counttextarea_counter" class="counter">&nbsp;</span> 
        <span class="textareaRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></span> </span>
        <div class="clr"></div>
        <div class="clr"></div>
        <span id="tfv_company_name">
        <label for="f_company_name"><wa:mls>Nom de la société* :</wa:mls></label>
        <input name="f_company_name" type="text" maxlength="100" value=""/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_company_type">
        <label for="f_company_type" class="label_radio"><wa:mls>Type de société* :</wa:mls></label>
        <select name="f_company_type" id="f_startDate">
          <option value=""><wa:mls>Choisissez</wa:mls></option>
          <option value="Press" >Press</option>
          <option value="Tour" >Tour</option>
          <option value="Mice" >Mice</option>
          <option value="Travel" >Travel</option>
          <option value="Public" >Public</option>
          <option value="Other" >Other</option>
        </select>     
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="selectRequiredMsg clr"><wa:mls>Veuillez faire un choix</wa:mls></div>
        </span>
       <div class="clr"></div>
        

        <div class="box_input_checkbox">
        		<input type="checkbox" name="f_allowEmail" id="f_allowEmail" value="1" class="checkbox" />
							<span class="checkboxTxt"><wa:mls>Oui, le BITC peut me contacter.</wa:mls></span>
							<div class="clr"></div>
							<input type="checkbox" name="f_allowForumEmail" id="f_allowForumEmail"  value="1" class="checkbox" />
							<span class="checkboxTxt">Je veux être tenu au courant lorsque quelqu'un réagit à une de mes questions sur le forum.</span>
							<div class="clr"></div>
							<input type="checkbox" name="f_allowPartner" id="f_allowPartner"  value="1" class="checkbox" />
							<span class="checkboxTxt">Je souhaite être tenu informé des nouvelles du BITC aussi bien par courrier que par e-mail</span>
							<div class="clr"></div>
</div>
            <wa:include URI="front/boxes/captcha" />
        <div class="clr"></div>
        
        
        
        
        <input type="submit" value="<wa:mls>Envoyer</wa:mls>" id="form_send" />
        <div class="clr"></div>
        <p><wa:mls>* Champs obligatoires à compléter</wa:mls></p>
        <p class="remark"><wa:mls>« All data of a personal nature passed on to Brussels International is recorded in the files of Brussels International - or those of third parties (professionals) acting on its behalf - for the purposes of managing marketing communication mailings. Further information may be obtained from the 'Commission pour la protection de la vie privée' (Commission for the Protection of Privacy) (Rue de la Régence 63, 1000 Brussels). Every individual has the right to access his/her personal data. Brussels International, 2-4 rue Royale, 1000 Brussels, owns and manages the file. »</wa:mls></p>
      </fieldset>
    </form>
  </div>
  <script type="text/javascript">
var spryGreeting = new Spry.Widget.ValidationRadio("radio_greeting", {validateOn:["blur", "change"]});
var spryGender = new Spry.Widget.ValidationRadio("radio_gender", {validateOn:["blur", "change"]});
var spryCulture = new Spry.Widget.ValidationRadio("radio_culture", {validateOn:["blur", "change"]});
var spryLastname = new Spry.Widget.ValidationTextField("tfv_lastname", "none", {validateOn:["blur"]});
var spryFirstname = new Spry.Widget.ValidationTextField("tfv_firstname", "none", {validateOn:["blur"]});
var spryPseudo = new Spry.Widget.ValidationTextField("tfv_pseudo", "none", {validateOn:["blur"]});
var spryEmail = new Spry.Widget.ValidationTextField("tfv_email", "email", {validateOn:["blur"]});
var spryBirthdate = new Spry.Widget.ValidationTextField("tfv_birthdate", "date", {format:"dd/mm/yyyy", pattern:"00/00/0000", validateOn:["blur"], useCharacterMasking:true, isRequired:true});
var spryPassword = new Spry.Widget.ValidationPassword("tfv_password", {validateOn:["blur"]});
var spryPassword2 = new Spry.Widget.ValidationConfirm("tfv_password2", "tfv_password", {validateOn: ['blur']});	
var spryStreet = new Spry.Widget.ValidationTextField("tfv_street", "none", {validateOn:["blur"]});	
var spryNum = new Spry.Widget.ValidationTextField("tfv_num", "none", {validateOn:["blur"], isRequired:false});	
var spryBox = new Spry.Widget.ValidationTextField("tfv_box", "none", {validateOn:["blur"], isRequired:false});
var spryZipcode = new Spry.Widget.ValidationTextField("tfv_zipcode", "zip_code", {useCharacterMasking:true, format:"zip_custom", pattern:"0000",minChars:4, maxChars:4, validateOn:["blur"]});
var spryCity = new Spry.Widget.ValidationTextField("tfv_city", "none", {validateOn:["blur"]})
var spryCountry = new Spry.Widget.ValidationTextField("tfv_country", "none", {validateOn:["blur"]})
var spryCommeny = new Spry.Widget.ValidationTextarea("tfv_comment", {validateOn:["blur"], isRequired:false});
var spryNumParticipant = new Spry.Widget.ValidationTextField("tfv_num_participant", "integer", {useCharacterMasking:true, validateOn:["blur"] });
var spryPhone = new Spry.Widget.ValidationTextField("tfv_phone", "integer", {useCharacterMasking:true, validateOn:["blur"], isRequired:false});
var spryGsm = new Spry.Widget.ValidationTextField("tfv_gsm", "integer", {useCharacterMasking:true, validateOn:["blur"], isRequired:false});
var spryFax = new Spry.Widget.ValidationTextField("tfv_fax", "integer", {useCharacterMasking:true, validateOn:["blur"], isRequired:false});
var spryWebsite = new Spry.Widget.ValidationTextField("tfv_website", "url", {validateOn:["blur"],hint:"http://", isRequired:false});
var textMessage = new Spry.Widget.ValidationTextarea("tfv_message", {maxChars:1000, counterType:"chars_remaining", counterId:"Counttextarea_counter", validateOn:["blur"]});
var spryCompanyName = new Spry.Widget.ValidationTextField("tfv_company_name", "none", {validateOn:["blur"]});
var spryCompanyType = new Spry.Widget.ValidationSelect("tfv_company_type", {validateOn:["blur, change"]});
</script>
  <!--contentMain:end-->
