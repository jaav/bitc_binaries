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
<h2><wa:mls>User</wa:mls>&nbsp;-&nbsp;
</h2>
<div id="list">
	<div id="mask">
		<form action="" method="post" id="detailForm">
			<fieldset>
				<legend align="top"><wa:mls>Basic informations</wa:mls></legend>
					<input name="oldAllowEmail" type="hidden" />
					<c:if test="${bean!=null && bean.userId>0}">
					<div class="bgWhite">
						<label for="f_userId"><wa:mls>User ID</wa:mls></label>
						<span>${bean.userId}</span>
					</div>
					</c:if>
					<div class="bgGrey">
						<label for="f_email"><wa:mls>Email</wa:mls></label>
						<span>${bean.email}</span>
					</div>		
				</fieldset>
				<div class="clr"></div>	
				<fieldset>
					<legend align="top"><wa:mls>Personal informations</wa:mls></legend>
					<div class="bgGrey">
						<label for="f_firstname"><wa:mls>Firstname</wa:mls></label>
						<span>${bean.firstname}</span>
					</div>
					<div class="bgWhite">
						<label for="f_lastname"><wa:mls>Lastname</wa:mls></label>
						<span>${bean.lastname}</span>
					</div>
					<div class="bgWhite">
						<label for="f_origin"><wa:mls>Origin</wa:mls></label>
						<span>${bean.origin}</span>
					</div>	
				</fieldset>
					<div class="clr"></div>	
				<c:if test="${bean!=null && bean.userId>0}">
					<fieldset>
						<legend align="top"><wa:mls>Status date informations</wa:mls></legend>
						<div class="bgGrey">
							<label for="f_createdOn"><wa:mls>Created on</wa:mls></label>
							<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.createdOn}"/></span>
						</div>
						<div class="bgWhite">
							<label for="f_lastModifiedOn"><wa:mls>Last modified on</wa:mls></label>
							<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.lastModifiedOn}"/></span>
						</div>
						<!-- 
						<div class="bgGrey">
							<label for="f_allowEmailOn"><wa:mls>Allowed Email on</wa:mls></label>
							<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.allowEmailOn}"/></span>
						</div>
						<div class="bgWhite">
							<label for="f_notAllowEmailOn"><wa:mls>Not allowed Email on</wa:mls></label>
							<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.notAllowEmailOn}"/></span>
						</div>
						 -->
						<div class="bgGrey">
							<label for="f_lastLogginOn"><wa:mls>Last loggin on</wa:mls></label>
							<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.lastLogginOn}"/></span>
						</div>
						<div class="bgWhite">
							<label for="f_lastVisitedOn"><wa:mls>Last Visited on</wa:mls></label>
							<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.lastVisitedOn}"/></span>
						</div>
						<div class="bgGrey">
							<label for="f_valid"><wa:mls>valid</wa:mls></label>
							<textarea name="f_valid" class="textfield" >${bean.valid}</textarea>
						</div>
						<div class="bgWhite">
							<label for="f_validedOn"><wa:mls>Valided on</wa:mls></label>
							<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.validedOn}"/></span>
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
idName='${bean.userId}';
</script>
<!--tool boxes:end-->
	