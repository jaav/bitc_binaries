<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false" 
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="mainContent">
<div id="toolBox">
	<div class="content" id="actions">
		<a href="javascript:void(0);" id="search_btn" class="allways"><wa:mls>search</wa:mls></a>
		<a href="javascript:void(0);" id="add_btn"><wa:mls>add</wa:mls></a>
		<a href="javascript:void(0);" id="duplicate_btn"><wa:mls>duplicate</wa:mls></a>
		<a href="javascript:void(0);" id="delete_btn"><wa:mls>delete</wa:mls></a>
		<a href="javascript:void(0);" id="edit_btn"><wa:mls>edit</wa:mls></a>
		<a href="javascript:void(0);" id="publish_btn"><wa:mls>publish</wa:mls></a>
		<a href="javascript:void(0);" id="addListToNltContent_btn"><wa:mls>addToNltContent</wa:mls></a>
		<a href="javascript:void(0);" id="addResearchToNltContent_btn" class="allways"><wa:mls>add Research ToNltContent</wa:mls></a>
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
					<label for="s_contentBodyId"><wa:mls>contentBodyId</wa:mls></label>
					<input name="s_contentBodyId" type="text" <c:choose><c:when test="${waParam.s_contentBodyId!=null}">value="${waParam.s_contentBodyId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_culture"><wa:mls>culture</wa:mls></label>
					<wa:include URI="admin/dropdown/dropListCulture">
						<wa:param name="name" value="s_culture" />
						<wa:param name="choiceMsg" value="Choose the culture" />
						<wa:param name="selectedValues" value="${waParam.s_culture}" />
					</wa:include>
				</div>
				<div>
					<label for="s_name"><wa:mls>name</wa:mls></label>
					<input name="s_name" type="text" <c:choose><c:when test="${waParam.s_name!=null}">value="${waParam.s_name}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>		
				<div>
					<label for="s_position"><wa:mls>position</wa:mls></label>
					<input name="s_position" type="text" <c:choose><c:when test="${waParam.s_position!=null}">value="${waParam.s_position}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_createdOn"><wa:mls>createdOn</wa:mls></label>
					<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnStart" name="s_createdOnStart" value="${waParam.s_createdOnStart}" maxlength="10" /></p>
					<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnEnd" name="s_createdOnEnd" value="${waParam.s_createdOnEnd}" maxlength="10" /></p>
				</div>
				<div>
					<label for="s_fromDate"><wa:mls>fromDate</wa:mls></label>
					<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_fromDateStart" name="s_fromDateStart" value="${waParam.s_fromDateStart}" maxlength="10" /></p>
					<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_fromDateEnd" name="s_fromDateEnd" value="${waParam.s_fromDateEnd}" maxlength="10" /></p>
				</div>
				<div>
					<label for="s_toDate"><wa:mls>toDate</wa:mls></label>
					<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_toDateStart" name="s_toDateStart" value="${waParam.s_toDateStart}" maxlength="10" /></p>
					<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_toDateEnd" name="s_toDateEnd" value="${waParam.s_toDateEnd}" maxlength="10" /></p>
				</div>
				<div>
					<label for="s_visible"><wa:mls>visible</wa:mls></label>
					<input type="radio"<c:if test="${waParam.s_visible=='0'}"> checked="checked"</c:if> value="0" name="s_visible"/><wa:mls>No</wa:mls>
					<input type="radio"<c:if test="${waParam.s_visible=='1'}"> checked="checked"</c:if> value="1" name="s_visible"/><wa:mls>Yes</wa:mls>
				</div>
				<div>
					<label for="s_status"><wa:mls>status</wa:mls></label>
					<br/>
					<input type="checkbox"<c:if test="${wa:contain(waParams.s_status,'0')}"> checked="checked"</c:if> value="0" name="s_status"/><wa:mls>DRAFT</wa:mls>
					<input type="checkbox"<c:if test="${wa:contain(waParams.s_status,'1')}"> checked="checked"</c:if> value="1" name="s_status"/><wa:mls>PUBLISHED</wa:mls>
					<br/>
					<input type="checkbox"<c:if test="${wa:contain(waParams.s_status,'2')}"> checked="checked"</c:if> value="2" name="s_status"/><wa:mls>ARCHIVED</wa:mls>
					<input type="checkbox"<c:if test="${wa:contain(waParams.s_status,'3')}"> checked="checked"</c:if> value="3" name="s_status"/><wa:mls>DELETED</wa:mls>
				</div>
				<div>
					<label for="s_publishContent_contentBodyId"><wa:mls>publishContent</wa:mls></label>
					<input name="s_publishContent_contentBodyId" type="text" <c:choose><c:when test="${waParam.s_publishContent_contentBodyId!=null}">value="${waParam.s_publishContent_contentBodyId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_group"><wa:mls>group</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.cms.hdata.ContentGroup" />
						<wa:param name="manager" value="com.wanabe.cms.manager.ContentGroupManager" />
						<wa:param name="method" value="listByTypeContentBody" />
						<wa:param name="identity" value="name" />
						<wa:param name="display" value="name" />
						<wa:param name="name" value="s_group" />
						<wa:param name="selectedValues" value="${waParam.s_group}" />
					</wa:include>
				</div>
				<c:if test="${fn:length(listProperties) > 0}">
				<label for="s_property_link"><wa:mls>PROPERTIES FOR TYPE</wa:mls> ${fn:toUpperCase(waParam.s_type)} : </label>
				<c:forEach var="property" items="${listProperties}">
				<div>

					<label for="s_property_link"><wa:mls>${fn:toLowerCase(property.name)}</wa:mls></label>
										
					<c:if test="${property.type!='FREE'}">
					<wa:include URI="admin/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue" />
						<wa:param name="manager" value="com.wanabe.cms.manager.ContentPropertyValueManager" />
						<wa:param name="identity" value="valueId" />
						<wa:param name="display" value="name" />
						<wa:param name="method" value="listByPropertyName" />
						<wa:param name="propertyName" value="${property.name}" />
						<wa:param name="name" value="s_property_link_${fn:toLowerCase(property.name)}" />
						<wa:param name="parentValue" value="parent" />
						<wa:param name="selectedValues" value="${waParam[property.propertyLinkName]}" />
					</wa:include>
					</c:if>

					<c:if test="${property.type=='FREE'}">
						<input type="text" name="s_property_link_${fn:toLowerCase(property.name)}" value="${waParam[property.propertyLinkName]}"/>				
					</c:if>			
					
				</div>
				</c:forEach>
				</c:if>
				
				<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
			</form>
		</div>
	</div>
<!--searchBox:end-->

</div>
<!--floatLeft:end-->
<h2><wa:mls>ContentBody</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td></td>
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
					<td class="center contentBodyId">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>contentBodyId</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="contentBodyId" />
						</wa:link>			
					</td>
					<td class="center culture">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>culture</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="culture" />
						</wa:link>			
					</td>
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
					<td class="center position">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>position</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="position" />
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
					<td class="center fromDate">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>fromDate</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="fromDate" />
						</wa:link>			
					</td>
					<td class="center toDate">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>toDate</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="toDate" />
						</wa:link>			
					</td>
					<td class="center visible">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>visible</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="visible" />
						</wa:link>			
					</td>
					<td class="center status">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>status</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="status" />
						</wa:link>			
					</td>
					<td class="center group">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>group</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="group" />
						</wa:link>			
					</td>
					<td class="center publishContent">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>publishContent</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="publishContent" />
						</wa:link>			
					</td>
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">
				
					<!-- AFFICHER LE STATUS -->
					<td 
						<c:if test="${item.status == 0}">class="blueStatus"</c:if>
						<c:if test="${item.status == 1}">class="greenStatus"</c:if>
						<c:if test="${item.status == 2}">class="orangeStatus"</c:if>
						<c:if test="${item.status == 3}">class="redStatus"</c:if>
					>&nbsp;</td>
				
					<td class="center checkbox"><input type="checkbox" value="${item.contentBodyId}"></td>
					<td class="center contentBodyId"><a href="${context}/${site}/contentBody/editItem/id/${item.contentBodyId}.do" title="<wa:mls>Edit id</wa:mls>">${item.contentBodyId}</a></td>
					<td class="center culture">${item.culture}&nbsp;</td>
					<td class="left name">${item.name}&nbsp;</td>
					<td class="center position">${item.position}&nbsp;</td>
					<td class="center createdOn"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.createdOn}"/>&nbsp;</td>
					<td class="center fromDate"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.fromDate}"/>&nbsp;</td>
					<td class="center toDate"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.toDate}"/>&nbsp;</td>
					<td class="center visible">
						<c:if test="${item.visible == 1}">
							X&nbsp;
						</c:if>
					</td>
					<td class="center status"> 
						<c:if test="${item.status == 0}">DRAFT</c:if>
						<c:if test="${item.status == 1}">PUBLISHED</c:if>
						<c:if test="${item.status == 2}">ARCHIVED ${item.versionId}</c:if>
						<c:if test="${item.status == 3}">DELETED</c:if>
					</td>
					<td class="center group">${item.group}&nbsp;</td>
					<td class="center publishContent">${item.publishContent.contentBodyId}&nbsp;</td>
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
			<input name="contentBodyId" id="c_contentBodyId" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>contentBodyId</wa:mls></label>
		</div>
		<div>
			<input name="culture" id="c_culture" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>culture</wa:mls></label>
		</div>
		<div>
			<input name="name" id="c_name" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>name</wa:mls></label>
		</div>
		<div>
			<input name="position" id="c_position" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>position</wa:mls></label>
		</div>
		<div>
			<input name="createdOn" id="c_createdOn" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>createdOn</wa:mls></label>
		</div>
		<div>
			<input name="fromDate" id="c_fromDate" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>fromDate</wa:mls></label>
		</div>
		<div>
			<input name="toDate" id="c_toDate" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>toDate</wa:mls></label>
		</div>
		<div>
			<input name="visible" id="c_visible" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>visible</wa:mls></label>
		</div>
		<div>
			<input name="status" id="c_status" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>status</wa:mls></label>
		</div>
		<div>
			<input name="group" id="c_group" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>group</wa:mls></label>
		</div>
		<div>
			<input name="publishContent" id="c_publishContent" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>publishContent</wa:mls></label>
		</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='contentBodyId';

document.searchForm.s_group.id='s_group';
$('s_group').addEvent('change',function(){
	document.searchForm.submit();
});
</script>
<script>
contentType='ContentBody';
</script>
<script type="text/javascript" src="${static}/${site}/js/actionsNltContent.js"></script>
