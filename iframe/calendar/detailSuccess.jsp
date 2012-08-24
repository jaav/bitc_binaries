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

<wa:slot id='slotHead'> 
 <link rel="canonical" href="http://visitbrussels.be/front/content/displayDetail/group/${bean.group}/id/${bean.id}"/> 
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" /> 
<link rel="stylesheet" type="text/css" href="${calList.cssFile}" media="screen, projection"/>
<script type="text/javascript" src="${staticSite}/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript"  src="http://maps.google.com/maps/api/js?sensor=false"> </script> 
<script type="text/javascript">   
<c:if test="${bean.latitude != null and bean.longitude != null}">

	function initialize() {
		//alert("initialize");	
			var latlng = new google.maps.LatLng(${bean.latitude}, ${bean.longitude});   
			//alert("lat +" + latlng);
			var myOptions = {      
					zoom: 15,       
					center: latlng,
					mapTypeControl: true,     
					mapTypeControlOptions: {       
						style: google.maps.MapTypeControlStyle.DROPDOWN_MENU     
					},     
					zoomControl: true,     
					zoomControlOptions: {       
						style: google.maps.ZoomControlStyle.LARGE    
					},
					mapTypeId: google.maps.MapTypeId.ROADMAP     
			};     
			var map = new google.maps.Map(document.getElementById("map_canvas"),
					myOptions);  
			var image = '/bitc/static/front/img/ml/btn_map_a.jpg'; 
			var beachMarker = new google.maps.Marker({       
				position: latlng,       
				map: map,
				icon : image
			});
		
		//alert("map :" +map);
		//alert("end initialize");
	}
	$(document).ready(function() {
		initialize();
	});
	</c:if>
	
</script> 
</wa:slot>

<wa:slot id='slotBody'>

<div id="detail">
	<h1 class="title"><a href="visitbrussels.be" target="_blank" title="<wa:mls>VisitBrussels</wa:mls>"><img src="/bitc/static/iframe/img/ml/header.jpg" alt="<wa:mls>VisitBrussels</wa:mls>"/></a></h1>
	<div id="content">
		<!-- <div id="btn_back" ><a href="javascript:history.back();"><wa:mls>Back</wa:mls></a></div> -->
		<h2>${bean.mainTitle}</h2>
		<a href="javascript:history.back();" id="back" ><wa:mls>Back</wa:mls></a>
		<h3>
			<c:choose>
				<c:when test="${bean.periodFromHour eq '00'}">
					<fmt:formatDate pattern="dd/MM/yyyy" value="${bean.periodFromDate}"/>
				</c:when>
				<c:otherwise>
					<fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${bean.periodFromDate}"/>
				</c:otherwise>
			</c:choose>
			- 
			<c:choose>
				<c:when test="${bean.periodToHour eq '00'}">
					<fmt:formatDate pattern="dd/MM/yyyy" value="${bean.periodToDate}"/>
				</c:when>
				<c:otherwise>
					<fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${bean.periodToDate}"/>
				</c:otherwise>
			</c:choose>
		</h3>
		<c:if test="${not empty bean.mainBigImage}">	
	     	<img src="${bean.mainBigImage}" alt="${bean.mainTitle}">
	    </c:if>
	   <p>${bean.mainBody}</p>
	   
	    <div id="pratical_information">
			<h4><wa:mls>Practical informations</wa:mls></h4>
			<div class="address">
			    <c:if test="${not empty bean.address}">
		        	<p>${bean.address}</p>
		      		<p>
		      			<c:if test="${not empty bean.zipcode && bean.zipcode > 0}">
		      				${bean.zipcode}
		      			</c:if>
		      			 <c:if test="${not empty bean.city}">
		      			 	${bean.city}
		      			 </c:if>
		      		</p>
			    </c:if>
		    </div>
		    <div class="offlineData">
		      	<c:if test="${not empty bean.phone}">
		      		 <p><strong><wa:mls>Tel :</wa:mls></strong> ${bean.phone}</p>
		      	</c:if>
		      	<c:if test="${not empty bean.mobile}">
		      		 <p><strong><wa:mls>Mobile :</wa:mls></strong> ${bean.mobile}</p>
		      	</c:if>
		      	<c:if test="${not empty bean.fax}">
		      		 <p><strong><wa:mls>Fax :</wa:mls></strong> ${bean.fax}</p>
		      	</c:if>
		      	<c:if test="${not empty bean.price}">
		       		<p><strong><wa:mls>Price :</wa:mls></strong> ${bean.price}</p>
		       	</c:if>
	       	</div>
	       	<div class="onlineData">
		      	<c:if test="${not empty bean.email}">
		        	<p><a href="mailto:${bean.email}" class="email"><wa:mls>Envoyer un email</wa:mls></a></p>
		       	</c:if>
		        <c:if test="${not empty bean.URLWebsite}">
		        	<p><a href="${bean.URLWebsite}" target="_blank" class="website"><wa:mls>Visiter le website</wa:mls></a></p>
		        </c:if>
	       </div>
	       <div class="clr"></div>
	  </div>
	 
	   
	</div>
	<div id="map_canvas" ></div>     
	<div id="copyright">&copy; ${currentYear} <wa:mls>Découvrez toute l'info sur Bruxelles sur </wa:mls><a href="http://visitbrussels.be" target="_blank">www.visitbrussels.be</a></div> 
</div>


</wa:slot>
