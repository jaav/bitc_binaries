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
		<a href="javascript:void(0);" id="add_btn"><wa:mls>add</wa:mls></a>
		<a href="javascript:void(0);" id="duplicate_btn"><wa:mls>duplicate</wa:mls></a>
		<a href="javascript:void(0);" id="delete_btn"><wa:mls>delete</wa:mls></a>
		<a href="javascript:void(0);" id="edit_btn"><wa:mls>edit</wa:mls></a>
		<a href="javascript:void(0);" id="export_btn"><wa:mls>export</wa:mls></a>
		<a href="javascript:void(0);" id="import_btn"><wa:mls>import</wa:mls></a>
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
	<div id="searchBox" style="width:300px">
		<h2><wa:mls>Search Box</wa:mls></h2>
		<div id="searchclose"></div>
		<div class="content">
			<form name="searchForm" id="searchForm" action="${context}/${site}/${module}/${action}.do${filterString}"> 
				<div>
					<label for="s_id"><wa:mls>id</wa:mls></label>
					<input name="s_id" type="text" <c:choose><c:when test="${waParam.s_id!=null}">value="${waParam.s_id}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_catalogProduct_id"><wa:mls>ProductPrice</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
							<wa:param name="class" value="com.bitc.catalog.hdata.CatalogPrice" />
							<wa:param name="manager" value="com.bitc.catalog.hdata.manager.CatalogPriceManager" />
							<wa:param name="identity" value="id" />
							<wa:param name="display" value="nameForAdmin" />
							<wa:param name="choiceMsg" value="Choose the ProductPrice" />
							<wa:param name="name" value="s_catalogPrice_id" />
							<wa:param name="selectedValues" value="${waParam.s_catalogPrice_id}" />
					</wa:include>
				</div>	
				<div>
					<label for="s_catalogPromoType_id"><wa:mls>Promotion Type</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
							<wa:param name="class" value="com.bitc.catalog.hdata.CatalogPromoType" />
							<wa:param name="manager" value="com.bitc.catalog.hdata.manager.CatalogPromoTypeManager" />
							<wa:param name="identity" value="id" />
							<wa:param name="display" value="titleDefault" />
							<wa:param name="choiceMsg" value="Choose the Promo Type" />
							<wa:param name="name" value="s_catalogPromoType_id" />
							<wa:param name="selectedValues" value="${waParam.s_catalogPromoType_id}" />
					</wa:include>
				</div>	
				<div>
					<label for="s_code"><wa:mls>Code</wa:mls></label>
					<input name="s_code" type="text" <c:choose><c:when test="${waParam.s_code!=null}">value="${waParam.s_code}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				
				<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>				
			</form>
		</div>
	</div>
<!--searchBox:end-->
</div>
<!--floatLeft:end-->
<h2><wa:mls>Catalog Promotions</wa:mls></h2>
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
					<td class="center price">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>Price</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="price" />
						</wa:link>			
					</td>
					<td class="center promoValue">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>Discount</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="promoValue" />
						</wa:link>			
					</td>
					<td class="center titleDefault">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>Promo Code</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="promoCode" />
						</wa:link>			
					</td>
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">
						
					<td class="center checkbox"><input type="checkbox" value="${item.id}"></td>
					<td class="center id"><a href="${context}/${site}/catalogPromo/editItem/id/${item.id}.do" title="<wa:mls>Edit id</wa:mls>">${item.id}</a></td>
					<td class="center price"><a href="${context}/${site}/catalogPrice/editItem/id/${item.catalogPrice.id}.do" title="<wa:mls>Edit id</wa:mls>">${item.catalogPrice.nameForAdmin}</a></td>
					<td class="center value">${item.promoValue}&nbsp;</td>
					<td class="center titleDefault">${item.promoCode}&nbsp;</td>
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
			<input name="product" id="c_product" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>product</wa:mls></label>
		</div>
			<div>
			<input name="promoValue" id="c_promoValue" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>promoValue</wa:mls></label>
		</div>
		<div>
			<input name="promoCode" id="c_promoCode" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>promoCode</wa:mls></label>
		</div>
		
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='id';

function deleteInLine(id){
	var cfrm=confirm('Do you want to delete this element : '+id);
	if (cfrm==true){
		window.location=path+'/deleteItems/items/'+id+'.do';
	}
}
function publishInLine(id){
	var cfrm=confirm('Do you want to publish this element : '+id);
	if (cfrm==true){
		window.location=path+'/publishItems/items/'+id+'.do';
	}
}
numOfElement='${listSize}';
</script>
