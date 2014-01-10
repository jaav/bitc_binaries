// JavaScript Document 
window.addEvent('load', function(){
	<!-- load functions -->
	if($('footer')!=null) wa_setFooter();
	wa_dragBox();
	if($('help')!=null) wa_displayHelp();
	if($('help')!=null) wa_setCloseBtnHelp();
	if($('legend')!=null) wa_displayLegend();
	if($('legend')!=null) wa_setCloseBtnLegend();
	if($('fieldList')!=null) wa_rightClickMenu();
	<!-- create the menu instance -->
	if($('navigation')!=null) var menu = new MenuAdmin();
	<!-- create the searchbox horizontal slider instance -->
	if($('searchBox')!=null) {
		var mySlide2 = null;
		if (Cookie.read('searchBoxDisplay',{path: path}) == '0'){
			var mySlide2 = new Fx.Slide('searchBox', {mode: 'horizontal', duration: 250}).hide();
			//if($('footer')!=null) wa_setFooter();
		}else{
			var mySlide2 = new Fx.Slide('searchBox', {mode: 'horizontal', duration: 250});
			//if($('footer')!=null) wa_setFooter();
		}
		$('searchBox').setStyle('display','block');
		$('search_btn').addEvent('click', function(e){
			e = new Event(e); 
			mySlide2.toggle();
			if(mySlide2.open){
				var myCookie = Cookie.write('searchBoxDisplay', '0',{path: path});
			} else {
				var myCookie = Cookie.write('searchBoxDisplay', '1',{path: path});
			}
			e.stop();
		});
		$('searchclose').addEvent('click', function(e){
			e = new Event(e);
			mySlide2.toggle();
			var myCookie = Cookie.write('searchBoxDisplay', '0',{path: path});
			e.stop();
		});
	
		<!-- reset all input in form searchForm -->		
		$('reset_btn').addEvent('click', function(e){
			var inputs = $$('#searchForm input');
			inputs.each(function(item,index){
				if(item.type == 'text'){
					item.value = '';
				} else if (item.type == 'radio' || item.type == 'checkbox'){
					item.checked = false;
				}	
			})
			var selects = $$('#searchForm select');
			selects.each(function(item,index){
				item.value = '';
			})
			$('searchForm').submit();
		});
		
	}
	
	document.windowHeight=$('body').getSize().y;
	document.windowWidth=$('body').getSize().x;

	wa_displayColumn();


	var inputList=$$('#fieldList input').getProperty('name')
	inputList.each(function(item, index){
		if(Cookie.read('field_'+item,{path: path}) == null) {
			if($('c_'+item).checked){
				$$('#list td.'+item).setStyle('display','')
			}else{
				$$('#list td.'+item).setStyle('display','none')
			}
		}else if (Cookie.read('field_'+item,{path: path}) == '1'){
			$$('#list td.'+item).setStyle('display','')
			$('c_'+item).checked=true; 
		}else{
			$$('#list td.'+item).setStyle('display','none')
			$('c_'+item).checked=false; 			
		}
	});

	if($('footer')!=null) wa_setFooter();
	
});
window.addEvent('resize', function(){
	if($('footer')!=null) wa_setFooter();
	if(document.windowHeight!=$('body').getSize().y || document.windowWidth!=$('body').getSize().x) {		
			
		document.windowHeight=$('body').getSize().y;
		document.windowWidth=$('body').getSize().x;		
	}
	//
});