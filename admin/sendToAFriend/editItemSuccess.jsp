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
<h2><wa:mls>SendToAFriend </wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean!=null && bean.sendToAFriendId>0}"><wa:mls>(View)</wa:mls></c:if>
</h2>
<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
			<fieldset>
				<legend><wa:mls>Main informations</wa:mls></legend>
				<c:if test="${bean!=null && bean.sendToAFriendId>0}">
				<div class="bgGrey">
						<label for="f_id"><wa:mls>SendToAFriendId</wa:mls></label>
						<span>${bean.sendToAFriendId}</span>
					</div>
				</c:if>
				<div class="bgGrey">
						<label for="f_message"><wa:mls>Message</wa:mls></label>
						<span>${bean.message}</span>
					</div>
					<div class="bgWhite">
						<label for="f_url"><wa:mls>URL</wa:mls></label>
						<span>${bean.url}</span>
					</div>
					<c:if test="${bean!=null && bean.sendToAFriendId>0}">
					<div class="bgGrey">
						<label for="f_createdOn"><wa:mls>createdOn</wa:mls></label>
						<span>${bean.createdOn}</span>
					</div>
					</c:if>
			</fieldset>
			<div class="clr"></div>	
				<fieldset>
					<legend><wa:mls>From informations</wa:mls></legend>
					<div class="bgWhite">
						<label for="f_fromLastname"><wa:mls>Lastname</wa:mls></label>
						<span>${bean.fromLastname}</span>
					</div>
					<div class="bgGrey">
						<label for="f_fromFirstname"><wa:mls>Firstname</wa:mls></label>
						<span>${bean.fromFirstname}</span>
					</div>
					<div class="bgWhite">
						<label for="f_fromEmail"><wa:mls>Email</wa:mls></label>
						<span>${bean.fromEmail}</span>
					</div>
					<div class="bgGrey">
						<label for="f_fromInCopy"><wa:mls>In copy</wa:mls></label>
						<span>
							<c:if test="${bean.fromInCopy=='0'}">No</c:if>
							<c:if test="${bean.fromInCopy=='1'}">Yes</c:if>
						</span>
					</div>
				</fieldset>
				<div class="clr"></div>	
				<fieldset>
					<legend><wa:mls>To informations</wa:mls></legend>
					<div class="bgGrey">
						<label for="f_toLastname"><wa:mls>Lastname</wa:mls></label>
						<span>${bean.toLastname}</span>
					</div>
					<div class="bgWhite">
						<label for="f_toFirstname"><wa:mls>Firstname</wa:mls></label>
						<span>${bean.toFirstname}</span>
					</div>
					<div class="bgGrey">
						<label for="f_toEmail"><wa:mls>Email</wa:mls></label>
						<span>${bean.toEmail}</span>
					</div>
					<div class="bgWhite">
						<label for="f_toLanguageid"><wa:mls>Languageid</wa:mls></label>
						<span>${bean.toLanguageid}</span>
					</div>
				</fieldset>
		</form>
	</div>
</div>
</div>	
<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
<script>
path='${context}/${site}/${module}';
idName='${bean.sendToAFriendId}';
</script>
<!--tool boxes:end-->
