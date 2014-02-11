<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<select style=" width: 150px;" name="${name}" onchange="${onChangeEvent}" <c:if test="${readonly != null}">disabled="disabled"</c:if>>
	<option value=""><wa:mls>${choiceMsg}</wa:mls></option>
	<c:if test="${listDropdown!=null}">
		<c:forEach var="itemDropdown" items="${listDropdown}">
					<option value="${itemDropdown.id}" title="${itemDropdown.value}"<c:if test="${itemDropdown.id==selectedId}">selected="selected"</c:if>>
						<wa:mls>${itemDropdown.value}</wa:mls>
					</option>
		</c:forEach>	
	</c:if>
	</select>	
