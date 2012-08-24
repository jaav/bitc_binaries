
HTTPRequest2 =function(){
	var xmlhttp=null;
	try{
		xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
	} catch (_e){
		try{
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		} catch(_E){}
	}
	if(!xmlhttp && typeof XMLHttpRequest != 'undefined'){
		try {
			xmlhttp = new XMLHttpRequest();
		}catch(e){
			xmlhttp = false;
		}
	}
	return xmlhttp;
} 

//charge un objet de type option à partir d'un url
function wa_ask(url,optionObj){
	var http = new HTTPRequest2();
	http.open("GET",url,true);
	http.onreadystatechange=function() {
		if (http.readyState==4) {
	   		wa_fillOption(optionObj,http);
  		}	
 	}
	http.send(null);
}

function wa_ask_selected(url,optionObj,selected){
	var http = new HTTPRequest2();
	http.open("GET",url,true);
	http.onreadystatechange=function() {
		if (http.readyState==4) {
	   		wa_fillOption(optionObj,http);
	   		optionObj.value = selected;
  		}	
 	}
	http.send(null);
}

//Fill a option object
function wa_fillOption(optionObj,http){
	xmldoc =http.responseText;
	var opl =optionObj.length;

	for(i=1; i< opl; i++){
		optionObj[1]= null;
	}
	var length = xmldoc.length;
	var indexStart = xmldoc.indexOf("<obj att_val=",0);
	var i=0;
	while(indexStart < length && indexStart >= 0){
		indexStart = xmldoc.indexOf("\"",indexStart);
		var indexEnd =xmldoc.indexOf("\"",indexStart+1);
		var attVal = xmldoc.substring(indexStart+1,indexEnd);
		indexStart = xmldoc.indexOf("att_text=",indexEnd);
		indexStart = xmldoc.indexOf("\"",indexStart);
		indexEnd =xmldoc.indexOf("\"",indexStart+1);
		var attText = xmldoc.substring(indexStart+1,indexEnd);
		optionObj[i+1]= new Option(attText,attVal,false,false);
		indexStart = xmldoc.indexOf("<obj att_val=",indexEnd+1);
		i++;
	}
}






