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
		<a href="javascript:void(0);" id="refreshMenu_btn"><wa:mls>refresh Menu</wa:mls></a>
		<a href="javascript:void(0);" id="edit_btn"><wa:mls>edit</wa:mls></a>
		<a href="${context}/${site}/${module}/reorderMenu.do" id="reload_btn" class="allways"><wa:mls>Reorder menu</wa:mls></a>
		<c:if test="${legend != null}">
			<a href="javascript:void(0);" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
		</c:if>
		<c:if test="${cutNode !=null}">
			<a href="${context}/${site}/${module}/clearCutElement.do" id="clear_cut"   class="allways"><wa:mls>Clear cut element</wa:mls></a>
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
					<label for="s_contentMenuId"><wa:mls>contentMenuId</wa:mls></label>
					<input name="s_contentMenuId" type="text" <c:choose><c:when test="${waParam.s_contentMenuId!=null}">value="${waParam.s_contentMenuId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_tree_contentMenuId"><wa:mls>TreeId</wa:mls></label>					
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.cms.hdata.ContentMenu" />
						<wa:param name="manager" value="com.wanabe.cms.manager.ContentMenuManager" />
						<wa:param name="method" value="listAllFather" />
						<wa:param name="identity" value="contentMenuId" />
						<wa:param name="display" value="title" />
						<wa:param name="name" value="s_tree_contentMenuId" />
						<wa:param name="selectedValues" value="${waParam.s_tree_contentMenuId}" />
						<wa:param name="choiceMsg" value="Choose" />
					</wa:include>
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
					<label for="s_title"><wa:mls>title</wa:mls></label>
					<input name="s_title" type="text" <c:choose><c:when test="${waParam.s_title!=null}">value="${waParam.s_title}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
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
					<input type="radio"<c:if test="${not empty waParam.s_visible && !waParam.s_visible}"> checked="checked"</c:if> value="false" name="s_visible"/><wa:mls>false</wa:mls>
					<input type="radio"<c:if test="${waParam.s_visible}"> checked="checked"</c:if> value="true" name="s_visible"/><wa:mls>true</wa:mls>
				</div>
				<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
			</form>
		</div>
	</div>
<!--searchBox:end-->
</div>
<!--floatLeft:end-->
<h2><wa:mls>ContentMenu</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
					<td class="center contentMenuId">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>contentMenuId</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="contentMenuId" />
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
					
					<td class="left action">
						<wa:mls>Actions</wa:mls>
					</td>
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1} <c:if test="${item.left >= cutNode.left && item.right <= cutNode.right}" >cut</c:if>">
					<td class="center checkbox"><input type="checkbox" value="${item.contentMenuId}"></td>
					<td class="center contentMenuId"><a href="${context}/${site}/contentMenu/editItem/id/${item.contentMenuId}.do" title="<wa:mls>Edit id</wa:mls>">${item.contentMenuId}</a></td>
					<td class="center culture">${item.culture}&nbsp;</td>
					<td class="left title">
						<c:if test="${item.level==1}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<c:if test="${item.level==2}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<c:if test="${item.level==3}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<c:if test="${item.level==4}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						${item.title}&nbsp;
					</td>
					<td class="center position">${item.pos}&nbsp;</td>
					<td class="center createdOn"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.createdOn}"/>&nbsp;</td>
					<td class="center fromDate"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.fromDate}"/>&nbsp;</td>
					<td class="center toDate"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.toDate}"/>&nbsp;</td>
					<td class="center visible">${item.visible}&nbsp;</td>
					<td class="left action"> 
						
					
						<c:if test="${item.tree != null}">  
						 	<a href="${context}/${site}/${module}/insertNode/nodeId/${item.contentMenuId}<c:if test="${waParam.page!=null}">/page/${waParam.page}</c:if>.do" title="Insert child"><img src="${static}/${site}/img/ico_add.png" /></a>  
							 <a href="javascript:admin_validateDelete('${context}/${site}/${module}/deleteNode/nodeId/${item.contentMenuId}<c:if test="${waParam.page!=null}">/page/${waParam.page}</c:if>.do','${item.contentMenuId}');" title="Delete node"><img src="${static}/${site}/img/ico_delete.png" /></a>  
							<c:if test="${item.tree.contentMenuId != item.contentMenuId}">
							 <a href="${context}/${site}/${module}/movedownNode/nodeId/${item.contentMenuId}<c:if test="${waParam.page!=null}">/page/${waParam.page}</c:if>.do" title="Move down"><img src="${static}/${site}/img/ico_arrow_down.png" /></a>  
							 <a href="${context}/${site}/${module}/moveupNode/nodeId/${item.contentMenuId}<c:if test="${waParam.page!=null}">/page/${waParam.page}</c:if>.do" title="Move up"><img src="${static}/${site}/img/ico_arrow_up.png" /></a>
							 <a href="${context}/${site}/${module}/insertSibling/nodeId/${item.contentMenuId}<c:if test="${waParam.page!=null}">/page/${waParam.page}</c:if>.do" title="Add brother"><img src="${static}/${site}/img/ico_add_sibling.png" /></a>
								<c:if test="${cutNode==null}"> 
									 <a href="${context}/${site}/${module}/cutNode/nodeId/${item.contentMenuId}<c:if test="${waParam.page!=null}">/page/${waParam.page}</c:if>.do" title="Cut node"><img src="${static}/${site}/img/ico_cut.png" /></a>
								</c:if> 
								
							</c:if>
							<c:if test="${cutNode!=null && (item.left < cutNode.left || item.right > cutNode.right)}"> 
									 <a href="${context}/${site}/${module}/pasteNode/nodeId/${item.contentMenuId}<c:if test="${waParam.page!=null}">/page/${waParam.page}</c:if>.do" title="Paste node as a child"><img src="${static}/${site}/img/ico_paste_child.png" /></a>
									 <a href="${context}/${site}/${module}/pasteNodeSibling/nodeId/${item.contentMenuId}<c:if test="${waParam.page!=null}">/page/${waParam.page}</c:if>.do" title="Paste node as a brother"><img src="${static}/${site}/img/ico_paste_sibling.png" /></a>	
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
			<input name="contentMenuId" id="c_contentMenuId" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>contentMenuId</wa:mls></label>
		</div>
		<div>
			<input name="culture" id="c_culture" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>culture</wa:mls></label>
		</div>
		<div>
			<input name="title" id="c_title" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>title</wa:mls></label>
		</div>
		<div>
			<input name="pos" id="c_pos" type="checkbox" value="1" checked="checked"/>
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
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='id';
</script>