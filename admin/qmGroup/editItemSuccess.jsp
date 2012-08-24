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
<h2><wa:mls>QmGroup</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean==null || bean.qmGroupId<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.qmGroupId>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>
<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
			<fieldset>
				<legend>&nbsp;</legend>
				<c:if test="${bean!=null && bean.qmGroupId>0}">
				<div class="bgGrey">
					<label for="f_id"><wa:mls>QmGroupId</wa:mls></label>
					<span>${bean.qmGroupId}</span>
					<input name=id type="hidden" value="${bean.qmGroupId}"/>
				</div>
				</c:if>
				<div class="bgWhite">
					<label for="f_name"><wa:mls>Name</wa:mls></label>
					<textarea name="f_name" class="textfield" >${bean.name}</textarea>
				</div>
				<div class="bgGrey">
					<label for="f_type"><wa:mls>Type</wa:mls></label>
					<select name="f_type">
						<option value=""><wa:mls>Choose the type</wa:mls></option>
						<option value="CONTEST" <c:if test="${bean.type eq 'CONTEST'}">selected="selected"</c:if>><wa:mls>CONTEST</wa:mls></option>
						<option value="QUICKPOLL" <c:if test="${bean.type eq 'QUICKPOLL'}">selected="selected"</c:if>><wa:mls>QUICKPOLL</wa:mls></option>
						<option value="QUIZZ" <c:if test="${bean.type eq 'QUIZZ'}">selected="selected"</c:if>><wa:mls>QUIZZ</wa:mls></option>
					</select>
				</div>
				<div class="bgWhite">
					<label for="f_campaignId"><wa:mls>Campaign</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.hdata.Campaign" />
						<wa:param name="manager" value="com.wanabe.manager.CampaignManager" />
						<wa:param name="identity" value="campaignId" />
						<wa:param name="display" value="name" />
						<wa:param name="name" value="f_campaignId" />
						<wa:param name="selectedValues" value="${bean.campaignId}" />
						<wa:param name="choiceMsg" value="Choose the campaign" />
					</wa:include>
				</div>
				<div class="bgGrey">
					<label for="f_visible"><wa:mls>Visible</wa:mls></label>
					<input type="radio" value="0" name="f_visible" <c:if test="${bean.visible == null || bean.visible==0}">checked="checked"</c:if>/><wa:mls>No</wa:mls>
					<input type="radio" value="1" name="f_visible" <c:if test="${bean.visible==1}">checked="checked"</c:if>/><wa:mls>Yes</wa:mls>
				</div>
				<div class="bgWhite">
					<label for="f_fromDate"><wa:mls>fromDate</wa:mls></label>
					<input type="text" class="w8em format-d-m-y divider-slash highlight-days-12 no-transparency" id="f_fromDate" name="f_fromDate" value="<fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.fromDate}"/>" maxlength="10" />
				</div>
				<div class="bgGrey">	
					<label for="f_toDate"><wa:mls>toDate</wa:mls></label>
					<input type="text" class="w8em format-d-m-y divider-slash highlight-days-12 no-transparency" id="f_toDate" name="f_toDate" value="<fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.toDate}"/>" maxlength="10" />
				</div>
			</fieldset>
			
			<c:if test="${bean!=null && bean.qmGroupId>0}">
			<div class="clr"></div>
			<fieldset>
				<legend align="top">&nbsp;</legend>
				<div class="bgGrey">
					<label for="f_createdOn"><wa:mls>createdOn</wa:mls></label>
					<span>${bean.createdOn}</span>
				</div>
				<div class="bgWhite">
					<label for="f_modifiedOn"><wa:mls>modifiedOn</wa:mls></label>
					<span>${bean.modifiedOn}</span>
				</div>
			</fieldset>
			</c:if>
			<div id="errorMessage">
				<c:if test="${waParam.msgError != null}">
					<img src="${static}/${site}/img/stop.png" alt="<wa:mls>Error</wa:mls>" />
					<wa:mls>${waParam.msgError}</wa:mls>
				</c:if>
			</div>
			
			<div id="containerButton">
				<input type="button" name="cancel" id="cancel" class="cancel" value="<wa:mls>Cancel</wa:mls>"/>
				<input type="submit" name="submit" class="submit" value="<wa:mls>Enregistrer</wa:mls>"/>
			</div>
		</form>
	</div>
</div>
</div>	
<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
<script>
path='${context}/${site}/${module}';
idName='${bean.qmGroupId}';
</script>
<!--tool boxes:end-->
