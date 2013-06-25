<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>

    <title>Brussels Interactive Map</title>
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen" href="/bitc/static/front/css/map.css">

    <script src="http://www.google.com/jsapi"></script>
    <script type="text/javascript">
        window.globalLang = 'en';

        google.load("jquery", "1.7.1");
        google.load("maps", "3", {other_params: "sensor=false&language=" + window.globalLang});

        window.globalMapSettings = {
            categoriesOrder: ["services", "food", "fuel", "payment"],
            jsonCategoriesPath: '/bitc/service/google_map/json/categories?title=hotel',
            jsonItemsPath: '/bitc/service/google_map/json/items?title=hotel',
            jsonShopsPath: '/bitc/service/google_map/json/locations?title=hotel',
            canvasElement: 'map_canvas', //The id of the canvas element (div) in which map should be rendered
            lang: window.globalLang,	//The language parameter to call your data on the Mobilosoft platform
            mapZoom: 12,		//The initial zoom factor the map will be shown in
            routingContainer: 'directionsPanel' //The id of the div element where routing steps should be printed
        };
    </script>
    <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
    <script src="http://maps.total.be/locator/js/json2.js"></script>
    <script src="/bitc/static/admin/js/BrusselsMap.js?ts=6"></script>
</head>
<body>

<div>
    <div id="map_canvas_container">
        <div class="well">
            <form class="form-horizontal">
                <div class="control-group">
                    <label class="radio">
                        <input type="radio" name="type" id="all" value="all" checked>
                        Show all
                    </label>
                    <label class="radio">
                        <input type="radio" name="type" id="place" value="place">
                        Show places
                    </label>
                    <label class="radio">
                        <input type="radio" name="type" id="event" value="event">
                        Show events
                    </label>
                </div>
                <div class="control-group">
                    <select>
                        <option value="0">Everywhere</option>
                        <option value="1000">Brussels (1000)</option>
                        <option value="1010">Brussels (1010)</option>
                        <option value="1020">Brussels (1020)</option>
                        <option value="1030">Brussels (1030)</option>
                        <option value="1040">Brussels (1040)</option>
                        <option value="1050">Brussels (1050)</option>
                        <option value="1060">Brussels (1060)</option>
                        <option value="1070">Brussels (1070)</option>
                        <option value="1080">Brussels (1080)</option>
                        <option value="1090">Brussels (1090)</option>
                        <option value="1110">Brussels (1110)</option>
                        <option value="1120">Brussels (1120)</option>
                        <option value="1130">Brussels (1130)</option>
                        <option value="1140">Brussels (1140)</option>
                        <option value="1150">Brussels (1150)</option>
                        <option value="1160">Brussels (1160)</option>
                        <option value="1170">Brussels (1170)</option>
                        <option value="1180">Brussels (1180)</option>
                        <option value="1190">Brussels (1190)</option>
                    </select>
                </div>
                <div class="control-group">
                    <button class="btn btn-primary" type="button">Filter now!</button>
                </div>
            </form>
        </div>
        <div id="map_canvas"></div>
    </div>
</div>
</body>
</html>