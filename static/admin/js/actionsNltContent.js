function admin_addResearchToNltContent(){
	var cfrm=confirm('Do you want to add all the elements of the search to nltContent ? : ');
	if (cfrm==true){
		location.href=path+'/addResearchToNltContent/contentType/'+contentType+'.do';
	}
}
/*function admin_addListToNltContent(){
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
	var cfrm=confirm('Do you want to add this/these elements to nltContent ? : '+id);
	
	if (cfrm==true){
		location.href=path+'/addListToNltContent/items/'+id+'/contentType/'+contentType+'.do';
	}
}*/
function admin_addListToNltContent(){
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
	var cfrm=confirm('Do you want to add this/these elements to nltContent ? : '+id);
	if (cfrm==true){
		location.href='/bitc/admin/ajax/addListToNltContent/items/'+id+'/contentType/'+contentType+'.do';
		/*$.ajax({
			url:'/bitc/admin/ajax/addListToNltContent/items/'+id+'/contentType/'+contentType+'.do',
			type:'GET',
			dataType: "json",
			success : function(data){
			}
		})*/
	}
}

btn = $('addListToNltContent_btn');
if(btn!=null){
	btn.addClass('atLeastOne');
	btn.href="#";
	btn.addEvent('click',admin_addListToNltContent)
}
btn = $('addResearchToNltContent_btn');
if(btn!=null){
	btn.href="#";
	btn.addEvent('click',admin_addResearchToNltContent)
}