<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<br /><br />
<span id="img_captcha"> 
	<label><wa:mls>Code de vérification :</wa:mls></label>

	<div id="box_capcha">
		<img src="${context}/tools/captcha/displayCaptcha.do?cpt_backgroundColor=%23f9f9f9&cpt_circleColor=%23f9f9f9&cpt_textColor=%23000000&cpt_borderColor=%23d0d0d0" class="captcha" />
		<div class="captcha_reset"><a href="javascript:resetCaptcha()"><wa:mls>Reset Captcha</wa:mls></a></div>
	</div>
</span>

<div class="clr"></div>
<br>
<span id="tfv_captcha"> 
<div class="validation">
	 <label><wa:mls>Entrez le code * :</wa:mls></label>
	 <input name="f_captcha" id="captcha" />
	 <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> 
	 <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" /> 
     </div>
	 <span class="textfieldRequiredMsg clr" ><wa:mls>Ce champ est obligatoire</wa:mls></span>
</span>

<script type="text/javascript"> 	
	var spryCaptcha = new Spry.Widget.ValidationTextField("tfv_captcha", "none", {validateOn:["blur"]});
	function resetCaptcha(){
		var timestamp = new Date().getTime();
		var html ='<img src="${context}/tools/captcha/displayCaptcha.do?cpt_backgroundColor=%23f9f9f9&cpt_circleColor=%23f9f9f9&cpt_textColor=%23000000&cpt_borderColor=%23d0d0d0&t='+timestamp+'" class="captcha" /><div class="captcha_reset"><a href="javascript:resetCaptcha()"><wa:mls>Reset Captcha</wa:mls></a></div>';
		$('#box_capcha').html(html);
	} 
</script>