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
		<a href="javascript:void(0);" id="duplicate_btn"><wa:mls>duplicate</wa:mls></a>
		<a href="javascript:void(0);" id="delete_btn"><wa:mls>delete</wa:mls></a>
		<a href="javascript:void(0);" id="edit_btn"><wa:mls>edit</wa:mls></a>
		<a href="javascript:void(0);" id="publish_btn"><wa:mls>publish</wa:mls></a>
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
					<label for="s_eventId"><wa:mls>EventId</wa:mls></label>
					<input name="s_eventId" type="text" <c:choose><c:when test="${waParam.s_eventId!=null}">value="${waParam.s_eventId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_status"><wa:mls>status</wa:mls></label>
					<br />
					<input type="checkbox"<c:if test="${wa:contain(waParams.s_status,'0')}"> checked="checked"</c:if> value="0" name="s_status"/><wa:mls>DRAFT</wa:mls>
					<input type="checkbox"<c:if test="${wa:contain(waParams.s_status,'1')}"> checked="checked"</c:if> value="1" name="s_status"/><wa:mls>PUBLISHED</wa:mls>
					<br />
					<input type="checkbox"<c:if test="${wa:contain(waParams.s_status,'2')}"> checked="checked"</c:if> value="2" name="s_status"/><wa:mls>ARCHIVED</wa:mls>
					<input type="checkbox"<c:if test="${wa:contain(waParams.s_status,'3')}"> checked="checked"</c:if> value="3" name="s_status"/><wa:mls>DELETED</wa:mls>
				</div>
				<div>
					<label for="s_visible"><wa:mls>visible</wa:mls></label>
					<input type="radio"<c:if test="${waParam.s_visible=='0'}"> checked="checked"</c:if> value="0" name="s_visible"/><wa:mls>0</wa:mls>
					<input type="radio"<c:if test="${waParam.s_visible=='1'}"> checked="checked"</c:if> value="1" name="s_visible"/><wa:mls>1</wa:mls>
				</div>
				<div>
					<label for="s_culture"><wa:mls>Culture</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropListCulture">
							<wa:param name="name" value="s_culture" />
							<wa:param name="choiceMsg" value="Select the culture" />
							<wa:param name="selectedValues" value="${waParam.s_culture}" />
					</wa:include>
				</div>
				<div>
					<label for="s_title"><wa:mls>Title</wa:mls></label>
					<input name="s_title" type="text" <c:choose><c:when test="${waParam.s_title!=null}">value="${waParam.s_title}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>	
				<div>
					<label for="s_place"><wa:mls>Place</wa:mls></label>
					<input name="s_place" type="text" <c:choose><c:when test="${waParam.s_place!=null}">value="${waParam.s_place}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>									
				<div>
					<label for="s_periodFromDate"><wa:mls>PeriodFromDate</wa:mls></label>
					<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_periodFromDateStart" name="s_periodFromDateStart" value="${waParam.s_periodFromDateStart}" maxlength="10" /></p>
					<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_periodFromDateEnd" name="s_periodFromDateEnd" value="${waParam.s_periodFromDateEnd}" maxlength="10" /></p>
				</div>
				<div>
					<label for="s_periodToDate"><wa:mls>PeriodToDate</wa:mls></label>
					<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_periodToDateStart" name="s_periodToDateStart" value="${waParam.s_periodToDateStart}" maxlength="10" /></p>
					<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_periodToDateEnd" name="s_periodToDateEnd" value="${waParam.s_periodToDateEnd}" maxlength="10" /></p>
				</div>
				<div>
					<label for="s_eventCategoryByEventCategoryId_eventCategoryId"><wa:mls>EventCategory</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.event.hdata.EventCategory" />
						<wa:param name="manager" value="com.wanabe.event.hdata.manager.EventCategoryManager" />
						<wa:param name="method" value="listNotMain" />
						<wa:param name="identity" value="eventCategoryId" />
						<wa:param name="display" value="name" />
						<wa:param name="name" value="s_eventCategoryByEventCategoryId_eventCategoryId" />
						<wa:param name="selectedValues" value="${waParam.s_eventCategoryByEventCategoryId_eventCategoryId}" />
						<wa:param name="choiceMsg" value="Choose" />
					</wa:include>
				</div>
				<div>
					<label for="s_eventType"><wa:mls>EventType</wa:mls></label>
					<select name="s_eventType">
						<option value="">Choose</option>
						<option value="EVENT" <c:if test="${waParam.s_eventType eq 'EVENT'}">selected="selected"</c:if>>EVENT</option>
						<option value="WORKSHOP" <c:if test="${waParam.s_eventType eq 'WORKSHOP'}">selected="selected"</c:if>>WORKSHOP</option>												
					</select>
				</div>
				<div>
					<label for="s_publishedEvent_eventId"><wa:mls>publishedEvent</wa:mls></label>
					<input name="s_publishedEvent_eventId" type="text" <c:choose><c:when test="${waParam.s_publishedEvent_eventId!=null}">value="${waParam.s_publishedEvent_eventId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>					
				<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
			</form>
		</div>
	</div>
<!--searchBox:end-->
</div>
<!--floatLeft:end-->
<h2><wa:mls>Event</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing="0" cellpadding="0">
			<tr class="header">
				<td></td>				
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
				<td class="center eventId">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>EventId</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="eventId" />
					</wa:link>			
				</td>
				<td class="left status">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Status</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="status" />
					</wa:link>			
				</td>
				<td class="left visible">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Visible</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="visible" />
					</wa:link>			
				</td>
				<td class="left culture">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Culture</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="culture" />
					</wa:link>			
				</td>
				<td class="left title">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Title</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="title" />
					</wa:link>			
				</td>
				<td class="left place">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Place</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="place" />
					</wa:link>			
				</td>				
				<td class="center periodFromDate">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>PeriodFromDate</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="periodFromDate" />
					</wa:link>			
				</td>				
				<td class="center periodToDate">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>PeriodToDate</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="periodToDate" />
					</wa:link>			
				</td>							
				<td class="center eventCategory_name">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>EventCategory Name</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="eventCategoryByEventCategoryId_name" />
					</wa:link>			
				</td>
				<td class="left eventType">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>EventType</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="eventType" />
					</wa:link>			
				</td>
				<td class="center publishedEvent">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>publishedEvent</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="publishedEvent" />
					</wa:link>			
				</td>		
					<td class="center Preview">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>Preview</wa:mls>
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
					<td class="center checkbox"><input type="checkbox" value="${item.eventId}"></td>
					<td class="center userId"><a href="${context}/${site}/${module}/editItem/id/${item.eventId}.do" title="<wa:mls>Edit id</wa:mls>">${item.eventId}</a></td>
					<td class="center status"> 
						<c:if test="${item.status == 0}">DRAFT</c:if>
						<c:if test="${item.status == 1}">PUBLISHED</c:if>
						<c:if test="${item.status == 2}">ARCHIVED ${item.versionId}</c:if>
						<c:if test="${item.status == 3}">DELETED</c:if>
					</td>
					<td class="left visible">${item.visible}</td>
					<td class="left culture">${item.culture}</td>
					<td class="left title">${item.title}</td>
					<td class="left title">${item.place}</td>
					<td class="center periodFromDate">${item.periodFromDate}</td>
					<td class="center periodToDate">${item.periodToDate}</td>
					<td class="center eventCategory_name">${item.eventCategoryByEventCategoryId.name}</td>
					<td class="center eventType">${item.eventType}</td>
					<td class="center publishContent">
							${item.publishContent.id}
					</td>
					<td class="center publishContent">
					<c:if test="${item.status == 0 || item.status == 1}">
							<a href="${context}/front/content/displayDetail/group/${item.group}/id/${item.publishContent.id}.do" target="site"><wa:mls>Preview</wa:mls></a>
						</c:if>
					</td>
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

<div id="fieldList">
	<div>
		<input name="eventId" id="c_eventId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>EventId</wa:mls></label>
	</div>
	<div>
		<input name="status" id="c_status" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Status</wa:mls></label>
	</div>
	<div>
		<input name="visible" id="c_visible" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Visible</wa:mls></label>
	</div>
	<div>
		<input name="culture" id="c_culture" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Culture</wa:mls></label>
	</div>
	<div>
		<input name="title" id="c_title" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Title</wa:mls></label>
	</div>
	<div>
		<input name="place" id="c_place" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Place</wa:mls></label>
	</div>					
	<div>
		<input name="periodFromDate" id="c_periodFromDate" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>PeriodFromDate</wa:mls></label>
	</div>
	<div>
		<input name="periodToDate" id="c_periodToDate" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>PeriodToDate</wa:mls></label>
	</div>	
	<div>
		<input name="eventCategory_name" id="c_eventCategory_name" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>EventCategory Name</wa:mls></label>
	</div>		
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='eventId';
</script>