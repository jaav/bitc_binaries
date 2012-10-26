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
					<label for="s_contentImageId"><wa:mls>contentImageId</wa:mls></label>
					<input name="s_contentImageId" type="text" <c:choose><c:when test="${waParam.s_contentImageId!=null}">value="${waParam.s_contentImageId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_name"><wa:mls>name</wa:mls></label>
					<input name="s_name" type="text" <c:choose><c:when test="${waParam.s_name!=null}">value="${waParam.s_name}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_type"><wa:mls>type</wa:mls></label>
					<select name="s_type">
						<option value="" <c:if test="${waParam.s_type eq '' || waParam.s_type == null}">selected="selected"</c:if>><wa:mls>Select the type</wa:mls></option>
						<option value="db" <c:if test="${waParam.s_type eq 'db'}">selected="selected"</c:if>><wa:mls>DB</wa:mls></option>
                        <option value="pdf" <c:if test="${waParam.s_type eq 'pdf'}">selected="selected"</c:if>>PDF</option>
						<!-- <option value="gamme" <c:if test="${waParam.s_type eq 'gamme'}">selected="selected"</c:if>><wa:mls>Gamme</wa:mls></option>
						<option value="product" <c:if test="${waParam.s_type eq 'product'}">selected="selected"</c:if>><wa:mls>Product</wa:mls></option>
						<option value="content" <c:if test="${waParam.s_type eq 'content'}">selected="selected"</c:if>><wa:mls>Content</wa:mls></option> -->
					</select>
				</div>
				<div>
					<label for="s_createdOn"><wa:mls>createdOn</wa:mls></label>
					<p><wa:mls>from</wa:mls><input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnStart" name="s_createdOnStart" value="${waParam.s_createdOnStart}" maxlength="10" /></p>
					<p><wa:mls>to</wa:mls><input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnEnd" name="s_createdOnEnd" value="${waParam.s_createdOnEnd}" maxlength="10" /></p>
				</div>
				<div>
					<label for="s_keywords"><wa:mls>keywords</wa:mls></label>
					<input name="s_keywords" type="text" <c:choose><c:when test="${waParam.s_keywords!=null}">value="${waParam.s_keywords}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
			</form>
		</div>
	</div>
<!--searchBox:end-->
</div>
<!--floatLeft:end-->
<h2><wa:mls>ContentImage</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
					<td class="center contentImageId">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>contentImageId</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="contentImageId" />
						</wa:link>			
					</td>
					<td class="center image" >&nbsp;</td>
					<td class="left name">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>name</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="name" />
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
						<td class="left keywords">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>keywords</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="keywords" />
						</wa:link>			
					</td>
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">
					<td class="center checkbox"><input type="checkbox" value="${item.contentImageId}"></td>
					<td class="center contentImageId"><a href="${context}/${site}/contentImage/editItem/id/${item.contentImageId}.do" title="<wa:mls>Edit id</wa:mls>">${item.contentImageId}</a></td>
					<td class="center image"><a href="${item.url}" target="image"><img src="${item.url}" <c:if test="${item.width > 200}"> width="200"</c:if> /></a></td>
					<td class="left name">${item.name}&nbsp;</td>
					<td class="center createdOn"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.createdOn}"/>&nbsp;</td>
					<td class="left url">
					<c:choose>
						<c:when test="${openerField != null}">
							<a href="javascript:copyToOpener('${item.url}','${openerField}');">${item.url}&nbsp;</a>
						</c:when>
						<c:otherwise>
							${item.url}
						</c:otherwise>
						</c:choose>
					</td>
					<td class="left keywords">${item.keywords}&nbsp;</td>
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
		<input name="contentImageId" id="c_contentImageId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>contentImageId</wa:mls></label>
	</div>
	<div>
		<input name="name" id="c_name" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>name</wa:mls></label>
	</div>
	<div>
		<input name="createdOn" id="c_createdOn" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>createdOn</wa:mls></label>
	</div>
	<div>
		<input name="url" id="c_url" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>url</wa:mls></label>
	</div>
	<div>
		<input name="keywords" id="c_keywords" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>keywords</wa:mls></label>
	</div>
</div>
<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
	path='${context}/${site}/${module}';
	idName='contentImageId';
	addParams='?contentType=${fckContentType}&contentId=${fckPublishId}';
</script>
<script type="text/javascript" >

function copyToOpener(data,target){
	if(window.opener != 'undefined' && window.opener != null){
		window.opener.document.getElementById(target).value=data;
		window.close();
	}
}
</script>