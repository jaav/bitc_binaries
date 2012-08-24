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
	<h3>Stats Users</h3>
    <a href="javascript:void(0);" id="print_btn" onclick="window.print()">Imprimer</a>
</div>
<!-- printBox:end-->

	<div id="stats">
		<div id="mask">
		<table>
			<tr class="header">
				<td>&nbsp;</td>
				<td>Total Users</td>
				<td>Tot</td>
				<td>FR</td>
				<td>NL</td>
			</tr>
			<tr>
				<td>(1)</td><td>Num of Users</td><td>${total}</td><td>${totalFR} (<fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${(totalFR/total)*100}" />%)</td><td>${totalNL} (<fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${(totalNL/total)*100}" />%)</td>
			</tr>
			<tr>
				<td>(2)</td><td class="level1">Confirmed Users</td><td>${totalValid} (<fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${(totalValid/total)*100}" />%) (2/1)</td><td>${totalValidFR} (<fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${(totalValidFR/totalFR)*100}" />%)</td><td>${totalValidNL} (<fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${(totalValidNL/totalNL)*100}" />%)</td>
			</tr>
		</table>
		</div>
	</div>
</div>
<script>
path='${context}/${site}/${module}';
</script>
