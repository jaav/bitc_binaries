<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	 <td>${item.title}&nbsp;</td>
	 <td><c:if test="${(item.group eq 'HOTEL') or (item.group eq 'RESTO') or (item.group eq 'VENUE') }">
	${item.phone}&nbsp;
	 </c:if> </td>
     <td><c:if test="${(item.group eq 'HOTEL') or (item.group eq 'RESTO') or (item.group eq 'VENUE') }">
	${item.email}
	 </c:if></td>

