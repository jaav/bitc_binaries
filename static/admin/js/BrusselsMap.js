function BrusselsMap(opts) {
	var options = $.extend({
		canvasElement : 'map_canvas', // Canvas element where map should be
										// printed
		shopsCallbackName : 'shopsCallback', // used in cross-domain jsonp
												// calls
		itemsCallbackName : 'itemsCallback', // used in cross-domain jsonp
												// calls
		categoriesCallbackName : 'categoriesCallback', // used in cross-domain
														// jsonp calls
		region : 'be', // used in geocoder requests
		lang : 'en', // Default language
		mapCenter : {
			lat : 50.846747,
			lng : 4.352455
		},
		mapTypeId : google.maps.MapTypeId.ROADMAP, // Map Type SATTELITE,
													// ROADMAP ....
		mapZoom : 10, // Map Zoom
		renderInfoTemplateFunction : null, // function (dataToRender) { }
		routingContainer : 'directionsPanel' // The id of the div element
												// where routing steps should be
												// printed
	}, opts),

	shops = {}, map, markers = [], geocoder, infoWindow, activeMarker, lastServiceFilter, lastSelectedPlaceType;

	function bind(event, callback) {
		$(document).bind('mmap:' + event, callback);
	}

	function trigger(event, data) {
		$(document).trigger('mmap:' + event, data);
	}
	
	function resetFilter() {
		$.each(markers, function() {
			this.setVisible(true);
		})
	}
	function filterByZip(selectedZipcode) {
		$.each(markers, function() {
			if(this.info.zipcode !== selectedZipcode)
				this.setVisible(false);
		})
	}

	function filterByType(selectedPlaceType) {
		$.each(markers, function() {
			if(selectedPlaceType !== 'all' && this.info.type !== selectedPlaceType) {
				this.setVisible(false);
			}
		})
	}

	function filterOnBoth(selectedZipcode, selectedPlaceType){
		$.each(markers, function() {
			if(this.info.type !== selectedPlaceType || this.info.zipcode !== selectedZipcode) {
				this.setVisible(false);
			}
		})
	}

	function applyServiceFilter() {
		var selectedServices = lastServiceFilter
				&& JSON.parse(lastServiceFilter), len;

		if (!selectedServices)
			return;

		len = selectedServices.length;

		$.each(markers, function() {
			var shopServices = this.info.itemList, match = true;
			if (shopServices) {
				for ( var i = 0; i < len; i++) {
					if (($.inArray(selectedServices[i], shopServices)) < 0) {
						match = false;
						break;
					}
				}
			} else
				match = false;

			this.setVisible(match);
		})
	}

	function getLocalizedText(textObject) {
		if (textObject) {
			if (textObject.values.hasOwnProperty(options.lang)) {
				return textObject.values[options.lang];
			}
		}

		return "";
	}

	function getOptions() {
		return options;
	}

	function init() {
		/*options.jsonShopsPath = options.jsonShopsPath.replace('%lang%',
				options.lang);
		options.jsonItemsPath = options.jsonItemsPath.replace('%lang%',
				options.lang);
		options.jsonCategoriesPath = options.jsonCategoriesPath.replace(
				'%lang%', options.lang);*/

		var mapOptions = {
			zoom : options.mapZoom,
			center : new google.maps.LatLng(options.mapCenter.lat,
					options.mapCenter.lng),
			mapTypeId : options.mapTypeId
		};

		map = new google.maps.Map(document
				.getElementById(options.canvasElement), mapOptions);

		directionsRenderer = new google.maps.DirectionsRenderer();
		directionsRenderer.setMap(map);
		directionsRenderer.setPanel(document
				.getElementById(options.routingContainer));

		google.maps.event.addListener(directionsRenderer, 'directions_changed',
				function() {
					trigger('route', {
						distance : computeTotalDistance()
					});
				});

		directionsService = new google.maps.DirectionsService();
		geocoder = new google.maps.Geocoder();
		infoWindow = new google.maps.InfoWindow();
		$('#moreCriteria').click(function(ev) {
			ev.preventDefault();
			$('#search-services').slideToggle();
		});

		loadData();
	}

	function loadData() {

		function onShopsLoad(json) {
			// shops = json.shops;

			$.each(json, function() {
				makeMarker(this);
			});

			applyServiceFilter();
		}

		$.ajax({
			url : options.jsonShopsPath,
			dataType : "jsonp",
			jsonpCallback : options.shopsCallbackName,
			cache : false,
			success : onShopsLoad,
			error : function(a, b, c) {
				var test = c;
				alert(c);
			}
		});
	}

	function makeMarker(shop) {
		var t_icon = null;
		if(shop.type == 'ContentEvent') {
			t_icon = new google.maps.MarkerImage(
					'/bitc/static/front/img/green_pin.png', new google.maps.Size(24, 24), new google.maps.Point(0, 0),
					new google.maps.Point(3, 7));
		} else if(shop.type == 'ContentPlace') {
			t_icon = new google.maps.MarkerImage(
					'/bitc/static/front/img/pink_pin.png', new google.maps.Size(24, 24), new google.maps.Point(0, 0),
					new google.maps.Point(3, 7));	
		}
		
		var markerOptions = {
			map : map,
			position : new google.maps.LatLng(shop.latitude, shop.longitude),
			icon : t_icon
		}, marker = new google.maps.Marker(markerOptions);

		marker.info = shop;
		markers.push(marker);

		google.maps.event.addListener(marker, 'click', showInfoWindow);
	}
	// 'this' variable will be set to the marker clicked
	function showInfoWindow() {
		var marker = this, info = marker.info, preparedInfo = $
				.extend({}, info);

		preparedInfo.name = getLocalizedText(info.name);
		preparedInfo.address = getLocalizedText(info.address);
		preparedInfo.city = getLocalizedText(info.city);
		preparedInfo.zipcode = info.zipcode;
		preparedInfo.tel = info.tel;
		preparedInfo.open = getLocalizedText(info.open);
		preparedInfo.id = info.id;
		// this should be replaced by service
		if(preparedInfo.type == 'ContentEvent') preparedInfo.type = 'HERITAGE_EVENT';
		else preparedInfo.type = 'HERITAGE_PLACE';

		var infoContent = "<div>" + "<strong>" + preparedInfo.name
				+ "</strong><br/>" + "" + preparedInfo.address + "<br/>" + ""
				+ preparedInfo.zipcode + " " + preparedInfo.city + "<br/>"
				+ "<a href=\"/bitc/minisite/content/displayDetail/clt/BE_"+options.lang+"/name/monument/group/"+preparedInfo.type+"/id/"+preparedInfo.id+".do\" target=\"_top\">details</a> <br/>"
				+ "<img src=\""+preparedInfo.smallImage+"\" />"
				+ "</div>"
		infoWindow.setContent(infoContent);
		infoWindow.open(map, marker);
		
		google.maps.event.addListener(infoWindow, 'click', function() {
	        alert("htlle");
	    });

		activeMarker = marker;
	}

	this.init = init;
	this.bind = bind;
	this.filterByZip = filterByZip;
	this.filterByType = filterByType;
	this.getOptions = getOptions;
	this.resetFilter = resetFilter;
	
	return this;
}

$(function() {
	var mbMap, urlParams;

	var populateWithAll = function() {
	}

	function initMap() {
		$.mbMap = new BrusselsMap($.extend(window.globalMapSettings));

		$.mbMap.init();

		// setTimeout(function () {
		// $("#loaderContainer").show();
		// }, 0);

		/*$.mbMap.bind('dataload', function() {
			populateWithAll();
		});*/
	}
	initMap();
});
