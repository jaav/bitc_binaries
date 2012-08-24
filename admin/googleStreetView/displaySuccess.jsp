<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false" 
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 

<div id="mainContent">

<div id="list">
	<div id="mask">	 
           <form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm" name="detailForm">
           <input name="id" type="hidden" value="${bean.id}"/>
             <input name="ContentType" type="hidden" value="${ContentType}"/>
			<fieldset>
			 			 
			
						<legend><wa:mls>Google Street View</wa:mls></legend>
					 
						 
							 
						<div class="bgWhite" >
						<c:choose>
							<c:when test="${bean.group eq 'STREET_VIEW'}">
								<div id="pano" style="width: 425px; height: 425px;float:left"></div>
								<div id="panoInfo" style="width: 425px; height: 425px;float:left"> </div>
							</c:when>
							<c:otherwise>
							<div id="pano" style="width: 676px; height: 200px; "></div>
								<div id="panoInfo" style="width: 676px; height: 200px;float:left">  </div>
							</c:otherwise>
						</c:choose>
						</div>
					 	<div class="clr"></div>
						<div class="bgGrey" id="v_svLatitude">
							<label for="f_svLatitude"><wa:mls>latitude</wa:mls></label>
							<textarea name="f_svLatitude" class="textfield" id="latitude_cell">${bean.svLatitude}</textarea>
							<script type="text/javascript">
								var v_svLatitude = new Spry.Widget.ValidationTextarea("v_svLatitude", {isRequired:false});
							</script> 
						</div>
						<div class="bgWhite" id="v_svLongitude">
							<label for="f_svLongitude"><wa:mls>longitude</wa:mls></label>
							<textarea name="f_svLongitude" class="textfield" id="longitude_cell">${bean.svLongitude}</textarea>
							<script type="text/javascript">
								var v_svLongitude = new Spry.Widget.ValidationTextarea("v_svLongitude", {isRequired:false});
							</script> 
						</div>	
						<div class="bgGrey" id="v_svHeading">
							<label for="f_svHeading"><wa:mls>heading</wa:mls></label>
							<textarea name="f_svHeading" class="textfield" id="heading_cell">${bean.svHeading}</textarea>
							<script type="text/javascript">
								var v_svHeading = new Spry.Widget.ValidationTextarea("v_svHeading", {isRequired:false});
							</script> 
						</div>
						<div class="bgWhite" id="v_svPitch">
							<label for="f_svPitch"><wa:mls>pitch</wa:mls></label>
							<textarea name="f_svPitch" class="textfield" id="pitch_cell">${bean.svPitch}</textarea>
							<script type="text/javascript">
								var v_svPitch = new Spry.Widget.ValidationTextarea("v_svPitch", {isRequired:false});
							</script> 
						</div>
						<div class="bgGrey" id="v_svZoom">
							<label for="f_svZoom"><wa:mls>zoom</wa:mls></label>
							<textarea name="f_svZoom" class="textfield" id="zoom_cell">${bean.svZoom}</textarea>
							<script type="text/javascript">
								var v_svZoom = new Spry.Widget.ValidationTextarea("v_svZoom", {isRequired:false});
							</script> 
						</div>
						 
					</fieldset>
						<div id="containerButton">
				<input type="button" name="cancel" id="cancel" class="cancel" value="<wa:mls>Cancel</wa:mls>"/>
				<input type="submit" name="submit" class="submit" value="<wa:mls>Enregistrer</wa:mls>"/>
			</div>
			</form>
			</div> </div></div>
					<script src="//maps.googleapis.com/maps/api/js?sensor=false"
        type="text/javascript"></script>
<script type="text/javascript">

var place = new google.maps.LatLng(${bean.svLatitude},${bean.svLongitude});
 
	 var panoramaOptions = {
		      position: place,
		      pov: {
		        heading: ${bean.svHeading},
		        pitch: ${bean.svPitch},
		        zoom: ${bean.svZoom}
		      },
		      visible: true
		    };
	var panorama = new google.maps.StreetViewPanorama($("pano"), panoramaOptions);
	google.maps.event.addListener(panorama, 'pov_changed', function() {
        $('heading_cell').value = panorama.getPov().heading;
        $('pitch_cell').value = panorama.getPov().pitch;
        $('zoom_cell').value = panorama.getPov().zoom;
    });
	google.maps.event.addListener(panorama, 'position_changed', function() {
        var position =  panorama.getPosition();
        $('latitude_cell').value = position.lat();
        $('longitude_cell').value = position.lng();
    });
 
</script>
 