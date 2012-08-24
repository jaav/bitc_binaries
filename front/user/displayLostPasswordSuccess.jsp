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
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationTextField.css" media="screen, projection"/>
<div id="content_main">
    <wa:include URI="${site}/content/introForm" />
   	<form class="form" action="<wa:url URI="${site}/${module}/saveLostPassword"/>" method="post">
   		<input type="hidden" name="backURL" value="${backURL}" />
    	<fieldset>
      		<p class="error"><wa:mls>${ERROR_LOSTPASSWORD}</wa:mls></p>
       		<span id="tfv_email">
       			<label  for="f_email"><wa:mls>E-mail* :</wa:mls></label>
        		<input name="f_email" type="text" maxlength="80" value=""/>
        		<img src="${staticSite}/img/ml/ok.png" class="validMsg" /> 
        		<img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
        		<span class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></span>
        		<span class="textfieldInvalidFormatMsg clr"><wa:mls>Le format de votre adresse n'est pas valide !</wa:mls></span>
        	</span>
        	<div class="clr"></div>
        	<wa:include URI="${site}/boxes/captcha" />
        	<div class="clr"></div>
    		<input type="submit" value="<wa:mls>Envoyer</wa:mls>" id="form_send" />
       		<div class="clr"></div>
        	<p><wa:mls>* Champs obligatoires à compléter</wa:mls></p>
        	<p class="remark"><wa:mls>All data of a personal </wa:mls></p>
      </fieldset>
    </form>
 </div>
 <script type="text/javascript">
var spryEmail = new Spry.Widget.ValidationTextField("tfv_email", "email", {validateOn:["blur"]});
</script>
  <!--contentMain:end-->
