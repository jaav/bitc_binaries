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
					<label for="s_linkid"><wa:mls>linkid</wa:mls></label>
					<input name="s_linkid" type="text" <c:choose><c:when test="${waParam.s_linkid!=null}">value="${waParam.s_linkid}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_url"><wa:mls>URL</wa:mls></label>
					<input name="s_url" type="text" <c:choose><c:when test="${waParam.s_url!=null}">value="${waParam.s_url}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_description"><wa:mls>description</wa:mls></label>
					<input name="s_description" type="text" <c:choose><c:when test="${waParam.s_description!=null}">value="${waParam.s_description}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
			</form>
		</div>
	</div>
<!--searchBox:end-->
</div>
<!--floatLeft:end-->
<h2><wa:mls>ContentLink</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
					<td class="center linkid">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>linkId</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="linkid" />
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
					<td class="left cryptLink">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>cryptLink</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="cryptLink" />
						</wa:link>			
					</td>
					<td class="right countClicks">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>countClicks</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="countClicks" />
						</wa:link>			
					</td>
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">
					<td class="center checkbox"><input type="checkbox" value="${item.linkid}"></td>
					<td class="center linkid"><a href="${context}/${site}/contentLink/editItem/id/${item.linkid}.do" title="<wa:mls>Edit id</wa:mls>">${item.linkid}</a></td>
					<td class="left url">${item.url}</td>
					<td class="left description">${item.description}</td>
					<td class="left cryptLink">
						<c:choose>
						<c:when test="${openerField != null}">
							<a href="javascript:copyToOpener('/wasyb/front/tracking/link${item.paramDescription}/cid/${wa:crypt(item.linkid)}.do','${openerField}');">${context}/front/tracking/link${item.paramDescription}/cid/${wa:crypt(item.linkid)}.do</a>
						</c:when>
						<c:otherwise>
							${context}/front/tracking/link${item.paramDescription}/cid/${wa:crypt(item.linkid)}.do
						</c:otherwise>
						</c:choose>
					</td>
					<td class="right countClicks">${item.countClicks}</td>
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
			<input name="url" id="c_url" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>url</wa:mls></label>
		</div>

		<div>
			<input name="description" id="c_description"" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>description</wa:mls></label>
		</div>
		<div>
			<input name="cryptLink" id="c_cryptLink" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>cryptLink</wa:mls></label>
		</div>
		<div>
			<input name="countClicks" id="c_countClicks"" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>countClicks</wa:mls></label>
		</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='linkId';
</script>
<script type="text/javascript" >

function copyToOpener(data,target){
	if(window.opener != 'undefined' && window.opener != null){
		window.opener.document.getElementById(target).value=data;
		window.close();
	}
}
</script>