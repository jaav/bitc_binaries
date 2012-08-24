var admin_selectNum = 0;
var path =".";
var fileExport ="_";
var filePrint ="_";
function admin_print(el){
	el.href ='#';
	window.print();
}

function admin_exportXls(el){
	el.href = path+'/'+fileExport+'.do';
}

function admin_calculate(el){
	el.href = path+'/formCriteria.do';
}

function admin_action(el){
	if(el.id=='exportXls_btn'){
		admin_exportXls(el);
	} else if(el.id=='calculate_btn'){
		admin_calculate(el);
	} else if(el.id=='print_btn'){
		admin_print(el);
	}
}
var admin_function_action = function(){admin_action(this); }


var admin_actions = $$('#actions a');
admin_actions.each(function(item, index){
	if(item.hasClass('allways')){
		item.setStyle('text-decoration','underline');
		item.addEvent('click',admin_function_action);
	}
});

$('legend_btn').href='#';






