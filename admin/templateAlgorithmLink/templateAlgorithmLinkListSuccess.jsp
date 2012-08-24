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
					<label for="s_templateAlgorithmLinkId"><wa:mls>templateAlgorithmLinkId</wa:mls></label>
					<input name="s_templateAlgorithmLinkId" type="text" <c:choose><c:when test="${waParam.s_templateAlgorithmLinkId!=null}">value="${waParam.templateAlgorithmLinkId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
			<!-- 	<div>
					<label for="s_template_templateId"><wa:mls>templateId</wa:mls></label>
					<input name="s_template_templateId" type="text" <c:choose><c:when test="${waParam.s_template_templateId!=null}">value="${waParam.s_template_templateId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
			 -->
				<div>
					<label for="s_template_templateId"><wa:mls>template</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.template.hdata.Template" />
						<wa:param name="manager" value="com.wanabe.template.manager.TemplateManager" />
						<wa:param name="method" value="listAll" />
						<wa:param name="identity" value="templateId" />
						<wa:param name="display" value="name" />
						<wa:param name="name" value="s_template_templateId" />
						<wa:param name="selectedValues" value="${waParam.s_template_templateId}" />
					</wa:include>
				</div>
				<!-- <div>
					<label for="s_templateAlgorithm_algorithmId"><wa:mls>algorithmId</wa:mls></label>
					<input name="s_templateAlgorithm_algorithmId" type="text" <c:choose><c:when test="${waParam.s_templateAlgorithm_algorithmId!=null}">value="${waParam.s_templateAlgorithm_algorithmId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div> -->
				<div>
					<label for="s_templateAlgorithm_algorithmId"><wa:mls>templateAlgorithm</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.template.hdata.TemplateAlgorithm" />
						<wa:param name="manager" value="com.wanabe.template.manager.TemplateAlgorithmManager" />
						<wa:param name="method" value="listAll" />
						<wa:param name="identity" value="algorithmId" />
						<wa:param name="display" value="name" />
						<wa:param name="name" value="s_templateAlgorithm_algorithmId" />
						<wa:param name="selectedValues" value="${waParam.s_templateAlgorithm_algorithmId}" />
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
<h2><wa:mls>TemplateAlgorithmLink</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
				<td class="center algorithmId">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>templateAlgorithmLinkId</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="templateAlgorithmLinkId" />
					</wa:link>			
				</td>
				<td class="left template">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>template</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="template" />
					</wa:link>			
				</td>
				<td class="left templateAlgorithm">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>templateAlgorithm</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="templateAlgorithm" />
					</wa:link>			
				</td>
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">
					<td class="center checkbox"><input type="checkbox" value="${item.templateAlgorithmLinkId}"></td>
					<td class="center templateAlgorithmLinkId"><a href="${context}/${site}/templateAlgorithmLink/editItem/id/${item.templateAlgorithmLinkId}.do" title="<wa:mls>Edit id</wa:mls>">${item.templateAlgorithmLinkId}</a></td>
					<td class="left template"><wa:link URI="${site}/template/editItem/id/${item.template.templateId}"> ${item.template.name}&nbsp;</wa:link></td>
					<td class="left templateAlgorithm"><wa:link URI="${site}/templateAlgorithm/editItem/id/${item.templateAlgorithm.algorithmId}"> ${item.templateAlgorithm.name}&nbsp;</wa:link></td>
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
		<input name="templateAlgorithmLinkId" id="c_templateAlgorithmLinkId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>templateAlgorithmLinkId</wa:mls></label>
	</div>
	<div>
		<input name="template" id="c_user" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>template</wa:mls></label>
	</div>
	<div>
		<input name="templateAlgorithm" id="c_user" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>templateAlgorithm</wa:mls></label>
	</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='algorithmId';
</script>