
// TRIP PLANNER METHODS  

//	* addToTripPlanner(group, contentId) => call tripPlannerLightBox(data) => data.contentName & data.status ( return contentName & status )
//
function addToTripPlanner(group,contentId){
	$.ajax({
		url:'/bitc/front/ajax/addToTripPlanner.do?contentId='+contentId+'&group='+group,
		type:'GET',
		dataType: "json",
		success : function(data){
			tripPlannerLightBox(data)
		}
	})
}
function saveTripPlannerToDb(divId,contentType,group,contentId,origin){
	$.ajax({
		url:'/bitc/front/ajax/saveTripPlannerToDb.do?contentType='+contentType+'&contentId='+contentId+'&group='+group+'&divId='+divId,
		type:'GET',
		dataType: "html",
		success : function(data){
			var d="#"+divId;    
			$(d).append(data);
			deleteTripPlannerFromSession(divId,contentType,group,contentId);
		}
	})
	
}
function deleteTripPlannerFromSession(divId,contentType,group,contentId){
	$.ajax({
		url:'/bitc/front/ajax/deleteContentFromSession.do?contentType='+contentType+'&contentId='+contentId+'&group='+group+'&divId='+divId,
		type:'GET',
		dataType: "html",
		success : function(data){
			var d="#favorite";
			$(d).html(data);
		}
	})
	
}
function deleteTripPlannerFromDb(divId,contentType,group,contentId){
	$.ajax({
		url:'/bitc/front/ajax/deleteContentFromDb.do?contentType='+contentType+'&contentId='+contentId+'&group='+group+'&divId='+divId,
		type:'GET',
		dataType: "html",
		success : function(data){
			var d="#"+divId;
			$(d).html(data);
		}
	})
}
