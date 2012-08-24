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
	<h3>Team News</h3>
    <a href="javascript:void(0);" id="print_btn" onclick="window.print()">Imprimer</a>
</div>
<!-- printBox:end-->

	<div id="stats">
		<div id="mask">
		<table>
			<tr class="header">
				<td>&nbsp;</td>
				<td>Total</td>
				<td>Tot</td>
				<td>FR</td>
				<td>NL</td>
			</tr>
			<tr>
				<td>(1)</td><td>Num of Articles</td><td>${total}</td><td>${totalFR} (<fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${(totalFR/total)*100}" />%)</td><td>${totalNL} (<fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${(totalNL/total)*100}" />%)</td>
			</tr>
			<tr>
				<td>(2)</td><td class="level1">News</td><td>${totalNews} (<fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${(totalNews/total)*100}" />%) (2/1)</td><td>${totalNewsFR} (<fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${(totalNewsFR/totalFR)*100}" />%)</td><td>${totalNewsNL} (<fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${(totalNewsNL/totalNL)*100}" />%)</td>
			</tr>
			<tr>
				<td>(3)</td><td class="level1">Gallery</td><td>${totalGallery} (<fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${(totalGallery/total)*100}" />%) (3/1)</td><td>${totalGalleryFR} (<fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${(totalGalleryFR/totalFR)*100}" />%)</td><td>${totalGalleryNL} (<fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${(totalGalleryNL/totalNL)*100}" />%)</td>
			</tr>
			<tr>
				<td>(4)</td><td class="level1">Photo</td><td>${totalPhoto} (<fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${(totalPhoto/total)*100}" />%) (4/1)</td><td>${totalPhotoFR} (<fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${(totalPhotoFR/totalFR)*100}" />%)</td><td>${totalPhotoNL} (<fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${(totalPhotoNL/totalNL)*100}" />%)</td>
			</tr>
			<tr>
				<td>(5)</td><td class="level1">Event</td><td>${totalEvent} (<fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${(totalEvent/total)*100}" />%) (5/1)</td><td>${totalEventFR} (<fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${(totalEventFR/totalFR)*100}" />%)</td><td>${totalEventNL} (<fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${(totalEventNL/totalNL)*100}" />%)</td>
			</tr>
		</table>
		</div>
	</div>
</div>
<script>
path='${context}/${site}/${module}';
</script>
