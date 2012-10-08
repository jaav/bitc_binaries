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

  <h1 class="line_grey">${bean.mainTitle}</h1>
  ${bean.mainBody}
  <c:if test="${ not empty adminComment}"><wa:mls>Message de l'administrateur : ${adminComment}</wa:mls></c:if>
  
  