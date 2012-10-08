<%@ page
        language="java"
        contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"
        isELIgnored="false"
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

<link rel="stylesheet" type="text/css" href="${static}/front/css/SpryValidationTextField.css"
      media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/SpryValidationRadio.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/SpryValidationPassword.css"
      media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/SpryValidationConfirm.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/SpryValidationTextarea.css"
      media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/SpryValidationSelect.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/SpryValidationSelect_search.css"
      media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/SpryValidationCheckbox.css"
      media="screen, projection"/>

<!--contentMain:start-->
<div id="content_main">
    <h1 class="line_pink"><wa:mls>ACHETER EN LIGNE</wa:mls></h1>
    <!--nav_eshop:start-->
    <ul id="nav_eshop">
        <li><b>1. <wa:mls>Mon panier</wa:mls></b></li>
        <li class="select"><b>2. <wa:mls>Coordonnées</wa:mls></b></li>
        <li><b>3. <wa:mls>Récapitulatif</wa:mls></b></li>
        <li><b>4. <wa:mls>Paiement</wa:mls></b></li>
        <li><b>5. <wa:mls>Impression des vouchers</wa:mls></b></li>
    </ul>
    <!--nav_eshop:end-->
    <br clear="all"/>

    <div class="clr"></div>
    <hr class="dashed"/>
    <c:if test="${errorEshop != null }">
        <p class="error"><wa:mls>${errorEshop}</wa:mls></p>
    </c:if>
    <form class="form_eshop" action="${context}/${site}/${module}/saveInfos.do">
        <fieldset>



        <span id="tfv_invoiceCompanyName">
         <label for="f_invoiceCompanyName"><wa:mls>Company Name :</wa:mls></label>
         <input name="f_invoiceCompanyName" type="text" maxlength="50" tabindex="1"
                 <c:choose>
                     <c:when test="${order.invoiceCompanyName != null}">value="${order.invoiceCompanyName}"</c:when>
                     <c:when test="${user.companyName != null}">value="${user.companyName}"</c:when>
                 </c:choose>
                 />
         </span>

            <div class="clr"></div>
        <span id="tfv_lastname">
        <label for="f_lastname"><wa:mls>Nom* :</wa:mls></label>
        <input name="f_lastname" tabindex="2" type="text" maxlength="50"
                <c:choose>
                    <c:when test="${order.invoiceLastname != null}">value="${order.invoiceLastname}"</c:when>
                    <c:when test="${user.lastname != null}">value="${user.lastname}"</c:when>
                </c:choose>
                />
        <img src="${static}/front/img/ml/ok.png" class="validMsg"/> <img src="${static}/front/img/ml/erreur.png"
                                                                         class="errorMsg"/>
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>

            <div class="clr"></div>
        <span id="tfv_firstname">
        <label for="f_firstname"><wa:mls>Prénom* :</wa:mls></label>
        <input name="f_firstname" tabindex="3" type="text" maxlength="50"
                <c:choose>
                    <c:when test="${order.invoiceFirstname != null}">value="${order.invoiceFirstname}"</c:when>
                    <c:when test="${user.firstname != null}">value="${user.firstname}"</c:when>
                </c:choose>
                />
        <img src="${static}/front/img/ml/ok.png" class="validMsg"/> <img src="${static}/front/img/ml/erreur.png"
                                                                         class="errorMsg"/>
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>

            <div class="clr"></div>
        <span id="tfv_birthdate">
        <label for="f_birthdate"><wa:mls>Date de naissance* :</wa:mls></label>
        <input name="f_birthdate" tabindex="4" type="text"
                <c:choose>
                    <c:when test="${order.invoiceBirthdate != null}">value="<fmt:formatDate
                            value="${order.invoiceBirthdate}" pattern="dd/MM/yyyy"/>"</c:when>
                    <c:when test="${user.birthdate != null}">value="<fmt:formatDate value="${user.birthdate}"
                                                                                    pattern="dd/MM/yyyy"/>"</c:when>
                </c:choose>
                />
        <img src="${static}/front/img/ml/ok.png" class="validMsg"/> <img src="${static}/front/img/ml/erreur.png"
                                                                         class="errorMsg"/>
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        <div class="textfieldInvalidFormatMsg clr"><wa:mls>Veuillez entrer une date au format JJ/MM/AAAA</wa:mls></div>
        </span>

            <div class="clr"></div>
        <span id="tfv_country">
        <label for="f_country"><wa:mls>Pays* :</wa:mls></label>
        <input name="f_country" tabindex="5" type="text" maxlength="50"
                <c:choose>
                    <c:when test="${order.invoiceCountry != null}">value="${order.invoiceCountry}"</c:when>
                    <c:when test="${user.country != null}">value="${user.country}"</c:when>
                </c:choose>
                />
        <img src="${staticSite}/img/ml/ok.png" class="validMsg"/> <img src="${staticSite}/img/ml/erreur.png"
                                                                       class="errorMsg"/>
        <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        </span>


            <div class="clr"></div>
      <span id="tfv_email">
      <label for="f_email"><wa:mls>E-mail* :</wa:mls></label>
      <input name="f_email" tabindex="6" type="text" maxlength="80" <c:if
              test="${order.invoiceEmail != null}"> value="${order.invoiceEmail}" </c:if>
              <c:choose>
                  <c:when test="${order.invoiceEmail != null}">value="${order.invoiceEmail}"</c:when>
                  <c:when test="${user.email != null}">value="${user.email}"</c:when>
              </c:choose>
              />
      <img src="${static}/front/img/ml/ok.png" class="validMsg"/> <img src="${static}/front/img/ml/erreur.png"
                                                                       class="errorMsg"/>
      <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
      <div class="textfieldInvalidFormatMsg clr"><wa:mls>Le format de votre adresse n'est pas valide !</wa:mls></div>
      </span>


            <div class="clr">&nbsp;</div>
            <div><wa:mls>brochure_send_text</wa:mls></div>

                    <span id="tfv_invoiceStreet">
                    <label for="f_invoiceStreet"><wa:mls>Street :</wa:mls></label>
                    <input name="f_invoiceStreet" type="text" maxlength="50" tabindex="7"
                            <c:choose>
                                <c:when test="${order.invoiceStreet != null}">value="${order.invoiceStreet}"</c:when>
                                <c:when test="${user.street != null}">value="${user.street}"</c:when>
                            </c:choose>
                            />
                    </span>

            <div class="clr"></div>
                    <span id="tfv_invoiceNum">
                    <label for="f_invoiceNum"><wa:mls>Num :</wa:mls></label>
                    <input name="f_invoiceNum" type="text" maxlength="50" tabindex="8"
                            <c:choose>
                                <c:when test="${order.invoiceNum != null}">value="${order.invoiceNum}"</c:when>
                                <c:when test="${user.num != null}">value="${user.num}"</c:when>
                            </c:choose>
                            />
                    </span>

            <div class="clr"></div>
                    <span id="tfv_invoiceBox">
                    <label for="f_invoiceBox"><wa:mls>Box :</wa:mls></label>
                    <input name="f_invoiceBox" type="text" maxlength="50" tabindex="9"
                            <c:choose>
                                <c:when test="${order.invoiceBox != null}">value="${order.invoiceBox}"</c:when>
                                <c:when test="${user.box != null}">value="${user.box}"</c:when>
                            </c:choose>
                            />
                    </span>

            <div class="clr"></div>
                    <span id="tfv_invoiceZipcode">
                    <label for="f_invoiceZipcode"><wa:mls>zipcode :</wa:mls></label>
                    <input name="f_invoiceZipcode" type="text" maxlength="50" tabindex="10"
                            <c:choose>
                                <c:when test="${order.invoiceZipcode != null}">value="${order.invoiceZipcode}"</c:when>
                                <c:when test="${user.zipcode != null}">value="${user.zipcode}"</c:when>
                            </c:choose>
                            />
                    </span>

            <div class="clr"></div>
                    <span id="tfv_invoiceCity">
                    <label for="f_invoiceCity"><wa:mls>City :</wa:mls></label>
                    <input name="f_invoiceCity" type="text" maxlength="50" tabindex="11"
                            <c:choose>
                                <c:when test="${order.invoiceCity != null}">value="${order.invoiceCity}"</c:when>
                                <c:when test="${user.city != null}">value="${user.city}"</c:when>
                            </c:choose>
                            />
                    </span>

            <div class="clr m22"></div>
            <p><wa:mls>* Champs obligatoires à compléter</wa:mls></p>

            <p class="remark">« All data of a personal nature passed on to Brussels International is recorded in the
                files of Brussels International - or those of third parties (professionals) acting on its behalf - for
                the purposes of managing marketing communication mailings. Further information may be obtained from the
                'Commission pour la protection de la vie privée' (Commission for the Protection of Privacy) (Rue de la
                Régence 63, 1000 Brussels). Every individual has the right to access his/her personal data. Brussels
                International, 2-4 rue Royale, 1000 Brussels, owns and manages the file. »</p>
            <hr
            / class="m17">
            <a href="${context}/${site}/${module}/displayBasket.do"
               class="btn_previous_eshop float_left"><wa:mls>Précédent</wa:mls></a>
            <input type="submit" value="Suivant" id="form_send" class="btn_next_eshop_arrow float_right"/>
        </fieldset>
    </form>

    <script type="text/javascript">
        var sprytextfield = new Spry.Widget.ValidationTextField("tfv_lastname", "none", {validateOn:["blur"]});
        var sprytextfield = new Spry.Widget.ValidationTextField("tfv_firstname", "none", {validateOn:["blur"]});
        var sprytextfield = new Spry.Widget.ValidationTextField("tfv_birthdate", "date", {format:"dd/mm/yyyy", pattern:"00/00/0000", validateOn:["blur"], useCharacterMasking:true, isRequired:true});
        var sprytextfield = new Spry.Widget.ValidationTextField("tfv_country", "none", {validateOn:["blur"]})
        var sprytextfield = new Spry.Widget.ValidationTextField("tfv_email", "email", {validateOn:["blur"]});
    </script>
    <div class="clr"></div>
</div>
<!--contentMain:end-->

<!--content:end-->
	

