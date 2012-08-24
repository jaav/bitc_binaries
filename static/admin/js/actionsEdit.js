var path =".";
var idName="";

function admin_confirm(a,msg){
	var cfrm=confirm(msg);
	if (cfrm==true){
		location.href=a;
	}
}

function admin_add(el){
	el.href = path+'/newItem.do';
}


function admin_deleteSelection(el){
	var id = idName;
	var cfrm=confirm('Do you want to delete this elements : '+id);
	if (cfrm==true){
		el.href=path+'/deleteItems/items/'+id+'.do';
	}
}

function admin_duplicateSelection(el){
	var id = idName;
	el.href = path+'/duplicate/id/'+id+'.do';
}

function admin_action(el){
	if(el.id=='add_btn'){
		admin_add(el);
	} else if(el.id=='duplicate_btn'){
		admin_duplicateSelection(el);
	} else if(el.id=='delete_btn'){
		admin_deleteSelection(el);
	}
}

var btn = $('add_btn');
if(btn!=null)
	btn.addClass('allways');
btn = $('duplicate_btn');
if(btn!=null)
	btn.addClass('allways');
btn = $('delete_btn');
if(btn!=null)
	btn.addClass('allways');

var admin_back = function() {history.back();}
btn = $('back_btn');
if(btn!=null && history.length > 1){
	btn.setStyle('text-decoration','underline');
	btn.href="javascript:admin_back();";
	btn.setStyle("display","block");
	btn.setStyle("visibility","visible");
}

var window_close = function() {window.close();}
btn = $('cancel');
if(btn!=null && history.length > 1){
	btn.addEvent('click',admin_back);
} else if(btn!=null && opener){
	btn.addEvent('click',window_close);
} else if(btn!=null){
	btn.setStyle("display","none");
	btn.setStyle("visibility","hidden");	
}

var admin_function_action = function(){ admin_action(this); }


var admin_actions = $$('#actions a');
admin_actions.each(function(item, index){
	if(item.hasClass('allways')){
		item.setStyle('text-decoration','underline');
		item.addEvent('click',admin_function_action);
	}
});







