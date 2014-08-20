<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Language" content="${culture.language}" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="KEYWORDS" content="" />
	<meta name="DESCRIPTION" content="" />
	<script type="text/javascript" src="${staticSite}/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="${staticSite}/js/jquery-tools.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${staticSite}/css/screen.css" media="screen, projection"/>
	<link rel="stylesheet" type="text/css" href="${staticSite}/css/print.css" media="print"/>
	<title>BITC</title>
</head>
<body id="splash">
	<jsp:include page="/${template}" />

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


</body>
</html>
