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
		<a href="javascript:void(0);" id="duplicate_btn"><wa:mls>duplicate</wa:mls></a>
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
					<label for="s_algorithmId"><wa:mls>AlgorithmId</wa:mls></label>
					<input name="s_algorithmId" type="text" <c:choose><c:when test="${waParam.s_algorithmId!=null}">value="${waParam.s_algorithmId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_name"><wa:mls>name</wa:mls></label>
					<input name="s_name" type="text" <c:choose><c:when test="${waParam.s_name!=null}">value="${waParam.s_name}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_description"><wa:mls>Description</wa:mls></label>
					<input name="s_description" type="text" <c:choose><c:when test="${waParam.s_description!=null}">value="${waParam.s_description}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_params"><wa:mls>Params</wa:mls></label>
					<input name="s_params" type="text" <c:choose><c:when test="${waParam.s_params!=null}">value="${waParam.s_params}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
			</form>
		</div>
	</div>
<!--searchBox:end-->
</div>
<!--floatLeft:end-->
<h2><wa:mls>Algorithm</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
				<td class="center algorithmId">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>AlgorithmId</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="algorithmId" />
					</wa:link>			
				</td>
				<td class="left name">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Name</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="name" />
					</wa:link>			
				</td>
				<td class="left description">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Description</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="description" />
					</wa:link>			
				</td>
				<td class="left params">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Params</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="params" />
					</wa:link>			
				</td>
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">
					<td class="center checkbox"><input type="checkbox" value="${item.algorithmId}"></td>
					<td class="center algorithmId"><a href="${context}/${site}/templateAlgorithm/editItem/id/${item.algorithmId}.do" title="<wa:mls>Edit</wa:mls>">${item.algorithmId}</a></td>
					<td class="left name">${item.name}&nbsp;</td>
					<td class="left description">${item.description}&nbsp;</td>
					<td class="left params">${item.params}&nbsp;</td>
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
		<input name="algorithmId" id="c_algorithmId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>AlgorithmId</wa:mls></label>
	</div>
	<div>
		<input name="name" id="c_name" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>name</wa:mls></label>
	</div>
	<div>
		<input name="description" id="c_description" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Description</wa:mls></label>
	</div>
	<div>
		<input name="params" id="c_params" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Params</wa:mls></label>
	</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='algorithmId';
</script>