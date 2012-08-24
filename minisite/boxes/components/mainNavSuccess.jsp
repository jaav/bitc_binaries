<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="wa" uri="WanabeTags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- NEW SUB NAVIGATION : start--> 
<div id="sub_nav_bg">
	<div id="sub_nav_content">
		<ul id="sub_nav">
			<c:forEach items="${subNav.children}" var="item" varStatus="loop">
				<c:if test ="${item.userObject.visible}" >
		    		<li class="${item.userObject.author} <c:if test="${loop.count>1}">sep</c:if>">
		    			<c:choose>
							<c:when test="${not empty item.userObject.url && item.userObject.isExtenal}">
								<a href="${item.userObject.url}" target="_blank">${item.userObject.displayTitle}</a>
							</c:when>
							<c:when test="${not empty item.userObject.url && not item.userObject.isExtenal}">
								<a href="<wa:url URI="${item.userObject.url}"><wa:param name="cmid" value="${item.userObject.contentMenuId}" /></wa:url>" >${item.userObject.displayTitle}</a>
							</c:when>
							<c:otherwise>
								<a href="javascript:void(0)">${item.userObject.displayTitle}</a>
	       						<div class="level2">
		       						<c:forEach items="${item.children}" var="item2" varStatus="loop2">
										<c:if test ="${item2.userObject.visible}" > 
					           	 			<ul>
								                <li> 
								                	<c:if test="${not empty item2.userObject.displayTitle}">
														<h3>${item2.userObject.displayTitle}</h3>
													</c:if>
								                </li>
								                <c:forEach items="${item2.children}" var="item3" varStatus="loop3">
													<c:if test ="${item3.userObject.visible}" >
										                <li>
											                <c:choose>
																<c:when test="${item3.userObject.isExtenal}">
											                		<a href="${item3.userObject.url}" target="_blank" >${item3.userObject.displayTitle}</a>
											                	</c:when>
											                	<c:otherwise>
											                		<a href="<wa:url URI="${item3.userObject.url}"><wa:param name="cmid" value="${item3.userObject.contentMenuId}" /></wa:url>"  >${item3.userObject.displayTitle}</a>
											                	</c:otherwise>
											                </c:choose>
										                </li>		
													</c:if>
												</c:forEach>
					            			</ul>
							          </c:if>
							       </c:forEach>
						       	</div>
							</c:otherwise>
						</c:choose>	
		    		</li>
		    	</c:if>
		    </c:forEach>
		    <li><a href="/bitc/front/eshop/displayBasket.do" title="<wa:mls>See basket</wa:mls>" style="padding: 6px 0 0 0"><img src="/bitc/static/front/img/ml/icon_basket.png" alt="basket" /></a></li>
		</ul>	
		<script type="text/javascript">
			$("ul#sub_nav > li .level2").css("display", "none")
		</script>
	</div>
</div>
<!-- NEW SUB NAVIGATION : end--> 
