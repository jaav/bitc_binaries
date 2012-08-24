<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="wa" uri="WanabeTags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">






<!-- Include Header -->
<wa:include URI="front/boxes/header" />
<body >
<c:if test="${adminUser != null}">
	<p> <a
		href="<wa:url  site="admin" module="mlss" action="mlssList" />?s_lg=${fn:toUpperCase(culture.language)}&s_page=${site}/${module}/${action}&s_submit=Rechercher"
		target="admin" style="font-size: 13px; color: grey"> Editer le
	contenu MLSS de la page </a> &nbsp;|&nbsp; UserId : ${user.userId} - Status
	: ${user.loginStatus} &nbsp;|&nbsp;<span>Url = <a
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
<!-- Include top -->
<wa:include URI="front/boxes/top" />
<wa:include URI="front/boxes/topFlashXml" />
<!--mainnav:start-->

<wa:include URI="${site}/boxes/mainNav" />

<!--mainnav:end-->
<!--header:end-->



<!--content:start-->
<div id="content"> <img
	src="${staticSite}/img/ml/visu_top_print_css.jpg" class="top_print" />
<!--breadcrump:start--> <!-- Include breadcrump --> 
<div class="clear"></div>
<wa:include	URI="${site}/boxes/breadcrump" /> <!--breadcrump:end--> 
	<div class="clear"></div> <!--contentMain:start--> 
	<jsp:include page="/${template}" /> 
	<div class="clear"></div>
	<!--contentMain:end--> <!--contentSub:start-->
<div id="content_sub"> 
<!-- <div id="nav_trip_planner"> 
	<img src="${staticSite}/img/${culture.language}/title_nav_trip_planner.jpg" alt="My trip"/>
	<wa:include URI="front/rfpWithPro/myTrip">
		<wa:param name="userId" value="${ProPlannerUserId}"/>
	</wa:include>
	<a href="<wa:url URI="${site}/${module }/displayFormDescEvent/id/${cryptUserId}"/>" class="btn"><wa:mls>Send your RFP To Pro</wa:mls></a>
</div>
 -->
</div>
<!--contentSub:end--> 
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

<!--  ADD THIS  -->
<!-- AddThis  BEGIN -->
<script type="text/javascript">
var addthis_config = {
    data_track_clickback: true,
    ui_click:true
    //Addthis => Google Analytics 
    //data_ga_tracker: pageTracker
}
</script>
<script type="text/javascript"
	src="http://s7.addthis.com/js/250/addthis_widget.js#username=wanabe"></script>
<!-- AddThis  END -->
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
</body>
<script type="text/javascript">
      	function setListOfDate(){
      		var Month_Years = new Array();
      		d = new Date();
      		alert("aaaa");
      	}
</script>
</html>