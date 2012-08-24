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
		<a href="javascript:void(0);" id="add_btn"><wa:mls>add</wa:mls></a>
		<a href="javascript:void(0);" id="delete_btn"><wa:mls>delete</wa:mls></a>
		<a href="javascript:void(0);" id="duplicate_btn"><wa:mls>duplicate</wa:mls></a>
		<a href="javascript:void(0);" id="edit_btn"><wa:mls>edit</wa:mls></a>
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
					<label for="s_userid"><wa:mls>userid</wa:mls></label>
					<input name="s_userid" type="text" <c:choose><c:when test="${waParam.s_userid!=null}">value="${waParam.s_userid}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div> 
				<div>
					<label for="s_login"><wa:mls>login</wa:mls></label>
					<input name="s_login" type="text" <c:choose><c:when test="${waParam.s_login!=null}">value="${waParam.s_login}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div> 
				<div>
					<label for="s_firstname"><wa:mls>firstname</wa:mls></label>
					<input name="s_firstname" type="text" <c:choose><c:when test="${waParam.s_firstname!=null}">value="${waParam.s_firstname}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_lastname"><wa:mls>lastname</wa:mls></label>
					<input name="s_lastname" type="text" <c:choose><c:when test="${waParam.s_lastname!=null}">value="${waParam.s_lastname}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_email"><wa:mls>email</wa:mls></label>
					<input name="s_email" type="text" <c:choose><c:when test="${waParam.s_email!=null}">value="${waParam.s_email}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
			<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
			</form>
		</div>
	</div>
<!--searchBox:end-->
</div>
<!--floatLeft:end-->
<h2><wa:mls>Admin Users</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
				<td class="center userid">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>userid</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="userid" />
						</wa:link>			
					</td>
					<td class="left login">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>login</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="login" />
						</wa:link>			
					</td>
					<td class="left firstname">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>firstname</wa:mls>
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
							<wa:mls>lastname</wa:mls>
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
							<wa:mls>email</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="email" />
						</wa:link>			
					</td>
					<td class="left show"></td>

			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">
					<td class="center checkbox"><input type="checkbox" value="${item.userid}"></td>
					<td class="center userid"><a href="${context}/${site}/acxAdminusers/editItem/id/${item.userid}.do" title="<wa:mls>Edit userid</wa:mls>">${item.userid}</a></td>
					<td class="left login">${item.login}&nbsp;</td>
					<td class="left firstname">${item.firstname}&nbsp;</td>
					<td class="left lastname">${item.lastname}&nbsp;</td>
					<td class="left email">${item.email}&nbsp;</td>
					<td class="left show">
					<a href="${context}/${site}/acxUserprofile/acxUserprofileList.do?s_adminuserid=${item.userid}&s_submit=Search"><wa:mls>Show profiles</wa:mls></a>
					<c:if test="${openerField != null}">
						|<a href="javascript:copyToOpener('${item.userid}','${openerField}');"><wa:mls>Copy to opener</wa:mls></a>
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
<!--content:end-->

<!--wrapper:end-->


<div id="fieldList">
		<div>
			<input name="userid" id="c_userid" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>userid</wa:mls></label>
		</div>
		<div>
			<input name="login" id="c_login" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>login</wa:mls></label>
		</div>
		<div>
			<input name="firstname" id="c_firstname" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>firstname</wa:mls></label>
		</div>
		<div>
			<input name="lastname" id="c_lastname" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>lastname</wa:mls></label>
		</div>
		<div>
			<input name="email" id="c_email" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>email</wa:mls></label>
		</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='id';
</script>
<script type="text/javascript" >

function copyToOpener(data,target){
	if(window.opener != 'undefined' && window.opener != null){
		window.opener.document.getElementById(target).value=data;
		window.close();
	}
}
</script>