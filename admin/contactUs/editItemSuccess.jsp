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
<h2><wa:mls>ContactUs</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean!=null && bean.contactUsId>0}"><wa:mls>(View)</wa:mls></c:if>
</h2>

<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
			<fieldset>
				<legend></legend>
				<div class="bgGrey">
					<label for="f_id"><wa:mls>ContactUsId</wa:mls></label>
					<span>${bean.contactUsId}</span>
					<input name=id type="hidden" value="${bean.contactUsId}"/>
				</div>
				<div class="bgWhite">
					<label for="f_gender"><wa:mls>Gender</wa:mls></label>
					<span>${bean.gender}</span>
				</div>
				<div class="bgGrey">
					<label for="f_lastname"><wa:mls>Lastname</wa:mls></label>
					<span>${bean.lastname}</span>
				</div>
				<div class="bgWhite">
					<label for="f_firstname"><wa:mls>Firstname</wa:mls></label>
					<span>${bean.firstname}</span>
				</div>
				<div class="bgGrey">
					<label for="f_email"><wa:mls>Email</wa:mls></label>
					<span>${bean.email}</span>
				</div>
				<div class="bgWhite">
					<label for="f_languageid"><wa:mls>Languageid</wa:mls></label>
					<span>${bean.languageid}</span>
				</div>
				<div class="bgGrey">
					<label for="f_typeQuestion"><wa:mls>TypeQuestion</wa:mls></label>
					<span>${bean.contactUsTypeQuestion.name}</span>
				</div>
				<div class="bgWhite">
					<label for="f_message"><wa:mls>Message</wa:mls></label>
					<span>${bean.message}</span>
				</div>
				<div class="bgGrey">
					<label for="f_sendCopy"><wa:mls>Send copy</wa:mls></label>
					<span><c:if test="${bean.sendCopy=='0'}"><wa:mls>No</wa:mls></c:if>
					<c:if test="${bean.sendCopy=='1'}"><wa:mls>Yes</wa:mls></c:if>
					</span>
				</div>
				<div class="bgWhite">
					<label for="f_closed"><wa:mls>Closed</wa:mls></label>
					<span><c:if test="${bean.closed=='0'}"><wa:mls>No</wa:mls></c:if>
					<c:if test="${bean.closed=='1'}"><wa:mls>Yes</wa:mls></c:if>
					</span>
				</div>
				<div class="bgGrey">
					<label for="f_createdOn"><wa:mls>createdOn</wa:mls></label>
					<span>${bean.createdOn}</span>
				</div>
				
			</fieldset>
			
		</form>
	</div>
</div>
</div>	
<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
<script>
path='${context}/${site}/${module}';
idName='${bean.contactUsId}';
</script>
<!--tool boxes:end-->
