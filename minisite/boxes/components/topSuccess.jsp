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
<div id="top">
	<div id="top_bg"></div>
  	<div id="top_content">
  	<!-- NEW TOP NAVIGATION : start -->
  	<ul id="top_nav">
	    <li class="home"><a href="<wa:url URI="front/home/display/section/visiteur/lg/${culture.language}"/>"><wa:mls>Home</wa:mls></a></li>
	    <c:forEach items="${topNav.children}" var="item" varStatus="loop">
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
	</ul>
	<script type="text/javascript">
		$("ul#top_nav > li .level2").css("display", "none")
	</script>
  	<!-- NEW TOP NAVIGATION : end -->
	    <form id="f_search" action="${context}/front/search/display.do" method="get">
	      <input id="f_search_textfield" name="f_search_query" type="text" title="<wa:mls>Rechercher</wa:mls>"  />
	      <input id="f_search_submit" name="f_search_submit" value="" type="submit" alt="<wa:mls>Rechercher</wa:mls>" />
	    </form>
	    <div class="clear"></div>
	    <div id="box_btn_lg">
	    	<c:forEach var="otherLanguagesItem" items="${otherLanguages}" varStatus="loop">
				<a class="btn_lang" href="<wa:url URI="${URI}" allParams="true">
					<wa:exceptParam name="clt"/>
					<wa:exceptParam name="lg"/>
					<wa:exceptParam name="cty"/>
					<wa:param name="clt" value="BE_${otherLanguagesItem}"/>
					</wa:url><c:if test="${not empty otherParam}">?${otherParam}</c:if>">${fn:toUpperCase(otherLanguagesItem)}</a>
			</c:forEach>
		</div>
		
		<div id="top_bg_adn"></div>
		
    </div>
    
</div>

<script type="text/javascript">
/*header status */
openedTop=false;

$(".btn_lang").click(function() {
	setNavigatorClt();
});
function setNavigatorClt(){
	$.cookies.set('navigator_clt', '0', {path : '/', hoursToLive: 24})
}
</script>
<div id="collapse">
  <div id="expand_content"><div id="g_map"></div></div>
  <div id="collapse_content"><img src="${imgSmall}" title="" alt="" /></div>
</div>