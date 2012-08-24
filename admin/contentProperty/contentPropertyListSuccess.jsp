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
					<label for="s_propertyid"><wa:mls>Property ID</wa:mls></label>
					<input name="s_propertyid" type="text" <c:choose><c:when test="${waParam.s_propertyid!=null}">value="${waParam.s_propertyid}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_name"><wa:mls>Name</wa:mls></label>
					<input name="s_name" type="text" <c:choose><c:when test="${waParam.s_name!=null}">value="${waParam.s_name}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_type"><wa:mls>Type</wa:mls></label>
					<select name="s_type">
						<option value="">...</option>
						<option value="FREE" 	<c:if test="${'FREE'==waParam.s_type}">selected="selected"		</c:if>>FREE</option>
						<option value="CLOSED" 	<c:if test="${'CLOSED'==waParam.s_type}">selected="selected"	</c:if>>CLOSED</option>
						<option value="OPEN" 	<c:if test="${'OPEN'==waParam.s_type}">selected="selected"		</c:if>>OPEN</option>
						<option value="DB" 	<c:if test="${'DB'==waParam.s_type}">selected="selected"		</c:if>>DB</option>
					</select>
				</div>
				<div>
					<label for="s_multivalue"><wa:mls>Multivalued</wa:mls></label>
					<select name="s_multivalue">
						<option value="">Choose</option>
						<option value="1" <c:if test="${waParam.s_multivalue==1}">selected="selected"</c:if>>YES</option>
						<option value="0" <c:if test="${!empty waParam.s_multivalue && waParam.s_multivalue==0}">selected="selected"</c:if>>NO</option>
					</select>
				</div>
				<div>
					<label for="s_tree"><wa:mls>Tree</wa:mls></label>
					<select name="s_tree">
						<option value="">Choose</option>
						<option value="1" <c:if test="${waParam.s_tree==1}">selected="selected"</c:if>>YES</option>
						<option value="0" <c:if test="${!empty waParam.s_tree && waParam.s_tree==0}">selected="selected"</c:if>>NO</option>
					</select>
				</div>
				<div>
					<label for="s_groupId"><wa:mls>group</wa:mls></label>	
					<wa:include URI="${site}/dropdown/dropList">
							<wa:param name="class" value="com.wanabe.cms.hdata.ContentGroup" />
							<wa:param name="manager" value="com.wanabe.cms.manager.ContentGroupManager" />
							<wa:param name="method" value="listAll" />
							<wa:param name="identity" value="groupid" />
							<wa:param name="display" value="name" />
							<wa:param name="name" value="s_groupId" />
							<wa:param name="selectedValues" value="${waParam.s_groupId}" />
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
<h2><wa:mls>ContentProperty</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
				<td class="center propertyid">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>Property ID</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="propertyid" />
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
					<td class="center type">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>Type</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="type" />
						</wa:link>			
					</td>
					<td class="center multivalue">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>Multivalued</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="multivalue" />
						</wa:link>			
					</td>
					<td class="center tree">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>Tree</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="tree" />
						</wa:link>			
					</td>
					<td class="center action">
						<wa:mls>Actions</wa:mls>
					</td>
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">
					<td class="center checkbox"><input type="checkbox" value="${item.propertyid}"></td>
					<td class="center propertyid"><a href="${context}/${site}/contentProperty/editItem/id/${item.propertyid}.do" title="<wa:mls>Edit name</wa:mls>">${item.propertyid}</a></td>
					<td class="left name">${item.name}&nbsp;</td>
					<td class="center type">${item.type}&nbsp;</td>
					<td class="center multivalue">${item.multivalue}&nbsp;</td>
					<td class="center tree">${item.tree}&nbsp;</td>
					<td class="left action">
						<c:if test="${item.type != 'FREE' && item.type != 'DB'}">
							<a href="${context}/${site}/contentPropertyValue/contentPropertyValueList.do?s_contentProperty_propertyid=${item.propertyid}&s_submit=filtre"><wa:mls>Show Values</wa:mls></a>  
						</c:if>
						&nbsp;
						<c:if test="${item.tree}">
							<a href="${context}/${site}/contentPropertyValue/root/id/${item.propertyid}.do"><wa:mls>Root</wa:mls></a>  
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
<!--content:end-->

<!--wrapper:end-->


<div id="fieldList">
		<div>
			<input name="propertyid" id="c_propertyid" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>Property ID</wa:mls></label>
		</div>
		<div>
			<input name="name" id="c_name" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>Name</wa:mls></label>
		</div>
		<div>
			<input name="type" id="c_type" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>Type</wa:mls></label>
		</div>
		
		<div>
			<input name="multivalue" id="c_multivalue" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>Multivalue</wa:mls></label>
		</div>
		
		<div>
			<input name="tree" id="c_tree" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>Tree</wa:mls></label>
		</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='name';
</script>