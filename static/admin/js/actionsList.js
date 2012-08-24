var admin_selectNum = 0;
var path =".";
var addParams="";
var numOfElement="0";

function admin_confirm(a,msg){
	var cfrm=confirm(msg);
	if (cfrm==true){
		location.href=a;
	}
}


function admin_validateDelete(a,id){
	var cfrm=confirm('Do you want to delete this elements : '+id);
	if (cfrm==true){
		location.href=a;
	}
}

function admin_add(el){
	el.href = path+'/newItem.do'+addParams;
}

function admin_deleteSelection(el){
	var checks = $$('#mask input[type="checkbox"]');
	var id = "";
	var count = 0;
	for(i=0;i<checks.length;i++ ){
		if(checks[i].checked){
			if(count > 0)
				id += ',';
			id += checks[i].value;
			count++;
		}
	}
	var cfrm=confirm('Do you want to delete this elements : '+id);
	if (cfrm==true){
		el.href=path+'/deleteItems/items/'+id+'.do';
	}
}
function admin_refreshMenu(el){
	var checks = $$('#mask input[type="checkbox"]');
	var id = "";
	var count = 0;
	for(i=0;i<checks.length;i++ ){
		if(checks[i].checked){
			if(count > 0)
				id += ',';
			id += checks[i].value;
			count++;
		}
	}
	var cfrm=confirm('Do you want to refresh the tree of menus ? ');
	if (cfrm==true){
		el.href=path+'/refreshTreeMenu/nodeId/'+id+'.do';
	}
}
function admin_publishSelection(el){
	var checks = $$('#mask input[type="checkbox"]');
	var id = "";
	var count = 0;
	for(i=0;i<checks.length;i++ ){
		if(checks[i].checked){
			if(count > 0)
				id += ',';
			id += checks[i].value;
			count++;
		}
	}
	var cfrm=confirm('Do you want to publish this elements : '+id);
	if (cfrm==true){
		el.href=path+'/publishItems/items/'+id+'.do';
	}
}

function admin_editSelection(el){
	var checks = $$('#mask input[type="checkbox"]');
	var id = -1;
	for(i=0;i<checks.length;i++ ){
		if(checks[i].checked){
			id = checks[i].value;
		}
	}
	el.href = path+'/editItem/id/'+id+'.do';
}
 
function admin_duplicateSelection(el){
	var checks = $$('#mask input[type="checkbox"]');
	var id = -1;
	for(i=0;i<checks.length;i++ ){
		if(checks[i].checked){
			id = checks[i].value;
		}
	}
	el.href = path+'/duplicate/id/'+id+'.do';
}
function admin_exportList(el){
	var infos = null;

	if(location.href.indexOf("?") > 0)
		infos = location.href.substring(location.href.indexOf("?")+1, location.href.length);
	var url = path+'/exportList.do'
	url = url +'?num='+numOfElement;
	if(infos != null && infos.length>0)
		url = url +'&'+infos;

	el.href = url;
}

function admin_importList(el){
	el.href = path+'/importList.do'
}
 

function admin_action(el){
	if(el.id=='add_btn'){
		admin_add(el);
	} else if(el.id=='edit_btn'){
		admin_editSelection(el);
	} else if(el.id=='duplicate_btn'){
		admin_duplicateSelection(el);
	} else if(el.id=='delete_btn'){
		admin_deleteSelection(el);
	} else if(el.id=='publish_btn'){
		admin_publishSelection(el);
	} else if(el.id=='exportXls_btn'){
		admin_exportList(el);
	} else if(el.id=='exportCsv_btn'){
		admin_exportList(el);
	} else if(el.id=='export_btn'){
		admin_exportList(el);
	} else if(el.id=='import_btn'){
		admin_importList(el);
	} else if(el.id=='refreshMenu_btn'){
		admin_refreshMenu(el);
	} 
	 
	
}
var btn = $('add_btn');
if(btn!=null)
	btn.addClass('allways');
btn = $('edit_btn');
if(btn!=null){
	btn.addClass('onlyOne');
	btn.href="#";
}
 
btn = $('duplicate_btn');
if(btn!=null){
	btn.addClass('onlyOne');
	btn.href="#";
}
btn = $('delete_btn');
if(btn!=null){
	btn.addClass('atLeastOne');
	btn.href="#";
}
btn = $('refreshMenu_btn');
if(btn!=null){
	btn.addClass('onlyOne');
	btn.href="#";
}
btn = $('publish_btn');
if(btn!=null){
	btn.addClass('atLeastOne');
	btn.href="#";
}
btn = $('exportXls_btn');
if(btn!=null)
	btn.addClass('allways');
btn = $('exportCsv_btn');
if(btn!=null)
	btn.addClass('allways');
btn = $('export_btn');
if(btn!=null)
	btn.addClass('allways');
btn = $('import_btn');
if(btn!=null)
	btn.addClass('allways');



var admin_function_action = function(){ admin_action(this); }

// ajouter activation des actions
$('checkboxAll').addEvent('click',function(){
	var checks = $$('#mask input[type="checkbox"]');
	var isChecked = $('checkboxAll').checked;
	checks.each(function(item, index){
		item.checked = isChecked;
	});
	if(isChecked){
		admin_selectNum = checks.length-1;
	} else {
		admin_selectNum = 0;
	}
	if(admin_selectNum == 1){
		admin_actions.each(function(item, index){
			if(item.hasClass('onlyOne') || item.hasClass('atLeastOne')){
				item.setStyle('display','block');
				item.setStyle('visibility','visible');
				item.setStyle('text-decoration','underline');
				item.addEvent('click',admin_function_action);
			}
		});
	} else if(admin_selectNum == 0) {
		admin_actions.each(function(item, index){
			if(item.hasClass('onlyOne') || item.hasClass('atLeastOne')){
				item.setStyle('display','none');
				item.setStyle('visibility','hidden');
				item.setStyle('text-decoration','none');
				item.removeEvent('click',admin_function_action);
			}
		});
	} else {
		admin_actions.each(function(item, index){
			if(item.hasClass('onlyOne')){
				item.setStyle('display','none');
				item.setStyle('visibility','hidden');
				item.setStyle('text-decoration','none');
				item.removeEvent('click',admin_function_action);
			}
			if(item.hasClass('atLeastOne')){
				item.setStyle('display','block');
				item.setStyle('visibility','visible');
				item.setStyle('text-decoration','underline');
				item.addEvent('click',admin_function_action);
			}
		});
			
	}
});

var admin_actions = $$('#actions a');

var admin_checks = $$('#mask input[type="checkbox"]');
admin_checks.each(function(item, index){
	if(item.id != 'checkboxAll' ){
	item.addEvent('click',function(){
		
		var isChecked = item.checked;
		if(isChecked){
			admin_selectNum++;
		}else{
			admin_selectNum--;
		}
		if(admin_selectNum == admin_checks.length){
			$('checkboxAll').checked = true;
		} else {
			$('checkboxAll').checked = false;
		}
		if(admin_selectNum == 1){
			admin_actions.each(function(item, index){
				if(item.hasClass('onlyOne') || item.hasClass('atLeastOne')){
					item.setStyle('display','block');
					item.setStyle('visibility','visible');
					item.setStyle('text-decoration','underline');
					item.addEvent('click',admin_function_action);
				}
			});
		} else if(admin_selectNum == 0) {
			admin_actions.each(function(item, index){
				if(item.hasClass('onlyOne') || item.hasClass('atLeastOne')){
					item.setStyle('display','none');
					item.setStyle('visibility','hidden');
					item.setStyle('text-decoration','none');
					item.removeEvent('click',admin_function_action);
				}
			});
		} else {
			admin_actions.each(function(item, index){
				if(item.hasClass('onlyOne')){
					item.setStyle('display','none');
					item.setStyle('visibility','hidden');
					item.setStyle('text-decoration','none');
					item.removeEvent('click',admin_function_action);
				}
			});	
		}
		
	
		
	});}
});


admin_actions.each(function(item, index){
	if(item.hasClass('allways')){
		item.setStyle('text-decoration','underline');
		item.setStyle('display','block');
		item.setStyle('visibility','visible');
		item.addEvent('click',admin_function_action);
	}else{
		item.setStyle('display','none');
		item.setStyle('visibility','hidden');
	}
});
/*
var btn_reset = $('reset_btn');
btn_reset.addEvent('click', function(){
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
*/



function admin_order_arrow(){

      var url = location.href;

      var dirs =url.split('/');

      var orderBy = '';

      var orderDir ='';

      for(i=0;i<dirs.length;i++ ){

            if(dirs[i] == 'orderBy' && i < dirs.length-1){

                  orderBy = dirs[i+1].split('.')[0];

            }

            if(dirs[i] == 'orderDir' && i < dirs.length-1){

                  orderDir = dirs[i+1].split('.')[0];

            }

      }

      var columns = $$('.header td');

      columns.each(function(item,index){

            if(item.hasClass(orderBy)){	
                  if(orderDir == '0')

                        item.set('html',item.get('html')+'<img src="'+context+'/static/admin/img/ico_order_down.png" width="16" height="16" alt="down" />');

                  else if(orderDir == '1')

                        item.set('html',item.get('html')+'<img src="'+context+'/static/admin/img/ico_order_up.png" width="16" height="16" alt="up" />');

            }

      })

 

}

admin_order_arrow();

 

