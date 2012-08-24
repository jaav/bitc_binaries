
// TRIP PLANNER METHODS  

//	* addToTripPlanner(group, contentId) => call tripPlannerLightBox(data) => data.contentName & data.status ( return contentName & status )
//
function saveRfpProfessionalToDb(divId,professionalId,origin){
	$.ajax({
		url:'/bitc/front/ajax/saveRfpProfessionalToDb.do?professionalId='+professionalId+'&divId='+divId,
		type:'GET',
		dataType: "html",
		success : function(data){
			var d="#"+divId;    
			$(d).append(data);
		}
	})
	
}
function deleteRfpProfessionalFromDb(divId,professionalId){
	$.ajax({
		url:'/bitc/front/ajax/deleteRfpProfessionalFromDb.do?professionalId='+professionalId+'&divId='+divId,
		type:'GET',
		dataType: "html",
		success : function(data){
			var d="#"+divId;
			$(d).html(data);
		}
	})
	
}
