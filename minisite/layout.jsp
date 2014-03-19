<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	
<%@ taglib prefix="wa" uri="WanabeTags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://ogp.me/ns#">

<!-- Include Header -->
<wa:include URI="${site}/boxes/header" />
<body id="${waParam.name}" class="minisite">
<c:if test="${adminUser != null}">
	<p> <a
		href="<wa:url  site="admin" module="mlss" action="mlssList" />?s_lg=${fn:toUpperCase(culture.language)}&s_page=${site}/${module}/${action}&s_submit=Rechercher"
		target="admin" style="font-size: 13px; color: grey"> Editer le
	contenu MLSS de la page </a> &nbsp;|&nbsp; UserId : ${user.userId} - Status
	: ${user.loginStatus} - loggedWithFacebook ? : ${loggedWithFacebook}&nbsp;|&nbsp;<span>Url = <a
		href="${context}/admin/mlrs/editItem.do?rurl=${encodedRewrittenUrl}&f_clt=${culture}"
		target="_blank">/bitc${rewrittenUrl}</a></span> &nbsp;|&nbsp;<span><a
		href="${context}/admin/meta/editItem.do?ruri=${encodedRewrittenUri}&f_clt=${culture}"
		target="_blank">meta</a></span></p> 
</c:if>
<!-- stylesheets-->
<!-- Variables used by banners Machine -->
<script type='text/javascript'>
var m3_u ='';
var m3_r = 0;
minisiteName = '${waParam.name}';
</script>
<!-- Include top -->
<wa:include URI="${site}/boxes/top" />

<!--mainnav:start-->

<wa:include URI="${site}/boxes/mainNav" />

<!--mainnav:end-->
<!--header:end-->



<!--content:start-->
<div id="content"> 
	
		<!-- top2:start--> 
		<wa:include	URI="${site}/boxes/top2" />
		<!--top2:end--> 
			<div class="clear"></div>  
		<!--contentMain:start--> 
			<jsp:include page="/${template}" /> 
		<!--contentMain:end--> 
		<!--contentSub:start-->
			<div id="content_sub"> 
				<div id="right_content">				
					<wa:include URI="${site}/boxes/rightColumn" >
						<wa:param name="section" value="${section}" />
					</wa:include>
				</div>
			</div> 
		<!--contentSub:end--> 
	
	<div class="clr"></div> 
</div>
<!--content:end-->
<!--bottom theme:start-->

<div>
	<div id="ribbon_bottom"></div>
	<!--navSub:start-->
	<div id="nav_sub"> 
		<div id="nav_sub_content"> <!-- Include bottom -->
		<wa:include URI="front/boxes/bottom" /> 
		</div> 
		</div>
	<!--navSub:end-->
	<!--footer:start-->
	
		<wa:include URI="front/boxes/footer" />
	<!--footer:end-->
	</div>

<!--bottom theme:end-->



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
<script language='javascript'>
    function openIFrame(contentURL) {
        $.nyroModalManual({
            zIndex: 1001,
            minWidth: 690,
            minHeight: 510,
            forceType: 'iframe',
            closeSelector: '.nyroModalClose',
            url: contentURL,
            closeButton: '<a href="#" class="nyroModalClose" id="closeBut"><img src="${static}/front/img/ml/close.png" alt="close" /></a>'
        });
    }
</script>
<script type="text/javascript"
	src="http://s7.addthis.com/js/250/addthis_widget.js#username=wanabe"></script>
<!-- AddThis  END -->
</body>
</html>