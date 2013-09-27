/*Place footer at the absolute bottom of the page*/
wa_setFooter=function(){
	var windowHeight = window.getHeight(); // height of the actual browser window in px
	//var contentHeight = $('wrapper').getSize().y+108;//content height + header height
	var contentHeight = $('wrapper').getSize().y+10;//content height + margin
	var footerHeight = $('footer').getStyle('height').toInt(); // div with id footer height in px
	
	//alert((contentHeight+footerHeight)+"/"+windowHeight)
	if (windowHeight<(contentHeight+footerHeight)) { // when my content+footer height is bigger then the browser window height, meaning the content must be scrolled
		$('footer').setStyle('position', 'relative'); // set the position of footer to relative
		//alert('must be scrolled')
	}
	if (windowHeight>(contentHeight+footerHeight)) { // when my content+footer height is smaller the the browser window height, meaning no scrolling necessary
		$('footer').setStyle('position', 'absolute'); // set the position of footer to absolute
	 	//alert('no scrolling')
	}
}

/*Help toggle:start*/
wa_displayHelp=function(){
	if ($('helpBtn')!=undefined){
		$('helpBtn').addEvent('click', function(){	
			$('helpBtn').status=$('help').getStyle('display');
			if($('helpBtn').status=='block'){
				$('help').setStyle('display', 'none');
			}else{
				$('help').setStyle('display', 'block');
			}
		});
	}
}

/*Legend toggle:start*/
wa_displayLegend=function(){
	if ($('legend_btn')!=undefined){
		$('legend_btn').addEvent('click', function(){	
			$('legend_btn').status=$('legend').getStyle('display');
			if($('legend_btn').status=='block'){
				$('legend').setStyle('display', 'none');
			}else{
				$('legend').setStyle('display', 'block');
			}
		});
	}
}

/*Close helpbox:start*/
wa_setCloseBtnHelp=function(){
	$('helpclose').addEvent('click', function(){	
		$('helpclose').status=$('help').getStyle('display');
		if($('helpclose').status=='block'){
			$('help').setStyle('display', 'none');
		}else{
			$('help').setStyle('display', 'block');
		}
	});
}

/*Close legend:start*/
wa_setCloseBtnLegend=function(){
	$('legendclose').addEvent('click', function(){
		$('legend_btn').status=$('legend').getStyle('display');
		if($('legend_btn').status=='block'){
			$('legend').setStyle('display', 'none');
		}else{
			$('legend').setStyle('display', 'block');
		}
	});
}
/*Drag:start*/
wa_dragBox=function(){
	if ($('help')!=undefined)
	new Drag.Move('help', {
				  'container': $('body'),
				  'snap': 1
				  });
	
	if ($('legend_btn')!=undefined) 
	new Drag.Move('legend', {
				  'container': $('body'),
				  'snap': 1
				  });
}
/*Drag:end*/

/*Context menu:start (rightclick)*/
wa_rightClickMenu=function(){
	var cursorx=2;
	var cursory=1;
	var coords = {};
	$$('tr.header').addEvent('mousedown', function(event){
			$$('tr.header').addEvent('contextmenu', $break);
			if(event.rightClick) $('fieldList').setStyle('display','block')
			$('fieldList').getPosition().y-$(document.body).getScroll().y+$('fieldList').getSize().y < $(document.body).getSize().y ?
				coords.y = event.page.y + cursory :
				coords.y = event.page.y - $('fieldList').getSize().y + cursory;
			if (coords.y<$(document.body).getScroll().y+1) coords.y = $(document.body).getScroll().y+1;	
			$('fieldList').getPosition().x-$(document.body).getScroll().x+$('fieldList').getSize().x < $(document.body).getSize().x ?
				coords.x = event.page.x + cursorx :
				coords.x = event.page.x - $('fieldList').getSize().x + cursorx;
			if (coords.x<$(document.body).getScroll().x+1) coords.x = $(document.body).getScroll().x+1;		
			$('fieldList').setStyles({ top: coords.y, left: coords.x });
	});
	$('mainContent').addEvent('mousedown', function(event){
			if(event.rightClick!=true) $('fieldList').setStyle('display','none')							   
	});	
	$break = function () {return false;}
}




// Expiration method
wa_callServer = function(url){
	var myRequest = new Request(url);
}
wa_areYouConnected = function(){
	//var url='/wape/admin/other/expiredSession';
	var url = '/bitc/admin/login/doLogout.do';
	var d = new Date();
	d.setMinutes(d.getMinutes()+5); 
	//alert('Your session will expire in a 5 minutes ('+d.getHours()+':'+(d.getMinutes()<10?'0':'')+d.getMinutes()+')! Click OK to extend it.');
	//callServer(url);
	window.location.assign("/bitc/admin/login/doLogout.do");
	window.setTimeout(areYouConnected,1500000); // 25 minutes = 1500 sec 1500000
}



wa_columnEqualizer=function(arg){
	var maxHeight=0;
	var selectedColumn=arg.split(',');
	selectedColumn.each(function(item, index){
		if (maxHeight < $(item).getStyle('height').toInt()){
			maxHeight = $(item).getStyle('height').toInt()
		}				
	});	
	selectedColumn.each(function(item2, index){
		$(item2).setStyle('height',maxHeight+100)
	});
}


wa_displayColumn=function(){
	var inputList=$$('#fieldList input').getProperty('name')
	inputList.each(function(item, index){
		$$('#fieldList input[name='+item+']').addEvent('click', function(){
			if($$('#list td.'+item)[0].getStyle('display')=='none'){
				var myCookie = Cookie.write('field_'+item, '1',{path: path, duration : 30});
				$$('#list td.'+item).setStyle('display','')
			}else{
				var myCookie = Cookie.write('field_'+item, '0',{path: path, duration : 30});
				$$('#list td.'+item).setStyle('display','none')			
			}
		});	
	});
}
wa_tableColumnFix=function(){
	return;
	if($$('#mask tr.line1 td')!= ''){
		var tableWidth=0;
		
		$$('#list tr.header td').each(function(item, index){
			var headerTdWidth=$(item).getCoordinates().width.toInt();
			var listTdWidth=$$('#mask tr.line1 td')[index].getCoordinates().width.toInt();
			if(headerTdWidth<listTdWidth){
				$$('#list tr.header td')[index].setProperty('width',$$('#mask tr.line1 td')[index].getCoordinates().width.toInt()+11)
				$$('#mask tr.line1 td')[index].setProperty('width',$$('#mask tr.line1 td')[index].getCoordinates().width.toInt()-5)
				//alert($(item).getCoordinates().width.toInt()+'-'+$$('#mask tr.line1 td')[index].getCoordinates().width.toInt()+'-'+$(item).getProperty('class'))
				tableWidth=tableWidth+$(item).getProperty('width').toInt();
			}else{
				alert("test")
				$$('#mask tr.line1 td')[index].setProperty('width',$(item).getCoordinates().width.toInt())
				$$('#list tr.header td')[index].setProperty('width',$(item).getCoordinates().width.toInt())
				//alert($(item).getCoordinates().width.toInt()+'-'+$$('#mask tr.line1 td')[index].getCoordinates().width.toInt()+'-'+$$('#mask tr.line1 td')[index].getProperty('class'))
				tableWidth=tableWidth+$(item).getProperty('width').toInt();
			}
		}); 
		$$('#list table').setProperty('width',tableWidth);
	}
}
	
function wa_add(name){
	var selectsLeft = $(name);
	if (selectsLeft) {
		var optionsLeft = selectsLeft.getElementsByTagName ('option');
		if (optionsLeft) {
			var length = optionsLeft.length;
			for (var i = 0; i < length; i++) {
				if(optionsLeft[i].selected == true){
					var optionLeftSelected = optionsLeft[i];
					var newOptionRight = document.createElement('option');
				  	newOptionRight.text = optionLeftSelected.text;
				  	newOptionRight.value = optionLeftSelected.value;
				  	var selectsRight = $(name+'Selected');
				  	try {
				   		 selectsRight.add(newOptionRight, null);
				  	} catch(ex) {
				    	selectsRight.add(newOptionRight);
				  	}
			  	}
			}
			wa_removeOptionSelected(selectsLeft,name);
			
		}
	} 
}

function wa_removeOptionSelected(elSelArg,name){
  var elSel = elSelArg;
  for (var i = elSel.length - 1; i>=0; i--) {
    if (elSel.options[i].selected) {
      elSel.remove(i);
    }
  }
  wa_fillHiddenField(name);
}


function wa_fillHiddenField(name){
	var selects = $(name+'Selected');
	if (selects) {
		var options = selects.getElementsByTagName ('option');
		if (options) {
			  var hiddenElSel = $(name+'SelectedValues');	
			  hiddenElSel.value = "";
			  for (var u = 0; u < options.length; u++) {
			  	hiddenElSel.value += options[u].value;
			  	if(u<options.length-1) { hiddenElSel.value += "|" }
			  }
		 }
	}
}

function wa_remove(name){
	var selectsRight = $(name+'Selected');
	if (selectsRight) {
		var optionsRight = selectsRight.getElementsByTagName ('option');
		if (optionsRight) {
			for (var i = 0; i < optionsRight.length; ++i) {
				if(optionsRight[i].selected == true){
			    	var optionRightSelected = optionsRight[i];
			    	var newOptionLeft = document.createElement('option');
			    	newOptionLeft.text = optionRightSelected.text;
			    	newOptionLeft.value = optionRightSelected.value;
			    	var selectsLeft = $(name);
			    	try {
			    		selectsLeft.add(newOptionLeft,null);
			    	} catch(ex){
			    		selectsLeft.add(newOptionLeft);
			    	}	
			    }
			}
		}
		wa_removeOptionSelected(selectsRight,name);
	}
}
function wa_validateNum(a){
	$(a).value = Number($(a).value);
}

function wa_addOne(a){
	$(a).value = Number($(a).value) +1;
}

function wa_removeOne(a){
	if(Number($(a).value) >0 )
	$(a).value = Number($(a).value) - 1;
}


