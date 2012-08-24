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
		<a href="javascript:void(0);" id="delete_btn"><wa:mls>delete</wa:mls></a>
		<a href="javascript:void(0);" id="edit_btn"><wa:mls>edit</wa:mls></a>
		
		<c:if test="${legend != null}">
			<a href="javascript:void(0);" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
		</c:if>
		
		<a href="javascript:void(0);" id="validate_btn"><wa:mls>validate</wa:mls></a>
		<a href="javascript:void(0);" id="reject_btn"><wa:mls>refuse</wa:mls></a>
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
					<label for="s_contentForumId"><wa:mls>ContentForumId</wa:mls></label>
					<input name="s_contentForumId" type="text" <c:choose><c:when test="${waParam.s_contentForumId!=null}">value="${waParam.s_contentForumId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_tree_contentForumId"><wa:mls>TreeId</wa:mls></label>					
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.cms.hdata.ContentForum" />
						<wa:param name="manager" value="com.wanabe.cms.manager.ContentForumManager" />
						<wa:param name="method" value="listAllFather" />
						<wa:param name="identity" value="contentForumId" />
						<wa:param name="display" value="title" />
						<wa:param name="name" value="s_tree_contentForumId" />
						<wa:param name="selectedValues" value="${waParam.s_tree_contentForumId}" />
						<wa:param name="choiceMsg" value="Choose" />
					</wa:include>
				</div>
				<div>
					<label for="s_culture"><wa:mls>Culture</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropListCulture">
							<wa:param name="name" value="s_culture" />
							<wa:param name="choiceMsg" value="Choose the culture" />
							<wa:param name="selectedValues" value="${waParam.s_culture}" />
					</wa:include>
				</div>
				<!-- 
				<div>
					<label for="s_name"><wa:mls>Name</wa:mls></label>
					<input name="s_name" type="text" <c:choose><c:when test="${waParam.s_name!=null}">value="${waParam.s_name}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>  -->
				<div>
					<label for="s_title"><wa:mls>Title</wa:mls></label>
					<input name="s_title" type="text" <c:choose><c:when test="${waParam.s_title!=null}">value="${waParam.s_title}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				
				<div>
					<label for="s_contentArticle_title"><wa:mls>Content Article Title</wa:mls></label>
					<input name="s_contentArticle_title" type="text" <c:choose><c:when test="${waParam.s_contentArticle_title!=null}">value="${waParam.s_contentArticle_title}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_contentArticle_contentArticleId"><wa:mls>ContentArticleId</wa:mls></label>
					<input name="s_contentArticle_contentArticleId" type="text" <c:choose><c:when test="${waParam.s_contentArticle_contentArticleId!=null}">value="${waParam.s_contentArticle_contentArticleId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_visible"><wa:mls>Visible</wa:mls></label>
					<input type="radio" value="0" name="s_visible" <c:if test="${waParam.s_visible=='0'}">checked="checked"</c:if>/>No
					<input type="radio" value="1" name="s_visible" <c:if test="${waParam.s_visible=='1'}">checked="checked"</c:if>/>Yes
				</div>
				<div>
					<label for="s_visible"><wa:mls>Selected</wa:mls></label>
					<input type="radio" value="0" name="s_selected" <c:if test="${waParam.s_selected=='0'}">checked="checked"</c:if>/>No
					<input type="radio" value="1" name="s_selected" <c:if test="${waParam.s_selected=='1'}">checked="checked"</c:if>/>Yes
				</div>
				<div>
					<label for="s_status"><wa:mls>status</wa:mls></label>
					<input type="checkbox"<c:if test="${wa:contain(waParams.s_status,'0')}"> checked="checked"</c:if> value="0" name="s_status"/><wa:mls>Refused</wa:mls>
					<input type="checkbox"<c:if test="${wa:contain(waParams.s_status,'1')}"> checked="checked"</c:if> value="1" name="s_status"/><wa:mls>Waiting</wa:mls>
					<input type="checkbox"<c:if test="${wa:contain(waParams.s_status,'2')}"> checked="checked"</c:if> value="2" name="s_status"/><wa:mls>Accepted</wa:mls>
				</div>
				<div>
					<label for="s_author"><wa:mls>Author</wa:mls></label>
					<input name="s_author" type="text" <c:choose><c:when test="${waParam.s_author!=null}">value="${waParam.s_author}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_createdOn"><wa:mls>Created on</wa:mls></label>
					<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnStart" name="s_createdOnStart" value="${waParam.s_createdOnStart}" maxlength="10" /></p>
					<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnEnd" name="s_createdOnEnd" value="${waParam.s_createdOnEnd}" maxlength="10" /></p>
				</div>
				<div>
					<label for="s_body"><wa:mls>Body</wa:mls></label>
					<input name="s_body" type="text" <c:choose><c:when test="${waParam.s_body!=null}">value="${waParam.s_body}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_group"><wa:mls>Group</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.cms.hdata.ContentGroup" />
						<wa:param name="manager" value="com.wanabe.cms.manager.ContentGroupManager" />
						<wa:param name="method" value="listByTypeContentForum" />
						<wa:param name="identity" value="name" />
						<wa:param name="display" value="name" />
						<wa:param name="name" value="s_group" />
						<wa:param name="choiceMsg" value="Choose the Group" />
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
<h2><wa:mls>ContentForum</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
					<td class="center status" />
					<td class="center checkbox">
						<input type="checkbox" id="checkboxAll"/>
					</td>	
					<td class="center contentForumId">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>ContentForumId</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="contentForumId" />
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
					<!--  
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
					</td> -->
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
					<td class="left group">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>Group</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="group" />
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
					<td class="left contentArticle_contentArticleId">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>ContentArticleId</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="contentArticle.contentArticleId" />
						</wa:link>			
					</td>
					<td class="center visible">
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
					<td class="center selected">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>Selected</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="selected" />
						</wa:link>			
					</td>
					<td class="left author">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>Author</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="author" />
						</wa:link>			
					</td>
					<td class="left body">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>Body</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="body" />
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
								
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">	
					<td 
						<c:if test="${item.status=='2'}">class="greenStatus"</c:if>
						<c:if test="${item.status=='1'}">class="orangeStatus"</c:if>
						<c:if test="${item.status=='0'}">class="redStatus"</c:if>
					>&nbsp;</td>		
					<td class="center checkbox"><input type="checkbox" value="${item.contentForumId}"></td>
					<td class="center contentForumId"><a href="${context}/${site}/contentForum/editItem/id/${item.contentForumId}.do" title="<wa:mls>Edit id</wa:mls>">${item.contentForumId}</a></td>
					<td class="left culture">${item.culture}&nbsp;</td>
					<!-- <td class="left name">${item.name}&nbsp;</td>  -->
					<td class="left title">${item.title}&nbsp;</td>
					<td class="left group">${item.group}&nbsp;</td>
					<td class="center status">${item.status}&nbsp;</td>
					<td class="left contentArticle_contentArticleId">
						<wa:include URI="${site}/contentLinkPropertyvalueContent/lookup">
							<wa:param name="id" value="${item.contentArticle.contentArticleId}"/>
							<wa:param name="type" value="article"/>
						</wa:include> 
						<c:if test="${item.contentArticle.contentArticleId!=null}">(${item.contentArticle.contentArticleId})</c:if>
					</td>
					
					<td class="center visible"><c:if test="${item.visible=='1'}">X&nbsp;</c:if></td>
					<td class="center selected"><c:if test="${item.selected==true}">X&nbsp;</c:if></td>
					<td class="left author">
						<wa:include URI="${site}/user/lookup">
							<wa:param name="login" value="${item.createdBy}"/>
						</wa:include>
					</td>
					<td class="left body">${item.body}</td>
					<td class="center createdOn"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.createdOn}"/>&nbsp;</td>
			
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
		<input name="contentForumId" id="c_contentForumId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>ContentForumId</wa:mls></label>
	</div>
	<div>
		<input name="culture" id="c_culture" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Culture</wa:mls></label>
	</div>
	<!--
	<div>
		<input name="name" id="c_name" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Name</wa:mls></label>
	</div>   -->
	<div>
		<input name="title" id="c_title" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Title</wa:mls></label>
	</div>
	<div>
		<input name="group" id="c_group" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Group</wa:mls></label>
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
		<input name="author" id="c_author" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Author</wa:mls></label>
	</div>
	<div>
		<input name="body" id="c_body" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Body</wa:mls></label>
	</div>
	<div>
		<input name="createdOn" id="c_createdOn" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>CreatedOn</wa:mls></label>
	</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='contentBodyId';
</script>

<script type="text/javascript">
<!--
function admin_validate(){
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
	var cfrm=confirm('Do you want to validate this elements : '+id);
	if (cfrm==true){
		this.href=path+'/validateItems/items/'+id+'.do';
	}
}

function admin_reject(){
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
	var cfrm=confirm('Do you want to reject this elements : '+id);
	if (cfrm==true){
		this.href=path+'/rejectItems/items/'+id+'.do';
	}
}

btn = $('validate_btn');
if(btn!=null){
	btn.addClass('atLeastOne');
	btn.href="#";
	btn.addEvent('click',admin_validate)
}

btn = $('reject_btn');
if(btn!=null){
	btn.addClass('atLeastOne');
	btn.href="#";
	btn.addEvent('click',admin_reject)
}

document.searchForm.s_group.id='s_group';
$('s_group').addEvent('change',function(){
	document.searchForm.submit();
});
//-->
</script>