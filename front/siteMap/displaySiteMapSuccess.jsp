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
<div id="btn_back"><a href="javascript:history.back()"><wa:mls>Back</wa:mls></a></div>
  <!--btnback:end-->
 <div class="clear"></div>
 <div id="content_main">
<h1 class="line_grey"><wa:mls>Site Map</wa:mls></h1>
    <div id="sitemap">
    	<ol class="level_one">
    	<li><a href="<wa:url URI="front/home/display/section/visiteur/lg/${culture.language}"/>"><wa:mls>Home</wa:mls></a></li>
    	    <c:forEach items="${mapNav1.children}" var="item" varStatus="loop">
    	    <c:if test ="${item.userObject.visible}" >
				<li>
					<c:choose>
						<c:when test="${not empty item.userObject.url && item.userObject.isExtenal}">
								<a href="${item.userObject.url}" target="_blank">${item.userObject.displayTitle}</a>
						</c:when>
						<c:when test="${not empty item.userObject.url && not item.userObject.isExtenal}">
								<a href="<wa:url URI="${item.userObject.url}"><wa:param name="cmid" value="${item.userObject.contentMenuId}" /></wa:url>" >${item.userObject.displayTitle}</a>
						</c:when>
						<c:otherwise>
				  				<a href="#">${item.userObject.displayTitle}</a>
				  		</c:otherwise>
					</c:choose>
				</li>
				
			 	 <ol class="level_two">
					<c:forEach items="${item.children}" var="item2" varStatus="loop2">
					<c:if test ="${item2.userObject.visible}" >
						<c:choose>
						<c:when test="${not empty item2.userObject.url  ||  (item2.userObject.displayTitle ne ' ' && not empty item2.userObject.displayTitle)}">
							<li>
								<c:choose>
									<c:when test="${not empty item2.userObject.url && item2.userObject.isExtenal}">
										<a href="${item2.userObject.url}" target="_blank">${item2.userObject.displayTitle}</a>
									</c:when>
									<c:when test="${not empty item2.userObject.url && not item2.userObject.isExtenal}">
										<a href="<wa:url URI="${item2.userObject.url}"><wa:param name="cmid" value="${item2.userObject.contentMenuId}" /></wa:url>" >${item2.userObject.displayTitle}</a>
									</c:when>
									<c:otherwise>
										<a href="#">${item2.userObject.displayTitle}</a>
									</c:otherwise>
						       </c:choose>
			              </li>
		              </c:when>
					</c:choose>
		              <ul class="level_three">
			              <c:forEach items="${item2.children}" var="item3" varStatus="loop3">
			              <c:if test ="${item3.userObject.visible}" >
			              <li>
								<c:choose>
									<c:when test="${not empty item3.userObject.url && item3.userObject.isExtenal}">
										<a href="${item3.userObject.url}" target="_blank">${item3.userObject.displayTitle}</a>
									</c:when>
									<c:when test="${not empty item3.userObject.url && not item3.userObject.isExtenal}">
										<a href="<wa:url URI="${item3.userObject.url}"><wa:param name="cmid" value="${item3.userObject.contentMenuId}" /></wa:url>" >${item3.userObject.displayTitle}</a>
									</c:when>
									<c:otherwise>
							  			<a href="#">${item3.userObject.displayTitle}</a>
							  		</c:otherwise>
						       </c:choose>
			                </li>
			                </c:if>
			              </c:forEach>
		              </ul>
		             </c:if>
					</c:forEach>
			    </ol>
			</c:if>
			</c:forEach>
			 <c:forEach items="${mapNav2.children}" var="item" varStatus="loop">
    	    <c:if test ="${item.userObject.visible}" >
				<li>
					<c:choose>
						<c:when test="${not empty item.userObject.url && item.userObject.isExtenal}">
								<a href="${item.userObject.url}" target="_blank">${item.userObject.displayTitle}</a>
						</c:when>
						<c:when test="${not empty item.userObject.url && not item.userObject.isExtenal}">
								<a href="<wa:url URI="${item.userObject.url}"><wa:param name="cmid" value="${item.userObject.contentMenuId}" /></wa:url>" >${item.userObject.displayTitle}</a>
						</c:when>
						<c:otherwise>
				  				<a href="#">${item.userObject.displayTitle}</a>
				  		</c:otherwise>
					</c:choose>
				</li>
				
			 	 <ol class="level_two">
					<c:forEach items="${item.children}" var="item2" varStatus="loop2">
					<c:if test ="${item2.userObject.visible}" >
						<c:choose>
						<c:when test="${not empty item2.userObject.url && item2.userObject.isExtenal}">
						<li>
							<c:choose>
								<c:when test="${not empty item2.userObject.url && item2.userObject.isExtenal}">
								<a href="${item2.userObject.url}" target="_blank">${item2.userObject.displayTitle}</a>
								</c:when>
								<c:when test="${not empty item2.userObject.url && not item2.userObject.isExtenal}">
										<a href="<wa:url URI="${item2.userObject.url}"><wa:param name="cmid" value="${item2.userObject.contentMenuId}" /></wa:url>" >${item2.userObject.displayTitle}</a>
								</c:when>
								<c:otherwise>
						  				<a href="#">${item2.userObject.displayTitle}</a>
						  		</c:otherwise>
					       </c:choose>
		              </li>
		              </c:when>
					</c:choose>
		              <ul class="level_three">
			              <c:forEach items="${item2.children}" var="item3" varStatus="loop3">
			              <c:if test ="${item3.userObject.visible}" >
			              <li>
								<c:choose>
									<c:when test="${not empty item3.userObject.url && item3.userObject.isExtenal}">
									<a href="${item3.userObject.url}" target="_blank">${item3.userObject.displayTitle}</a>
									</c:when>
									<c:when test="${not empty item3.userObject.url && not item3.userObject.isExtenal}">
											<a href="<wa:url URI="${item3.userObject.url}"><wa:param name="cmid" value="${item3.userObject.contentMenuId}" /></wa:url>" >${item3.userObject.displayTitle}</a>
									</c:when>
									<c:otherwise>
							  				<a href="#">${item3.userObject.displayTitle}</a>
							  		</c:otherwise>
						       </c:choose>
			                </li>
			                </c:if>
			              </c:forEach>
		              </ul>
		             </c:if>
					</c:forEach>
			    </ol>
			</c:if>
			</c:forEach>
		</ol>
		
    </div>
    
	

  
 </div>