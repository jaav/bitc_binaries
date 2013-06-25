/*

Dateselect v1.00
================
Author: Dirk Van Caneghem
Copyright 2003 ActiveIDEA SA
http://www.activeidea.com

----22/05/06---- modified by cedric Feyaerts => add an iframe  to pop over the drop down in IE-browser

Compatibility:
--------------
IE5++
NS4++ (No automatic positioning, not draggable)

*/

var date_lang = "en";				// language (en,fr,nl)
var date_bgweekend = "EBEBEB";		// background color of weekends
var date_bgweekday = "FFF7F5";		// background of weekdays
var date_bgtitle = "FFCC98";		// background of top
var date_bgtitle2 = "FFCC98";		// background of title of days
var date_border = "666666";			// border color of layer
var date_title = "666666"; 			// font color of top
var date_title2 = "666666";			// font color of title with days 
var date_color = "666666"; 			// font color of weekdays
var date_colorwe = "990000"; 		// font color of weekends
var date_fieldcolor = "F8F4E8"; 	// color of field to update when layer is open

// DON'T CHANGE ANYTHING BELOW THIS LINE

var field = null;
var fieldtoupdate = null;
var tmpbg="";
var mon=0;
var yea=0;
var dtlng=new Array();
dtlng.fr= new Array("Lu","Ma","Me","Je","Ve","Sa","Di","S&eacute;lectionnez :","Mois","Ann&eacute;e","Fermer","Mois pr&eacute;c&eacute;dent","Mois suivant","Ann&eacute;e pr&eacute;c&eacute;dente","Ann&eacute;e suivante");
dtlng.en= new Array("Mo","Tu","We","Th","Fr","Sa","Su","Select:","Month","Year","Close","Previous month","Next month","Previous year","Next year");
dtlng.nl= new Array("Ma","Di","Wo","Do","Vr","Za","Zo","Selecteer:","Maand","Jaar","Sluiten","Vorige maand","Volgende maand","Vorig jaar","Volgend jaar");
isIE=document.all;
isNN=!document.all&&document.getElementById;
isN4=document.layers;

document.onkeypress = chkkey;
function chkkey(){
	if(!isN4){
		if(event.keyCode==27) closeit();
	}
}

function findfieldtoupdate(n,d) {
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=findfieldtoupdate(n,d.layers[i].document);
  if(!x && document.getElementById) x=document.getElementById(n); return x;
}

function datepop(obj,x,y,xoffset,yoffset){
  if(!xoffset) xoffset=0;
  if(!yoffset) yoffset=0;
  if(!document.layers){	
	field = findfieldtoupdate(obj);
	fieldtoupdate = findfieldtoupdate(obj);
	if (fieldtoupdate.value != "") {
		var elems = fieldtoupdate.value.split("/");
    	var result = (elems.length == 3);
    	if (result){
			if(isNaN(elems[1]) || isNaN(elems[2])){
				writepopup();
			}else{
				if(elems[1].charAt(0)=="0"){
					writepopup(elems[1].charAt(1),elems[2]);
				}else{
					writepopup(elems[1],elems[2]);
				}
			}
		}else{
			writepopup();
		}
		
	}else{
		writepopup();
	}
	if (isN4)
	{
		if(!x) x=200;
		if(!y) y=200;
		findfieldtoupdate('datepopup').top=parseInt(y);
		findfieldtoupdate('datepopup').left=parseInt(x);
		findfieldtoupdate('datepopup').visibility="visible";
	}
	var curtop = 0;
	var curleft = 0;
	if (isIE || isNN)
	{
		while (fieldtoupdate.offsetParent)
		{
			curtop += fieldtoupdate.offsetTop
			curleft += fieldtoupdate.offsetLeft
			fieldtoupdate = fieldtoupdate.offsetParent;
		}
		findfieldtoupdate('datepopup').style.top=curtop+yoffset;
		findfieldtoupdate('datepopup').style.left=curleft+xoffset;
		findfieldtoupdate('datepopup').style.visibility="visible";
		if (date_fieldcolor){
			tmpbg=field.style.background;
			field.style.background=date_fieldcolor;
		}
	}
  }
}

function closeit(){
	if (isN4) findfieldtoupdate('datepopup').visibility="hidden";
	if (isNN || isIE){
		findfieldtoupdate('datepopup').style.visibility="hidden";
		findfieldtoupdate('datepopup').innerHTML = "";
		if(date_fieldcolor) field.style.background=tmpbg;
	}
	window.status="";
}
function updatefield(a){
	field.value=a;
	if (isN4) findfieldtoupdate('datepopup').visibility="hidden";
	if (isNN || isIE){
		findfieldtoupdate('datepopup').style.visibility="hidden";
		findfieldtoupdate('datepopup').innerHTML = "";
		if(date_fieldcolor) field.style.background=tmpbg;
	}
	window.status="";
}
function bck(aa){
	if(aa=="0"){
		if(mon>1){
			writepopup(eval(mon-1),yea);
		}
		else{
			writepopup("12",eval(yea-1));
		}
	}
	if(aa=="1"){
		writepopup(mon,eval(yea-1));
	}
}
function nxt(aa){
	if(aa=="0"){
		if(mon<12){
			writepopup(eval(mon+1),yea);
		}
		else{
			writepopup("1",eval(yea+1));
		}
	}
	if(aa=="1"){
		writepopup(mon,eval(yea+1));
	}
}


function writepopup(a,b){
	window.status="";
	var c = new Date();
	var today = 0;
	if (!a && !b){
		a = c.getMonth()+1;
		b = c.getFullYear();
	}
	mon = eval(a);
	yea = eval(b);
	if ((a==c.getMonth()+1) && (b == c.getFullYear())) today = c.getDate();
	var content = "";
	content += "<form>\n<table bgcolor=\"#" + date_border + "\" border=\"0\" width=\"212\" cellspacing=\"1\" cellpadding=\"0\">\n";
	content += "<tr>\n<td>\n";
	content += "<table border=\"0\" width=\"210\" cellspacing=\"0\" cellpadding=\"2\">\n";
	content += "<tr align=\"right\" valign=\"top\" bgcolor=\"#" + date_bgtitle + "\">\n";

	content += "<td id=\"titleBar\" style=\"cursor:move; font-family: verdana; " + (isN4?"font-size:10px;":"font-size:9px;") + " font-weight: normal\" colspan=\"7\">\n";
	content += "<a href=\"javascript:closeit()\" onmouseover=\"window.status='" + dtlng[date_lang][10] + "';return true;\" onmouseout=\"window.status='';return true;\" style=\"text-decoration:none\"><font color=\"#" + date_title + "\"><b>X</b></font></a>\n</td>\n</tr>\n";
	content += "<tr valign=\"top\" bgcolor=\"#" + date_bgtitle + "\">\n<td style=\"font-family: verdana; font-size:9px; font-weight: normal\" colspan=\"3\" align=\"center\"><font color=\"#" + date_title + "\"><b>" + (isN4?"&nbsp;":dtlng[date_lang][7]) + "</b></font></td>\n";

	content += "<td style=\"font-family: verdana; font-size:9px; font-weight: normal\" colspan=\"2\" align=\"center\"><b>";
	content += ((a=="1"&&b=="1901")||isN4?"&nbsp;":"<a href=\"javascript:bck('0')\" style=\"text-decoration:none\" onmouseover=\"window.status='" + dtlng[date_lang][11] + "';return true;\" onmouseout=\"window.status='';return true;\"><font color=\"#" + date_title + "\">&laquo;</font></a>");
	content += "<font color=\"#" + date_title + "\"> " + dtlng[date_lang][8] + " </font>";
	content += ((a=="12"&&b==c.getFullYear()+10)||isN4?"&nbsp;":"<a href=\"javascript:nxt('0')\" style=\"text-decoration:none\" onmouseover=\"window.status='" + dtlng[date_lang][12] + "';return true;\" onmouseout=\"window.status='';return true;\"><font color=\"#" + date_title + "\">&raquo;</font></a>");
	content += "</b></td>\n";

	content += "<td style=\"font-family: verdana; font-size:9px; font-weight: normal\" colspan=\"2\" align=\"center\"><b>";
	content += ((b=="1901")||isN4?"&nbsp;":"<a href=\"javascript:bck('1')\" style=\"text-decoration:none\" onmouseover=\"window.status='" + dtlng[date_lang][13] + "';return true;\" onmouseout=\"window.status='';return true;\"><font color=\"#" + date_title + "\">&laquo;</font></a>");
	content += "<font color=\"#" + date_title + "\"> " + dtlng[date_lang][9] + " </font>";
	content += ((b==c.getFullYear()+10)||isN4?"&nbsp;":"<a href=\"javascript:nxt('1')\" style=\"text-decoration:none\" onmouseover=\"window.status='" + dtlng[date_lang][14] + "';return true;\" onmouseout=\"window.status='';return true;\"><font color=\"#" + date_title + "\">&raquo;</font></a>");
	content += "</b></td>\n</tr>\n";

	content += "<tr style=\"font-family: verdana; font-size:9px; font-weight: normal\" align=\"center\" bgcolor=\"#" + date_bgtitle + "\">\n<td colspan=\"3\">&nbsp;</td>\n";
	content += "<td colspan=\"2\" align=\"center\"><select name=\"datemonth\" onchange=\"writepopup(this.options[this.selectedIndex].value," + b + ");\" style=\"" + (isN4?"font-size:10px;":"font-size:9px;") + " font-weight: normal\">\n";
	for (var mmm=1;mmm<13;mmm++){
		content = content + "<option value=\"" + mmm + "\"" + (a==mmm?" selected":"") + ">" + mmm + "</option>\n";
	}
	content += "</select></td>\n";
	content += "<td colspan=\"2\" align=\"center\"><select name=\"dateyear\" onchange=\"writepopup(" + a + ",this.options[this.selectedIndex].value);\" style=\"" + (isN4?"font-size:10px;":"font-size:9px;") + " font-weight: normal\">\n";
	for (var mmm=c.getFullYear()+10;mmm>=1900;mmm--){
		content = content + "<option value=\"" + mmm + "\"" + (b==mmm?" selected":"") + ">" + mmm + "</option>\n";
	}
	content += "</select></td>\n</tr>\n</table>\n</td>\n</tr>\n";
	content += "<tr bgcolor=\"#FFFFFF\">\n<td>\n<table border=\"0\" width=\"210\" cellspacing=\"0\" cellpadding=\"2\">\n";
	content += "<tr>\n";
	for (var jjj=0;jjj<7;jjj++){
		content += "<td style=\"font-family: verdana; font-size:10px; font-weight: normal\" align=\"center\" bgcolor=\"#" + date_bgtitle2 + "\"><font color=\"#" + date_title2 + "\"><b>" + dtlng[date_lang][jjj]+ "</b></font></td>\n";
	}
	content += "</tr>\n";
	var datecfg = new Date();
	datecfg.setDate(1);
	datecfg.setMonth(a-1);
	datecfg.setFullYear(b);
	var start=1;
	if (datecfg.getMonth()==0 || datecfg.getMonth()==2 || datecfg.getMonth()==4 || datecfg.getMonth()==6 || datecfg.getMonth()==7 || datecfg.getMonth()==9 || datecfg.getMonth()==11) var datemax=31;
	else if (datecfg.getMonth()==3 || datecfg.getMonth()==5 || datecfg.getMonth()==8 || datecfg.getMonth()==10) var datemax=30;
	else if ((datecfg.getMonth()==1) && (datecfg.getFullYear() % 4 == 0)){
		var datemax=29;
	}else{
		var datemax=28;
	}
	if (datecfg.getDay() == 0){
		var start2=7;
	}else{
		var start2=datecfg.getDay();
	}
	content += "<tr>\n";
	for (var iii=1;iii<start2;iii++){
		content += "<td style=\"font-family: verdana; font-size:10px; font-weight: normal\" align=\"center\" bgcolor=\"#" + (iii<6? date_bgweekday:date_bgweekend) + "\">&nbsp;</td>\n";
	}
	for (iii;iii<8;iii++){
		content += "<td style=\"font-family: verdana; font-size:10px; font-weight: normal\" align=\"center\" bgcolor=\"#" + (iii<6? date_bgweekday:date_bgweekend) + "\"><a href=\"javascript:;\" onclick=\"updatefield('" + ((start < 10) ? "0"+start:start) + "/" + ((a != 10 && a != 11 && a != 12) ? "0"+a:a) + "/" + b + "');\" style=\"text-decoration: none\"><font color=\"#" + (iii<6? date_color:date_colorwe) + "\" onmouseover=\"window.status='" + start + "/" + a + "/" + b + "';return true;\" onmouseout=\"window.status='';return true;\">" + (start==today ? "<b>":"") + start + (start==today? "</b>":"") + "</font></a></td>\n";
		start++;
	}
	content += "</tr>\n";

	var jjj=0;
	for (start;start<=datemax;start++){
		if(jjj==0) content += "<tr>\n";
		content += "<td style=\"font-family: verdana; font-size:10px; font-weight: normal\" align=\"center\" bgcolor=\"#" + (jjj<5? date_bgweekday:date_bgweekend) + "\"><a href=\"javascript:;\" onclick=\"updatefield('" + ((start < 10) ? "0"+start:start) + "/" + ((a != 10 && a != 11 && a != 12) ? "0"+a:a) + "/" + b + "');\" style=\"text-decoration: none\"><font color=\"#" + (jjj<5? date_color:date_colorwe) + "\" onmouseover=\"window.status='" + start + "/" + a + "/" + b + "';return true;\" onmouseout=\"window.status='';return true;\">" + (start==today ? "<b>":"") + start + (start==today? "</b>":"") + "</font></a></td>\n";
		jjj++;
		if((jjj==7) && (start!= datemax)){
			content += "</tr>\n";
			jjj=0;
		}
	}
	for(jjj;(jjj>0 && jjj<7);jjj++){
		content += "<td style=\"font-family: verdana; font-size:10px; font-weight: normal\" align=\"center\" bgcolor=\"#" + (jjj<5? date_bgweekday:date_bgweekend) + "\">&nbsp;</td>\n";
	}
	content += "</tr>\n</table>\n";
	content += "</td>\n</tr>\n</table>\n</form>\n";
	if(isIE) {
		//add an iframe under the pop up -----22/05/06 Ceddric Feyaerts
		//alert('with iframe');
		var datePopupWidth = 212;
		var datePopupHeight = 167;
		
		findfieldtoupdate('datepopup').innerHTML = "<div id='titleBar' style='position:relative;background:white; width:"+datePopupWidth+"px; height:"+datePopupHeight+"px'><div style='position:absolute; top:0; z-index:10; width:"+datePopupWidth+"px; height:"+datePopupHeight+"px'>"+content+"</div><iframe src='iframe.html' width='"+datePopupWidth+"' height='"+datePopupHeight+"' id='popFrame'></iframe></div>";	
		
		
	}else if (isNN){
		findfieldtoupdate('datepopup').innerHTML = content;
		
	}
	if(isN4){
		findfieldtoupdate('datepopup').document.open();
		findfieldtoupdate('datepopup').document.write(content);
		findfieldtoupdate('datepopup').document.close();
	}
	content="";
}

//draggable layer

function ddInit(e){
  topDog=isIE ? "BODY" : "HTML";
  whichDog=isIE ? document.all.datepopup : document.getElementById("datepopup");  
  hotDog=isIE ? event.srcElement : e.target;  
  while (hotDog.id!="titleBar"&&hotDog.tagName!=topDog){
    hotDog=isIE ? hotDog.parentElement : hotDog.parentNode;
  }  
  if (hotDog.id=="titleBar"){
    offsetx=isIE ? event.clientX : e.clientX;
    offsety=isIE ? event.clientY : e.clientY;
    nowX=parseInt(whichDog.style.left);
    nowY=parseInt(whichDog.style.top);
    ddEnabled=true;
    document.onmousemove=dd;
  }
}

function dd(e){
  if (!ddEnabled) return;
  whichDog.style.left=isIE ? nowX+event.clientX-offsetx : nowX+e.clientX-offsetx; 
  whichDog.style.top=isIE ? nowY+event.clientY-offsety : nowY+e.clientY-offsety;
  return false;  
}

document.onmousedown=ddInit;
document.onmouseup=Function("ddEnabled=false");
//document.onload
if (!document.layers) document.write("<div id=\"datepopup\" name=\"datepopup\" style=\"position:absolute; left:1px; top:1px; width:288px; height:1px; z-index:1; visibility: hidden;\"></div>");

