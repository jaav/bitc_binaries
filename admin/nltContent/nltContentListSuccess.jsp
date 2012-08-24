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
		<a href="javascript:void(0);" id="edit_btn"><wa:mls>edit</wa:mls></a>
		<a href="javascript:void(0);" id="export_btn"><wa:mls>export</wa:mls></a>
		<a href="javascript:void(0);" id="deleteAll_btn" class="allways"><wa:mls>delete All</wa:mls></a>
		<!-- <a href="javascript:void(0);" id="setSmallVersion_btn"><wa:mls>setSmallVersion</wa:mls></a>
		<a href="javascript:void(0);" id="setNonSmallVersion_btn"><wa:mls>setNonSmallVersion</wa:mls></a>
		 -->
		<a href="javascript:void(0);" id="createSmallTemplate_btn"><wa:mls>createSmallTemplate</wa:mls></a>
		<a href="javascript:void(0);" id="createBigTemplate_btn"><wa:mls>createBigTemplate</wa:mls></a>
		<a href="javascript:void(0);" id="setNonSmallVersion_btn"><wa:mls>setNonSmallVersion</wa:mls></a>
		<!-- <a href="javascript:void(0);" id="createHtmlTemplate_btn" class="allways"><wa:mls>create html template</wa:mls></a> 
		<a href="javascript:void(0);" id="createTextTemplate_btn" class="allways"><wa:mls>create text template</wa:mls></a>-->
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
					<label for="s_nltContentId"><wa:mls>nlt content ID</wa:mls></label>
					<input name="s_nltContentId" type="text" <c:choose><c:when test="${waParam.s_nltContentId!=null}">value="${waParam.s_nltContentId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_contentType"><wa:mls>contentType</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.cms.hdata.ContentGroupType" />
						<wa:param name="manager" value="com.wanabe.cms.manager.ContentGroupTypeManager" />
						<wa:param name="identity" value="name" />
						<wa:param name="display" value="name" />
						<wa:param name="name" value="s_contentType" />
						<wa:param name="selectedValues" value="${waParam.s_contentType}" />
					</wa:include>	
				</div>
				<div>
					<label for="s_contentId"><wa:mls>contentId</wa:mls></label>
					<input name="s_contentId" type="text" <c:choose><c:when test="${waParam.s_contentId!=null}">value="${waParam.s_contentId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_title"><wa:mls>title</wa:mls></label>
					<input name="s_title" type="text" <c:choose><c:when test="${waParam.s_title!=null}">value="${waParam.s_title}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>	
				<div>
					<label for="s_culture"><wa:mls>culture</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropListCulture">
						<wa:param name="name" value="s_culture" />
						<wa:param name="choiceMsg" value="Choose the Culture" />
						<wa:param name="selectedValues" value="${waParam.s_culture}" />
					</wa:include>
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
<h2><wa:mls>Nlt Content</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
				<td class="center nltContentId">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>nltContentId</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="nltContentId" />
					</wa:link>			
				</td>
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
				<td class="left contentId">
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
				<td class="left title">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>title</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="title" />
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
				<td class="center smallVersion">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>smallVersion</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="smallVersion" />
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
					<td class="center checkbox"><input type="checkbox" value="${item.nltContentId}"></td>
					<td class="center nltContentId"><a href="${context}/${site}/nltContent/editItem/id/${item.nltContentId}.do" title="<wa:mls>Edit id</wa:mls>">${item.nltContentId}</a></td>
					<td class="left contentType">${item.contentType}</td>
					<td class="left contentId">${item.contentId}</td>
					<td class="left title">${item.title}</td>
					<td class="center culture">${item.culture}</td>
					<td class="center smallVersion">${item.smallVersion}</td>
					<td class="center createdOn"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.createdOn}"/></td>
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
		<input name="nltContentId" id="c_nltContentId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>nltContentId</wa:mls></label>
	</div>
	<div>
		<input name="contentType" id="c_contentType" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>contentType</wa:mls></label>
	</div>
	<div>
		<input name="gender" id="c_gender" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Gender</wa:mls></label>
	</div>
	<div>
		<input name="contentId" id="c_contentId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>contentId</wa:mls></label>
	</div>
	<div>
		<input name="title" id="c_title" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>title</wa:mls></label>
	</div>	
	<div>
		<input name="culture" id="c_culture" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Culture</wa:mls></label>
	</div>	
	<div>
		<input name="createdOn" id="c_createdOn" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Created on</wa:mls></label>
	</div>
	
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='nltContentId';
</script>
<script>
function admin_createHtmlTemplate(){
	var checks = $$('#mask input[type="checkbox"]');
	var id = "";
	var count = 0;
	for(i=0;i<checks.length;i++ ){
		if(checks[i].checked){
			if(count > 0)
				id += ',';
			id += checks[i].value;
			count++;
		}
	}
	var cfrm=confirm('Do you want to add this/these elements to nltContent ? : '+id);
	if (cfrm==true){
		location.href='${context}/${site}/${module}/createTemplate/items/'+id+'.do';
	}
}
function admin_createTextTemplate(){

	var cfrm=confirm('Are you sure you want to create text template ?');
	if (cfrm==true){
		location.href='${context}/${site}/${module}/createTemplateText.do';
	}
}
function admin_deleteAll(){

	var cfrm=confirm('Are you sure you want to delete all Elements ?');
	if (cfrm==true){
		location.href='${context}/${site}/${module}/deleteAll.do';
	}
}
/*function admin_setSmallVersion(){
	var checks = $$('#mask input[type="checkbox"]');
	var id = "";
	var count = 0;
	for(i=0;i<checks.length;i++ ){
		if(checks[i].checked){
			if(count > 0)
				id += ',';
			id += checks[i].value;
			count++;
		}
	}
	var cfrm=confirm('Do you want to add this/these elements to nltContent ? : '+id);
	if (cfrm==true){
		location.href='${context}/${site}/${module}/setSmallVersionToList/items/'+id+'.do';
	}
}
function admin_setNonSmallVersion(){
	var checks = $$('#mask input[type="checkbox"]');
	var id = "";
	var count = 0;
	for(i=0;i<checks.length;i++ ){
		if(checks[i].checked){
			if(count > 0)
				id += ',';
			id += checks[i].value;
			count++;
		}
	}
	var cfrm=confirm('Do you want to add this/these elements to nltContent ? : '+id);
	if (cfrm==true){
		location.href='${context}/${site}/${module}/setNonSmallVersionToList/items/'+id+'.do';
	}
}

btn = $('setSmallVersion_btn');
if(btn!=null){
	btn.addClass('atLeastOne');
	btn.href="#";
	btn.addEvent('click',admin_setSmallVersion)
}
btn = $('setNonSmallVersion_btn');
if(btn!=null){
	btn.addClass('atLeastOne');
	btn.href="#";
	btn.addEvent('click',admin_setNonSmallVersion)
}*/
function admin_createSmallTemplate(){
	var checks = $$('#mask input[type="checkbox"]');
	var id = "";
	var count = 0;
	for(i=0;i<checks.length;i++ ){
		if(checks[i].checked){
			if(count > 0)
				id += ',';
			id += checks[i].value;
			count++;
		}
	}
	var cfrm=confirm('Are you sure you want to create a small  template ? : '+id);
	if (cfrm==true){
		location.href='${context}/${site}/${module}/createTemplate/type/Small/items/'+id+'.do';
	}
}
function admin_createBigTemplate(){
	var checks = $$('#mask input[type="checkbox"]');
	var id = "";
	var count = 0;
	for(i=0;i<checks.length;i++ ){
		if(checks[i].checked){
			if(count > 0)
				id += ',';
			id += checks[i].value;
			count++;
		}
	}
	var cfrm=confirm('Are you sure you want to create a big template ? : '+id);
	if (cfrm==true){
		location.href='${context}/${site}/${module}/createTemplate/type/Big/items/'+id+'.do';
	}
}

btn = $('createSmallTemplate_btn');
if(btn!=null){
	btn.addClass('atLeastOne');
	btn.href="#";
	btn.addEvent('click',admin_createSmallTemplate)
}
btn = $('createBigTemplate_btn');
if(btn!=null){
	btn.addClass('atLeastOne');
	btn.href="#";
	btn.addEvent('click',admin_createBigTemplate)
}
btn = $('deleteAll_btn');
if(btn!=null){
	btn.href="#";
	btn.addEvent('click',admin_deleteAll)
}
btn = $('createHtmlTemplate_btn');
if(btn!=null){
	btn.href="#";
	btn.addEvent('click',admin_createHtmlTemplate)
}
btn = $('createTextTemplate_btn');
if(btn!=null){
	btn.href="#";
	btn.addEvent('click',admin_createTextTemplate)
}
</script>