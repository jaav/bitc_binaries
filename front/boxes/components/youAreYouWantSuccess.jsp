<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script type="text/javascript">
jQuery(document).ready(function() {
	//JCAROUSEL - EXPERIENCE
		// Jcarousel 
		function mycarousel_initCallback(carousel) {
			jQuery('.jcarousel-control a').bind('click', function() {
				carousel.scroll(jQuery.jcarousel.intval(jQuery(this).text()));
				return false;
			});
			jQuery('#mycarousel-next').bind('click', function() {
				carousel.next();
				return false;
			});
		
			jQuery('#mycarousel-prev').bind('click', function() {
				carousel.prev();
				return false;
			});
		};
		jQuery("#mycarousel").jcarousel({							
			scroll: 1,
			initCallback: mycarousel_initCallback,
			wrap:"circular"
		});
		// Jcarousel2 
		function mycarousel_initCallback1(carousel1) {
			jQuery('.jcarousel-control a').bind('click', function() {
				carousel1.scroll(jQuery.jcarousel.intval(jQuery(this).text()));
				return false;
			});
			jQuery('#mycarousel-next1').bind('click', function() {
				carousel1.next();
				return false;
			});
			jQuery('#mycarousel-prev1').bind('click', function() {
				carousel1.prev();
				return false;
			});
			// Smart Tab 
			$('#experience').smartTab({autoProgress: false,stopOnFocus:true,transitionEffect:'fade', progressInterval: 5000});
		};
		jQuery("#mycarousel1").jcarousel({
			scroll: 1,
			initCallback: mycarousel_initCallback1,
			wrap:"circular"
		});
});
</script>
<!-- component experience:start -->
    <div id="experience" class="stContainer">
        <ul id="tabs">
            <li>
                <a href="#tabs-1" id="tab1"><span><wa:mls>You are</wa:mls></span></a>
            </li>
            <li>
                <a href="#tabs-2" id="tab2"><span><wa:mls>You want</wa:mls></span></a>
            </li>
        </ul>
        <div id="tabs-1">
        	<a href="javascript:void(0)" id="mycarousel-prev"><img src="${staticSite}/img/ml/arrow_left_promo.jpg" alt="previous"/></a>
                <ul id="mycarousel" class="first-and-second-carousel jcarousel-skin-tango">
                	<c:forEach items="${listProfiles}" var="profile" varStatus="loop">
						<li>
							<a href="/bitc/${site}/propertyValue/display/id/${profile.valueId}/lg/${culture.language}.do"><img width="65" height="65" src="${staticSite}/img/ml/picto_${profile.logo}.png" alt="${profile.mainTitle}" /><br />${profile.mainTitle}</a>
						</li>
					</c:forEach>
               </ul>
            <a href="javascript:void(0)" id="mycarousel-next"><img src="${staticSite}/img/ml/arrow_right_promo.jpg" alt="next"/></a>
      </div>
      <div id="tabs-2" style="display:block">
        	<a href="javascript:void(0)" id="mycarousel-prev1"><img src="${staticSite}/img/ml/arrow_left_promo.jpg" alt="previous"/></a>
                <ul id="mycarousel1" class="first-and-second-carousel jcarousel-skin-tango">
                	<c:forEach items="${listExperiences}" var="experience" varStatus="loop">
						<li><a href="/bitc/${site}/propertyValue/display/id/${experience.valueId}/lg/${culture.language}.do"><img width="65" height="65" src="${staticSite}/img/ml/picto_${experience.logo}.png" alt="${experience.mainTitle}" /><br />${experience.mainTitle}</a></li>
					</c:forEach>
             	</ul>
            <a href="javascript:void(0)" id="mycarousel-next1"><img src="${staticSite}/img/ml/arrow_right_promo.jpg" alt="next"/></a>
      </div>                      
  	</div>
