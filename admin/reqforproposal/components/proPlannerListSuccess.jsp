<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="meeting">
    <tr class="top"><td class="id">Id</td><td class="id">Professional Id</td><td class="type">User</td></tr>
	<c:forEach var="item" items="${proPlanner}" varStatus="loop">
		<tr>
			<td>${item.id}&nbsp;</td>
			<td>${item.professionalId}&nbsp;</td>
			<td>
				<wa:include URI="${site}/acxAdminusers/lookup">
					<wa:param name="id" value="${item.professionalId}"/>
				</wa:include>
			</td>
		</tr>
	</c:forEach>
</table>