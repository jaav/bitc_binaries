

/* --------------------------------------------------*/
/* NEW DEV 10/11/11 FOR G_MAP+STREETVIEW INTEGRATION */
/* --------------------------------------------------*/
var sv_panorama;
var sv_map ;
var sv_gmarkers = []; 
var sv_arrayMarker=[];

function sv_initialize() {
	
	var arrayTmp0=[];
	var arrayTmp1=[];
	arrayTmp0[0]=parseFloat("37.86926")//+(parseInt(Math.random()*3)/100000);
	arrayTmp0[1]=parseFloat("-122.25458500000002")//+(parseInt(Math.random()*3)/100000);
	arrayTmp0[2]="BOZAR";
	arrayTmp0[3]="a";
	arrayTmp0[4]=parseFloat("37.86926")//+(parseInt(Math.random()*3)/100000);
	arrayTmp0[5]=parseFloat("-122.25458500000002")//+(parseInt(Math.random()*3)/100000);
	arrayTmp0[6]=("0");
	arrayTmp0[7]=("0");
	arrayTmp0[8]=("0");
	
	arrayTmp1[0]=parseFloat("37.868404")//+(parseInt(Math.random()*3)/100000);
	arrayTmp1[1]=parseFloat("-122.254437")//+(parseInt(Math.random()*3)/100000);
	arrayTmp1[2]="Mus&eacute;e";
	arrayTmp1[3]="b";
	arrayTmp1[4]=parseFloat("37.868404")//+(parseInt(Math.random()*3)/100000);
	arrayTmp1[5]=parseFloat("-122.254437")//+(parseInt(Math.random()*3)/100000);
	arrayTmp1[6]=("285");
	arrayTmp1[7]=("-8");
	arrayTmp1[8]=("2");
	
	sv_arrayMarker.push(arrayTmp0);
	sv_arrayMarker.push(arrayTmp1);
	// Map constructor
	var mapOptions = {
		// Specify zoom and center only if we have one marker, we fit the map further down.
		zoom: 13,
		center: new google.maps.LatLng(sv_arrayMarker[0][0], sv_arrayMarker[0][1]),
		mapTypeId: google.maps.MapTypeId.ROADMAP,
		streetViewControl: true
	};
	map = new google.maps.Map(document.getElementById('g_pageStreetView_map'), mapOptions);
	var contentInfoWindow;
	// loop and construct markers
	for (var i = 0; i < sv_arrayMarker.length; i++) {
		var marker = new google.maps.Marker({
	        position: new google.maps.LatLng(sv_arrayMarker[i][0], sv_arrayMarker[i][1]), 
	        map: map,
	        icon: new google.maps.MarkerImage(
        	    "/bitc/static/front/img/ml/btn_map_"+sv_arrayMarker[i][3]+".png"
	        ),
	        title:sv_arrayMarker[i][2],
	        contentInfoWindow : '<h4>'+sv_arrayMarker[i][2]+'</h4><br /><a href="javascript:void(0);" onclick="toggleStreetView('+sv_arrayMarker[i][4]+','+sv_arrayMarker[i][5]+','+sv_arrayMarker[i][6]+','+sv_arrayMarker[i][7]+','+sv_arrayMarker[i][8]+ ');"><img src="/bitc/static/front/img/ml/btn_streetview.png" /></a>'
	    }); 
		var infoWindow = new google.maps.InfoWindow;
		google.maps.event.addListener(marker, 'click', function() {
			infoWindow.setContent(this.contentInfoWindow);
		   	infoWindow.open(map, this);
		});
		marker.index = gmarkers.length;
		marker.setMap(map);
		gmarkers.push(marker);
	}
	// if we have more than one marker, we zoom and center the map to include all the markers
    if(sv_arrayMarker.length > 1){
    	var bounds = new google.maps.LatLngBounds();
        for (index in arrayMarker) {
          bounds.extend(new google.maps.LatLng(arrayMarker[index][0], arrayMarker[index][1]));
        }
    	map.fitBounds(bounds);
    }

   
	//alert('map initialized')
}

sv_initialize();

// Open the corresponding info window
function sv_openInfoWindow(letter) {
	letters = new Array("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z");
	for (var i = 0; i < letters.length; i++){
      if (letters[i] == letter.toLowerCase()) {
    	  google.maps.event.trigger(gmarkers[i], "click");
      }
    }
}
function sv_returnMarker(letter) {
	letters = new Array("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z");
	for (var i = 0; i < letters.length; i++){
      if (letters[i] == letter.toLowerCase()) {
    	  return i;
      }
    }
}
/* Asynchronously Loading the Javascript API*/
function sv_loadScript() {
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = 'http://maps.googleapis.com/maps/api/js?sensor=false&' + 'callback=initialize';
    document.body.appendChild(script);
}



