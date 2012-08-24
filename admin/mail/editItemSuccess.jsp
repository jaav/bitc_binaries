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
<h2><wa:mls>Mails</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean==null || bean.mailId<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.mailId>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>
<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
			<fieldset>
				<legend>&nbsp;</legend>
				<c:if test="${bean!=null && bean.mailId>0}">
					<div class="bgGrey">
						<label for="f_id"><wa:mls>mailId</wa:mls></label>
						<span>${bean.mailId}</span>
						<input name="id" type="hidden" value="${bean.mailId}"/>
					</div>
				</c:if>
					<div class="bgWhite">
						<label for="f_culture"><wa:mls>culture</wa:mls> </label>
						<wa:include URI="admin/dropdown/dropListCulture">
								<wa:param name="name" value="f_culture" />
								<wa:param name="choiceMsg" value="Select the culture" />
								<wa:param name="selectedValues" value="${bean.culture}" />
						</wa:include>
					</div>
					<div class="bgGrey">
						<label for="f_name"><wa:mls>name</wa:mls></label>
						<textarea name="f_name" class="textfield" >${bean.name}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_urlTxt"><wa:mls>urlTxt</wa:mls></label>
						<textarea name="f_urlTxt" class="textfield" >${bean.urlTxt}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_urlHtml"><wa:mls>urlHtml</wa:mls></label>
						<textarea name="f_urlHtml" class="textfield" >${bean.urlHtml}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_fromName"><wa:mls>fromName</wa:mls></label>
						<textarea name="f_fromName" class="textfield" >${bean.fromName}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_fromEmail"><wa:mls>fromEmail</wa:mls></label>
						<textarea name="f_fromEmail" class="textfield" >${bean.fromEmail}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_toName"><wa:mls>toName</wa:mls></label>
						<textarea name="f_toName" class="textfield" >${bean.toName}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_toEmail"><wa:mls>toEmail</wa:mls></label>
						<textarea name="f_toEmail" class="textfield" >${bean.toEmail}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_bccName"><wa:mls>bccName</wa:mls></label>
						<textarea name="f_bccName" class="textfield" >${bean.bccName}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_bccEmail"><wa:mls>bccEmail</wa:mls></label>
						<textarea name="f_bccEmail" class="textfield" >${bean.bccEmail}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_subject"><wa:mls>subject</wa:mls></label>
						<textarea name="f_subject" class="textfield" >${bean.subject}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_mailmachineMailid"><wa:mls>mailmachineMailid</wa:mls></label>
						<textarea name="f_mailmachineMailid" class="textfield" >${bean.mailmachineMailid}</textarea>
					</div>
				</fieldset>
				<c:if test="${bean!=null && bean.mailId>0}">
					<div class="clr" ></div>	
					<fieldset>
					<legend align="top">&nbsp;</legend> 
					<div class="bgWhite">
						<label for="f_createdOn"><wa:mls>createdOn</wa:mls></label>
						<span>${bean.createdOn}</span>
					</div>
					<div class="bgGrey">
						<label for="f_createdBy"><wa:mls>createdBy</wa:mls></label>
						<span>
							<wa:include URI="${site}/acxAdminusers/lookup">
							<wa:param name="login" value="${bean.createdBy}"/>
							</wa:include>
						</span>
					</div>
					<div class="bgWhite">
						<label for="f_lastModifiedOn"><wa:mls>lastModifiedOn</wa:mls></label>
						<span>${bean.lastModifiedOn}</span>
					</div>
					<div class="bgGrey">
						<label for="f_lastModifiedBy"><wa:mls>lastModifiedBy</wa:mls></label>
						<span>
							<wa:include URI="${site}/acxAdminusers/lookup">
							<wa:param name="login" value="${bean.lastModifiedBy}"/>
							</wa:include>
						</span>
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
idName='${bean.mailId}';
</script>
<!--tool boxes:end-->
