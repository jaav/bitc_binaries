<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="wa" uri="WanabeTags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml">


<!-- Include Header -->
<wa:include URI="front/boxes/header" />
<body>

<c:if test="${adminUser != null}">
	<p> <a
		href="<wa:url  site="admin" module="mlss" action="mlssList" />?s_lg=${fn:toUpperCase(culture.language)}&s_page=${site}/${module}/${action}&s_submit=Rechercher"
		target="admin" style="font-size: 13px; color: grey"> Editer le
	contenu MLSS de la page </a> &nbsp;|&nbsp; UserId : ${user.userId} - Status
	: ${user.loginStatus} - loggedWithFacebook ? : ${loggedWithFacebook}&nbsp;|&nbsp;<span>Url = <a
		href="${context}/admin/mlrs/editItem.do?rurl=${encodedRewrittenUrl}&f_clt=${culture}"
		target="_blank">${rewrittenUrl}</a></span> &nbsp;|&nbsp;<span><a
		href="${context}/admin/meta/editItem.do?ruri=${encodedRewrittenUri}&f_clt=${culture}"
		target="_blank">meta</a></span></p>
</c:if>
<!-- stylesheets-->
<!-- Variables used by banners Machine -->
<script type='text/javascript'>
var m3_u ='';
var m3_r = 0;
</script>

<!-- center site for 1024 -->
<script type="text/javascript">
jQuery(document).ready(function() {
		scrollBy(($('#content').width()-$('body').width())/2,0);
});
window.onload=function(){
	scrollBy(($('#content').width()-$('body').width())/2,0);	
}						
</script>

<!-- Include top -->
<wa:include URI="front/boxes/top" />
<!--mainnav:start-->

<wa:include URI="${site}/boxes/mainNav" />

<!--mainnav:end-->
<!--header:end-->



<!--content:start-->
<div id="content"> 
	<img src="${staticSite}/img/ml/visu_top_print_css.jpg" class="top_print" alt="visu_top" />
		<!--breadcrump:start--> 
		<!-- Include breadcrump --> 
			<wa:include	URI="${site}/boxes/breadcrump" /> 
		<!--breadcrump:end--> 
			<div class="clear"></div> 
		<!--contentMain:start--> 
			<jsp:include page="/${template}" /> 
		<!--contentMain:end--> 
	
	
	<div class="clr"></div> 
</div>
<!--content:end-->
<!--navSub:start-->
<div id="nav_sub"> <div id="nav_sub_content"> <!-- Include bottom -->
<wa:include URI="${site}/boxes/bottom" /> </div> </div>
<!--navSub:end-->
<!--footer:start-->
<!-- Include footer -->
<wa:include URI="${site}/boxes/footer" />
<!--footer:end-->
<c:if test="${config['facebook.isactive']==1}">
<wa:include URI="${site}/boxes/facebookConnect" />
</c:if>


<!-- Google Analytics START -->
<script type="text/javascript">
	var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
	document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
	var pageTracker = _gat._getTracker("${google_analytics_code}");
	pageTracker._setLocalRemoteServerMode();
	pageTracker._trackPageview();
</script>
<!-- Google Analytics END -->

<!-- Code Google de la balise de remarketing -->
<!--------------------------------------------------
Les balises de remarketing ne peuvent pas être associées aux informations personnelles ou placées sur des pages liées aux catégories à caractère sensible. Pour comprendre et savoir comment configurer la balise, rendez-vous sur la page http://google.com/ads/remarketingsetup.
--------------------------------------------------->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 994890786;
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/994890786/?value=0&amp;guid=ON&amp;script=0"/>
</div>
</noscript>


<!-- Piwik -->
<script type="text/javascript">
var pkBaseURL = (("https:" == document.location.protocol) ? "https://analytics.modul.ac.at/" : "http://analytics.modul.ac.at/");
document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
</script><script type="text/javascript">
try { var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 15); piwikTracker.trackPageView(); piwikTracker.enableLinkTracking(); } catch( err ) {}
</script><noscript><p><img src="http://analytics.modul.ac.at/piwik.php?idsite=15" style="border:0" alt="" /></p></noscript>
<!-- End Piwik Tracking Code -->

<!--  ADD THIS  -->
<!-- AddThis  BEGIN -->
<script type="text/javascript">
var addthis_config = {
    data_track_clickback: true,
    data_ga_tracker: pageTracker,
    ui_click:true
}
</script>
<script type="text/javascript"
	src="http://s7.addthis.com/js/250/addthis_widget.js#username=wanabe"></script>
<!-- AddThis  END -->
</body>
</html>