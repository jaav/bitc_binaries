<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% //ADMIN CAN EDIT CONTENT %>
<c:if test="${adminUser != null && contentArticleId != null}">
	<p>
		<c:if test="${contentType eq 'ContentArticle'}">
			<a href="<wa:url URI="admin/contentArticle/editItem" >
						<wa:param name="id" value="${contentArticleId}" />	
					</wa:url>" target="admin">
				<wa:mls>Editer</wa:mls>
			</a>
		</c:if>
	</p>
</c:if>