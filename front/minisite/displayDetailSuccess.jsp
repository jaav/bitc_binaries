<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false"
	%>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="wabd" uri="BigDecimalUtilsTags" %>
<%@ taglib prefix="wast" uri="StringToolsTags" %>


<style type="text/css" media="screen">
	@import url("${static}/front/css/nyroModal.css");
	@import url("http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css");
	@import url("/bitc/map.css");
</style>
<script type="text/javascript" src="${static}/front/js/jquery.nyroModal-1.6.1.pack.js"></script>
<!--
<div id="btn_back"><a href="javascript:history.back()"><wa:mls>Back</wa:mls></a></div>
-->
<div class="clear"></div>
<div id="content_main">

	<div id="main_information">
		<div class="minisite">
			${bean.mainBody}
		</div>
		<c:if test="${boxOffice ne null && boxOffice eq true}">
			<div style="position: relative;float: left;">
				<a class="btn_buy_ticket" href="javascript:forwardToBoxofficeFrame('${bean.officeBookingURL}')"></a>
			</div>
			<script language='javascript'>
				function forwardToBoxofficeFrame(officeURL) {
					$.nyroModalManual({
						zIndex: 1001,
						minWidth: 690,
						minHeight: 510,
						forceType: 'iframe',
						closeSelector: '.nyroModalClose',
						url: officeURL,
						closeButton: '<a href="#" class="nyroModalClose" id="closeBut"><img src="${static}/front/img/ml/close.png" alt="close" /></a>'
					});
				}
			</script>
		</c:if>
	</div>
</div>

