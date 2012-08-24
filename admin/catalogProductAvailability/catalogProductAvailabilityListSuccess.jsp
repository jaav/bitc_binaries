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
					<label for="s_titleDefault"><wa:mls>titleDefault</wa:mls></label>
					<input name="s_titleDefault" type="text" <c:choose><c:when test="${waParam.s_titleDefault!=null}">value="${waParam.s_titleDefault}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_catalogProduct_catalogProductId"><wa:mls>catalogProduct</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
							<wa:param name="class" value="com.bitc.catalog.hdata.CatalogProduct" />
							<wa:param name="manager" value="com.bitc.catalog.hdata.manager.CatalogProductManager" />
							<wa:param name="identity" value="id" />
							<wa:param name="display" value="name" />
							<wa:param name="choiceMsg" value="Choose the Product" />
							<wa:param name="name" value="s_catalogProduct_id" />
							<wa:param name="selectedValues" value="${waParam.s_catalogProduct_id}" />
					</wa:include>
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
				
				<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>				
			</form>
		</div>
	</div>
<!--searchBox:end-->
</div>
<!--floatLeft:end-->
<h2><wa:mls>Catalog Product Availability</wa:mls></h2>
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
					<td class="center typeOfDate">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>typeOfDate</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="typeOfDate" />
						</wa:link>			
					</td>
					<td class="center product">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>product</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="product" />
						</wa:link>			
					</td>
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">
						
					<td class="center checkbox"><input type="checkbox" value="${item.id}"></td>
					<td class="center id"><a href="${context}/${site}/catalogPrice/editItem/id/${item.id}.do" title="<wa:mls>Edit id</wa:mls>">${item.id}</a></td>
					<td class="center fromDate"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.fromDate}"/>&nbsp;</td>
					<td class="center toDate"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.toDate}"/>&nbsp;</td>
					<td class="center typeOfDate"><c:if test="${item.typeOfDate==1}"><wa:mls>jours d'ouverture</wa:mls></c:if><c:if test="${item.typeOfDate==2}"><wa:mls>jours de fermeture</wa:mls></c:if>&nbsp;</td>
					<td class="center product"><a href="${context}/${site}/catalogProduct/list/id=${item.catalogProduct.id}.do" title="<wa:mls>Edit id</wa:mls>">${item.catalogProduct.name}</a></td>
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
			<input name="fromDate" id="c_fromDate" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>fromDate</wa:mls></label>
		</div>
		<div>
			<input name="toDate" id="c_toDate" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>toDate</wa:mls></label>
		</div>
		<div>
			<input name="typeOfDate" id="c_typeOfDate" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>typeOfDate</wa:mls></label>
		</div>
		<div>
			<input name="product" id="c_product" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>product</wa:mls></label>
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

</script>
