var timer;
var openedTop=false;
var context="/bitc";
var countClickiLike = 0;
var currentiLike = null;
var minisiteName = null; 

function iLikeLightBox(id, group, top, left) {
//alert("contentId :"+id+" // group :"+group);
//alert("iLike = " + context+'/front/other/displayILikeLightBox.do?contentId='+id+'&group='+group);
//alert("top :"+top+" // left :"+left);
	
	var excludedGroup = ["MINISITE", "TESTIMONIAL", "LATEST_NEWS", "INCENTIVES", "GT_ASSOCIATION", "SALES_GUIDE", "CONTENT", "ACTIVITY", "NEWSLETTER", "OG_TOUR", "USEFUL_LINK", "PRESS_REPORT", "SERVICE"];
	var isExcludedGroup = false;
	for (var i = 0; i < excludedGroup.length; i++){
		if (excludedGroup[i] == group){
			isExcludedGroup = true;
			break;
		}
	}
	var urlDisplay = context+'/front/other/displayILikeLightBox.do?contentId='+id+'&group='+group;
	if(minisiteName != null)
		urlDisplay += '&ms='+minisiteName;
	
	if(!isExcludedGroup){
		$.ajax({
			url: urlDisplay,
			success : function(html){						
				var contentMainOffset = $("#content").offset();
		
				$("#content").children(".fan_box").remove();
				$('#content').append(html);
				$("#content .fan_box").css("top", (top - contentMainOffset.top)+"px");
				$("#content .fan_box").css("left", (left - contentMainOffset.left)+"px");
			}
		});
	}
	
}

jQuery(document).ready(function($){
	//center site for 1024
	scrollBy(($('#content').width()-$('body').width())/2,0);
	//NEW NAV 01/2011
	var rowWidth;
	var top_sub_nav = $("#top_nav > li > a");
	var sub_sub_nav = $("#sub_nav > li > a");
	//
	top_sub_nav.click(function(e){
		if ($(this).next(".level2").parent().hasClass("clicked")){
			return false;
		} else {
			(function($) {
		     	//Function to calculate total width of all ul's
		     	jQuery.fn.calcSubWidth = function() {
		     		rowWidth = 0;
		         	$(this).children(".level2").children("ul").each(function() {
						rowWidth += 175;
		         	});
		     	};
			})(jQuery);
			//e.preventDefault();
			$(e.target).parent().calcSubWidth();  //calculate width of all ul's
			$(e.target).next(".level2").css({'width' : rowWidth}); //set width
			$(e.target).next(".level2").children('ul').css({'float' : 'left'})
			//test if topnav must be aligned to the right
			if($(e.target).parent().index()==4 && rowWidth > 525){
				$(e.target).next(".level2").addClass("align_right")
			}
			if($(e.target).parent().index()>4 && rowWidth > 350){
				$(e.target).next(".level2").addClass("align_right")
			}
			$(e.target).next(".level2").children("ul:last").css({'border' : 'none'});  //Kill last ul border
		   	$(e.target).next(".level2").children("ul:last").css({'margin-right' : '0'});  //Kill last ul margin
		   	$(e.target).next(".level2").children("ul:last").css({'padding-right' : '0'});  //Kill last ul padding
		    top_sub_nav.next('.level2').slideUp(100).parent().removeClass("clicked");
		    sub_sub_nav.next('.level2').slideUp(100).parent().removeClass("clicked");
		    $(this).next(".level2").slideDown(200).parent().addClass("clicked");  
		}
	});
	sub_sub_nav.click(function(e){
		if ($(this).next(".level2").parent().hasClass("clicked")){
			return false;
		} else {
			(function($) {
		     	//Function to calculate total width of all ul's
		     	jQuery.fn.calcSubWidth = function() {
		     		rowWidth = 0;
		         	$(this).children(".level2").children("ul").each(function() {
						rowWidth += 175;
		         	});
		     	};
			})(jQuery); 
			//e.preventDefault();
			$(e.target).parent().calcSubWidth();  //calculate width of all ul's
			$(e.target).next(".level2").css({'width' : rowWidth}); //set width
			$(e.target).next(".level2").children('ul').css({'float' : 'left'})
			//test if subnav must be aligned to the right
			if($(e.target).parent().index()>3 && rowWidth > 350){
				$(e.target).next(".level2").addClass("align_right")
			}
			$(e.target).next(".level2").children("ul:last").css({'border' : 'none'});  //Kill last ul border
		   	$(e.target).next(".level2").children("ul:last").css({'margin-right' : '0'});  //Kill last ul margin
		   	$(e.target).next(".level2").children("ul:last").css({'padding-right' : '0'});  //Kill last ul padding
		   	top_sub_nav.next('.level2').slideUp(100).parent().removeClass("clicked");
		    sub_sub_nav.next('.level2').slideUp(100).parent().removeClass("clicked");
		    $('.arrow_down').replaceWith( $('.arrow_down').contents()); 
		    $(this).next(".level2").slideDown(200).parent().addClass("clicked").children("a").wrapInner("<span class='arrow_down'></span>");  
		}
	});
	$('body').click(function() {
		$(this).parent().find(".level2").slideUp(100);
	   	top_sub_nav.next('.level2').slideUp(100).parent().removeClass("clicked");
	    sub_sub_nav.next('.level2').slideUp(100).parent().removeClass("clicked");
	});
	$("#top_nav").click(function(e) {
	    e.stopPropagation();
	});
	$("#sub_nav").click(function(e) {
	    e.stopPropagation();
	});
	
	
	
	//Add anchor to all LIST paginated next/previous links if URL exist
	$(".nav_number a").click(function(event) {
	  if($(this).attr("href").length){
		  var url = $(this).attr("href")
		  window.location = url+"#content_main";
		  return false;
	  } else{
		  return false;
	  }
	});
	/*COOKIES MANAGMENT*/
	//var cookie_iscollapsed = $.cookies.get('iscollapsed', {path : '/'});
	var cookie_iscollapsedTrip = $.cookies.get('iscollapsedTrip', {path : '/'});
	var cookie_iscollapsedAdmin = $.cookies.get('iscollapsedAdmin', {path : '/'});
	//var iscollapsedBoolean = null;
	var iscollapsedTripBoolean = null;
	var iscollapsedAdminBoolean = null;
	/* Planner and book your stay cookie managment*/
	if(cookie_iscollapsedTrip != null && cookie_iscollapsedTrip == "1"){
		iscollapsedTripBoolean = true;
	} else if(cookie_iscollapsedTrip != null && cookie_iscollapsedTrip == "0"){
		iscollapsedTripBoolean = false;
	}
	if(iscollapsedTripBoolean){
		collapseTripCookie(iscollapsedTripBoolean)
	} else if(iscollapsedTripBoolean == false) {
		collapseTripCookie(iscollapsedTripBoolean)
	}
	/* Interface Admin abstract_ cookie managment*/
	if(cookie_iscollapsedAdmin != null && cookie_iscollapsedAdmin == "1"){
		iscollapsedAdminBoolean = true;
	} else if(cookie_iscollapsedAdmin != null && cookie_iscollapsedAdmin == "0"){
		iscollapsedAdminBoolean = false;
	}
	if(iscollapsedAdminBoolean){
		collapseAdmin(iscollapsedAdminBoolean)
	} else if(iscollapsedAdminBoolean == false) {
		collapseAdmin(iscollapsedAdminBoolean)
	}
	
	/*COLLAPSE MANAGMENT*/
	function collapseCookie(iscollapsed) {
		if (!iscollapsed && $("body").hasClass("minisite")){
			//$("#collapse").animate({ height: 171}, 200);
			$("#collapse #collapse_content").show(0)
			$("#collapse #expand_content").hide(0)
			$("#top_slideshow").hide()
			$("#loader").hide()
			return false;
		} else if (!iscollapsed){
			$("#collapse").animate({ height: 171}, 200);
			$("#collapse #collapse_content").show(0)
			$("#collapse #expand_content").hide(0)
			$("#top_slideshow").hide()
			$("#loader").hide()
		} else {
			$("#collapse").animate({ height: 390}, 200);
			$("#collapse #collapse_content").hide(0)
			$("#collapse #expand_content").show(0)
			$("#top_slideshow").show(0)
			$("#loader").hide()
			// construct slideshow
			var root = $("#top_slideshow").scrollable({circular: true,  prev: ".prevSlide", next: ".nextSlide", mousewheel: false}).autoscroll({
			  interval: 8000
			});	
			
			window.api = root.data("scrollable");
			//window.api.play();

			//BTN video on homepages
			$(".btn_video").click(function() {
				// set blured bg
				$("#expand_content").css('background','url("/bitc/static/front/img/ml/bg_expand_content-blur.jpg") no-repeat top left');
				$("#top_slideshow").hide(200);
				// show video in html5 or swf fallback (IE9-) and add btn close
				$("#expand_content").html("<img src='/bitc/static/front/img/ml/btn_top_close.png' class='btn_close_video' /><video width='548' height='308' controls autoplay><source src='http://wanabe-eu.bitc.s3.amazonaws.com/video/bitc_top.mp4' type='video/mp4' /><source src='http://wanabe-eu.bitc.s3.amazonaws.com/video/bitc_top.ogg' type='video/ogg' /><object class='vjs-flash-fallback' width='548' height='308' type='application/x-shockwave-flash' data='/bitc/static/front/swf/player.swf'><param name='wmode' value='transparent'><param name='movie' value='/bitc/static/front/swf/player.swf' /><param name='allowfullscreen' value='true' /><param name='flashvars' value='autostart=true&amp;controlbar=over&amp;file=http://wanabe-eu.bitc.s3.amazonaws.com/video/bitc_top.flv' /></object></video>");
				// construct video player
				VideoJS.setupAllWhenReady();
			});
			$(".btn_close_video").live("click", function() {
				// remove blured bg, reset google map container
				$("#expand_content").html("<div id='g_map'></div>")
				// reset slideshow
				$("#top_slideshow").show()
			});
			
		}
		
	}
		
	collapseCookie(openedTop); // BLE

	
	// stop slideshow
	$(".pauseSlide").live("click", function() {
		//alert('stop slideshow')
		window.api.stop();
	});
	
	$(".collapse").click(function () {
		$("a.btn_collapse_up").toggleClass('btn_collapse_down');
		$("a.btn_collapse_up").html(Collapse);
		
		$("a.btn_collapse_down").html(Expand);
	
		if ($("#collapse #expand_content").is(':visible')){
			$("#collapse").animate({ height: 171}, 0);
			$("#collapse #expand_content").slideUp(0)
			$("#collapse #collapse_content").slideDown(0)
			$("#top_bg").children().hide()
			$("#right_content .on_flash").slideDown(200).css({position: 'relative', right: '0', top: '0'})
			$.cookies.set('iscollapsed', '0', {path : '/', hoursToLive: 48})
		} else {
			$("#collapse").animate({ height: 390}, 50);
			$("#collapse #collapse_content").hide(0)
			$("#collapse #expand_content").show(0)
			$.cookies.set('iscollapsed', '1', {path : '/', hoursToLive: 48})
			
			$("#top_bg").children().show()
			/* slide up #right_content trip planner and book your stay ONLY if these banners are visible on #top */
			if(parseInt($("#collapse #expand_content .on_flash > div").parent().css('width'))==20){
				return false
			} else {
				$("#right_content .on_flash").slideUp(200)
			}
		}
	});
	
	//SCROLLABLE - SLIDESHOW - ! IF EXIST !

	if ($("#chained").children(".items").children().length != 0){
		$("#chained").scrollable({circular: true, mousewheel: true}).navigator().autoscroll({
		  interval: 8000		
		});	
	}
	if ($("#chained2").children(".items").children().length != 0){
		$("#chained2").scrollable({circular: true, mousewheel: true, next:".next_1",prev:".prev_1"}).autoscroll({
		  interval: 5000		
		});	
	}
	if ($("#scrollable").children(".items").children().length != 0){
		$("#scrollable").scrollable({next:".next_1",prev:".prev_1",circular: true});
	}

	$(".cutEmail").each(function(){		
			if($(this).text().length>22){
				var allEMail=$(this).text();
				var beginEmail=allEMail.substr(0,22)+"..."
				$(this).text(beginEmail);
				var newElement="<span style='position:absolute; left:10px; background-color: #fff; display:none'>"+allEMail+"</span>";
				$(this).prepend(newElement);
				
				
				$(this).mouseover(function(){
						showAllEmail($(this).children("span"));   
				})
				$(this).children("span").mouseleave(function(){
						hideAllEmail($(this));   
				})
				
			}
	})	
	$(".cutH2Title").each(function(){		
			if($(this).text().length>35){
				var allTitle=$(this).text();
				var beginTitle=allTitle.substr(0,30)
				var finalString = beginTitle.substr(0,beginTitle.lastIndexOf(" ")+1)+"..."
				$(this).text(finalString);
				var newElement="<span style='position:absolute;  background-color: #fff; display:none'>"+allTitle+"</span>";
				$(this).prepend(newElement);

				$(this).mouseover(function(){
						showAllEmail($(this).children("span"));   
				})
				$(this).children("span").mouseleave(function(){
						hideAllEmail($(this));   
				})
				
			}
	})
	$(".cutH2SmallTitle").each(function(){		
			if($(this).text().length>25 || $(this).height()>35){
				var allTitle=$(this).text();
				var beginTitle=allTitle.substr(0,20)
				var finalString = beginTitle.substr(0,beginTitle.lastIndexOf(" ")+1)+"..."
				$(this).text(finalString);
				var newElement="<span style='position:absolute; background-color: #fff; width:288px; display:none'>"+allTitle+"</span>";
				$(this).prepend(newElement);

				$(this).mouseover(function(){
						showAllEmail($(this).children("span"));   
				})
				$(this).children("span").mouseleave(function(){
						hideAllEmail($(this));   
				})
				
			}
	})
	$(".cutHomeMainAbstract").each(function(){		
			if($(this).text().length>155){
				var allTitle=$(this).text();
				var beginTitle=allTitle.substr(0,150)
				var finalString = beginTitle.substr(0,beginTitle.lastIndexOf(" ")+1)+"..."
				$(this).text(finalString);
				var newElement="<p style='position:absolute; background-color: #fff; display:none; z-index:5'>"+allTitle+"</p>";
				$(this).prepend(newElement);

				$(this).mouseover(function(){
						showAllEmail($(this).children("p"));   
				})
				$(this).children("p").mouseleave(function(){
						hideAllEmail($(this));   
				})
				
			}
	})
	
	$(".cutMainAbstract").children().each(function(){
			if($(this).text().length>220){
				var allTitle=$(this).text();
				var beginTitle=allTitle.substr(0,215)
				var finalString = beginTitle.substr(0,beginTitle.lastIndexOf(" ")+1)+"..."
				$(this).text(finalString);
				var newElement="<p style='position:absolute; background-color: #fff; display:none; z-index:5'>"+allTitle+"</p>";
				$(this).prepend(newElement);

				$(this).mouseover(function(){
						showAllEmail($(this).children("p"));   
				})
				$(this).children("p").mouseleave(function(){
						hideAllEmail($(this));   
				})
				
			}
	})
	/*PLAYER SWF*/
	$(".wa_player").each(function(e){
			var vidPath=$(this).attr("rel");
			if(vidPath!="" && vidPath!=undefined){
				$(this).flash({
					src: "../swf/wa_player.swf",
					width: 400,
					height: 325,
					flashvars:{movie:vidPath}
	  
				})	
			}
	})	
	/*I LIKE BUTTON*/
		$(".ilike_big").each(function(e){
			var el = this;
			var arrayParam=$(this).attr("rel");
			arrayParam=arrayParam.split("|");
			var group = arrayParam[0];
			var id = arrayParam[1];
			//alert(group+" - "+id);
					
			var likeOffset = $(this).offset();
			
			$.ajax({
				url:'/bitc/front/ajax/infoILike.do?contentId='+id+'&group='+group,
				type:'GET',
				dataType: "json",
				/*
				error:function(xhr, status, errorThrown) {
	                alert(errorThrown+'\n'+status+'\n'+xhr.statusText);
	        	},
				*/
				success : function(data){
					$(el).flash({
						src: "/bitc/static/front/swf/ilike_big.swf",
						width: 56,
						height: 47,
						wmode:"transparent",
						flashvars:{alreadyLike:data.userLike,nbr:data.numLike,likePath:"/bitc/front/ajax/addILike.do?contentId="+id+"&group="+group,contentId:id,contentGroup:group, topOffset:likeOffset.top+50, leftOffset:likeOffset.left }	  
					})
				}
			})					
		})
		
		$(".ilike, .ilike_venue").each(function(e){
			var el = this;
			var arrayParam=$(this).attr("rel");
			arrayParam=arrayParam.split("|");
			var group = arrayParam[0];
			var id = arrayParam[1];
			var gapTop = 30;
			var likeOffset = $(this).offset();
		
			if(group == "CONTENT"){
				gapTop = 250;
			}
			//alert(id + " :: " + group)
			$.ajax({
				url:'/bitc/front/ajax/infoILike.do?contentId='+id+'&group='+group,
				type:'GET',
				dataType: "json",
				success : function(data){
					$(el).flash({
						src: "/bitc/static/front/swf/ilike_small.swf",
						width: 27,
						height: 37,
						wmode:"transparent",
						flashvars:{alreadyLike:data.userLike,nbr:data.numLike,likePath:"/bitc/front/ajax/addILike.do?contentId="+id+"&group="+group,contentId:id,contentGroup:group, topOffset:likeOffset.top+gapTop, leftOffset:likeOffset.left}	  
					})
				}
			})					
		})
		
		$(".fan_box .btn_close").livequery('click', function(e) {
			$("#content").children(".fan_box").remove();
			//location.reload();
		});
	
	/*
		$(".fan_box").livequery(function() {
			$(this).mouseleave(function(){
				$("#content").children(".fan_box").remove();
				//location.reload();
			});			
		});
	*/	
		
	$("#collapse #expand_content .on_flash div img:first").click(function(){
		collapseTrip()							
	})

	/*Say to flash marker is ready*/
	markersIsReady=true;
	
	//if .theme_young : no ribbon in bottom
	if ($("div").hasClass("theme_young")){$("#ribbon_bottom").hide(0)};

	//trip planner positionning
	$("#right_content .top_flash").css("margin-left", "0px");
	
	// find all the input elements with title attributes to set hint on it
	$('input[title!=""]').hint();
	
	

	
	
})//document.ready finished
	
function showAllEmail(element){
	element.fadeIn();		
}
function hideAllEmail(element){
	element.fadeOut();		
}

/* point mamanger on map*/
var markersIsReady=false;


function getMarkerIsReady(){
	return markersIsReady;
}


var arrayMarker=[];
/*add marker */
function checkIfLetterAlreadyExist(letter){
	for(i=0;i<arrayMarker.length;i++){
		if(arrayMarker[i][3]==letter){
			return true;	
		}	
	}
	return false;	
}
var callNumber=0;

function addMarker(long, lat, desc, letter, sv_long, sv_lat, sv_heading, sv_pitch, sv_zoom){
	callNumber++;
	if(callNumber==1 || callNumber==2){
	//return;	
	}
	if(checkIfLetterAlreadyExist(letter)){
		return;	
	}

	var arrayTmp=[];
	arrayTmp[0]=parseFloat(lat)//+(parseInt(Math.random()*3)/100000);
	arrayTmp[1]=parseFloat(long)//+(parseInt(Math.random()*3)/100000);
	arrayTmp[2]=desc;
	arrayTmp[3]=letter;
	arrayTmp[4]=parseFloat(sv_lat);
	arrayTmp[5]=parseFloat(sv_long);
	arrayTmp[6]=sv_heading;
	arrayTmp[7]=sv_pitch;
	arrayTmp[8]=sv_zoom;
	//
	arrayMarker.push(arrayTmp);
	
	// Temporary hardcoded markers
	/*
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
	
	arrayMarker.push(arrayTmp0);
	arrayMarker.push(arrayTmp1);
*/
}

/*ONLY FOR COOKIES MANAGMENT*/
function collapseTripCookie(iscollapsedTrip){
	var $marginLefty = $("#collapse #expand_content .on_flash > div").parent();	
	var $marginTopy = $("#right_content .on_flash > div").parent();	
		if(!iscollapsedTrip){
				$marginLefty .animate({
					width:  20				  
				}, function() {
					$(".on_flash > div").children("img.key").attr("src", src_open);
					$marginTopy.slideDown(200).css({position: 'relative', right: '0', top: '0'})
				  });
				
		}else {
			$marginTopy.slideUp(200, function() {
				$marginLefty .animate({
					width:  320				  
				}, function(){
					$(".on_flash > div").children("img.key").attr("src", src_collapse)
				});	
			})
		}
}

function collapseTrip(){
	var $marginLefty = $("#collapse #expand_content .on_flash > div").parent();	
	var $marginTopy = $("#right_content .on_flash > div").parent();	
		if(parseInt($marginLefty.css('width'))>20){
				$marginLefty .animate({
					width:  20				  
				}, function() {
					$(".on_flash > div").children("img.key").attr("src", src_open);
					$marginTopy.slideDown(200).css({position: 'relative', right: '0', top: '0'});
					$.cookies.set('iscollapsedTrip', '0', {path : '/', hoursToLive: 48})
				  });
		}else {
			$marginTopy.slideUp(200, function() {
				$marginLefty .animate({
					width:  320				  
				}, function(){
					$(".on_flash > div").children("img.key").attr("src", src_collapse);
					$.cookies.set('iscollapsedTrip', '1', {path : '/', hoursToLive: 48})
				});	
			})
		}
}

//POUR EVITER LE BALANCIER 
function collapseTripLetter(){
	var $marginLefty = $("#collapse #expand_content .on_flash > div").parent();	
	var $marginTopy = $("#right_content .on_flash > div").parent();	
		if(parseInt($marginLefty.css('width'))>20){
			$marginLefty .animate({
				width:  20				  
			}, function() {
				$marginTopy.slideDown(200).css({position: 'relative', right: '0', top: '0'})
			  });
		}
}





/* --------------------------------------------------*/
/* NEW DEV 10/11/11 FOR G_MAP+STREETVIEW INTEGRATION */
/* --------------------------------------------------*/

var panorama;
var map ;
var gmarkers = []; 

function callLetter(letter, type){
	

	var markerNum = returnMarker(letter)
	
	
	if(!markersIsReady){
		setTimeout("callLetter('"+letter+","+type+"')",1000);
	} else {
	
		$(document).scrollTop(0);
		if($("#collapse #expand_content").is(':hidden')){
			$("#top_bg").children().show();
			$("#collapse #collapse_content").hide(0);
			$("#collapse").animate({ height: 390}, 200, function() {
				$("#collapse #expand_content").show(0);
				initialize();
				$("#expand_content").css('background','url("/bitc/static/front/img/ml/bg_expand_content-blur.jpg") no-repeat top left');
			});
		} else {
			$("#top_slideshow").hide(0);
			$("#top_bg").children().show(0);
			$("#collapse #collapse_content").hide(0);
			$("#collapse #expand_content").show(0);
			initialize();
			$("#expand_content").css('background','url("/bitc/static/front/img/ml/bg_expand_content-blur.jpg") no-repeat top left');
		}
	
		if(type == "map"){
			initialize();
			infoWindow.close()
			setTimeout("openInfoWindow('"+letter+"')",1000);
		} else if(type == "sv"){
			//initialize();
			setTimeout("toggleStreetView("+arrayMarker[markerNum][4]+","+arrayMarker[markerNum][5]+","+arrayMarker[markerNum][6]+","+arrayMarker[markerNum][7]+","+arrayMarker[markerNum][8]+")",1000);
		}
	}
}
var contentInfoWindow;
var infoWindow;
function initialize() {
	// Map constructor
	var mapOptions = {
		// Specify zoom and center only if we have one marker, we fit the map further down.
		zoom: 13,
		center: new google.maps.LatLng(arrayMarker[0][0], arrayMarker[0][1]),
		mapTypeId: google.maps.MapTypeId.ROADMAP,
		streetViewControl: true
	};
	map = new google.maps.Map(document.getElementById('g_map'), mapOptions);
	// loop and construct markers
	for (var i = 0; i < arrayMarker.length; i++) {
		var marker = new google.maps.Marker({
	        position: new google.maps.LatLng(arrayMarker[i][0], arrayMarker[i][1]), 
	        map: map,
	        icon: new google.maps.MarkerImage(
        	    "/bitc/static/front/img/ml/btn_map_"+arrayMarker[i][3]+".png"
	        ),
	        title:arrayMarker[i][2],
	        contentInfoWindow : '<h4>'+arrayMarker[i][2]+'</h4><br /><a href="javascript:void(0);" onclick="toggleStreetView('+arrayMarker[i][4]+','+arrayMarker[i][5]+','+arrayMarker[i][6]+','+arrayMarker[i][7]+','+arrayMarker[i][8]+ ');"><img src="/bitc/static/front/img/ml/btn_streetview.png" /></a>'
	    }); 
		infoWindow = new google.maps.InfoWindow;
		google.maps.event.addListener(marker, 'click', function() {
			infoWindow.setContent(this.contentInfoWindow);
		   	infoWindow.open(map, this);
		});
		marker.index = gmarkers.length;
		marker.setMap(map);
		gmarkers.push(marker);
	}
	// if we have more than one marker, we zoom and center the map to include all the markers
    if(arrayMarker.length > 1){
    	var bounds = new google.maps.LatLngBounds();
        for (index in arrayMarker) {
          bounds.extend(new google.maps.LatLng(arrayMarker[index][0], arrayMarker[index][1]));
        }
    	map.fitBounds(bounds);
    }
    
	//alert('map initialized')
}

// Open the corresponding info window
function openInfoWindow(letter) {
	letters = new Array("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z");
	for (var i = 0; i < letters.length; i++){
      if (letters[i] == letter.toLowerCase()) {
    	  google.maps.event.trigger(gmarkers[i], "click");
      }
    }
}
function returnMarker(letter) {
	letters = new Array("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z");
	for (var i = 0; i < letters.length; i++){
      if (letters[i] == letter.toLowerCase()) {
    	  return i;
      }
    }
}

/* Asynchronously Loading the Javascript Google Map API */
/*
 * 
function loadScript() {
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = 'http://maps.googleapis.com/maps/api/js?sensor=false&' + 'callback=initialize';
    document.body.appendChild(script);
}
*/
/* Switch MAP/SV or show  */
function toggleStreetView(sv_lat, sv_long, sv_heading, sv_pitch, sv_zoom) {
	var panoramaOptions = {
			position: new google.maps.LatLng(sv_lat, sv_long),
			pov: {
			  heading: sv_heading,
			  pitch: sv_pitch,
			  zoom: sv_zoom
			}
	    };
	var pos = new google.maps.LatLng(sv_lat, sv_long);
	if(map == undefined){
		/*
		var mapOptions = {
				// Specify zoom and center only if we have one marker, we fit the map further down.
				zoom: sv_zoom,
				center: new google.maps.LatLng(sv_lat, sv_long),
				mapTypeId: google.maps.MapTypeId.ROADMAP,
				streetViewControl: true
		};
		map = new google.maps.Map(document.getElementById('g_map'), mapOptions);
		*/
		initialize();
	}
	var panorama = map.getStreetView();
	panorama.setPosition(pos);
	panorama.setPov({
	  heading: sv_heading,
	  pitch: sv_pitch,
	  zoom: sv_zoom
	});
	//
    var toggle = panorama.getVisible();
    if (toggle == false) {
      panorama.setVisible(true);
    } else {
      panorama.setVisible(false);
    }
}

/* --------------------------------------------------*/
/* ------------- OLD - NO MORE USED -----------------*/
/* --------------------------------------------------*/
function getArrayConfig(){
	return arrayMarker;
}

function sendMarqueurToFlash(){
	var array = getArrayConfig();
}

function clickOnMarkerFromAS(letter){
//	alert(letter)
}

function sendToFlashCallLetter(letter){
	thisMovie("top_flash").callMarkerByLetter(letter);
}

//fonction qui retourne 
function thisMovie(movieName) {	
    if (navigator.appName.indexOf("Microsoft") != -1) {		 
        return window[movieName];
    } else {
        return document[movieName];
    }
}

var myTimer
function showHideMap(){	
	myTimer=setTimeout("thisMovie('top_flash').showHideMap()",1000)
}
function showMap(){	

	if(markersIsReady){
		sendToFlashCallLetter('A');
	}else{
		setTimeout("showMap()",500);
	}
}
