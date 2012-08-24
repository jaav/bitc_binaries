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
		<a href="javascript:void(0);" id="edit_btn"><wa:mls>edit</wa:mls></a>
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
					<label for="s_id"><wa:mls>id</wa:mls></label>
					<input name="s_id" type="text" <c:choose><c:when test="${waParam.s_id!=null}">value="${waParam.s_id}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_contentType"><wa:mls>contentType</wa:mls></label>
					<input name="s_contentType" type="text" <c:choose><c:when test="${waParam.s_contentType!=null}">value="${waParam.s_contentType}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_contentId"><wa:mls>contentId</wa:mls></label>
					<input name="s_contentId" type="text" <c:choose><c:when test="${waParam.s_contentId!=null}">value="${waParam.s_contentId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_url"><wa:mls>url</wa:mls></label>
					<input name="s_url" type="text" <c:choose><c:when test="${waParam.s_url!=null}">value="${waParam.s_url}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_description"><wa:mls>Description</wa:mls></label>
					<input name="s_description" type="text" <c:choose><c:when test="${waParam.s_description!=null}">value="${waParam.s_description}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_source"><wa:mls>Source</wa:mls></label>
					<input name="s_source" type="text" <c:choose><c:when test="${waParam.s_source!=null}">value="${waParam.s_source}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_sourceId"><wa:mls>SourceId</wa:mls></label>
					<input name="s_sourceId" type="text" <c:choose><c:when test="${waParam.s_sourceId!=null}">value="${waParam.s_sourceId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_createdOn"><wa:mls>createdOn</wa:mls></label>
					<p><wa:mls>from</wa:mls><input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnStart" name="s_createdOnStart" value="${waParam.s_createdOnStart}" maxlength="10" /></p>
					<p><wa:mls>to</wa:mls><input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnEnd" name="s_createdOnEnd" value="${waParam.s_createdOnEnd}" maxlength="10" /></p>
				</div>
				<div>
					<label for="s_modifiedOn"><wa:mls>modifiedOn</wa:mls></label>
					<p><wa:mls>from</wa:mls><input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_modifiedOnStart" name="s_modifiedOnStart" value="${waParam.s_modifiedOnStart}" maxlength="10" /></p>
					<p><wa:mls>to</wa:mls><input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_modifiedOnEnd" name="s_modifiedOnEnd" value="${waParam.s_modifiedOnEnd}" maxlength="10" /></p>
				</div>
				
				<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
			</form>
		</div>
	</div>
<!--searchBox:end-->
</div>
<!--floatLeft:end-->
<h2><wa:mls>ContentExternalImage</wa:mls></h2>
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
					<td class="center image" >&nbsp;</td>
					<td class="left contentType">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>contentType</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="contentType" />
						</wa:link>			
					</td>
					<td class="center contentId">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>contentId</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="contentId" />
						</wa:link>			
					</td>
					<td class="left url">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>url</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="url" />
						</wa:link>			
					</td>
					<td class="left description">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>description</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="description" />
						</wa:link>			
					</td>
					<td class="left source">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>source</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="source" />
						</wa:link>			
					</td>
					<td class="center sourceId">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>sourceId</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="sourceId" />
						</wa:link>			
					</td>
					<td class="center createdOn">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>createdOn</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="createdOn" />
						</wa:link>			
					</td>
					<td class="center modifiedOn">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>modifiedOn</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="modifiedOn" />
						</wa:link>			
					</td>
					
					
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">
					<td class="center checkbox"><input type="checkbox" value="${item.id}"></td>
					<td class="center id"><a href="${context}/${site}/contentExternalImage/editItem/id/${item.id}.do" title="<wa:mls>Edit id</wa:mls>">${item.id}&nbsp;</a></td>
					<td class="center image"><a href="${item.mainUrl}" target="image"><img src="${item.mainUrl}" width="100" /></a></td>
					<td class="left contentType">${item.contentType}&nbsp;</td>
					<td class="center contentId">${item.contentId}&nbsp;</td>
					<td class="left url">${item.mainUrl}</td>
					<td class="left description">${item.mainDescription}&nbsp;</td>
					<td class="left source">${item.source}&nbsp;</td>
					<td class="center sourceId">${item.sourceId}&nbsp;</td>
					<td class="center createdOn"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.createdOn}"/>&nbsp;</td>
					<td class="center modifiedOn"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.modifiedOn}"/>&nbsp;</td>
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
		<input name="contentType" id="c_contentType" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>contentType</wa:mls></label>
	</div>
	<div>
		<input name="contentId" id="c_contentId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>contentId</wa:mls></label>
	</div>
	<div>
		<input name="url" id="c_url" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>url</wa:mls></label>
	</div>
	<div>
		<input name="description" id="c_description" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>description</wa:mls></label>
	</div>
	<div>
		<input name="source" id="c_source" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>source</wa:mls></label>
	</div>
	<div>
		<input name="sourceId" id="c_sourceId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>sourceId</wa:mls></label>
	</div>
	<div>
		<input name="createdOn" id="c_createdOn" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>createdOn</wa:mls></label>
	</div>
	<div>
		<input name="modifiedOn" id="c_modifiedOn" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>modifiedOn</wa:mls></label>
	</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='id';
</script>
