
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%-- CatalogPromoTYPE!!! --%>
<%@ taglib prefix="wa" uri="WanabeTags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="mainContent">
	<div id="toolBox">
		<div class="content" id="actions">
			<a href="javascript:void(0);" id="search_btn" class="allways"><wa:mls>search</wa:mls></a> <a href="javascript:void(0);" id="add_btn"><wa:mls>add</wa:mls></a> <a href="javascript:void(0);"
				id="duplicate_btn"><wa:mls>duplicate</wa:mls></a> <a href="javascript:void(0);" id="delete_btn"><wa:mls>delete</wa:mls></a> <a href="javascript:void(0);" id="edit_btn"><wa:mls>edit</wa:mls></a>
			<c:if test="${legend != null}">
				<a href="javascript:void(0);" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
			</c:if>
		</div>
		<div id="pagingTop">
			<wa:include URI="${site}/boxes/pageNav">
				<wa:param name="orderBy" value="${waParam.orderBy}" />
				<wa:param name="orderDir" value="${waParam.orderDir}" />
			</wa:include>
		</div>
		<div style="clear: both"></div>
	</div>
	<!--floatLeft:start (important to toggle-slide search box)-->
	<div class="fl">
		<!--searchBox:start (hide by default)-->
		<div id="searchBox" style="width: 300px">
			<h2>
				<wa:mls>Search Box</wa:mls>
			</h2>
			<div id="searchclose"></div>
			<div class="content">
				<form name="searchForm" id="searchForm" action="${context}/${site}/${module}/${action}.do${filterString}">
					<div>
						<label for="s_id"><wa:mls>id</wa:mls></label> <input name="s_id" type="text"
							<c:choose><c:when test="${waParam.s_id!=null}">value="${waParam.s_id}"</c:when><c:otherwise>value=""</c:otherwise></c:choose> />
					</div>
					<div>
						<label for="s_titleDefault"><wa:mls>Title</wa:mls></label> <input name="s_titleDefault" type="text"
							<c:choose><c:when test="${waParam.s_titleDefault!=null}">value="${waParam.s_titleDefault}"</c:when><c:otherwise>value=""</c:otherwise></c:choose> />
					</div>

					<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>" class="reset"></input> <input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
				</form>
			</div>
		</div>
		<!--searchBox:end-->
	</div>
	<!--floatLeft:end-->
	<h2>
		<wa:mls>Catalog Promo Type</wa:mls>
	</h2>
	<div id="list">
		<div id="mask">
			<table cellspacing=0 cellpadding=0>
				<tr class="header">

					<td class="center checkbox"><input type="checkbox" id="checkboxAll" /></td>
					<td class="center id"><wa:link URI="${URI}" allParams="true">
							<wa:mls>id</wa:mls>
							<wa:exceptParam name="page" />
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir" />
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy" />
							<wa:param name="orderBy" value="id" />
						</wa:link></td>
					<td class="center titleDefault"><wa:link URI="${URI}" allParams="true">
							<wa:mls>Title</wa:mls>
							<wa:exceptParam name="page" />
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir" />
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy" />
							<wa:param name="orderBy" value="titleDefault" />
						</wa:link></td>
				</tr>
				<c:forEach var="item" items="${list}" varStatus="loop">
					<tr class="line${((loop.count+1)%2)+1}">

						<td class="center checkbox"><input type="checkbox" value="${item.id}"></td>
						<td class="center id"><a href="${context}/${site}/catalogPromoType/editItem/id/${item.id}.do" title="<wa:mls>Edit id</wa:mls>">${item.id}</a></td>
						<td class="center name">${item.titleDefault}&nbsp;</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div style="clear: both"></div>
	</div>
	<!-- paginationBottom:start-->
	<div id="pagingBottom">
		<wa:include URI="${site}/boxes/pageNav">
			<wa:param name="orderBy" value="${waParam.orderBy}" />
			<wa:param name="orderDir" value="${waParam.orderDir}" />
		</wa:include>
	</div>
	<!-- paginationBottom:end-->
</div>
<!--content:end-->

<!--wrapper:end-->


<div id="fieldList">
	<div>
		<input name="id" id="c_id" type="checkbox" value="1" checked="checked" /> <label><wa:mls>id</wa:mls></label>
	</div>
	<div>
		<input name="name" id="c_titleDefault" type="checkbox" value="1" checked="checked" /> <label><wa:mls>name</wa:mls></label>
	</div>

</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
	path = '${context}/${site}/${module}';
	idName = 'id';

	function deleteInLine(id) {
		var cfrm = confirm('Do you want to delete this element : ' + id);
		if (cfrm == true) {
			window.location = path + '/deleteItems/items/' + id + '.do';
		}
	}
	function publishInLine(id) {
		var cfrm = confirm('Do you want to publish this element : ' + id);
		if (cfrm == true) {
			window.location = path + '/publishItems/items/' + id + '.do';
		}
	}
</script>
