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
		<a href="javascript:void(0);" id="delete_btn"><wa:mls>delete</wa:mls></a>
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
					<label for="s_linkid"><wa:mls>linkid</wa:mls></label>
					<input name="s_linkid" type="text" <c:choose><c:when test="${waParam.s_linkid!=null}">value="${waParam.s_linkid}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_contentType"><wa:mls>content_type</wa:mls></label>
					<select name="s_contentType">
						<option value=""><wa:mls>chooseValue</wa:mls></option>
						<option value="article" <c:if test="${waParam.s_contentType=='article'}">selected="selected"</c:if>>article</option>
						<option value="body" <c:if test="${waParam.s_contentType=='body'}">selected="selected"</c:if>>body</option>
						<option value="menu" <c:if test="${waParam.s_contentType=='menu'}">selected="selected"</c:if>>menu</option>
					</select>
				</div>
				<div>
					<label for="s_contentid"><wa:mls>contentid</wa:mls></label>
					<input name="s_contentid" type="text" <c:choose><c:when test="${waParam.s_contentid!=null}">value="${waParam.s_contentid}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_propertyid"><wa:mls>property</wa:mls></label>
					<wa:include URI="${site}/contentProperty/dropList">
						<wa:param name="def" value="${waParam.s_propertyid}"/>
						<wa:param name="selectName" value="s_propertyid"/>
					</wa:include>
				</div>
				<div>
					<label for="s_value"><wa:mls>value</wa:mls></label>
					<input name="s_value" type="text" <c:choose><c:when test="${waParam.s_value!=null}">value="${waParam.s_value}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
			</form>
		</div>
	</div>
<!--searchBox:end-->
</div>
<!--floatLeft:end-->
<h2><wa:mls>ContentLinkPropertyvalueContent</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
					<td class="center linkid">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>ID</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="linkid" />
						</wa:link>			
					</td>
					<td class="center content_type">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>Type</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="contentType" />
						</wa:link>			
					</td>
					<td class="left contentid">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>Content</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="contentid" />
						</wa:link>			
					</td>
					<td class="center property_name">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>Property</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="propertyName" />
						</wa:link>			
					</td>
					<td class="left value_name">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>Value</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="valueName" />
						</wa:link>			
					</td>
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">
					<td class="center checkbox"><input type="checkbox" value="${item.linkid}"></td>
						<td class="center linkid">${item.linkid}</td>
						<td class="center content_type">${item.contentType}</td>
						<td class="left contentid">
							<wa:include URI="${site}/contentLinkPropertyvalueContent/lookup">
								<wa:param name="id" value="${item.contentid}"/>
								<wa:param name="type" value="${item.contentType}"/>
							</wa:include>
						</td>
						<td class="center property_name">${item.propertyName}&nbsp;</td>
						<td class="left value_name">${item.valueName}&nbsp;</td>
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
		<input name="linkid" id="c_linkid" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>linkid</wa:mls></label>
	</div>
	<div>
		<input name="content_type" id="c_content_type" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>content_type</wa:mls></label>
	</div>
	<div>
		<input name="contentid" id="c_contentid" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>contentid</wa:mls></label>
	</div>
	<div>
		<input name="property_name" id="c_property_name" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>property_name</wa:mls></label>
	</div>
	<div>
		<input name="value_name" id="c_value_name" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>value_name</wa:mls></label>
	</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='name';
</script>