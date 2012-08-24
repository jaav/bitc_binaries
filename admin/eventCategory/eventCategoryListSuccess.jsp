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
					<label for="s_eventCategoryId"><wa:mls>EventCategoryId</wa:mls></label>
					<input name="s_eventCategoryId" type="text" <c:choose><c:when test="${waParam.s_eventCategoryId!=null}">value="${waParam.s_eventCategoryId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_eventCategoryAlert_name"><wa:mls>Category</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.event.hdata.EventCategoryAlert" />
						<wa:param name="manager" value="com.wanabe.event.hdata.manager.EventCategoryAlertManager" />
						<wa:param name="method" value="listAll" />
						<wa:param name="identity" value="name" />
						<wa:param name="display" value="name" />
						<wa:param name="name" value="s_eventCategoryAlert_name" />
						<wa:param name="selectedValues" value="${waParam.s_eventCategoryAlert_name}" />
						<wa:param name="choiceMsg" value="Choose" />
					</wa:include>
				</div>
				<div>
					<label for="s_name"><wa:mls>Name</wa:mls></label>
					<input name="s_name" type="text" <c:choose><c:when test="${waParam.s_name!=null}">value="${waParam.s_name}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
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
					<label for="s_mainCategory"><wa:mls>MainCategory</wa:mls></label>
					<input type="radio"<c:if test="${waParam.s_mainCategory==false}"> checked="checked"</c:if> value="false" name="s_mainCategory"/><wa:mls>false</wa:mls>
					<input type="radio"<c:if test="${waParam.s_mainCategory==true}"> checked="checked"</c:if> value="true" name="s_mainCategory"/><wa:mls>true</wa:mls>
				</div>					
				<div>
					<label for="s_createdOn"><wa:mls>Created on</wa:mls></label>
					<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnStart" name="s_createdOnStart" value="${waParam.s_createdOnStart}" maxlength="10" /></p>
					<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnEnd" name="s_createdOnEnd" value="${waParam.s_createdOnEnd}" maxlength="10" /></p>
				</div>
					
				<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
			</form>
		</div>
	</div>
<!--searchBox:end-->
</div>
<!--floatLeft:end-->
<h2><wa:mls>EventCategory</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing="0" cellpadding="0">
			<tr class="header">				
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
				<td class="center eventCategoryId">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>EventCategoryId</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="eventCategoryId" />
					</wa:link>			
				</td>
				<td class="left eventCategoryAlert_name">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Category</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="eventCategoryAlert_name" />
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
				<td class="left mainCategory">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>MainCategory</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="mainCategory" />
					</wa:link>			
				</td>				
				<td class="center createdOn">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Created on</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="createdOn" />
					</wa:link>			
				</td>
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">					
					<td class="center checkbox"><input type="checkbox" value="${item.eventCategoryId}"></td>
					<td class="center userId"><a href="${context}/${site}/${module}/editItem/id/${item.eventCategoryId}.do" title="<wa:mls>Edit id</wa:mls>">${item.eventCategoryId}</a></td>
					<td class="left category">${item.category}</td>
					<td class="left name">${item.name}</td>
					<td class="left culture">${item.culture}</td>
					<td class="left mainCategory">${item.mainCategory}</td>
					<td class="center createdOn">${item.createdOn}</td>
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
		<input name="eventCategoryId" id="c_eventCategoryId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>EventCategoryId</wa:mls></label>
	</div>
	<div>
		<input name="category" id="c_eventCategoryAlert_name" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Category</wa:mls></label>
	</div>
	<div>
		<input name="name" id="c_name" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Name</wa:mls></label>
	</div>
	<div>
		<input name="culture" id="c_culture" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Culture</wa:mls></label>
	</div>			
	<div>
		<input name="mainCategory" id="c_mainCategory" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>MainCategory</wa:mls></label>
	</div>	
	<div>
		<input name="createdOn" id="c_createdOn" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Created on</wa:mls></label>
	</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='eventCategoryId';
</script>