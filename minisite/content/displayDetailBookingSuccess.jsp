<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="wadt" uri="DateToolsTags" %>
 <%@ taglib prefix="wast" uri="StringToolsTags" %>


<style type="text/css" media="screen">
@import url("${static}/front/css/nyroModal.css");
</style>
<script type="text/javascript" src="${static}/front/js/jquery.nyroModal-1.6.1.pack.js"></script>


<c:if test="${adminUser != null}">
<script>
function addToNltContent(group,contentId){
	$.ajax({
		url:'/bitc/admin/ajax/addToNltContent.do?contentId='+contentId+'&group='+group,
		type:'GET',
		dataType: "json",
		success : function(data){
			alert(data.result);
		}
	})
}
</script>
</c:if>
<!-- !!!! Don't put elements here. Content MUST be in content_main div below !!! -->
<div id="content_main">
<div id="btn_back"><a href="javascript:history.back();"><wa:mls>Back</wa:mls></a></div>	
 <c:set var="fb_url" value="${config['URL']}${context}/${site}/${module}/${action}/group/${bean.group}/id/${bean.id}/name/${waParam.name}.do"/>   
   <iframe src="http://www.facebook.com/plugins/like.php?href=${fb_url}&amp;layout=standard&amp;show_faces=false&amp;width=450&amp;action=like&amp;font=verdana&amp;colorscheme=light&amp;height=35" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:450px; height:35px;" allowTransparency="true" class="facebook_like"></iframe>
   <iframe
      
     src ="${wast:replace('.html','',bean.url)}.${culture.language}.html?aid=325008<c:if test="${not empty periodFromDate && not empty periodToDate}">&do_availability_check=on&checkin=${wadt:formatDateByPattern(periodFromDate,'yyyy-MM-dd')}&checkout=${wadt:formatDateByPattern(periodToDate,'yyyy-MM-dd')}</c:if>" width="620" height="2750">
    </iframe>
    <div class="clr"></div>
  
	<!--tab:start-->
	
	<div id="listComment">
		<wa:include URI="${site}/content/comment" >
			<wa:param name="group" value="${bean.group}"/>
			<wa:param name="id" value="${bean.id}"/>
		</wa:include>

	</div>
	
</div>	
	

