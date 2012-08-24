<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="wadt" uri="DateToolsTags" %>
<div id="btn_back"><a href="javascript:history.back()"><wa:mls>Back</wa:mls></a></div>
  <!--btnback:end-->
  <div class="clear"></div>
	  <div id="content_main">
			<wa:include URI="front/content/introList" />
			<c:choose>
				<c:when test="${group eq 'BnB'}">
					<wa:include URI="front/content/findBnB" >
						<wa:param name="group" value="${group}"/>
					</wa:include>
					<wa:include URI="front/content/listBookingSearch">
						<wa:param name="group" value="${group}"/>
					</wa:include>
				</c:when>
				<c:otherwise>
				<!-- Recherche d'hôtels -->
					<iframe src ="http://www.booking.com/searchresults.${culture.language}.html?ssai=1;aid=325807;order=class;ssre=1;do_availability_check=on;si=ai,co,ci,re;checkin_monthday=${wadt:formatDateByPattern(s_periodFromDate,'dd')};checkin_year_month=${wadt:formatDateByPattern(s_periodFromDate,'yyyy-MM')};checkout_monthday=${wadt:formatDateByPattern(s_periodToDate,'dd')};checkout_year_month=${wadt:formatDateByPattern(s_periodToDate,'yyyy-MM')};class_interval=1;offset=0;score_min=0;si=ai,co,ci,re,di;ss=hotel_id:${hotelIds};city=-1955538;origin=disamb;srhash=1777195148;srpos=1" width="620" height="2750" >
					</iframe>
			</c:otherwise>
			</c:choose>
      </div>
