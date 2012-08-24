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
					<label for="s_id"><wa:mls>id</wa:mls></label>
					<input name="s_id" type="text" <c:choose><c:when test="${waParam.s_id!=null}">value="${waParam.s_id}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_adminuserid_lastname">Username</label>
					<input name="s_adminuserid_lastname" type="text" <c:choose><c:when test="${waParam.s_adminuserid_lastname!=null}">value="${waParam.s_adminuserid_lastname}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_adminuserid"><wa:mls>adminuserid</wa:mls></label>
					<input name="s_adminuserid" type="text" <c:choose><c:when test="${waParam.s_adminuserid!=null}">value="${waParam.s_adminuserid}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_profile"><wa:mls>profile</wa:mls></label>
					<wa:include URI="${site}/acxProfile/dropList">
						<wa:param name="def" value="${waParam.s_profile}"/>
						<wa:param name="selectName" value="s_profile"/>
					</wa:include>
				</div>
				
			<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
			</form>
		</div>
	</div>
<!--searchBox:end-->
</div>
<!--floatLeft:end-->
<h2><wa:mls>acxUserprofile</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
					<td class="center id">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>id</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="id" />
						</wa:link>			
					</td>
					<td class="left username">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>username</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="username" />
						</wa:link>			
					</td>
					<td class="left profile">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>profile</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="profile" />
						</wa:link>			
					</td>
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">
					<td class="center checkbox"><input type="checkbox" value="${item.id}"></td>
					<td class="center id"><a href="${context}/${site}/acxUserprofile/editItem/id/${item.id}.do" title="<wa:mls>Edit id</wa:mls>">${item.id}</a></td>
					<td class="left adminuserid">
						<wa:include URI="${site}/acxAdminusers/lookup">
							<wa:param name="id" value="${item.adminuserid}"/>
						</wa:include>
					</td>
					<td class="left profile">${item.profile}&nbsp;</td>
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
		<input name="id" id="c_id" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>id</wa:mls></label>
	</div>
	<div>
		<input name="username" id="c_username" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>username</wa:mls></label>
	</div>
	<div>
		<input name="profile" id="c_profile" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>profile</wa:mls></label>
	</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='id';
</script>