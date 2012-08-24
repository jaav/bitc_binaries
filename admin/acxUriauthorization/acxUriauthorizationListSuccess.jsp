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
		<a href="javascript:void(0);" id="duplicate_btn"><wa:mls>duplicate</wa:mls></a>
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
					<label for="s_id"><wa:mls>id</wa:mls></label>
					<input name="s_id" type="text" <c:choose><c:when test="${waParam.s_id!=null}">value="${waParam.s_id}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_uri"><wa:mls>uri</wa:mls></label>
					<input name="s_uri" type="text" <c:choose><c:when test="${waParam.s_uri!=null}">value="${waParam.s_uri}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_ressource"><wa:mls>ressource</wa:mls></label>	
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.core.security.AcxRessource" />
						<wa:param name="manager" value="com.wanabe.core.security.manager.AcxRessourceManager" />
						<wa:param name="identity" value="ressource" />
						<wa:param name="display" value="ressource" />
						<wa:param name="name" value="s_ressource" />
						<wa:param name="selectedValues" value="${waParam.s_ressource}"/>
					</wa:include>
				</div> 
				<div>
					<label for="s_right"><wa:mls>right</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.core.security.AcxRight" />
						<wa:param name="manager" value="com.wanabe.core.security.manager.AcxRightManager" />
						<wa:param name="identity" value="right" />
						<wa:param name="display" value="right" />
						<wa:param name="name" value="s_right" />
						<wa:param name="selectedValues" value="${waParam.s_right}"/>
					</wa:include>
				</div> 
				<div>
					<label for="s_loginpage"><wa:mls>loginpage</wa:mls></label>
					<input name="s_loginpage" type="text" <c:choose><c:when test="${waParam.s_loginpage!=null}">value="${waParam.s_loginpage}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_accessDeniedPage"><wa:mls>Access denied page</wa:mls></label>
					<input name="s_accessDeniedPage" type="text" <c:choose><c:when test="${waParam.s_accessDeniedPage!=null}">value="${waParam.s_accessDeniedPage}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				
	
				<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
			</form>
		</div>
	</div>
<!--searchBox:end-->
</div>
<!--floatLeft:end-->
<h2><wa:mls>acxUriauthorization</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
					<td class="center checkbox">
						<input type="checkbox" id="checkboxAll"/>
					</td>
					<td class="center id">
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
					<td class="left uri">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>uri</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="uri" />
						</wa:link>			
					</td>
					<td class="left ressource">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>ressource</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="ressource" />
						</wa:link>			
					</td>
					<td class="left right_">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>right</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="right" />
						</wa:link>			
					</td>
					<td class="left loginpage">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>loginpage</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="loginpage" />
						</wa:link>			
					</td>
					<td class="left accessDeniedPage">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>AccessDeniedPage</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="accessDeniedPage" />
						</wa:link>			
					</td>
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">
					<td class="center checkbox"><input type="checkbox" value="${item.id}"></td>
					<td class="center id"><a href="${context}/${site}/acxUriauthorization/editItem/id/${item.id}.do" title="<wa:mls>Edit id</wa:mls>">${item.id}</a></td>
					<td class="left uri">${item.uri}&nbsp;</td>
					<td class="left ressource">${item.ressource}&nbsp;</td>
					<td class="left right_">${item.right}&nbsp;</td>
					<td class="left loginpage">${item.loginpage}&nbsp;</td>
					<td class="left accessDeniedPage">${item.accessDeniedPage}&nbsp;</td>
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
			<input name="uri" id="c_uri" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>uri</wa:mls></label>
		</div>
		<div>
			<input name="ressource" id="c_ressource" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>ressource</wa:mls></label>
		</div>
		<div>
			<input name="right" id="c_right" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>right</wa:mls></label>
		</div>
		<div>
			<input name="loginpage" id="c_loginpage" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>loginpage</wa:mls></label>
		</div>
		<div>
			<input name="accessDeniedPage" id="c_accessDeniedPage" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>AccessDeniedPage</wa:mls></label>
		</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='id';
</script>