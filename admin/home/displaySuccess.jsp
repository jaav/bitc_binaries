<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="mainContent">
<h2><wa:mls>Home</wa:mls></h2>
<div id ="dashMask">	
	<wa:mls>Welcome on the BITC administration !</wa:mls> 

	<c:if test="${code != null}">
		<br/><br/>
		<wa:mls> Rubrique : </wa:mls><wa:mls>${code}</wa:mls>
		<%--<c:if test="${menuNode.countDirectNavChildren > 0}">--%>
		<%--	<ul>
				<c:forEach var="item"
					items="${wa:orderTreeMenuWithCheckRight(menuNode,ac_user_admin).children}">
						<li>
							<c:if test="${!item.userObject.isExtenal}">
								<a href="${context}/${item.userObject.url}.do"><wa:mls>${item.userObject.title}</wa:mls></a> 
							</c:if>
							<c:if test="${item.userObject.isExtenal}">
								<a href="${item.userObject.url}" target="_blank"><wa:mls>${item.userObject.title}</wa:mls></a> 
							</c:if>
						</li>
				</c:forEach>
			</ul> --%>
		<%--</c:if>--%>
	</c:if>
	<c:if test="${code == null}">
		<%--<c:if test="${root.children > 0}">--%>
		<%--	<ul>
				<c:forEach var="item"
					items="${wa:orderTreeMenuWithCheckRight(root,ac_user_admin).children}">
							<li>
							<c:if test="${!item.userObject.isExtenal}">
								<a href="${context}/${item.userObject.url}.do"><wa:mls>${item.userObject.title}</wa:mls></a>
							</c:if>
							<c:if test="${item.userObject.isExtenal}">
								<a href="${item.userObject.url}" target="_blank"><wa:mls>${item.userObject.title}</wa:mls></a>
							</c:if>
							</li>
				</c:forEach>
			</ul> --%>
		<%--</c:if>--%>
	</c:if> 
</div>
</div>
<script>
path='${context}/${site}/${module}';
</script>
