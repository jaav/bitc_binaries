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
<div id="btn_back"><a href="javascript:history.back();"><wa:mls>Back</wa:mls></a></div>
<script type="text/javascript" src="${staticSite}/js/SpryValidationTextField.js"></script>
<script type="text/javascript" src="${staticSite}/js/SpryValidationConfirm.js"></script>
<script type="text/javascript" src="${staticSite}/js/SpryValidationTextarea.js"></script>
<script type="text/javascript" src="${staticSite}/js/SpryValidationCheckbox.js"></script>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationTextField_contact.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationConfirm.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationTextarea.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationCheckbox.css" media="screen, projection"/>
<div id="content_main">
	<wa:include URI="${site}/content/introForm" />
    <form class="form_contact_us form_deals_contact" action="<wa:url URI="${site}/${module}/saveDealsAnswer"/>" method="post">
      <fieldset>
      <p class="error">${ERROR_SAVE_DEALS_ANSWER}</p>
        <div class="clr"></div>
       
          
       
  
              <input name="id" type="hidden" value="${dealsAnswer.contentDealsId}"/>
              <span id="tfv_organisme">
	        <label for="f_organisme"><wa:mls>Organisme</wa:mls></label>
	        <input name="f_organisme" type="text" maxlength="50" value="${wa:nullFree(dealsAnswer.organisme)}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
            <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>

        </span>
	      <div class="clr"></div>
          <span id="tfv_lastname">
	        <label for="f_lastname"><wa:mls>Nom</wa:mls>&nbsp;:*</label>
	        <input name="f_lastname" type="text" maxlength="50" value="${wa:nullFree(dealsAnswer.lastname)}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
            <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>

        </span>
        <div class="clr"></div>
        <span id="tfv_firstname">
	        <label for="f_firstname"><wa:mls>Prénom</wa:mls>&nbsp;:*</label>
	        <input name="f_firstname" type="text" maxlength="50" value="${wa:nullFree(dealsAnswer.firstname)}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
            <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>

	    </span>
	      <div class="clr"></div>
	       <span id="tfv_phone">
	        <label for="f_phone"><wa:mls>Téléphone</wa:mls></label>
	        <input name="f_phone" type="text" maxlength="20" value="${wa:nullFree(dealsAnswer.phone)}"/>
	         <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
            <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
         
        <div class="clr"></div>
              <span id="tfv_email">
        <label  for="f_email"><wa:mls>E-mail</wa:mls> *</label>
	        <input name="f_email" type="text" maxlength="80" value="${wa:nullFree(dealsAnswer.email)}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
                 <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        <div class="textfieldInvalidFormatMsg clr"><wa:mls>Le format de votre adresse n'est pas valide !</wa:mls></div>
        </span>
       <div class="clr"></div>
            <span id="tfv_emailConf">
        <label  for="f_emailConf"><wa:mls>ConfirmerLe-mail</wa:mls></label>
	        <input name="f_emailConf" type="text" maxlength="80" value="${wa:nullFree(dealsAnswer.email)}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
			<div class="clr"></div>
                      <div class="confirmRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
                      <div class="confirmInvalidMsg clr"><wa:mls>L'adresse n'est pas valide</wa:mls></div> 
        </span>
         <div class="clr"></div>
        <span id="tfv_numParticipant">
	        <label for="f_numParticipant"><wa:mls>Nombredparticipants</wa:mls></label>
	         
	        <input name="f_numParticipant" type="text" maxlength="50" value="${wa:nullFree(dealsAnswer.numParticipant)}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
            <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>

	    </span>
	     
       
                                  <div class="clr"></div>
             <span id="check_stay">
	        <label for="f_stay" class="label_check"><wa:mls>Logement</wa:mls></label>
	       		 <input type="checkbox" <c:if test="${dealsAnswer.stay==true}"> checked="checked"</c:if>  value="true" name="f_stay" class="checkbox"/>  
	     
	    </span>
             <div class="clr"></div>                          
         <span id="tfv_info">
	        <label for="f_info"><wa:mls>Informationscomplémentaires</wa:mls></label>
	        <textarea name="f_info" type="text" maxlength="1000"/><c:if test="${dealsAnswer.info != null}">${dealsAnswer.info}</c:if></textarea>
	     </span>
	      <div class="clr"></div>
	      
	         <span id="check_optin">
	            
         <label for="f_optin"  class="label_check"><wa:mls>optinnewsletter</wa:mls></label>
				 <input type="checkbox" class="checkbox"   <c:if test="${ dealsAnswer.optin==true}"> checked="checked"</c:if> value="true" name="f_optin"/>  
 
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
  var spryNumParticipant = new Spry.Widget.ValidationTextField("tfv_numParticipant", "none",{isRequired:true,validateOn:["blur","change"]});
 
var spryOrganisme = new Spry.Widget.ValidationTextField("tfv_organisme", "none",{isRequired:true,validateOn:["blur","change"]});
var spryPhone = new Spry.Widget.ValidationTextField("tfv_phone", "none",{isRequired:true,validateOn:["blur","change"]});
var spryLastname = new Spry.Widget.ValidationTextField("tfv_lastname", "none",{isRequired:true,validateOn:["blur","change"]});
var spryFirstname = new Spry.Widget.ValidationTextField("tfv_firstname", "none",{isRequired:true,validateOn:["blur","change"]});
var spryEmail = new Spry.Widget.ValidationTextField("tfv_email", "email",{isRequired:true,validateOn:["blur","change"]});
var spryEmailConf = new Spry.Widget.ValidationConfirm("tfv_emailConf","tfv_email",{validateOn:["blur","change"]});

</script>
  <!--contentMain:end-->
