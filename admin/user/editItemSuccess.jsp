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
	<c:if test="${bean==null || bean.userId<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.userId>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>
<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
			<fieldset>
				<legend align="top"><wa:mls>Basic informations</wa:mls></legend>
					<input name="oldAllowEmail" type="hidden" />
					<c:if test="${bean!=null && bean.userId>0}">
					<div class="bgWhite">
						<label for="f_userId"><wa:mls>User ID</wa:mls></label>
						<span>${bean.userId}</span>
						<input name="id" type="hidden" value="${bean.userId}"/>
					</div>
					<div class="bgGrey">
						<label for="f_cryptedid"><wa:mls>Crypted ID</wa:mls></label>
						<span>${bean.cryptedid}</span>
						<input name="id" type="hidden" value="${bean.cryptedid}"/>
					</div>
					</c:if>
					<div class="bgWhite">
						<label for="f_password"><wa:mls>Password</wa:mls></label>
						<textarea name="f_password" class="textfield" >${bean.password}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_languageid"><wa:mls>languageid</wa:mls> </label>
						<wa:include URI="${site}/dropdown/dropListCulture">
							<wa:param name="name" value="f_languageid" />
							<wa:param name="choiceMsg" value="Select the languageid" />
							<wa:param name="selectedValues" value="${bean.languageid}" />
							<wa:param name="excludeBE" value="true" />
							<wa:param name="isUpper" value="true" />
						</wa:include>
					</div>
					
					<div class="bgWhite">
						<label for="f_facebookUid"><wa:mls>facebookUid</wa:mls></label>
						<textarea name="f_facebookUid" class="textfield" ><c:if test="${not empty bean.fbUid}">${bean.fbUid}</c:if></textarea>
					</div>
					<div class="bgGrey">
						<label for="f_email"><wa:mls>Email</wa:mls></label>
						<textarea name="f_email" class="textfield" >${bean.email}</textarea>
					</div>		
					<div class="bgWhite">
						<label for="f_newEmail"><wa:mls>newEmail</wa:mls></label>
						<textarea name="f_newEmail" class="textfield" >${bean.newEmail}</textarea>
					</div>			
					<div class="bgGrey"> 
						<label for="f_status"><wa:mls>Status</wa:mls></label>
						<input type="radio" value="0" name="f_status" <c:if test="${bean.status==0}">checked="checked"</c:if>/><wa:mls>new</wa:mls>
						<input type="radio" value="1" name="f_status" <c:if test="${bean.status==1}">checked="checked"</c:if>/><wa:mls>confirmed</wa:mls>
						<input type="radio" value="2" name="f_status" <c:if test="${bean.status==2}">checked="checked"</c:if>/><wa:mls>banished</wa:mls>					
					</div>
					 
					<div class="bgWhite">
						<label for="f_optin"><wa:mls>Optin</wa:mls></label>
						<input type="radio" value="" name="f_optin" <c:if test="${bean.optin == null}">checked="checked"</c:if>/> <wa:mls>Unknow</wa:mls>
						<input type="radio" value="false" name="f_optin" <c:if test="${!bean.optin}">checked="checked"</c:if>/>	<wa:mls>No</wa:mls>
						<input type="radio" value="true" name="f_optin" <c:if test="${bean.optin}">checked="checked"</c:if>/>	<wa:mls>Yes</wa:mls>					
					</div>
					 
				</fieldset>
				<div class="clr"></div>	
				<fieldset>
					<legend align="top"><wa:mls>Personal informations</wa:mls></legend>
					<div class="bgGrey">
						<label for="f_firstname"><wa:mls>Firstname</wa:mls></label>
						<textarea name="f_firstname" class="textfield" >${bean.firstname}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_lastname"><wa:mls>Lastname</wa:mls></label>
						<textarea name="f_lastname" class="textfield" >${bean.lastname}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_gender"><wa:mls>Gender</wa:mls></label>
						<input type="radio" value="F" name="f_gender" <c:if test="${bean.gender=='F'}">checked="checked"</c:if>/><wa:mls>Woman</wa:mls>
						<input type="radio" value="M" name="f_gender" <c:if test="${bean.gender=='M'}">checked="checked"</c:if>/><wa:mls>Man</wa:mls>
					</div>
					<div class="bgWhite">
						<label for="f_greeting"><wa:mls>greeting</wa:mls></label> 
						<select name="f_greeting">
							<option value="M" <c:if test="${bean.greeting=='M'}">selected="selected"</c:if>><wa:mls>M</wa:mls></option>
							<option value="Mme" <c:if test="${bean.greeting=='Mme'}">selected="selected"</c:if>><wa:mls>Mme</wa:mls></option>
							<option value="Mlle" <c:if test="${bean.greeting=='Mlle'}">selected="selected"</c:if>><wa:mls>Mlle</wa:mls></option>
						</select>
				    </div>
					<div class="bgWhite">
						<label for="f_birthdate"><wa:mls>Birthdate</wa:mls></label>
						<input type="text" class="w8em format-d-m-y divider-slash highlight-days-12 no-transparency" id="f_birthdate" name="f_birthdate" value="<fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.birthdate}"/>" maxlength="10" />
					</div>
					<div class="bgGrey">
						<label for="f_phone"><wa:mls>Phone</wa:mls></label>
						<textarea name="f_phone" class="textfield" >${bean.phone}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_gsm"><wa:mls>Mobile</wa:mls></label>
						<textarea name="f_gsm" class="textfield" >${bean.gsm}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_fax"><wa:mls>fax</wa:mls></label>
						<textarea name="f_fax" class="textfield" >${bean.fax}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_website"><wa:mls>website</wa:mls></label>
						<textarea name="f_website" class="textfield" >${bean.website}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_street"><wa:mls>Street</wa:mls></label>
						<textarea name="f_street" class="textfield" >${bean.street}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_num"><wa:mls>Number</wa:mls></label>
						<textarea name="f_num" class="textfield" >${bean.num}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_box"><wa:mls>Box</wa:mls></label>
						<textarea name="f_box" class="textfield" >${bean.box}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_zipcode"><wa:mls>Zipcode</wa:mls></label>
						<textarea name="f_zipcode" class="textfield" >${bean.zipcode}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_city"><wa:mls>City</wa:mls></label>
						<textarea name="f_city" class="textfield" >${bean.city}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_country"><wa:mls>Country</wa:mls></label>
						<textarea name="f_country" class="textfield" >${bean.country}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_origin"><wa:mls>Origin</wa:mls></label>
						<textarea name="f_origin" class="textfield" >${bean.origin}</textarea>
					</div>	
					<div class="bgGrey">
						<label for="f_originCreation"><wa:mls>originCreation</wa:mls></label>
						<textarea name="f_originCreation" class="textfield" >${bean.originCreation}</textarea>
					</div>	
					<div class="bgWhite">
						<label for="f_originModification"><wa:mls>originModification</wa:mls></label>
						<textarea name="f_originModification" class="textfield" >${bean.originModification}</textarea>
					</div>					
				</fieldset>
				<fieldset>
					<legend align="top"><wa:mls>Company informations</wa:mls></legend>
					<div class="bgGrey">
						<label for="f_companyName"><wa:mls>companyName</wa:mls></label>
						<textarea name="f_companyName" class="textfield" >${bean.companyName}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_companyType"><wa:mls>companyType</wa:mls></label>
						<textarea name="f_companyType" class="textfield" >${bean.companyType}</textarea>
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
	