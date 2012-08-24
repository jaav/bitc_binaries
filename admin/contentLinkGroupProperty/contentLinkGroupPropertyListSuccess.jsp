<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false" 
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


	<div id="listBox">
		<h1><wa:mls>ContentLinkGroupProperty</wa:mls></h1>
		<div id="list">
			<div id="mask">
			<table cellspacing=0 cellpadding=0>
				<tr class="header">
					<td class="checkbox">
						<input type="checkbox" id="checkboxAll"/>
					</td>
					<td class="text linkid">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>id</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="linkid" />
						</wa:link>			
					</td>
					<td class="text contentGroup">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>Name</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="contentGroup" />
						</wa:link>			
					</td>
					<td class="text contentProperty">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>Type</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="contentProperty" />
						</wa:link>			
					</td>
				</tr>
				
				<c:forEach var="item" items="${list}" varStatus="loop">
					<tr class="line${((loop.count+1)%2)+1}">
						<td class="checkbox"><input type="checkbox" value="${item.linkid}"></td>
							<td class="text linkid"><a href="${context}/${site}/contentLinkGroupProperty/editItem/id/${item.linkid}.do" title="<wa:mls>Edit linkid</wa:mls>">${item.linkid}</a></td>
					 		<td class="text contentGroup">${item.contentGroup.name}&nbsp;</td>
							<td class="text contentProperty">${item.contentProperty.name}&nbsp;</td>
					</tr>
				</c:forEach>
				
			</table>
			</div>
		</div>
		<wa:include URI="${site}/boxes/pageNav">
			<wa:param name="orderBy" value="${waParam.orderBy}"/>
			<wa:param name="orderDir" value="${waParam.orderDir}"/>
		</wa:include>
	</div>
<!--tool boxes:start-->
<div id="searchBox">
	<h2><wa:mls>Search Box</wa:mls></h2>
	<div class="content">
		<form name="searchForm" id="searchForm" action="${context}/${site}/${module}/${action}.do${filterString}">
			<div>
				<label for="s_linkid"><wa:mls>Link ID</wa:mls></label>
				<input name="s_linkid" type="text" <c:choose><c:when test="${waParam.s_linkid!=null}">value="${waParam.s_linkid}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
			</div>
			
			
			<div>
				<label for="s_linkid"><wa:mls>Content Group</wa:mls></label>
				<wa:include URI="${site}/dropdown/dropList">
					<wa:param name="class" value="com.inno.hdata.ContentGroup" />
					<wa:param name="manager" value="com.inno.hdata.manager.ContentGroupManager" />
					<wa:param name="identity" value="groupid" />
					<wa:param name="display" value="name" />
					<wa:param name="name" value="s_contentGroup_groupid" />
					<wa:param name="selectedValues" value="${waParam.s_contentGroup_groupid}" />
					<wa:param name="method" value="listAll" />
				</wa:include>
			</div>
			
			<div>
				<label for="s_linkid"><wa:mls>Content Property</wa:mls></label>
				<wa:include URI="${site}/dropdown/dropList">
					<wa:param name="class" value="com.inno.hdata.ContentProperty" />
					<wa:param name="manager" value="com.inno.hdata.manager.ContentPropertyManager" />
					<wa:param name="identity" value="propertyid" />
					<wa:param name="display" value="name" />
					<wa:param name="name" value="s_contentProperty_propertyid" />
					<wa:param name="selectedValues" value="${waParam.s_contentProperty_propertyid}" />
					<wa:param name="method" value="listAll" />
				</wa:include>
			</div>

			<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
		</form>
	</div>
</div>
<div id="toolBox">
	<div class="content" id="actions">
		<a href="" id="search_btn" class="allways"><wa:mls>search</wa:mls></a>
		<a href="" id="add_btn"><wa:mls>add</wa:mls></a>
		<a href="" id="delete_btn"><wa:mls>delete</wa:mls></a>
		<a href="" id="edit_btn"><wa:mls>edit</wa:mls></a>
		<a href="" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
	</div>
</div>
<div id="fieldList">
		<div>
			<input name="linkid" id="c_linkid" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>Link ID</wa:mls></label>
		</div>
		<div>
			<input name="contentGroup" id="c_contentGroup" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>contentGroup</wa:mls></label>
		</div>
				<div>
			<input name="contentProperty" id="c_contentProperty" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>contentProperty</wa:mls></label>
		</div>
</div>

<div id="legend">
	<div class="header">
		<h1><wa:mls>Legend</wa:mls></h1>
	</div>
	<div class="content">
		${legend}
	</div>
</div>
<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='linkid';
</script>