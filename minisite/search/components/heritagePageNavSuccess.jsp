<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="nav_number">
	    <form name="idform${waCompParam.navId}"> 
		    <c:if test="${ (page - 1) ne 0 }">
		        <a href="?clt=${culture}&page=${page - 1}&name=${waParam.name}&f_search_query=${queryString}&group=${group}&s_ContentPropertyValueManager_valueId_Location=${s_ContentPropertyValueManager_valueId_Location}&s_heritage_place=${s_heritage_place}&s_heritage_event=${s_heritage_place}" class="arrow_left">
			        <img src="${static}/front/img/ml/btn_arrow_left.jpg" alt="<wa:mls>previous</wa:mls>"/>
	            </a>
	        </c:if>
		    <c:if test="${ (page - 1) eq 0 }">
		        <a class="arrow_left"><img src="${static}/front/img/ml/btn_arrow_left_opacity.png" alt="<wa:mls>previous</wa:mls>"/></a>
			</c:if>
		 <div style="float:left"> <wa:mls>Page</wa:mls> 
		
		  	<input  type="text" name="page" value="${page}" size="3"  class="first_number"/> 
		  	<input  type="hidden" name="maxPage" value="${lastPage}" />
		  	<input  type="hidden" name="f_search_query" value="${queryString}" />
		  	<input  type="hidden" name="contentType" value="${contentType}" />
		  	<input  type="hidden" name="group" value="${group}" />
		  	<input  type="hidden" name="name" value="${waParam.name}" />
		  	<input  type="hidden" name="s_ContentPropertyValueManager_valueId_Location" value="${s_ContentPropertyValueManager_valueId_Location}" />
		  	<input  type="hidden" name="s_heritage_place" value="${s_heritage_place}" />
		  	<input  type="hidden" name="s_heritage_event" value="${s_heritage_event}" />
		  	
		   <wa:mls>of</wa:mls> ${lastPage} </div>
	      <c:if test="${ (page + 1) le lastPage }"> 
				<a href="?clt=${culture}&page=${page + 1 }&name=${waParam.name}&f_search_query=${queryString}&contentType=${contentType}&group=${group}&s_ContentPropertyValueManager_valueId_Location=${s_ContentPropertyValueManager_valueId_Location}&s_heritage_place=${s_heritage_place}&s_heritage_event=${s_heritage_event}" class="arrow_right">
			        <img src="${static}/front/img/ml/btn_arrow_right.png" alt="<wa:mls>next</wa:mls>"/>
	            </a>
	      </c:if>
	      <c:if test="${ (page + 1) gt lastPage }"> 
	         <a class="arrow_right"> <img src="${static}/front/img/ml/btn_arrow_right_opacity.png" alt="<wa:mls>next</wa:mls>"/></a>
	      </c:if>
	      <div class="clr"></div>
	     </form> 
</div>

