window.addEvent('load', function(){
	var _abstract='abstract';
	actionForDisplayTxtArea(_abstract);
	var _body='body';
	actionForDisplayTxtArea(_body);
	var _info='info';	
	actionForDisplayTxtArea(_info);
});
function applyValueForAll(nameOfClass,element){
	var myElement = $(element);
	if(myElement != null ){
		try{
			var inputs = $$('.'+nameOfClass);
			if(inputs != null){
				inputs.each(function(item,index){
					item.value = myElement.value;
				});
			}
		}
		catch(err){
			alert(err+ " element : "+ myElement.id);
		}
	}
	
}

function actionForDisplayTxtArea(name){
	//Chercher dans les cookies : initialise
	try{
			
		if (Cookie.read('check_'+name,{path: path}) == '1'){ // les composants seront affichés en display none
					actionStyleDisplay('.'+name,'none');
					actionChecked('.check_'+name,true);
					actionStyleDisplay('.text_check_block_'+name,'block');
				}
				else{
					actionStyleDisplay('.text_check_none_'+name,'block');
					actionChecked('.check_'+name,false);
				}
			//Evenement : checker
				var inputs = $$('.check_'+name);
				if(inputs != null){
					
					$$('.check_'+name).addEvent('click', function(e){
						if (Cookie.read('check_'+name,{path: path}) == '1'){
							actionStyleDisplay('.'+name,'block');
							var myCookie = Cookie.write('check_'+name, '0',{path: path});
							actionStyleDisplay('.text_check_block_'+name,'none');
							actionStyleDisplay('.text_check_none_'+name,'block');
							actionChecked('.check_'+name,false);
						}
						else{
							var myCookie = Cookie.write('check_'+name, '1',{path: path});
							actionStyleDisplay('.'+name,'none');
							actionStyleDisplay('.text_check_none_'+name,'none');
							actionStyleDisplay('.text_check_block_'+name,'block');
							
							actionChecked('.check_'+name,true);
						}
					});
				}
	}
	catch(err){
		//alert(err+ " element : "+name);
	}
}
function actionChecked(elements,bool){
	//sert a modifier le checked
	try{
		var inputs = $$(elements);
		if(inputs != null){
			inputs.each(function(item,index){
				item.checked= bool;
			});
		}
		
	}
	catch(err){
		alert("error on actionChecked"+err);
	}
}

function actionStyleDisplay(elements,type){
	//sert a modifier le style display
	try{
		var inputs = $$(elements);
		if(inputs != null){
			inputs.each(function(item,index){
				item.setStyle('display',type) ;
			});
		}
		
	}
	catch(err){
		alert("error on actionChecked"+err);
	}
}

