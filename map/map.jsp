<%@ page
        language="java"
        contentType="text/html; charset=utf-8"
        pageEncoding="utf-8"
        isELIgnored="false"
        %>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="wabd" uri="BigDecimalUtilsTags" %>
<%@ taglib prefix="wast" uri="StringToolsTags" %>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<title>Brussels Interactive Map</title>
<link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen" href="/bitc/static/front/css/map.css">

<script src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
	window.globalLang = 'fr';

	google.load("jquery", "1.7.1");
	google.load("maps", "3", {
		other_params : "sensor=false&language=" + window.globalLang
	});

	window.globalMapSettings = {
		jsonShopsPath : '/bitc/service/google_map/json/locations',
		canvasElement : 'map_canvas', //The id of the canvas element (div) in which map should be rendered
		lang : window.globalLang, //The language parameter to call your data on the Mobilosoft platform
		mapZoom : 13, //The initial zoom factor the map will be shown in
		routingContainer : 'directionsPanel' //The id of the div element where routing steps should be printed
	};
    <c:if test="${param['lat'] != null && param['lng'] != null}">
    console.log(${param["lat"]});
    window.globalMapSettings.mapCenter = {
    			lat : ${param['lat']},
    			lng : ${param['lng']}
    		};
    window.globalMapSettings.mapZoom = 18;
    </c:if>
</script>
</head>
<body>

	<div>
		<div id="map_canvas_container">
			<div class="well">
				<form class="form-horizontal">
					<div class="control-group">
						<label class="radio"> <input type="radio" name="placeType" id="all" value="all" checked> Show all
						</label> <label class="radio h_places"> <input type="radio" name="placeType" id="place" value="ContentPlace"> Show places
						</label> <label class="radio h_events"> <input type="radio" name="placeType" id="event" value="ContentEvent"> Show events
						</label>
					</div>
					<div class="control-group">
						<select id="zipcode">
							<option value="0"><wa:mls>Everywhere</wa:mls></option>
							<option value="1000"><wa:mls>Brussels (1000)</wa:mls></option>
							<option value="1010"><wa:mls>Brussels (1010)</wa:mls></option>
							<option value="1020"><wa:mls>Brussels (1020)</wa:mls></option>
							<option value="1030"><wa:mls>Brussels (1030)</wa:mls></option>
							<option value="1040"><wa:mls>Brussels (1040)</wa:mls></option>
							<option value="1050"><wa:mls>Brussels (1050)</wa:mls></option>
							<option value="1060"><wa:mls>Brussels (1060)</wa:mls></option>
							<option value="1070"><wa:mls>Brussels (1070)</wa:mls></option>
							<option value="1080"><wa:mls>Brussels (1080)</wa:mls></option>
							<option value="1090"><wa:mls>Brussels (1090)</wa:mls></option>
							<option value="1110"><wa:mls>Brussels (1110)</wa:mls></option>
							<option value="1120"><wa:mls>Brussels (1120)</wa:mls></option>
							<option value="1130"><wa:mls>Brussels (1130)</wa:mls></option>
							<option value="1140"><wa:mls>Brussels (1140)</wa:mls></option>
							<option value="1150"><wa:mls>Brussels (1150)</wa:mls></option>
							<option value="1160"><wa:mls>Brussels (1160)</wa:mls></option>
							<option value="1170"><wa:mls>Brussels (1170)</wa:mls></option>
							<option value="1180"><wa:mls>Brussels (1180)</wa:mls></option>
							<option value="1190"><wa:mls>Brussels (1190)</wa:mls></option>
						</select>
					</div>
					<div class="control-group">
						<button class="btn btn-primary" type="button" name="filterNow">Filter now!</button>
					</div>
				</form>
			</div>
			<div id="map_canvas"></div>
		</div>
	</div>
	<script src="/bitc/static/admin/js/BrusselsMap.js?ts=6"></script>
	<script type="text/javascript">
		$("button[name=filterNow]").click(function() {
			var selectedPlaceType = $("input[name=placeType]:checked").val();
			var selectedZipcode = $("#zipcode").val();
			$.mbMap.resetFilter();
			if(selectedPlaceType.length > 0) {
				$.mbMap.filterByType(selectedPlaceType);
			}
			if(selectedZipcode > 0) {
				$.mbMap.filterByZip(selectedZipcode);
			}
		})
		
	</script>
</body>
</html>