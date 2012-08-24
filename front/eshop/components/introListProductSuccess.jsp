<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--contentMain:start-->
  <h1 class="line_blue">${bean.mainTitle}</h1>
  <c:if test="${not empty bean.mainBigImage}">	
     <img src="${bean.mainBigImage}" alt="${bean.mainTitle}" align="left" class="m22">
  </c:if>
  <c:if test="${not empty bean.mainBody}">
  	${bean.mainBody}
  </c:if>
  <c:if test="${empty bean.mainBody}">
  	${bean.mainAbstract_}
  </c:if>
