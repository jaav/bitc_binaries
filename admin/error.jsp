<%@ page 
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>
	<HEAD>
		<META http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<META http-equiv="expires" contentg="0">
		<META http-equiv="cache-control" contentg="no-cache">
		<TITLE>Error ${errorCode} - ${errorMessage}</TITLE>
		<LINK rel="stylesheet" type="text/css" href="${staticSite}/css/main.css" />
	</HEAD>
	<BODY>
		<!-- Container principal englobe tout le site -->
		<div id="container">
			
			<div id="top">
				
				<!-- Top contient le top noir avec logo Wanabe, Nom du client, URL client, logout -->

				<!-- Menu du haut -->
				<div id="navLevel1">
					<ul>
						<c:forEach items="${menu.level1}" var="item">
							<c:if test="${!item.isSelected}">
								<li class="iconDatabase"><a href ="${context}/${item.target}.do">${item.name}</a></li>
							</c:if>
							<c:if test="${item.isSelected}">
								<li class="iconDatabase active"><a href ="${context}/${item.target}.do">${item.name}</a></li>
							</c:if>
						</c:forEach>
					</ul>

					<div class="iconHelp"><img src="${staticSite}/images/icon_help.gif" alt="help" width="21" height="22" /></div>
				</div>

				<!-- content englobe tout le reste du contenu -->
				<div id="content">
					<h2>${errorMessage}</h2>
					<table>
						<tr>
							<td>Error code</td>
							<td>${errorCode}</td>
						</tr>
						<tr>
							<td>Exception message</td>
							<td>${exception.message}</td>
						</tr>
						<tr>
							<td>Stacktrace</td>
							<td>
								<c:forEach var="stackItem" items="${exception.stackTrace}">
									${stackItem.className}.${stackItem.methodName}(${stackItem.fileName}:${stackItem.lineNumber})<br>
								</c:forEach>
							</td>
						</tr>
						<tr>
							<td>Cause</td>
							<td>${exception.cause}</td>
						</tr>
						<tr>
							<td>Cause stacktrace</td>
							<td>
								<c:forEach var="stackItem" items="${exception.cause.stackTrace}">
									${stackItem.className}.${stackItem.methodName}(${stackItem.lineNumber})<br>
								</c:forEach>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</BODY>
</HTML>
				