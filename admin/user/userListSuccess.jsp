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
		<a href="javascript:void(0);" id="search_btn" class="allways"><wa:mls>search</wa:mls></a>
		<a href="javascript:void(0);" id="edit_btn"><wa:mls>edit</wa:mls></a>
		<a href="javascript:void(0);" id="export_btn"><wa:mls>export</wa:mls></a>
		<c:if test="${legend != null}">
			<a href="javascript:void(0);" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
		</c:if>
	</div>
	<div id="pagingTop">
		<wa:include URI="${site}/boxes/pageNav">
			<wa:param name="orderBy" value="${waParam.orderBy}"/>
			<wa:param name="orderDir" value="${waParam.orderDir}"/>
		</wa:include>
	</div>
	<div style="clear:both"></div>
</div>
<!--floatLeft:start (important to toggle-slide search box)-->
<div class="fl">
<!--searchBox:start (hide by default)-->
	<div id="searchBox">
		<h2><wa:mls>Search Box</wa:mls></h2>
		<div id="searchclose"></div>
		<div class="content">
			<form name="searchForm" id="searchForm" action="${context}/${site}/${module}/${action}.do${filterString}"> 
				<div>
					<label for="s_userId"><wa:mls>User ID</wa:mls></label>
					<input name="s_userId" type="text" <c:choose><c:when test="${waParam.s_userId!=null}">value="${waParam.s_userId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_cryptedid"><wa:mls>Cryptedid</wa:mls></label>
					<input name="s_cryptedid" type="text" <c:choose><c:when test="${waParam.s_cryptedid!=null}">value="${waParam.s_cryptedid}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_gender"><wa:mls>Gender</wa:mls></label>
					<select name="s_gender" onchange="">
						<option value=""  <c:if test="${waParam.s_gender ne 'M' && waParam.s_gender ne 'F'}">selected="selected"</c:if>><wa:mls>Choisissez le genre</wa:mls></option>
						<option value="M" <c:if test="${waParam.s_gender eq 'M'}">selected="selected"</c:if>><wa:mls>Masculin</wa:mls></option>
						<option value="F" <c:if test="${waParam.s_gender eq 'F'}">selected="selected"</c:if>><wa:mls>Féminin</wa:mls></option>
					</select>	
				</div>
				<div>
					<label for="s_firstname"><wa:mls>Firstname</wa:mls></label>
					<input name="s_firstname" type="text" <c:choose><c:when test="${waParam.s_firstname!=null}">value="${waParam.s_firstname}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_lastname"><wa:mls>Lastname</wa:mls></label>
					<input name="s_lastname" type="text" <c:choose><c:when test="${waParam.s_lastname!=null}">value="${waParam.s_lastname}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>	
				<div>
					<label for="s_email"><wa:mls>Email</wa:mls></label>
					<input name="s_email" type="text" <c:choose><c:when test="${waParam.s_email!=null}">value="${waParam.s_email}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>	
				<div>
					<label for="s_zipcode"><wa:mls>Zipcode</wa:mls></label>
					<input name="s_zipcode" type="text" <c:choose><c:when test="${waParam.s_zipcode!=null}">value="${waParam.s_zipcode}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_city"><wa:mls>City</wa:mls></label>
					<input name="s_city" type="text" <c:choose><c:when test="${waParam.s_city!=null}">value="${waParam.s_city}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_languageid"><wa:mls>languageid</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropListCulture">
						<wa:param name="name" value="s_languageid" />
						<wa:param name="choiceMsg" value="Choose the Culture" />
						<wa:param name="selectedValues" value="${waParam.s_languageid}" />
						<wa:param name="excludeBE" value="true" />
						<wa:param name="isUpper" value="true" />
					</wa:include>
				</div>
				<div>
					<label for="s_nltUserTypes_nltType_id"><wa:mls>nltType</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.bitc.hdata.NltType" />
						<wa:param name="manager" value="com.bitc.hdata.manager.NltTypeManager" />
						<wa:param name="method" value="listAll" />
						<wa:param name="identity" value="id" />
						<wa:param name="display" value="name" />
						<wa:param name="name" value="s_nltUserTypes_nltType_id" />
						<wa:param name="selectedValues" value="${waParam.s_nltUserTypes_nltType_id}" />
					</wa:include>
				</div>
				<div>
					<label for="s_accessUserSections_accessSection_id"><wa:mls>AccessSection</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.bitc.hdata.AccessSection" />
						<wa:param name="manager" value="com.bitc.hdata.manager.AccessSectionManager" />
						<wa:param name="method" value="listAll" />
						<wa:param name="identity" value="id" />
						<wa:param name="display" value="name" />
						<wa:param name="name" value="s_accessUserSections_accessSection_id" />
						<wa:param name="selectedValues" value="${waParam.s_accessUserSections_accessSection_id}" />
					</wa:include>
				</div>
				<div>
					<label for="s_status"><wa:mls>Status</wa:mls></label>
					<input type="radio" value="0" name="s_status" <c:if test="${waParam.s_status == 0}">checked="checked"</c:if>/><wa:mls>new</wa:mls><br/>
					<input type="radio" value="1" name="s_status" <c:if test="${waParam.s_status == 1}">checked="checked"</c:if>/><wa:mls>confirmed</wa:mls><br/>
					<input type="radio" value="2" name="s_status" <c:if test="${waParam.s_status == 2}">checked="checked"</c:if>/><wa:mls>bannished</wa:mls>
				</div>	
				<div>
					<label for="f_optin"><wa:mls>Optin</wa:mls></label>
					<input type="radio" value="0" name="s_optin" <c:if test="${waParam.s_optin == 0}">checked="checked"</c:if>/>	<wa:mls>No</wa:mls><br/>
					<input type="radio" value="1" name="s_optin" <c:if test="${waParam.s_optin == 1}">checked="checked"</c:if>/>	<wa:mls>Yes</wa:mls>					
				</div>			
				<div>
					<label for="s_createdOn"><wa:mls>Created on</wa:mls></label>
					<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnStart" name="s_createdOnStart" value="${waParam.s_createdOnStart}" maxlength="10" /></p>
					<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnEnd" name="s_createdOnEnd" value="${waParam.s_createdOnEnd}" maxlength="10" /></p>
				</div>
					
				<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
			</form>
		</div>
	</div>
<!--searchBox:end-->
</div>
<!--floatLeft:end-->
<h2><wa:mls>User</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center checkbox"></td>
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
				<td class="center userId">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>UserId</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="userId" />
					</wa:link>			
				</td>
				<td class="left cryptedid">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Cryptedid</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="cryptedid" />
					</wa:link>			
				</td>
				<td class="center gender">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Gender</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="gender" />
					</wa:link>			
				</td>
				<td class="left firstname">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Firstname</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="firstname" />
					</wa:link>			
				</td>
				<td class="left lastname">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Lastname</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="lastname" />
					</wa:link>			
				</td>
				<td class="left email">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Email</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="email" />
					</wa:link>			
				</td>
				<td class="center zipcode">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Zipcode</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="zipcode" />
					</wa:link>			
				</td>
				<td class="left city">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>City</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="city" />
					</wa:link>			
				</td>
				<td class="center languageid">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>languageid</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="languageid" />
					</wa:link>			
				</td>
				<td class="center optin">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>optin</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="optin" />
					</wa:link>			
				</td>
				<td class="center createdOn">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Created on</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="createdOn" />
					</wa:link>			
				</td>
				<td class="center accessUserSection"></td>
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">
					<td 
						<c:if test="${item.status=='2'}">class="redStatus"</c:if>
						<c:if test="${item.status=='1'}">class="greenStatus"</c:if>
						<c:if test="${item.status=='0'}">class="blueStatus"</c:if>
					>&nbsp;</td>
					<td class="center checkbox"><input type="checkbox" value="${item.userId}"></td>
					<td class="center userId"><a href="${context}/${site}/user/editItem/id/${item.userId}.do" title="<wa:mls>Edit id</wa:mls>">${item.userId}</a></td>
					<td class="left cryptedid">${item.cryptedid}</td>
					<td class="center gender">${item.gender}</td>
					<td class="left firstname">${item.firstname}</td>
					<td class="left lastname">${item.lastname}</td>
					<td class="left email">${item.email}</td>
					<td class="center zipcode">${item.zipcode}</td>
					<td class="left city">${item.city}</td>
					<td class="center languageid">${item.languageid}</td>
					<td class="center optin">${item.optin}</td>
					<td class="center createdOn"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.createdOn}"/></td>
					<td class="center accessUserSection">
						<a href="${context}/admin/accessUserSection/accessUserSectionList.do?s_user_userId=${item.userId}&s_submit=Search"><wa:mls>Voir le(s) section(s)</wa:mls></a>
						| <a href="${context}/admin/nltUserType/nltUserTypeList.do?s_user_userId=${item.userId}&s_submit=Search"><wa:mls>Voir le(s) optin(s)</wa:mls></a>
						<c:if test="${openerField != null}">
							|<a href="javascript:copyToOpener('${item.userId}','${openerField}');"><wa:mls>Copy to opener</wa:mls></a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	 <div style="clear:both"></div>
</div>
<!-- paginationBottom:start-->
<div id="pagingBottom">
	<wa:include URI="${site}/boxes/pageNav">
		<wa:param name="orderBy" value="${waParam.orderBy}"/>
		<wa:param name="orderDir" value="${waParam.orderDir}"/>
	</wa:include>
</div>
<!-- paginationBottom:end-->
</div>

<div id="fieldList">
	<div>
		<input name="userId" id="c_userId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>UserId</wa:mls></label>
	</div>
	<div>
		<input name="cryptedid" id="c_cryptedid" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Cryptedid</wa:mls></label>
	</div>
	<div>
		<input name="gender" id="c_gender" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Gender</wa:mls></label>
	</div>
	<div>
		<input name="firstname" id="c_firstname" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Firstname</wa:mls></label>
	</div>
	<div>
		<input name="lastname" id="c_lastname" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Lastname</wa:mls></label>
	</div>	
	<div>
		<input name="email" id="c_email" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Email</wa:mls></label>
	</div>	
	<div>
		<input name="zipcode" id="c_zipcode" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Zipcode</wa:mls></label>
	</div>
	<div>
		<input name="city" id="c_city" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>City</wa:mls></label>
	</div>
	<div>
		<input name="languageid" id="c_languageid" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Culture</wa:mls></label>
	</div>	
	<div>
		<input name="optin" id="c_optin" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>optin</wa:mls></label>
	</div>	
	<div>
		<input name="createdOn" id="c_createdOn" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Created on</wa:mls></label>
	</div>
	
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='userId';
numOfElement='${listSize}'; 
</script>
<script type="text/javascript" >

function copyToOpener(data,target){
	if(window.opener != 'undefined' && window.opener != null){
		window.opener.document.getElementById(target).value=data;
		window.close();
	}
}
</script>