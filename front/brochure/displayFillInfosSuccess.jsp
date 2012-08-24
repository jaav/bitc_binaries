<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="${static}/front/js/SpryValidationTextField.js"></script>
<script type="text/javascript" src="${static}/front/js/SpryValidationRadio.js"></script>
<script type="text/javascript" src="${static}/front/js/SpryValidationPassword.js"></script>
<script type="text/javascript" src="${static}/front/js/SpryValidationConfirm.js"></script>
<script type="text/javascript" src="${static}/front/js/SpryValidationTextarea.js"></script>
<script type="text/javascript" src="${static}/front/js/SpryValidationSelect.js"></script>
<script type="text/javascript" src="${static}/front/js/SpryValidationCheckbox.js"></script>

<link rel="stylesheet" type="text/css" href="${static}/front/css/SpryValidationTextField.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/SpryValidationRadio.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/SpryValidationPassword.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/SpryValidationConfirm.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/SpryValidationTextarea.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/SpryValidationSelect.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/SpryValidationSelect_search.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/SpryValidationCheckbox.css" media="screen, projection"/>

<!--contentMain:start-->
  <div id="content_main">
    <h1 class="line_pink"><wa:mls>ACHETER EN LIGNE</wa:mls></h1>
    <!--nav_eshop:start-->
    <ul id="nav_eshop">
      <li><b>1. <wa:mls>Mon panier</wa:mls></b></li>
      <li class="select"><b>2. <wa:mls>Coordonnées</wa:mls></b></li>
      <li><b>3. <wa:mls>Récapitulatif</wa:mls></b></li>
      <li><b>4. <wa:mls>Confirmation</wa:mls></b></li>
    </ul>
    <!--nav_eshop:end-->
    <br clear="all" />
    <div class="clr"></div>
    <hr class="dashed" />
    <c:if test="${errorEshop != null }">
    	<p class="error"><wa:mls>${errorEshop}</wa:mls></p>
    </c:if>
    <form class="form_eshop" action="${context}/${site}/${module}/saveInfos.do">
      <fieldset>
      	<span id="tfv_invoiceCompanyName">
        <label for="f_invoiceCompanyName"><wa:mls>Company Name :</wa:mls></label>
        <input name="f_invoiceCompanyName" type="text" maxlength="50" 
        	<c:choose>
	        	<c:when test="${orderBrochure.invoiceCompanyName != null}">value="${orderBrochure.invoiceCompanyName}"</c:when>
	        	<c:when test="${user.companyName != null}">value="${user.companyName}"</c:when>
	        </c:choose>         
        />
        </span>
        <div class="clr"></div>
        <span id="tfv_invoiceLastname">
        <label for="f_invoiceLastname"><wa:mls>Nom* :</wa:mls></label>
        <input name="f_invoiceLastname"  type="text" maxlength="50" 
        	<c:choose>
	        	<c:when test="${orderBrochure.invoiceLastname != null}">value="${orderBrochure.invoiceLastname}"</c:when>
	        	<c:when test="${user.lastname != null}">value="${user.lastname}"</c:when>
	        </c:choose> 
        />
        <img src="${static}/front/img/ml/ok.png" class="validMsg" /> <img src="${static}/front/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_invoiceFirstname">
        <label for="f_invoiceFirstname"><wa:mls>Prénom* :</wa:mls></label>
        <input name="f_invoiceFirstname"  type="text" maxlength="50" 
			<c:choose>
	        	<c:when test="${orderBrochure.invoiceFirstname != null}">value="${orderBrochure.invoiceFirstname}"</c:when>
	        	<c:when test="${user.firstname != null}">value="${user.firstname}"</c:when>
	        </c:choose>
		/>
        <img src="${static}/front/img/ml/ok.png" class="validMsg" /> <img src="${static}/front/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_invoiceBirthdate">
        <label  for="f_invoiceBirthdate"><wa:mls>Date de naissance* :</wa:mls></label>
        <input name="f_invoiceBirthdate"  type="text"  
        	<c:choose>
	        	<c:when test="${orderBrochure.invoiceBirthdate != null}">value="<fmt:formatDate value="${orderBrochure.invoiceBirthdate}" pattern="dd/MM/yyyy" />"</c:when>
	        	<c:when test="${user.birthdate != null}">value="<fmt:formatDate value="${user.birthdate}" pattern="dd/MM/yyyy" />"</c:when>
	        </c:choose>
        />
        <img src="${static}/front/img/ml/ok.png" class="validMsg" /> <img src="${static}/front/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        <div class="textfieldInvalidFormatMsg clr"><wa:mls>Veuillez entrer une date au format JJ/MM/AAAA</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_invoiceEmail">
        <label  for="f_invoiceEmail"><wa:mls>E-mail* :</wa:mls></label>
        <input name="f_invoiceEmail"  type="text" maxlength="80" 
        	<c:choose>
	        	<c:when test="${orderBrochure.invoiceEmail != null}">value="${orderBrochure.invoiceEmail}"</c:when>
	        	<c:when test="${user.email != null}">value="${user.email}"</c:when>
	        </c:choose>
        />
        <img src="${static}/front/img/ml/ok.png" class="validMsg" /> <img src="${static}/front/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        <div class="textfieldInvalidFormatMsg clr"><wa:mls>Le format de votre adresse n'est pas valide !</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_invoiceStreet">
        <label for="f_invoiceStreet"><wa:mls>Street* :</wa:mls></label>
        <input name="f_invoiceStreet"  type="text" maxlength="50" 
        	<c:choose>
	        	<c:when test="${orderBrochure.invoiceStreet != null}">value="${orderBrochure.invoiceStreet}"</c:when>
	        	<c:when test="${user.street != null}">value="${user.street}"</c:when>
	        </c:choose>
        />
        <img src="${static}/front/img/ml/ok.png" class="validMsg" /> <img src="${static}/front/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        
        <div class="clr"></div>
        <span id="tfv_invoiceNum">
        <label for="f_invoiceNum"><wa:mls>Num :</wa:mls></label>
        <input name="f_invoiceNum"  type="text" maxlength="50" 
        	<c:choose>
	        	<c:when test="${orderBrochure.invoiceNum != null}">value="${orderBrochure.invoiceNum}"</c:when>
	        	<c:when test="${user.num != null}">value="${user.num}"</c:when>
	        </c:choose>
        />
        </span>
        <div class="clr"></div>
        <span id="tfv_invoiceBox">
        <label for="f_invoiceBox"><wa:mls>Box :</wa:mls></label>
        <input name="f_invoiceBox"  type="text" maxlength="50" 
        	<c:choose>
	        	<c:when test="${orderBrochure.invoiceBox != null}">value="${orderBrochure.invoiceBox}"</c:when>
	        	<c:when test="${user.box != null}">value="${user.box}"</c:when>
	        </c:choose>
        />
        </span>
        <div class="clr"></div>
        <span id="tfv_invoiceZipcode">
        <label for="f_invoiceZipcode"><wa:mls>zipcode* :</wa:mls></label>
        <input name="f_invoiceZipcode"  type="text" maxlength="50" 
        	<c:choose>
	        	<c:when test="${orderBrochure.invoiceZipcode != null}">value="${orderBrochure.invoiceZipcode}"</c:when>
	        	<c:when test="${user.zipcode != null}">value="${user.zipcode}"</c:when>
	        </c:choose>
        />
        <img src="${static}/front/img/ml/ok.png" class="validMsg" /> <img src="${static}/front/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_invoiceCity">
        <label for="f_invoiceCity"><wa:mls>City* :</wa:mls></label>
        <input name="f_invoiceCity"  type="text" maxlength="50" 
        	<c:choose>
	        	<c:when test="${orderBrochure.invoiceCity != null}">value="${orderBrochure.invoiceCity}"</c:when>
	        	<c:when test="${user.city != null}">value="${user.city}"</c:when>
	        </c:choose>
        />
        <img src="${static}/front/img/ml/ok.png" class="validMsg" /> <img src="${static}/front/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        
        <div class="clr"></div>
        <span id="tfv_invoiceCountry">
        <label for="f_invoiceCountry"><wa:mls>Pays* :</wa:mls></label>
        <input name="f_invoiceCountry" type="text" maxlength="50" 
			<c:choose>
	        	<c:when test="${orderBrochure.invoiceCountry != null}">value="${orderBrochure.invoiceCountry}"</c:when>
	        	<c:when test="${user.country != null}">value="${user.country}"</c:when>
	        </c:choose> 
		/>
        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>
        <div class="clr"></div>
        <span id="tfv_invoicePhone">
        <label for="f_invoicePhone"><wa:mls>Phone :</wa:mls></label>
        <input name="f_invoicePhone"  type="text" maxlength="50" 
        	<c:choose>
	        	<c:when test="${orderBrochure.invoicePhone != null}">value="${orderBrochure.invoicePhone}"</c:when>
	        	<c:when test="${user.phone != null}">value="${user.phone}"</c:when>
	        </c:choose>
        />
        </span>
        <div class="clr"></div>
        <span id="tfv_invoiceFax">
        <label for="f_invoiceFax"><wa:mls>Fax :</wa:mls></label>
        <input name="f_invoiceFax"  type="text" maxlength="50" 
        	<c:choose>
	        	<c:when test="${orderBrochure.invoiceFax != null}">value="${orderBrochure.invoiceFax}"</c:when>
	        	<c:when test="${user.fax != null}">value="${user.fax}"</c:when>
	        </c:choose>
        />
        </span>
        <div class="clr"></div>
        <c:if test="${isMeeting == true}">
        
  		<div class="clr"></div>
  		<br /><br />
		<strong><wa:mls>In order to provide you with a more personalised service, can you please help us with the following</wa:mls></strong>
		<br /><br /><wa:mls>*How did you know our services ?</wa:mls>
		<div class="checkbox_set">
			<input type=checkbox name="f_howDoYouKnow" value="Internet" class="checkbox" /><span class="checkboxTxt"><wa:mls>Internet</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_howDoYouKnow" value="Press" class="checkbox" /><span class="checkboxTxt"><wa:mls>Press</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_howDoYouKnow" value="Fair" class="checkbox" /><span class="checkboxTxt"><wa:mls>Fair</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_howDoYouKnow" value="Workshop" class="checkbox" /><span class="checkboxTxt"><wa:mls>Workshop</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_howDoYouKnow" value="Other" class="checkbox" /><span class="checkboxTxt"><wa:mls>Other</wa:mls></span>
			<div class="clr"></div>
		</div>
		<div class="clr"></div>
		
		<br /><br /><wa:mls>What type of organisation are you from ?</wa:mls>
		<div class="checkbox_set">
			<input type=checkbox name="f_whatTypeOrga" value="Corporate" class="checkbox" /><span class="checkboxTxt"><wa:mls>Corporate</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_whatTypeOrga" value="Association" class="checkbox" /><span class="checkboxTxt"><wa:mls>Association</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_whatTypeOrga" value="Agency" class="checkbox" /><span class="checkboxTxt"><wa:mls>Agency</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_whatTypeOrga" value="Press" class="checkbox" /><span class="checkboxTxt"><wa:mls>Press</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_whatTypeOrga" value="University" class="checkbox" /><span class="checkboxTxt"><wa:mls>University</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_whatTypeOrga" value="Institution" class="checkbox" /><span class="checkboxTxt"><wa:mls>Institution</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_whatTypeOrga" value="Other" class="checkbox" /><span class="checkboxTxt"><wa:mls>Other</wa:mls></span>
		</div>
		<div class="clr"></div>
		
		
		<br /><br /><wa:mls>*Please specify the type of Agency :</wa:mls>
		<div class="checkbox_set">
			<input type=checkbox name="f_agencyType" value="Communication Agency" class="checkbox" /><span class="checkboxTxt"><wa:mls>Communication Agency</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_agencyType" value="DMC-Incoming tour operator" class="checkbox" /><span class="checkboxTxt"><wa:mls>DMC-Incoming tour operator</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_agencyType" value="Event Agency" class="checkbox" /><span class="checkboxTxt"><wa:mls>Event Agency</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_agencyType" value="Exhibition Organiser" class="checkbox" /><span class="checkboxTxt"><wa:mls>Exhibition Organiser</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_agencyType" value="Incentive house" class="checkbox" /><span class="checkboxTxt"><wa:mls>Incentive house</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_agencyType" value="PCO-Meeting planner" class="checkbox" /><span class="checkboxTxt"><wa:mls>PCO-Meeting planner</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_agencyType" value="Outbout Travel agent" class="checkbox" /><span class="checkboxTxt"><wa:mls>Outbout Travel agent</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_agencyType" value="Other" class="checkbox" /><span class="checkboxTxt"><wa:mls>Other</wa:mls></span>
		</div>
		
		<div class="clr"></div>
		
		<br /><wa:mls>*How many events do you organise per year ?</wa:mls><br />

			<select name="f_howManyEvents">
				<option value=""><wa:mls>Choisissez</wa:mls></option>
				<option value="1-5">1-5</option>
				<option value="6-10">6-10</option>
				<option value="11-20">11-20</option>
				<option value="More"><wa:mls>More</wa:mls></option>
			</select>


		<div class="clr"></div>
		
		<br /><wa:mls>*What is the average size of your events ?</wa:mls><br />

			<select name="f_averageEvents">
				<option value=""><wa:mls>Choisissez</wa:mls></option>
				<option value="1-25">1-25</option>
				<option value="26-50">26-50</option>
				<option value="51-100">51-100</option>
				<option value="101-250">101-250</option>
				<option value="251-500">251-500</option>
				<option value="500-1000">500-1000</option>
				<option value="1001-2000">1001-2000</option>
				<option value="2001-">2001-</option>
			</select>

		<div class="clr"></div>

		<br /><br /><wa:mls>*What type of events do you organise ?</wa:mls><br />
		<div class="checkbox_set">
			<input type=checkbox name="f_eventType" value="Business Travel" class="checkbox" /><span class="checkboxTxt"><wa:mls>Business Travel</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_eventType" value="Conference - Meeting" class="checkbox" /><span class="checkboxTxt"><wa:mls>Conference - Meeting</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_eventType" value="Exhibition" class="checkbox" /><span class="checkboxTxt"><wa:mls>Exhibition</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_eventType" value="Incentive Travel" class="checkbox" /><span class="checkboxTxt"><wa:mls>Incentive Travel</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_eventType" value="International Convention" class="checkbox" /><span class="checkboxTxt"><wa:mls>International Convention</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_eventType" value="Product Launch" class="checkbox" /><span class="checkboxTxt"><wa:mls>Product Launch</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_eventType" value="Staff meeting" class="checkbox" /><span class="checkboxTxt"><wa:mls>Staff meeting</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_eventType" value="Other" class="checkbox" /><span class="checkboxTxt"><wa:mls>Other</wa:mls></span>
		</div>
		
		<div class="clr"></div>
		
		<br /><wa:mls>*What level of responsibility do you have in direct purchasing ?</wa:mls><br />
		<div class="checkbox_set">
			<input type=checkbox name="f_eventRole" value="Final Decision" class="checkbox" /><span class="checkboxTxt"><wa:mls>Final Decision</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_eventRole" value="Recommend" class="checkbox" /><span class="checkboxTxt"><wa:mls>Recommend</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_eventRole" value="Plan" class="checkbox" /><span class="checkboxTxt"><wa:mls>Plan</wa:mls></span>
		</div>
		
		<div class="clr"></div>
		
		<br /><wa:mls>*Did you already organise an event in Brussels ?</wa:mls><br />
		<div class="checkbox_set">
			<input type=checkbox name="f_alreadyOrganize" value="1" class="checkbox" /><span class="checkboxTxt"><wa:mls>Yes</wa:mls></span>
			<div class="clr"></div>
			<wa:mls>Which one(s)  - When ?</wa:mls> :<br /><input type=text name="f_wichWhenAlreadyOrganize" value="" style="float:none; margin:0 0 5px 0" />
			<div class="clr"></div>
			<input type=checkbox name="f_alreadyOrganize" value="0" class="checkbox" /><span class="checkboxTxt"><wa:mls>No</wa:mls></span>
		</div>
		
		<div class="clr"></div>
		
		<br /><wa:mls>*Are you planning future event(s) in Brussels ?</wa:mls><br />
		<div class="checkbox_set">
			<input type=checkbox name="f_alreadyPlan" value="1" class="checkbox" /><span class="checkboxTxt"><wa:mls>Yes</wa:mls></span>
			<div class="clr"></div>
			<wa:mls>Proposed dates</wa:mls> :<br /><input type=text name="f_whenAlreadyPlan" value="" style="float:none; margin:0 0 5px 0" />
			<div class="clr"></div>
			<input type=checkbox name="f_alreadyPlan" value="0" class="checkbox" /><span class="checkboxTxt"><wa:mls>No</wa:mls></span>
		</div>
		
		<div class="clr"></div>
		
		<br /><br /><wa:mls>*If so, do you wish us to forward your details to a local professional organiser ?</wa:mls>
		<div class="checkbox_set">
			<input type=checkbox name="f_forwardPro" value="1" class="checkbox" /><span class="checkboxTxt"><wa:mls>Yes</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_typeForwardPro" value="PCO-Meeting Planner" class="checkbox" /><span class="checkboxTxt"><wa:mls>PCO-Meeting Planner</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_typeForwardPro" value="Destination Management Company" class="checkbox" /><span class="checkboxTxt"><wa:mls>Destination Management Company</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_typeForwardPro" value="Event Organiser" class="checkbox" /><span class="checkboxTxt"><wa:mls>Event Organiser</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_typeForwardPro" value="Exhibition Organiser" class="checkbox" /><span class="checkboxTxt"><wa:mls>Exhibition Organiser</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_typeForwardPro" value="Incentive Agency" class="checkbox" /><span class="checkboxTxt"><wa:mls>Incentive Agency</wa:mls></span>
			<div class="clr"></div>
			<input type=checkbox name="f_forwardPro" value="0" class="checkbox" /><span class="checkboxTxt"><wa:mls>No</wa:mls></span>
		</div>
		
		<div class="clr"></div>
		
		<div>
			<br /><br /><wa:mls>Commentaire</wa:mls><br />
			<textarea name="f_comment"></textarea>
		</div>
        </c:if>
        
        <div class ="clr"></div>
        
        <wa:include URI="front/boxes/captcha" />
        <div class ="clr"></div>
        
  
        <div class="clr m22"></div>
        <p><wa:mls>* Champs obligatoires à compléter</wa:mls></p>
        <p class="remark">« All data of a personal nature passed on to Brussels International is recorded in the files of Brussels International - or those of third parties (professionals) acting on its behalf - for the purposes of managing marketing communication mailings. Further information may be obtained from the 'Commission pour la protection de la vie privée' (Commission for the Protection of Privacy) (Rue de la Régence 63, 1000 Brussels). Every individual has the right to access his/her personal data. Brussels International, 2-4 rue Royale, 1000 Brussels, owns and manages the file. »</p>
        <hr / class="m17">
        <a href="${context}/${site}/${module}/displayBasket.do" class="btn_previous_eshop float_left"><wa:mls>Précédent</wa:mls></a>
        <input type="submit" value="Suivant" id="form_send" class="btn_next_eshop float_right" />
      </fieldset>
    </form>
    
    <script type="text/javascript">
		var sprytextfield1 = new Spry.Widget.ValidationTextField("tfv_invoiceLastname", "none", {validateOn:["blur"]});
		var sprytextfield2 = new Spry.Widget.ValidationTextField("tfv_invoiceFirstname", "none", {validateOn:["blur"]});
		var sprytextfield3 = new Spry.Widget.ValidationTextField("tfv_invoiceBirthdate", "date", {format:"dd/mm/yyyy", pattern:"00/00/0000", validateOn:["blur"], useCharacterMasking:true, isRequired:true});
		var sprytextfield4 = new Spry.Widget.ValidationTextField("tfv_invoiceCountry", "none",{validateOn:["blur"]});
		var sprytextfield5 = new Spry.Widget.ValidationTextField("tfv_invoiceEmail", "email", {validateOn:["blur"]});
		var sprytextfield7 = new Spry.Widget.ValidationTextField("tfv_invoiceStreet", "none", {validateOn:["blur"]});
		var sprytextfield8 = new Spry.Widget.ValidationTextField("tfv_invoiceZipcode", "none", {validateOn:["blur"]});
		var sprytextfield9 = new Spry.Widget.ValidationTextField("tfv_invoiceCity", "none", {validateOn:["blur"]});

		
	</script>
    <div class="clr"></div>
  </div>
  <!--contentMain:end-->
  <!--contentSub:start-->
  <div id="content_sub"> 
   <!-- component book_stay:start -->
    
  <!--contentSub:end-->
  <div class="clr"></div>
</div>
<!--content:end-->
	

