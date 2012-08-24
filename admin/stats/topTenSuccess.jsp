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
<%
	java.util.Map waParam = (java.util.Map) request.getAttribute("waParam");
	java.text.DecimalFormat df = new  java.text.DecimalFormat("00");
%>
<div id="mainContent">

<!-- printBox:start-->
<div id="printBox">
	<h3>Top 10</h3>
    <a href="javascript:void(0);" id="print_btn" onclick="window.print()">Imprimer</a>
</div>
<!-- printBox:end-->

	<div id="stats">
		<div id="mask">
		<table>
			<tr class="header">
				<td>&nbsp;</td>
				<td>Top Fans</td>
				<td>Tot</td>
			</tr>
			<c:forEach var="item" items="${topFans}" varStatus="loop">
				<tr>
					<td>(${loop.count})</td>
					<td class="level1">${item.siteName}</td>
					<td>${item.numFans}</td>
				</tr>
			</c:forEach>
		</table>
		<br />
		<table>
			<tr class="header">
				<td>&nbsp;</td>
				<td>Top Comments</td>
				<td>Tot</td>
			</tr>
			<c:forEach var="item" items="${topComments}" varStatus="loop">
				<tr>
					<td>(${loop.count})</td>
					<td class="level1">${item.siteName}</td>
					<td>${item.numComments}</td>
				</tr>
			</c:forEach>
		</table>
		<br />
		<table>
			<tr class="header">
				<td>&nbsp;</td>
				<td>Top News</td>
				<td>Tot</td>
			</tr>
			<c:forEach var="item" items="${topNews}" varStatus="loop">
				<tr>
					<td>(${loop.count})</td>
					<td class="level1">${item.siteName}</td>
					<td>${item.numNews}</td>
				</tr>
			</c:forEach>
		</table>
		<br />
		<table>
			<tr class="header">
				<td>&nbsp;</td>
				<td>Top Photos</td>
				<td>Tot</td>
			</tr>
			<c:forEach var="item" items="${topPhotos}" varStatus="loop">
				<tr>
					<td>(${loop.count})</td>
					<td class="level1">${item.siteName}</td>
					<td>${item.numPhotos}</td>
				</tr>
			</c:forEach>
		</table>
		<br />
		<table>
			<tr class="header">
				<td>&nbsp;</td>
				<td>Top Visits (From 12/10/2009)</td>
				<td>Tot</td>
			</tr>
			<c:forEach var="item" items="${topVisits}" varStatus="loop">
				<tr>
					<td>(${loop.count})</td>
					<td class="level1">${item.siteName}</td>
					<td>${item.numVisits}</td>
				</tr>
			</c:forEach>
		</table>
		
		</div>
	</div>
</div>
<script>
path='${context}/${site}/${module}';
</script>
