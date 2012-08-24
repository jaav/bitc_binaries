<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${not empty flickrTag}">
  <div id="flickr">
      <h2><wa:mls>Gallerie</wa:mls></h2>
     <!--  <script type="text/javascript" src="http://jqueryjs.googlecode.com/files/jquery-1.3.2.min.js"></script> -->
       <script type="text/javascript" src="${staticSite}/js/jquery.cycle.all.latest.js"></script>
      <script type="text/javascript">
// Our very special jQuery JSON fucntion call to Flickr, gets details
// of the most recent 20 images ${flickrTag}
$.getJSON("http://www.flickr.com/services/feeds/photos_public.gne?tags=${flickrTag}&format=json&jsoncallback=?", displayImages);
var htmlString = "";
 var nbr=0;
 var i = 0
  var sourceSquare
 var dataImg; 
 var imgVisible = 9
function displayImages(data) {
	// Start putting together the HTML string
   
	
    // Now start cycling through our array of Flickr photo details

    
    // Pop our HTML in the #images DIV
    //$('#images').html(htmlString);
    // Close down the JSON function call
	
	//$.each(data.items,displayImg);
	//alert(data.items[0].title)
	dataImg = data;
	loadImg()	
}
var dataImg

function loadImg(){
	for( i = nbr; i < imgVisible; i++){
		displayImg(dataImg.items[i]);		
	}
	if(nbr == 0){
		$('#prev').css({ display: "none"})
	}
}

function goToNextImg(){	
	$('#prev').css({ display: "inline"})
	if((nbr/imgVisible) > ((dataImg.items.length)/imgVisible)){
		$('#next').css({ display: "none"})
	}
	htmlString = "";
	nbr = nbr + imgVisible
	
	//if((nbr/imgVisible) > ((dataImg.items.length-imgVisible)/imgVisible)){
	if((dataImg.items.length-nbr)>imgVisible){	
		$('#next').css({ display: "inline"});
		
	}else{
		$('#next').css("display", "none");
	}
	
	for( i = nbr; i < (nbr + imgVisible); i++){
		displayImg(dataImg.items[i]);		
	}
	

}

function goToPrevImg(){	
	$('#next').css({ display: "inline"})
	
	htmlString = "";	
	nbr = nbr - imgVisible
	for( i = nbr; i < (nbr + imgVisible ); i++){
		displayImg(dataImg.items[i]);		
	}	
	if(nbr == 0){
		$('#prev').css({ display: "none"})
	}
	
}

function displayImg(item){
		//alert("item" + item)
		 // I only want the ickle square thumbnails
        sourceSquare = (item.media.m).replace("_m.jpg", "_s.jpg");
        // Here's where we piece together the HTML
        htmlString += '<li><a href="' + item.link + '" target="_blank">';
        htmlString += '<img title="' + item.title + '" src="' + sourceSquare;
        htmlString += '" alt="'; htmlString += item.title + '" />';
        htmlString += '</a></li>';
		$('#images').html(htmlString);
}

</script>
	<div id="images"></div>
	<div class="flickrNav">
		<a id="prev" href="javascript:void(0)" onclick="goToPrevImg()"><img src="${staticSite}/img/ml/arrow_left_promo.jpg" alt="<wa:mls>previous</wa:mls>"/></a><a id="next" href="javascript:void(0)" onclick="goToNextImg()"><img src="${staticSite}/img/ml/arrow_right_promo.jpg" alt="<wa:mls>next</wa:mls>"/></a>
	</div>
    </div>
  </c:if>