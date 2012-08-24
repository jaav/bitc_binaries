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
		<a href="javascript:void(0);" id="duplicate_btn"><wa:mls>duplicate</wa:mls></a>
		<a href="javascript:void(0);" id="delete_btn"><wa:mls>delete</wa:mls></a>
		<a href="javascript:void(0);" id="edit_btn"><wa:mls>edit</wa:mls></a>
		<a href="javascript:void(0);" id="export_btn"><wa:mls>export</wa:mls></a>
		<a href="javascript:void(0);" id="import_btn"><wa:mls>import</wa:mls></a>
		<c:if test="${legend != null}">
			<a href="javascript:void(0);" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
		</c:if>
		<a href="${context}/${site}/framework/reloadMLSS.do" id="reload_btn" class="allways"><wa:mls>reload mlss</wa:mls></a>
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
					<label for="s_mlssId"><wa:mls>mlssId</wa:mls></label>
					<input name="s_mlssId" type="text" <c:choose><c:when test="${waParam.s_mlssId!=null}">value="${waParam.s_mlssId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_id"><wa:mls>id</wa:mls></label>
					<input name="s_id" type="text" <c:choose><c:when test="${waParam.s_id!=null}">value="${waParam.s_id}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_lg"><wa:mls>lg</wa:mls></label>
					<wa:include URI="admin/dropdown/dropListCulture">
						<wa:param name="name" value="s_lg" />
						<wa:param name="choiceMsg" value="Choose your language" />
						<wa:param name="selectedValues" value="${waParam.s_lg}" />
						<wa:param name="excludeBE" value="true" />
						<wa:param name="isUpper" value="true" />
					</wa:include>				
				</div>
				<div>
					<label for="s_page"><wa:mls>page</wa:mls></label>
					<input name="s_page" type="text" onkeypress="document.searchForm.s_page2.value='';" <c:choose><c:when test="${waParam.s_page!=null}">value="${waParam.s_page}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_page2"><wa:mls>Default page</wa:mls></label>
					<select name="s_page2" onchange="document.searchForm.s_page.value=this.value">
						<option value=""><wa:mls>Select</wa:mls></option>
						<option value="DEFAULT_PAGE.front">DEFAULT_PAGE.front</option>
						<option value="DEFAULT_PAGE.admin">DEFAULT_PAGE.admin</option>
					</select>
				</div>
				<div>
					<label for="s_val"><wa:mls>val</wa:mls></label>
					<input name="s_val" type="text" <c:choose><c:when test="${waParam.s_val!=null}">value="${waParam.s_val}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
			</form>
		</div>
	</div>
<!--searchBox:end-->
</div>
<!--floatLeft:end-->
<h2><wa:mls>MLSS</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
				<td class="center mlssId">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>mlssId</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="mlssId" />
					</wa:link>			
				</td>
				<td class="left id">
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
				<td class="center lg">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>lg</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="lg" />
					</wa:link>			
				</td>
				<td class="left page">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>page</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="page" />
					</wa:link>			
				</td>
				<td class="left val">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>val</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="val" />
					</wa:link>			
				</td>
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">
					<td class="center checkbox"><input type="checkbox" value="${item.mlssId}"></td>
					<td class="center mlssId"><a href="${context}/${site}/mlss/editItem/id/${item.mlssId}.do" title="<wa:mls>Edit mlssId</wa:mls>">${item.mlssId}</a></td>
					<td class="left id">${item.id}&nbsp;</td>
					<td class="center lg">${item.lg}&nbsp;</td>
					<td class="left page">${item.page}&nbsp;</td>
					<td class="left val">${item.val}&nbsp;</td>
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
			<input name="mlssId" id="c_mlssId" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>mlssId</wa:mls></label>
		</div>
		<div>
			<input name="id" id="c_id" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>id</wa:mls></label>
		</div>
		<div>
			<input name="lg" id="c_lg" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>lg</wa:mls></label>
		</div>
		<div>
			<input name="page" id="c_page" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>page</wa:mls></label>
		</div>
		<div>
			<input name="val" id="c_val" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>val</wa:mls></label>
		</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='mlssId';
numOfElement='${listSize}'; 
</script>