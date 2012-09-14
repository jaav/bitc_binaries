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
			<a href="javascript:void(0);" id="export_btn"><wa:mls>export</wa:mls></a>
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

<div class="fl">
	<div id="searchBox">
		<h2><wa:mls>Search Box</wa:mls></h2>
		<div id="searchclose"></div>
		<div class="content">
			<form name="searchForm" id="searchForm" action="${context}/${site}/${module}/${action}.do${filterString}"> 
				<div>
					<label for="s_orderId"><wa:mls>orderId</wa:mls></label>
					<input name="s_orderId" type="text" <c:choose><c:when test="${waParam.s_orderId!=null}">value="${waParam.s_orderId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_orderStatus"><wa:mls>orderStatus</wa:mls></label>
					<table>
						<tr>
							<td><input type="checkbox"<c:if test="${wa:contain(waParams.s_orderStatus,'CREATED')}"> checked="checked"</c:if> value="CREATED" name="s_orderStatus"/><wa:mls>CREATED</wa:mls></td>
							<td><input type="checkbox"<c:if test="${wa:contain(waParams.s_orderStatus,'SUMMARY')}"> checked="checked"</c:if> value="SUMMARY" name="s_orderStatus"/><wa:mls>SUMMARY</wa:mls></td>
						</tr>
						<tr>
							<td><input type="checkbox"<c:if test="${wa:contain(waParams.s_orderStatus,'PAYING')}">  checked="checked"</c:if> value="PAYING"  name="s_orderStatus"/><wa:mls>PAYING</wa:mls></td>
							<td><input type="checkbox"<c:if test="${wa:contain(waParams.s_orderStatus,'DUBIOUS')}">  checked="checked"</c:if> value="DUBIOUS"  name="s_orderStatus"/><wa:mls>DUBIOUS</wa:mls></td>
						</tr>
						<tr>
							<td><input type="checkbox"<c:if test="${wa:contain(waParams.s_orderStatus,'TIMEOUT')}">  checked="checked"</c:if> value="TIMEOUT"  name="s_orderStatus"/><wa:mls>TIMEOUT</wa:mls></td>
							<td><input type="checkbox"<c:if test="${wa:contain(waParams.s_orderStatus,'CANCELED')}">  checked="checked"</c:if> value="CANCELED"  name="s_orderStatus"/><wa:mls>CANCELED</wa:mls></td>
						</tr>
						<tr>
							<td><input type="checkbox"<c:if test="${wa:contain(waParams.s_orderStatus,'REFUSED')}">  checked="checked"</c:if> value="REFUSED"  name="s_orderStatus"/><wa:mls>REFUSED</wa:mls></td>
							<td><input type="checkbox"<c:if test="${wa:contain(waParams.s_orderStatus,'PAID')}">  checked="checked"</c:if> value="PAID"  name="s_orderStatus"/><wa:mls>PAID</wa:mls></td>
						</tr>
						<tr>
							<td><input type="checkbox"<c:if test="${wa:contain(waParams.s_orderStatus,'SENT')}">  checked="checked"</c:if> value="SENT"  name="s_orderStatus"/><wa:mls>SENT</wa:mls></td>
							<td><input type="checkbox"<c:if test="${wa:contain(waParams.s_orderStatus,'WAITING')}">  checked="checked"</c:if> value="WAITING"  name="s_orderStatus"/><wa:mls>WAITING</wa:mls></td>
						</tr>
					</table>
				</div>
				<div>
					<label for="s_total"><wa:mls>total</wa:mls></label>
					<input name="s_total" type="text" <c:choose><c:when test="${waParam.s_total!=null}">value="${waParam.s_total}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<%-- <div>
					<label for="s_type"><wa:mls>type</wa:mls></label>
					<select name="s_type">
						<option value=""></option>
						<option value="ESHOP" <c:if test="${waParam.s_type == 'ESHOP'}">selected="selected"</c:if> >ESHOP</option>
						<option value="BROCHURE" <c:if test="${waParam.s_type == 'BROCHURE'}">selected="selected"</c:if> >BROCHURE</option>
							
					</select>
				</div> --%>
				<div>
					<label for="s_invoiceLastname"><wa:mls>invoiceLastname</wa:mls></label>
					<input name="s_invoiceLastname" type="text" <c:choose><c:when test="${waParam.s_invoiceLastname!=null}">value="${waParam.s_invoiceLastname}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_invoiceFirstname"><wa:mls>invoiceFirstname</wa:mls></label>
					<input name="s_invoiceFirstname" type="text" <c:choose><c:when test="${waParam.s_invoiceFirstname!=null}">value="${waParam.s_invoiceFirstname}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_invoiceEmail"><wa:mls>invoiceEmail</wa:mls></label>
					<input name="s_invoiceEmail" type="text" <c:choose><c:when test="${waParam.s_invoiceEmail!=null}">value="${waParam.s_invoiceEmail}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_ogonePayid"><wa:mls>ogonePayid</wa:mls></label>
					<input name="s_ogonePayid" type="text" <c:choose><c:when test="${waParam.s_ogonePayid!=null}">value="${waParam.s_ogonePayid}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
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
</div>


<h2><wa:mls>EsOrder</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center orderStatus"></td>
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
				<td class="center orderId">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>orderId</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
					<wa:param name="orderBy" value="orderId" />
					</wa:link>			
				</td>
				<td class="center total">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>total</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="total" />
					</wa:link>			
				</td>
				<%-- <td class="center type">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>type</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${type}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="createdOn" />
					</wa:link>			
				</td> --%>
				<td class="center invoiceLastname">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>invoiceLastname</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${invoiceLastname}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="invoiceLastname" />
					</wa:link>			
				</td>
				<td class="center invoiceFirstname">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>invoiceFirstname</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${invoiceFirstname}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="invoiceFirstname" />
					</wa:link>			
				</td>
				<td class="center invoiceEmail">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>invoiceEmail</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${invoiceEmail}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="invoiceEmail" />
					</wa:link>			
				</td>
				<td class="center ogonePayid">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>ogonePayid</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${ogonePayid}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="ogonePayid" />
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
				<td class="center esOrderLine"/>
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">
					<td 
						<c:if test="${item.orderStatus eq 'REFUSED'}">class="center redStatus"</c:if>
						<c:if test="${item.orderStatus eq 'CANCELED'}">class="center redStatus"</c:if>
						<c:if test="${item.orderStatus eq 'TIMEOUT'}">class="center redStatus"</c:if>
						<c:if test="${item.orderStatus eq 'DUBIOUS'}">class="center redStatus"</c:if>
						<c:if test="${item.orderStatus eq 'SENT'}">class="center greenStatus"</c:if>
						<c:if test="${item.orderStatus eq 'PAID'}">class="center greenStatus"</c:if>
						<c:if test="${item.orderStatus eq 'CREATED'}">class="center blueStatus"</c:if>
						<c:if test="${item.orderStatus eq 'PAYING'}">class="center blueStatus"</c:if>
						<c:if test="${item.orderStatus eq 'WAITING'}">class="center blueStatus"</c:if>
						<c:if test="${item.orderStatus eq 'SUMMARY'}">class="center blueStatus"</c:if>
					>${item.orderStatus}</td>
					<td class="center checkbox"><input type="checkbox" value="${item.orderId}"></td>
					<td class="center orderId"><a href="${context}/${site}/esOrder/editItem/id/${item.orderId}.do" title="<wa:mls>Edit order</wa:mls>">${item.orderId}</a></td>	
					<td class="center total">${item.total}&nbsp;</td>
					<%-- <td class="center type">${item.type}&nbsp;</td> --%>
					<td class="center invoiceLastname">${item.invoiceLastname}&nbsp;</td>
					<td class="center invoiceFirstname">${item.invoiceFirstname}&nbsp;</td>
					<td class="center invoiceEmail">${item.invoiceEmail}&nbsp;</td>
					<td class="center ogonePayid">${item.ogonePayid}&nbsp;</td>
					<td class="center createdOn"><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${item.createdOn}"/>&nbsp;</td>
					<td class="center esOrderLine"><a href="${context}/admin/esOrderLine/esOrderLineList.do?s_esOrder_orderId=${item.orderId}&s_submit=Search"><wa:mls>Voir les lignes de commandes</wa:mls></a></td>	
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
		<input name="orderId" id="c_orderId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>orderId</wa:mls></label>
	</div>
	<div>
		<input name="total" id="c_total" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>total</wa:mls></label>
	</div>
	<div>
		<input name="createdOn" id="c_createdOn" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>createdOn</wa:mls></label>
	</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
	path='${context}/${site}/${module}';
	idName='orderId';
	numOfElement='${listSize}'; 
</script>