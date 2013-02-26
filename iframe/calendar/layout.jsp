<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>VisitBrussels.be</title>
	<wa:includeSlot template='${template}' id='slotHead' />
</head>
<body id="calendar">
	<wa:includeSlot template='${template}' id='slotBody' />

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


</body>
</html>
