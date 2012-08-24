<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="follow_us">

      <h2><wa:mls>Follow us</wa:mls></h2>
	  <c:forEach items="${followUsNav}" var="item">
      		<a href="${item.url}" target="_blank" title="${item.title}">
      			<img src="${item.image}" alt="${item.title}"/>
      		</a>
      </c:forEach>
       
</div>