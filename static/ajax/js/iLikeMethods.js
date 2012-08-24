
// ILIKE METHODS  
//	* addILike(group, contentId) => call processAddILikeResult(data) (add ILike for user,  return countILike / "already" if already iLiked, "false" if error )
//	* checkIfILike(group, contentId) => call processcheckIfILikeResult(data) ( return true/false ) 
//	* countILike(group, contentId) => call processCountILikeResult(data) ( return count / false if error )
//
function addILike(group,contentId){
	$.ajax({
		url:"/bitc/front/ajax/addILike.do?contentId="+contentId+"&group="+group,
		type:'GET',
		dataType: "json",
		success : function(data){
			processAddILikeResult(data)
		}
	})
}
function checkIfILike(group,contentId){
	$.ajax({
		url:'/bitc/front/ajax/checkIfILike.do?contentId='+contentId+'&group='+group,
		type:'GET',
		dataType: "json",
		success : function(data){
			processCheckIfILikeResult(data)
		}
	})
}
function countILike(group,contentId){
	$.ajax({
		url:'/bitc/front/ajax/countILike.do?contentId='+contentId+'&group='+group,
		type:'GET',
		dataType: "json",
		success : function(data){
			processCountILikeResult(data)
		}
	})
}