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
<script type="text/javascript" src="${staticSite}/js/SpryValidationPassword.js"></script>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationTextField.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationPassword.css" media="screen, projection"/>
<div id="content_main">
    <wa:include URI="${site}/content/introForm" />
    <div class="form_login">
    	<p class="title"><wa:mls>Je ne suis pas encore inscrit(e)</wa:mls></p>
        <p><wa:mls>Inscrivez-vous gratuitement sur BITC et profitez :</wa:mls>
    	</p>
        <div class="grey_btn"><a href="<wa:url URI="${site}/${module}/displaySubscribe"/>"><wa:mls>S'inscrire</wa:mls></a></div>
    </div>
   	<form class="form_login no_margin" action="<wa:url URI="${site}/${module}/doLogin"/>" method="post">
    	<p class="title"><wa:mls>Je suis déjà inscrit(e)</wa:mls></p>
   		<input type="hidden" name="backURL" value="${backURL}" />
    	<fieldset>
      		<p class="error"><wa:mls>${ERROR_LOGIN}</wa:mls></p>
       		<span id="tfv_email">
	            <div class="validation">
       			<label  for="f_login"><wa:mls>E-mail* :</wa:mls></label>
        		<input name="f_login" type="text" maxlength="80" value=""/>        		
                <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> 
        		<img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
                </div>
        		<span class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></span>
        		<span class="textfieldInvalidFormatMsg clr"><wa:mls>Le format de votre adresse n'est pas valide !</wa:mls></span>
        	</span>
        	<div class="clr"></div>
        	<span id="tfv_password">
            	<div class="validation">
        		<label  for="f_password"><wa:mls>Mot de passe* :</wa:mls></label>
        		<input name="f_password" type="password" maxlength="50" value=""/>
                <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> 
        		<img src="${staticSite}/img/ml/erreur.png" class="errorMsg" /> 
                </div>
        		<span class="passwordRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></span> 
        	</span>
        	<div class="clr"></div>
        	<c:if test="${not empty ERROR_LOGIN}">
        		<input type="hidden" name="f_hasACaptcha" value="1" />
        		<wa:include URI="front/boxes/captcha" />
        		<div class="clr"></div>
        	</c:if>
    		<input type="submit" value="<wa:mls>Envoyer</wa:mls>" class="form_send" />
       		<div class="clr"></div>
       		<p><a href="<wa:url URI="${site}/${module}/displayLostPassword"/>"><wa:mls>Mot de passe perdu ?</wa:mls></a></p>
       		<div class="clr"></div>
        	<p><wa:mls>* Champs obligatoires à compléter</wa:mls></p>
      </fieldset>
    </form>
    <div class="clr"></div><br />
    <p class="remark"><wa:mls>All data of a personal </wa:mls></p>
 </div>
 <script type="text/javascript">
var spryEmail = new Spry.Widget.ValidationTextField("tfv_email", "email", {validateOn:["blur"]});
var spryPassword = new Spry.Widget.ValidationPassword("tfv_password", {validateOn:["blur"]});
</script>
  <!--contentMain:end-->
