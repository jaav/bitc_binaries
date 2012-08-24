<%@ page 
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" 
isELIgnored="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<ul id="navigation">
	<c:if test="${ac_user_admin != null}">
	
	<c:forEach var="item"
				items="${root2.children}">
				<li>
					<c:if test="${!item.userObject.isExtenal}">
						<a href="${context}/${item.userObject.url}.do" <c:if test="${nodeLevel1.contentMenuId==item.userObject.contentMenuId}">class="menuOn"</c:if> ><wa:mls>${item.userObject.title}</wa:mls></a>
					</c:if>
					<c:if test="${item.userObject.isExtenal}">
						<a href="${item.userObject.url}"  target="_blank" <c:if test="${nodeLevel1.contentMenuId==item.userObject.contentMenuId}">class="menuOn"</c:if> ><wa:mls>${item.userObject.title}</wa:mls></a>
					</c:if>
					
					<ul>
	
						<c:forEach var="item2"
							items="${item.children}">
							<li> 
								<c:if test="${!item2.userObject.isExtenal}">
									<a href="${context}/${item2.userObject.url}.do" ><wa:mls>${item2.userObject.title}</wa:mls></a>
								</c:if>
								<c:if test="${item2.userObject.isExtenal}">
									<a href="${item2.userObject.url}" target="_blank"><wa:mls>${item2.userObject.title}</wa:mls></a>
								</c:if>
							</li>	
						</c:forEach> 
					</ul>
			
				</li>
			</c:forEach>
			
	</c:if>
	
</ul>



