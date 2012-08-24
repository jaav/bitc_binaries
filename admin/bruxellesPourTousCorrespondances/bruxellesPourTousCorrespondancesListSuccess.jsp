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
					<label for="s_id"><wa:mls>Id</wa:mls></label>
					<input name="s_id" type="text" <c:choose><c:when test="${waParam.s_id!=null}">value="${waParam.s_id}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_sourceId"><wa:mls>Bruxelles pour tous Id</wa:mls></label>
					<input name="s_sourceId" type="text" <c:choose><c:when test="${waParam.s_sourceId!=null}">value="${waParam.s_sourceId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_idContent"><wa:mls>Visitbrussels ContentId</wa:mls></label>
					<input name="s_idContent" type="text" <c:choose><c:when test="${waParam.s_idContent!=null}">value="${waParam.s_idContent}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_contentType"><wa:mls>content Type</wa:mls></label>
					<input name="s_contentType" type="text" <c:choose><c:when test="${waParam.s_contentType!=null}">value="${waParam.s_contentType}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_contentName"><wa:mls>contentName</wa:mls></label>
					<input name="s_contentName" type="text" <c:choose><c:when test="${waParam.s_contentName!=null}">value="${waParam.s_contentName}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				  
					 
				<div>
					<label for="s_createdOn"><wa:mls>createdOn</wa:mls></label>
					<p><wa:mls>from</wa:mls><input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnStart" name="s_createdOnStart" value="${waParam.s_createdOnStart}" maxlength="10" /></p>
					<p><wa:mls>to</wa:mls><input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnEnd" name="s_createdOnEnd" value="${waParam.s_createdOnEnd}" maxlength="10" /></p>
				</div>
				 
				<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
			</form>
		</div>
	</div>
<!--searchBox:end-->
</div>
<!--floatLeft:end-->
<h2><wa:mls>bruxelles Pour Tous Correspondance </wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
					<td class="center id">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>Id</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="id" />
						</wa:link>			
					</td>
					 <td class="center sourceId">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>Bruxelles pour tous Id</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="sourceId" />
						</wa:link>			
					</td>
					 <td class="center idContent">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>Visitbrussels Content Id</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="idContent" />
						</wa:link>			
					</td>
					<td class="center contentType">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls> content Type</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="contentType" />
						</wa:link>			
					</td>
					<td class="left contentName">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>content Name</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="contentName" />
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
					<td class="center checkbox"><input type="checkbox" value="${item.id}"></td>
					<td class="center id"><a href="${context}/${site}/bruxellesPourTousCorrespondances/editItem/id/${item.id}.do" title="<wa:mls>Edit id</wa:mls>">${item.id}</a></td>
					<td class="center sourceId">${item.sourceId}&nbsp;</td>
				 		<td class="center sourceId">${item.idContent}&nbsp;</td>
				 	<td class="center contentType">${item.contentType}&nbsp;</td>
					<td class="center contentName">${item.contentName}&nbsp;</td>
				
					<td class="center createdOn"><fmt:formatDate pattern="dd/MM/yyyy" value="${item.createdOn}"/>&nbsp;</td>
					 
				  
					
				 
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
		<input name="id" id="c_id" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>id</wa:mls></label>
	</div>
	<div>
		<input name="sourceId" id="c_sourceId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>source Id</wa:mls></label>
	</div>
	<div>
		<input name="idContent" id="c_idContent" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>content Id</wa:mls></label>
	</div>
	<div>
		<input name="contentName" id="c_contentName" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>content Name</wa:mls></label>
	</div>
		<div>
		<input name="contentType" id="c_contentType" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>content Type</wa:mls></label>
	</div>
	<div>
		<input name="createdOn" id="c_createdOn" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>createdOn</wa:mls></label>
	</div>
	
	 
</div>
<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
	path='${context}/${site}/${module}';
	idName='id';
 
</script>
<script type="text/javascript" >

function copyToOpener(data,target){
	if(window.opener != 'undefined' && window.opener != null){
		window.opener.document.getElementById(target).value=data;
		window.close();
	}
}
</script>