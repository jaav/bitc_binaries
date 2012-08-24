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
		<c:if test="${legend != null}">
			<a href="" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
		</c:if>
		<div class="clr"></div>
	</div>
</div>
<h2>
	<wa:mls>Edit Profile</wa:mls>
</h2>
<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
			<fieldset>
				<legend>&nbsp;</legend>
				<c:if test="${bean!=null && bean.userid>0}">
				<div class="bgGrey">
					<label for="f_userid"><wa:mls>userid</wa:mls></label> 
					<input name="id" type="hidden" value="${bean.userid}" /> 
					<span>${bean.userid}</span>
				</div>
				</c:if>
				<div class="bgWhite">
					<label for="f_email"><wa:mls>email</wa:mls></label> 
					<textarea name="f_email" class="textfield">${bean.email}</textarea>
				</div>
				<div class="bgGrey">
					<label for="f_languageid"><wa:mls>languageid</wa:mls></label>
					<select name="f_languageid">
						<option value="FR" <c:if test="${bean.languageid=='FR'}">selected="selected"</c:if>><wa:mls>languageid_FR</wa:mls></option>
						<option value="NL" <c:if test="${bean.languageid=='NL'}">selected="selected"</c:if>><wa:mls>languageid_NL</wa:mls></option>
					</select>
				</div>
				<div class="bgWhite">
					<label for="f_greeting"><wa:mls>greeting</wa:mls></label> 
					<select name="f_greeting">
						<option value="M" <c:if test="${bean.greeting=='M'}">selected="selected"</c:if>><wa:mls>M</wa:mls></option>
						<option value="Mme" <c:if test="${bean.greeting=='Mme'}">selected="selected"</c:if>><wa:mls>Mme</wa:mls></option>
						<option value="Mlle" <c:if test="${bean.greeting=='Mlle'}">selected="selected"</c:if>><wa:mls>Mlle</wa:mls></option>
					</select>
				</div>
				<div class="bgGrey">
				<label for="f_firstname"><wa:mls>firstname</wa:mls></label> <textarea
					name="f_firstname" class="textfield">${bean.firstname}</textarea>
					</div>
				<div class="bgWhite">
					<label for="f_lastname"><wa:mls>lastname</wa:mls></label> 
					<textarea name="f_lastname" class="textfield">${bean.lastname}</textarea>
				</div>
				
						<div class="bgGrey">
							<label for="f_login"><wa:mls>login</wa:mls></label>
							 <textarea name="f_login" class="textfield" DISABLED>${bean.login}</textarea>
						</div>
			      
				 
				 <div class="bgWhite">
							<label for="f_password"><wa:mls>password</wa:mls></label>
						   <textarea name="f_password" class="textfield">${bean.password}</textarea>
				</div>
				<div class="bgGrey">
					<label for="f_origin"><wa:mls>origin</wa:mls></label> 
				
							<select name="f_origin" DISABLED>
								<option value="WANABE" <c:if test="${bean.origin=='WANABE'}">selected="selected"</c:if>><wa:mls>WANABE</wa:mls></option>
								<option value="CLIENT" <c:if test="${bean.origin=='CLIENT'}">selected="selected"</c:if>><wa:mls>CLIENT</wa:mls></option>
							</select>
					  
				</div>

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
&nbsp;
</div>	
<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
<script>
path='${context}/${site}/${module}';
idName='${bean.userid}';
</script>
<!--tool boxes:end-->
