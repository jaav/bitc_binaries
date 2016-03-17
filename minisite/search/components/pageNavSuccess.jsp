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
		        <a href="?clt=${culture}&page=${page - 1}&name=${waParam.name}&f_search_query=${queryString}&contentType=${contentType}&group=${group}&s_ContentPropertyValue_valueId_Cuisine=${s_ContentPropertyValue_valueId_Cuisine}&s_ContentPropertyValueManager_valueId_ShoppingCategory=${s_ContentPropertyValueManager_valueId_ShoppingCategory}&s_periodFromDate=${s_periodFromDate}&s_periodToDate=${s_periodToDate}&s_bfoService=${s_bfoService}&s_spotProfile=${s_spotProfile}&s_ContentPropertyValueManager_valueId_Category=${s_ContentPropertyValueManager_valueId_Category}" class="arrow_left">
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
		  	<input  type="hidden" name="s_ContentPropertyValue_valueId_Cuisine" value="${s_ContentPropertyValue_valueId_Cuisine}" />
		  	<input  type="hidden" name="s_ContentPropertyValueManager_valueId_Quartier" value="${s_ContentPropertyValueManager_valueId_Quartier}" />
		  	<input  type="hidden" name="s_periodFromDate" value="${s_periodFromDate}" />
		  	<input  type="hidden" name="s_periodToDate" value="${s_periodToDate}" />
             <input  type="hidden" name="s_bfoService" value="${s_bfoService}" />
             <input  type="hidden" name="s_spotProfile" value="${s_spotProfile}" />
		  	
		   <wa:mls>of</wa:mls> ${lastPage} </div>
	      <c:if test="${ (page + 1) le lastPage }"> 
				<a href="?clt=${culture}&page=${page + 1 }&name=${waParam.name}&f_search_query=${queryString}&contentType=${contentType}&group=${group}&s_ContentPropertyValue_valueId_Cuisine=${s_ContentPropertyValue_valueId_Cuisine}&s_ContentPropertyValueManager_valueId_ShoppingCategory=${s_ContentPropertyValueManager_valueId_ShoppingCategory}&s_periodFromDate=${s_periodFromDate}&s_periodToDate=${s_periodToDate}&s_bfoService=${s_bfoService}&s_spotProfile=${s_spotProfile}&s_ContentPropertyValueManager_valueId_Category=${s_ContentPropertyValueManager_valueId_Category}" class="arrow_right">
			        <img src="${static}/front/img/ml/btn_arrow_right.png" alt="<wa:mls>next</wa:mls>"/>
	            </a>
	      </c:if>
	      <c:if test="${ (page + 1) gt lastPage }"> 
	         <a class="arrow_right"> <img src="${static}/front/img/ml/btn_arrow_right_opacity.png" alt="<wa:mls>next</wa:mls>"/></a>
	      </c:if>
	      <div class="clr"></div>
	     </form> 
</div>

