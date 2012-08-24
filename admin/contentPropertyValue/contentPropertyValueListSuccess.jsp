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
		<c:if test="${!property.tree}">
			<a href="javascript:void(0);" id="add_btn"><wa:mls>add</wa:mls></a>
			<a href="javascript:void(0);" id="delete_btn"><wa:mls>delete</wa:mls></a>
		</c:if>
		<a href="javascript:void(0);" id="edit_btn"><wa:mls>edit</wa:mls></a>
		<c:if test="${property.tree}">
			<a href="${context}/${site}/${module}/reorderMenu.do" id="reload_btn" class="allways"><wa:mls>Reorder menu</wa:mls></a>
		</c:if>
		<c:if test="${legend != null}">
			<a href="javascript:void(0);" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
		</c:if>
		<c:if test="${cutNode !=null}">
			<a href="${context}/${site}/${module}/clearCutElement.do" id="clear_cut"  class="allways"><wa:mls>Clear cut element</wa:mls></a>
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
				<input name="s_contentProperty_propertyid" type ="hidden" value="${property.propertyid}"/>
				<div>
					<label for="s_valueId"><wa:mls>valueId</wa:mls></label>
					<input name="s_valueId" type="text" <c:choose><c:when test="${waParam.s_valueId!=null}">value="${waParam.s_valueId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_name"><wa:mls>Name</wa:mls></label>
					<input name="s_name" type="text" <c:choose><c:when test="${waParam.s_name!=null}">value="${waParam.s_name}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>		
				<div>
					<label for="s_defaultTitle"><wa:mls>defaultTitle</wa:mls></label>
					<input name="s_defaultTitle" type="text" <c:choose><c:when test="${waParam.s_defaultTitle!=null}">value="${waParam.s_defaultTitle}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
			</form>
		</div>
	</div>
<!--searchBox:end-->
</div>
<!--floatLeft:end-->
<h2><wa:mls>ContentPropertyValue</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
					<td class="center valueId">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>ValueId</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="valueId" />
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
					<td class="left defaultTitle">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>defaultTitle</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="defaultTitle" />
						</wa:link>			
					</td>
					<td class="center property">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>Property</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="contentProperty.propertyid" />
						</wa:link>			
					</td>
					<td class="center pos">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>position</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="pos" />
						</wa:link>			
					</td>
					<td class="center level">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>Level</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="level" />
						</wa:link>			
					</td>
					<td class="center action">
						<wa:mls>Actions</wa:mls>
					</td>
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1} <c:if test="${item.contentProperty.tree && (item.left >= cutNode.left && item.right <= cutNode.right)}" >cut</c:if>">
					<td class="center checkbox"><input type="checkbox" value="${item.valueId}"></td>
							<td class="center valueId"><a href="${context}/${site}/${module}/editItem/id/${item.valueId}.do" title="<wa:mls>Edit id</wa:mls>">${item.valueId}</a></td>
							<td class="left name">
								<c:if test="${item.level==1}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
								<c:if test="${item.level==2}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
								<c:if test="${item.level==3}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
								<c:if test="${item.level==4}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
								${item.name}&nbsp;
							</td>
							<td class="left defaultTitle">${item.defaultTitle}</td>
							<td class="center property">${item.contentProperty.name}</td>
							<td class="center pos">${item.pos}&nbsp;</td>
							<td class="center level">${item.level}&nbsp;</td>
							<td class="left action">
								<c:if test="${item.tree != null}">  
									<a href="${context}/${site}/${module}/insertNode/nodeId/${item.valueId}<c:if test="${waParam.page!=null}">/page/${waParam.page}</c:if>.do" title="Insert child"><img src="${static}/${site}/img/ico_add.png" /></a>  
									 <a href="${context}/${site}/${module}/deleteNode/nodeId/${item.valueId}<c:if test="${waParam.page!=null}">/page/${waParam.page}</c:if>.do" title="Delete node"><img src="${static}/${site}/img/ico_delete.png" /></a>  
									<c:if test="${item.tree.valueId != item.valueId}">
									 <a href="${context}/${site}/${module}/movedownNode/nodeId/${item.valueId}<c:if test="${waParam.page!=null}">/page/${waParam.page}</c:if>.do" title="Move down"><img src="${static}/${site}/img/ico_arrow_down.png" /></a>  
									 <a href="${context}/${site}/${module}/moveupNode/nodeId/${item.valueId}<c:if test="${waParam.page!=null}">/page/${waParam.page}</c:if>.do" title="Move up"><img src="${static}/${site}/img/ico_arrow_up.png" /></a>
									 <a href="${context}/${site}/${module}/insertSibling/nodeId/${item.valueId}<c:if test="${waParam.page!=null}">/page/${waParam.page}</c:if>.do" title="Add brother"><img src="${static}/${site}/img/ico_add_sibling.png" /></a>
										<c:if test="${cutNode==null}"> 
											 <a href="${context}/${site}/${module}/cutNode/nodeId/${item.valueId}<c:if test="${waParam.page!=null}">/page/${waParam.page}</c:if>.do" title="Cut node"><img src="${static}/${site}/img/ico_cut.png" /></a>
										</c:if> 
										
									</c:if>
									<c:if test="${cutNode!=null && (item.left < cutNode.left || item.right > cutNode.right)}"> 
											 <a href="${context}/${site}/${module}/pasteNode/nodeId/${item.valueId}<c:if test="${waParam.page!=null}">/page/${waParam.page}</c:if>.do" title="Paste node as a child"><img src="${static}/${site}/img/ico_paste_child.png" /></a>
											 <a href="${context}/${site}/${module}/pasteNodeSibling/nodeId/${item.valueId}<c:if test="${waParam.page!=null}">/page/${waParam.page}</c:if>.do" title="Paste node as a brother"><img src="${static}/${site}/img/ico_paste_sibling.png" /></a>	
									</c:if>
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
			<input name="valueId" id="c_valueId" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>valueId</wa:mls></label>
		</div>
		<div>
			<input name="name" id="c_name" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>Name</wa:mls></label>
		</div>
		<div>
			<input name="pos" id="c_pos" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>position</wa:mls></label>
		</div>
		<div>
			<input name="level" id="c_level" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>level</wa:mls></label>
		</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='valueId';
addParams='?id=${property.propertyid}'
</script>