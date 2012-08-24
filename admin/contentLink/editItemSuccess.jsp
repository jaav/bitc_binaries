<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false" 
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="mainContent">
<div id="toolBox">
	<div class="content" id="actions">
		<a href="javascript:void(0);" id ="back_btn"><wa:mls>Back to List</wa:mls></a>
		<c:if test="${legend != null}">
			<a href="" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
		</c:if>
		<div class="clr"></div>
	</div>
</div>
<h2><wa:mls>ContentLink</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean==null || bean.linkid<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.linkid>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>

<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm" name="detailForm">
			<fieldset>
				<legend>&nbsp;</legend>
				<c:if test="${bean!=null && bean.linkid>0}">
					<div class="bgGrey"> 
						<label for="f_linkid"><wa:mls>linkid</wa:mls></label>
						<span>${bean.linkid}</span>
						<input name="id" type="hidden" value="${bean.linkid}"/>
					</div>
				</c:if>
					<div class="bgWhite">
						<label for="f_url" style="float:left"><wa:mls>URL</wa:mls></label>
						<textarea name="f_url" class="textfield" style="float:left">${bean.url}</textarea>
					</div>
					<div class="clr"></div>
					<div class="bgGrey" id="spryTextArea">
						<label for="f_description" style="float:left"><wa:mls>description</wa:mls></label>
						<textarea name="f_description" id="f_description" class="textfield" style="float:left;" onchange="validateTextArea()">${bean.description}</textarea><div style="float:left; color:#333; margin-left:8px;" id="countsprytextarea1">&nbsp;</div>
						<div class="clr"></div>
						<label></label><span id="errMsg"><wa:mls>Attention, la description ne doit pas contenir plus de 30 caractères, elle ne doit pas contenir d'espace ni de carcatère acccentué ou spéciaux (excepté "-"). Il est conseillé que cette description contiennent une origine indiquant le lieu de son utilisation.</wa:mls></span>
					</div>
					<c:if test="${bean!=null && bean.linkid>0}">
					<div class="bgWhite">
						<label for="f_countClicks"><wa:mls>countClicks</wa:mls></label>
						<span><c:if test="${bean.countClicks == null}">0</c:if>${bean.countClicks}</span>
					</div>
						<div class="bgGrey">
							<label for="f_cryptLink"><wa:mls>cryptLink</wa:mls></label>
							<span>${context}/front/tracking/link${item.paramDescription}/cid/${wa:crypt(bean.linkid)}.do</span>
						</div>
					</c:if>
			</fieldset>
			<div id="errorMessage">
				<c:if test="${waParam.msgError != null}">
					<img src="${static}/${site}/img/stop.png" alt="<wa:mls>Error</wa:mls>" />
					<wa:mls>${waParam.msgError}</wa:mls>
				</c:if>
			</div>
			<div id="containerButton">
				<input type="button" name="cancel" id="cancel" class="cancel" value="<wa:mls>Cancel</wa:mls>"/>
				<input type="button" class="submit" value="<wa:mls>Enregistrer</wa:mls>" onclick="submitMe()" />
			</div>
		</form>
	</div>
</div>
</div>	
<script type="text/javascript">
function checkTextArea(str){
	var re =/^[a-zA-Z0-9_-]*$/
  	if (!re.test(str)){ 
		return false;
	};
  	return true;
}
function validateTextArea(){
	if (!checkTextArea($('f_description').value)){
		return false;
	}
	if(!spryTextArea.validate()){
		return false;	
	}
	return true;
}
function submitMe(){
	if(!validateTextArea()){
		$('f_description').setStyle('border', '2px solid #bc0000');
		$('errMsg').setStyle('color', '#bc0000');
		return false;
	}	
	$("detailForm").submit();
}
var spryTextArea = new Spry.Widget.ValidationTextarea("spryTextArea", {minChars:1, maxChars:40, counterType:"chars_remaining", counterId:"countsprytextarea1", validateOn:["change"], useCharacterMasking:true});
</script>
<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
<script>
path='${context}/${site}/${module}';
idName='${bean.linkid}';
</script>
<!--tool boxes:end-->
