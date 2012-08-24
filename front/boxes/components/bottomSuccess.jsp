<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    <h2><wa:mls>EXPLORE</wa:mls></h2>
    <ul>
   		<c:set scope="page" value="0" var="col" />
    	<c:forEach items="${bottomNav.children}" var="item" varStatus="loop">
    		<c:if test="${col mod 4 == 0}"><li></c:if>
    			
    				<c:choose>
    					<c:when test="${item.userObject.contentMenuId eq 920}"></c:when>
						<c:when test="${item.userObject.contentMenuId eq 935}">
							<c:forEach items="${item.children}" var="item2" varStatus="loop2">
								<ul>
									<c:if test ="${item2.userObject.visible}" >
										<li style="list-style-type: none; list-style-image: none;">
										<c:choose>
											<c:when test="${not empty item2.userObject.url  && not item2.userObject.isExtenal}">
												<h5><a href="<wa:url URI="${item2.userObject.url}"><wa:param name="cmid" value="${item2.userObject.contentMenuId}" /></wa:url>" title="${item2.userObject.displayTitle}">${item2.userObject.displayTitle}</a></h5>
											</c:when>
											<c:when test="${not empty item2.userObject.url  && item2.userObject.isExtenal}">
												<h5><a href="${item2.userObject.url}" title="${item2.userObject.displayTitle}" target="_blank">${item2.userObject.displayTitle}</a></h5>
											</c:when>
											<c:otherwise>
					  							<h5>${item2.userObject.displayTitle}</h5>
					  						</c:otherwise>
										</c:choose>
										</li>
										<c:forEach items="${item2.children}" var="item3" varStatus="loop3">
											<c:if test ="${item3.userObject.visible}" >
												<li>
													<c:choose>
														<c:when test="${not empty item3.userObject.url   && not item3.userObject.isExtenal}">
															<a href="<wa:url URI="${item3.userObject.url}"><wa:param name="cmid" value="${item3.userObject.contentMenuId}" /></wa:url>"
																title="${item3.userObject.displayTitle}">${item3.userObject.displayTitle}</a>
														</c:when>
														<c:when test="${not empty item3.userObject.url   && item3.userObject.isExtenal}">
															<a href="${item3.userObject.url}"
																title="${item3.userObject.displayTitle}" target="_blank">${item3.userObject.displayTitle}</a>
														</c:when>
														<c:otherwise>
						  									${item3.userObject.displayTitle}
						  								</c:otherwise>
													</c:choose>
												</li>
											</c:if>
										</c:forEach>
									</c:if>
								</ul>
								<c:set scope="page" value="${col+1}" var="col" />
								<c:if test="${col mod 4 == 0}"></li><li style="list-style-type: none; list-style-image: none;" class="clr"></li></c:if>
							</c:forEach> 
						</c:when>
						<c:otherwise>
							<ul>
							<li style="list-style-type: none; list-style-image: none;">
							<c:choose>
								<c:when test="${not empty item.userObject.url  && not item.userObject.isExtenal}">
									<h5><a href="<wa:url URI="${item.userObject.url}"><wa:param name="cmid" value="${item.userObject.contentMenuId}" /></wa:url>" title="${item.userObject.displayTitle}">${item.userObject.displayTitle}</a></h5>
								</c:when>
								<c:when test="${not empty item.userObject.url  && item.userObject.isExtenal}">
									<h5><a href="${item.userObject.url}" title="${item.userObject.displayTitle}" target="_blank">${item.userObject.displayTitle}</a></h5>
								</c:when>
								<c:otherwise>
		  							<h5>${item.userObject.displayTitle}</h5>
		  						</c:otherwise>
							</c:choose>
							</li>
							<c:forEach items="${item.children}" var="item2" varStatus="loop2">
								<c:if test ="${item2.userObject.visible}" >
									
									<c:forEach items="${item2.children}" var="item3" varStatus="loop3">
										<c:if test ="${item3.userObject.visible}" >
											<li>
												<c:choose>
													<c:when test="${not empty item3.userObject.url   && not item3.userObject.isExtenal}">
														<a href="<wa:url URI="${item3.userObject.url}"><wa:param name="cmid" value="${item3.userObject.contentMenuId}" /></wa:url>"
															title="${item3.userObject.displayTitle}">${item3.userObject.displayTitle}</a>
													</c:when>
													<c:when test="${not empty item3.userObject.url   && item3.userObject.isExtenal}">
														<a href="${item3.userObject.url}"
															title="${item3.userObject.displayTitle}" target="_blank">${item3.userObject.displayTitle}</a>
													</c:when>
													<c:otherwise>
					  									${item3.userObject.displayTitle}
					  								</c:otherwise>
												</c:choose>
											</li>
										</c:if>
									</c:forEach>	
								</c:if>
							</c:forEach>
							</ul>
							<c:set scope="page" value="${col+1}" var="col" />
							<c:if test="${col mod 4 == 0}"></li><li style="list-style-type: none; list-style-image: none;" class="clr"></li></c:if>
						</c:otherwise>
					</c:choose>	
    			
    	</c:forEach>
    </ul>
<div id="bottom">

</div>

