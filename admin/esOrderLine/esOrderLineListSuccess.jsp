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
					<label for="s_orderLineId"><wa:mls>orderLineId</wa:mls></label>
					<input name="s_orderLineId" type="text" <c:choose><c:when test="${waParam.s_orderLineId!=null}">value="${waParam.s_orderLineId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_esOrder_orderId"><wa:mls>orderId</wa:mls></label>
					<input name="s_esOrder_orderId" type="text" <c:choose><c:when test="${waParam.s_esOrder_orderId!=null}">value="${waParam.s_esOrder_orderId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_reference"><wa:mls>reference</wa:mls></label>
					<input name="s_reference" type="text" <c:choose><c:when test="${waParam.s_reference!=null}">value="${waParam.s_reference}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_catalogProduct_id"><wa:mls>catalogProduct</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
							<wa:param name="class" value="com.bitc.catalog.hdata.CatalogProduct" />
							<wa:param name="manager" value="com.bitc.catalog.hdata.manager.CatalogProductManager" />
							<wa:param name="method" value="listCatalogProduct" />
							<wa:param name="identity" value="id" />
							<wa:param name="display" value="name" />
							<wa:param name="choiceMsg" value="Choose the Product" />
							<wa:param name="name" value="s_catalogProduct_id" />
							<wa:param name="selectedValues" value="${waParam.s_catalogProduct_id}" />
					</wa:include>
				</div>	
				<div>
					<label for="s_unitPrice"><wa:mls>unitPrice</wa:mls></label>
					<input name="s_unitPrice" type="text" <c:choose><c:when test="${waParam.s_unitPrice!=null}">value="${waParam.s_unitPrice}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_quantity"><wa:mls>quantity</wa:mls></label>
					<input name="s_quantity" type="text" <c:choose><c:when test="${waParam.s_quantity!=null}">value="${waParam.s_quantity}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_createdOn"><wa:mls>createdOn</wa:mls></label>
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
<h2><wa:mls>EsOrderLine</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
				<td class="center orderLineId">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>orderLineId</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="orderLineId" />
					</wa:link>			
				</td>
				<td class="center orderId">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>orderId</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="esOrder.orderId" />
					</wa:link>			
				</td>
				<td class="center orderId">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>type</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="orderType" />
					</wa:link>			
				</td>
				<td class="center reference">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>reference</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="reference" />
					</wa:link>			
				</td>
				<td class="center product">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>productId</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="productId" />
					</wa:link>			
				</td>
				<td class="center unitPrice">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>unitPrice</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="unitPrice" />
					</wa:link>			
				</td>
				<td class="center quantity">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>quantity</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="quantity" />
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
					<td class="center checkbox"><input type="checkbox" value="${item.orderLineId}"></td>
					<td class="center orderLineId"><a href="${context}/${site}/esOrderLine/editItem/id/${item.orderLineId}.do" title="<wa:mls>Edit orderLine</wa:mls>">${item.orderLineId}</a></td>	
					<td class="center orderId"><a href="${context}/admin/esOrder/esOrderList.do?s_orderId=${item.esOrder.orderId}&s_submit=Search">${item.esOrder.orderId}</a></td>
					<td class="center reference">${item.orderType}&nbsp;</td>
					<td class="center reference">${item.reference}&nbsp;</td>
					<td class="center productId">
						<wa:include URI="${site}/catalogProduct/lookup">
							<wa:param name="id" value="${item.productId}"/>
						</wa:include>
					</td>
					<td class="center unitPrice">${item.unitPrice}&nbsp;</td>
					<td class="center quantity">${item.quantity}&nbsp;</td>
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
		<input name="orderLineId" id="c_orderLineId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>orderLineId</wa:mls></label>
	</div>
	<div>
		<input name="createdOn" id="c_createdOn" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>createdOn</wa:mls></label>
	</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
	path='${context}/${site}/${module}';
	idName='orderLineId';
	numOfElement='${listSize}'; 
</script>

