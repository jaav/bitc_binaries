
// TRIP PLANNER METHODS  

//	* addToTripPlanner(group, contentId) => call tripPlannerLightBox(data) => data.contentName & data.status ( return contentName & status )
//
function addToMeetingPlanner(group,contentId){
	$.ajax({
		url:'/bitc/front/ajax/addToMeetingPlanner.do?contentId='+contentId+'&group='+group,
		type:'GET',
		dataType: "json",
		success : function(data){
			meetingPlannerLightBox(data)
		}
	})
}
function saveMeetingPlannerToDb(divId,contentType,group,contentId,origin){
	$.ajax({
		url:'/bitc/front/ajax/saveMeetingPlannerToDb.do?contentType='+contentType+'&contentId='+contentId+'&group='+group+'&divId='+divId,
		type:'GET',
		dataType: "html",
		success : function(data){
			var d="#"+divId;   
			$(d).append(data);
			deleteMeetingPlannerFromSession(divId,contentType,group,contentId);
		}
	})
	
}
function deleteMeetingPlannerFromSession(divId,contentType,group,contentId){
	$.ajax({
		url:'/bitc/front/ajax/deleteMeetingPlannerFromSession.do?contentType='+contentType+'&contentId='+contentId+'&group='+group+'&divId='+divId,
		type:'GET',
		dataType: "html",
		success : function(data){
			var d="#favorite";
			$(d).html(data);
		}
	})
	
}
function deleteMeetingPlannerFromDb(divId,contentType,group,contentId){
	$.ajax({
		url:'/bitc/front/ajax/deleteMeetingPlannerFromDb.do?contentType='+contentType+'&contentId='+contentId+'&group='+group+'&divId='+divId,
		type:'GET',
		dataType: "html",
		success : function(data){
			var d="#"+divId;
			$(d).html(data);
		}
	})
}
