<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<wa:include URI="${site}/boxes/topFlashBanner">
  		<wa:param name="zone" value="right"/>
  	</wa:include>

<c:forEach items="${rightColumnList}" var="item">
	<wa:include URI="${site}/boxes/${item.algorithm}">
		<wa:param name="algo_params" value="${item.paramValues}"/>
		
	</wa:include>
</c:forEach>



	
