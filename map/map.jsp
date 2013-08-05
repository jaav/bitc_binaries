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
	window.globalLang = '${param['locale']}'.substr(3);

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
                    <c:if test="${param['locale'] == 'BE_fr'}">
					<div class="control-group">
						<label class="radio"> <input type="radio" name="placeType" id="all" value="all" checked> Montrer tous
						</label> <label class="radio h_places"> <input type="radio" name="placeType" id="place" value="ContentPlace"> Montrer lieux
						</label> <label class="radio h_events"> <input type="radio" name="placeType" id="event" value="ContentEvent"> Montrer activités
						</label>
					</div>
					<div class="control-group">
						<select id="zipcode">
							<option value="0">Partout</option>
							<option value="1000">Bruxelles</option>
							<option value="1020">Laeken</option>
							<option value="1030">Schaerbeek</option>
							<option value="1040">Etterbeek</option>
							<option value="1050">Ixelles</option>
							<option value="1060">Saint-Gilles</option>
							<option value="1070">Anderlecht</option>
							<option value="1080">Molenbeek-Saint-Jean</option>
                            <option value="1081">Koekelberg</option>
                            <option value="1082">Berchem-Sainte-Agathe</option>
                            <option value="1083">Ganshoren</option>
							<option value="1090">Jette</option>
							<option value="1140">Evere</option>
							<option value="1150">Woluwe-Saint-Pierre</option>
							<option value="1160">Auderghem</option>
							<option value="1170">Watermael-Boitsfort</option>
							<option value="1180">Uccle</option>
							<option value="1190">Forest</option>
                            <option value="1200">Woluwe-Saint-Lambert</option>
                            <option value="1210">Saint-Josse-ten-Noode</option>
						</select>
					</div>
                    <div class="control-group">
                        <button class="btn btn-primary" type="button" name="filterNow">Filtrer</button>
                    </div>
                    </c:if>
                    <c:if test="${param['locale'] == 'BE_nl'}">
					<div class="control-group">
						<label class="radio"> <input type="radio" name="placeType" id="all" value="all" checked> Toon alles
						</label> <label class="radio h_places"> <input type="radio" name="placeType" id="place" value="ContentPlace"> Toon locaties
						</label> <label class="radio h_events"> <input type="radio" name="placeType" id="event" value="ContentEvent"> Toon activiteiten
						</label>
					</div>
					<div class="control-group">
						<select id="zipcode">
							<option value="0">Overal</option>
							<option value="1000">Brussel</option>
							<option value="1020">Laken</option>
							<option value="1030">Schaarbeek</option>
							<option value="1040">Etterbeek</option>
							<option value="1050">Elsene</option>
							<option value="1060">Sint-Gilles</option>
							<option value="1070">Anderlecht</option>
							<option value="1080">Sint-Jans-Molenbeek</option>
                            <option value="1081">Koekelberg</option>
                            <option value="1082">Sint-Agatha-Berchem</option>
                            <option value="1083">Ganshoren</option>
							<option value="1090">Jette</option>
							<option value="1140">Evere</option>
							<option value="1150">Sint-Pieters-Woluwe</option>
							<option value="1160">Oudergem</option>
							<option value="1170">Watermaal-Bosvoorde</option>
							<option value="1180">Ukkel</option>
							<option value="1190">Vorst</option>
                            <option value="1200">Sint-Lambrechts-Woluwe</option>
                            <option value="1210">Sint-Joost-ten-Node</option>
						</select>
					</div>
					<div class="control-group">
						<button class="btn btn-primary" type="button" name="filterNow">Filteren</button>
					</div>
                    </c:if>
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
            $.mbMap.filterOnBoth(selectedZipcode, selectedPlaceType);

		})
		
	</script>
</body>
</html>