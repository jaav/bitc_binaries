<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${layout.title}</title>
</head>
<script type="text/javascript">
	function navDisplay(idTag){
		document.getElementById(idTag).style.display = "block";
	}
	function navHide(idTag){
		document.getElementById(idTag).style.display = "none";
	}
</script>
<link rel="stylesheet" type="text/css" href="${static}/${site}/css/screen.css">
<body>
<div id="container">
  <!--branding =  logo + titre (contient : H1 et H2)-->
  <div id="branding">
    <h1><wa:mls>BITC</wa:mls></h1>
  </div>
  <!--navMain = la navigation principal-->
  <!--content-->
  <div id="content">

				<h2>${errorMessage}</h2>
				<table>
					<tr>
						<td>Error code</td>
						<td>${errorCode}</td>
					</tr>
					<tr>
						<td>Exception message</td>
						<td>${exception}</td>
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
								${stackItem.className}.${stackItem.methodName}(${stackItem.fileName}:${stackItem.lineNumber})<br>
							</c:forEach>
						</td>
					</tr>
				</table>


  </div>
  <!--site info ours du site (pied de page)-->
</div>
</body>
</html>
    