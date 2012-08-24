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
					<label for="s_templateZoneId"><wa:mls>TemplateZoneId</wa:mls></label>
					<input name="s_templateZoneId" type="text" <c:choose><c:when test="${waParam.s_templateZoneId!=null}">value="${waParam.s_templateZoneId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_templatePage_templatePageId"><wa:mls>TemplatePage</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.template.hdata.TemplatePage" />
						<wa:param name="manager" value="com.wanabe.template.manager.TemplatePageManager" />
						<wa:param name="identity" value="templatePageId" />
						<wa:param name="display" value="templatePageName" />
						<wa:param name="name" value="s_templatePage_templatePageId" />
						<wa:param name="choiceMsg" value="Select the TemplatePage" />
						<wa:param name="selectedValues" value="${waParam.s_templatePage_templatePageId}" />
					</wa:include>
				</div>
				<div>
					<label for="s_position"><wa:mls>Position</wa:mls></label>
					
					<input name="s_position" type="text" <c:choose><c:when test="${waParam.s_position!=null}">value="${waParam.s_position}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_algorithm"><wa:mls>Algorithm</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.template.hdata.TemplateAlgorithm" />
						<wa:param name="manager" value="com.wanabe.template.manager.TemplateAlgorithmManager" />
						<wa:param name="identity" value="name" />
						<wa:param name="display" value="name" />
						<wa:param name="name" value="s_algorithm" />
						<wa:param name="choiceMsg" value="Select the Algorithm" />
						<wa:param name="selectedValues" value="${waParam.s_algorithm}" />
					</wa:include>
				</div>
				<div>
					<label for="s_paramValues"><wa:mls>ParamValues</wa:mls></label>
					<input name="s_paramValues" type="text" <c:choose><c:when test="${waParam.s_paramValues!=null}">value="${waParam.s_paramValues}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
			</form>
		</div>
	</div>
<!--searchBox:end-->
</div>
<!--floatLeft:end-->
<h2><wa:mls>TemplateZone</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
				<td class="center templateZoneId">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>TemplateZoneId</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="templateZoneId" />
					</wa:link>			
				</td>
				<td class="center templatePageId">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>TemplatePage</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="templatePage_templatePageId" />
					</wa:link>			
				</td>
				<td class="center position">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Position</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="position" />
					</wa:link>			
				</td>
				<td class="center algorithm">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Algorithm</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="algorithm" />
					</wa:link>			
				</td>
				<td class="left paramValues">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>ParamValues</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="paramValues" />
					</wa:link>			
				</td>
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">
					<td class="center checkbox"><input type="checkbox" value="${item.templateZoneId}"></td>
					<td class="center templateZoneId"><a href="${context}/${site}/templateZone/editItem/id/${item.templateZoneId}.do" title="<wa:mls>Edit</wa:mls>">${item.templateZoneId}</a></td>
					<td class="center templatePageId"><wa:include URI="${site}/templatePage/lookup"><wa:param name="templatePageId" value="${item.templatePage.templatePageId}"/></wa:include>&nbsp;</td>
					<td class="center position">${item.position}&nbsp;</td>
					<td class="center algorithm">${item.algorithm}&nbsp;</td>
					<td class="left paramValues">${item.paramValues}&nbsp;</td>
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
		<input name="templateZoneId" id="c_templateZoneId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>TemplateZoneId</wa:mls></label>
	</div>
	<div>
		<input name="templatePageId" id="c_templatePageId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>TemplatePageId</wa:mls></label>
	</div>
	<div>
		<input name="position" id="c_position" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Position</wa:mls></label>
	</div>
	<div>
		<input name="algorithm" id="c_algorithm" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Algorithm</wa:mls></label>
	</div>
	<div>
		<input name="paramValues" id="c_paramValues" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>ParamValues</wa:mls></label>
	</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='templateZoneId';
</script>