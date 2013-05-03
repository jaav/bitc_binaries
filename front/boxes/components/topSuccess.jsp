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
											                		<a href="${item3.userObject.url}" target="_blank">${item3.userObject.displayTitle}</a>
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
	    <form id="f_search" action="${context}/${site}/search/display.do" method="get">
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
	    <a class="btn_lang" href="/bitc/static/front/pdf/cn_guide.pdf">CN</a>
		</div>
		
		
       
	 	<div id="top_slideshow">
	 		<div id="top_btns">
	 	     <%--a href="http://itunes.apple.com/be/app/visit-brussels/id479495930?l=fr&mt=8" class="btn_mobile" target="_blank">
			 <img src="/bitc/static/front/img/${culture.language}/btn_top_iphone.png" /></a--%>
             <span class="btn_mobile">
                 <img src="/bitc/static/front/img/button_app_left.png" /></span>
             <a href="https://play.google.com/store/apps/details?id=be.visitbrussels.VisitBrussels" class="btn_android" target="_blank">
                 <img src="/bitc/static/front/img/button_app_top_google_play.png" /></a>
             <a href="http://itunes.apple.com/be/app/visit-brussels/id479495930?l=fr&mt=8" class="btn_ios" target="_blank">
                 <img src="/bitc/static/front/img/button_app_bottom_appstore.png" /></a>
			 <a href="javascript:void(0);" class="btn_video"><img src="/bitc/static/front/img/${culture.language}/btn_top_video.png" /></a>
			 <a href="/bitc/front/streetView/displayTop.do" class="btn_sv"><img src="/bitc/static/front/img/${culture.language}/btn_top_sv.png" /></a>
			 
			</div>
			
			<div id="nav_btns">
				<a class="prevSlide" href="javascript:void(0);"><img src="/bitc/static/front/img/ml/btn_top_prev.png" /></a>
				<a class="pauseSlide" href="javascript:void(0);"><img src="/bitc/static/front/img/ml/btn_top_pause.png" /></a>
				<a class="nextSlide" href="javascript:void(0);"><img src="/bitc/static/front/img/ml/btn_top_next.png" /></a>
				
			</div>
			 <c:if test="${nameCongressiste!=null }">
            <div id="top_bg_topname" style="width:${taille}px; text-align:center" > 
            
           
            <span>sized for </span><span style ="color:${colorCongressiste};" class="congresstitle">${nameCongressiste}</span>
			 
            </div>
			 <div id="top_bg_toplogo">
				 <a href="${urlCongressiste}" target="blank">
			      <img src="${logoCongressiste}" height="318px" width="240px"/></a>
             </div>	 
		</c:if>	 
	 		<div class="items">
		   		<c:forEach items="${imgsTop}" var="item" varStatus="loop">
	   				<div>
	   					<img src="${item}" />
	   					
	   				</div>
	   			 
		   		</c:forEach>
	   	 	</div>
	   	</div>
	    <div id="top_bg_adn">
	
        </div>
          
    </div>
    
</div>

<script type="text/javascript">
/*header status */
<c:choose><c:when test="${module eq 'home' or (action eq 'displayDeals') or (module eq 'propertyValue' and action eq 'display')}"> openedTop=true;</c:when><c:otherwise>openedTop=false;</c:otherwise></c:choose>

$(".btn_lang").click(function() {
	setNavigatorClt();
});
function setNavigatorClt(){
	$.cookies.set('navigator_clt', '0', {path : '/', hoursToLive: 24})
}
</script>
<div id="collapse">
	 
			
	 
  <img src="/bitc/static/front/img/ml/headerLoader.gif" title="Loading..." alt="Loading..." id="loader" />
   <c:if test="${nameCongressiste!=null }">
  <div id="expand_contentCong"><div id="g_map"></div></div>
   </c:if>
  
 
   <c:if test="${nameCongressiste==null }">
   <div id="expand_content"><div id="g_map"></div></div>
   </c:if>
  <div id="collapse_content"><img src="${imgSmall}" title="" alt="" /></div>
 
</div>