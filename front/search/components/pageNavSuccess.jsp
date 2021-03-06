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
		        <a href="?clt=${culture}&page=${page - 1}&f_search_query=${queryString}&contentType=${contentType}&group=${group}&s_ContentPropertyValueManager_valueId_Experience=${s_ContentPropertyValueManager_valueId_Experience}&s_ContentPropertyValueManager_valueId_Profil=${s_ContentPropertyValueManager_valueId_Profil}&s_ContentPropertyValueManager_valueId_Quartier=${s_ContentPropertyValueManager_valueId_Quartier}&s_ContentPropertyValue_valueId_Cuisine=${s_ContentPropertyValue_valueId_Cuisine}&s_ContentPropertyValueManager_valueId_ShoppingCategory=${s_ContentPropertyValueManager_valueId_ShoppingCategory}&s_periodFromDate=${s_periodFromDate}&s_periodToDate=${s_periodToDate}&s_guided_tour_valueId_language=${s_guided_tour_valueId_language}&s_ContentPropertyValueManager_valueId_Category=${s_ContentPropertyValueManager_valueId_Category}
		        &s_ContentPropertyValueManager_valueId_Stars=${s_ContentPropertyValueManager_valueId_Stars}
		        &s_ContentPropertyValueManager_valueId_gmScore=${s_ContentPropertyValueManager_valueId_gmScore}" class="arrow_right">
			        <img src="${staticSite}/img/ml/btn_arrow_left.jpg" alt="<wa:mls>previous</wa:mls>"/>
	            </a>
	        </c:if>
		    <c:if test="${ (page - 1) eq 0 }">
		        <a class="arrow_left"><img src="${staticSite}/img/ml/btn_arrow_left_opacity.png" alt="<wa:mls>previous</wa:mls>"/></a>
			</c:if>
		 <div style="float:left"> <wa:mls>Page</wa:mls> 
		
		  	<input  type="text" name="page" value="${page}" size="3"  class="first_number"/> 
		  	<input  type="hidden" name="maxPage" value="${lastPage}" />
		  	<input  type="hidden" name="f_search_query" value="${queryString}" />
		  	<input  type="hidden" name="contentType" value="${contentType}" />
		  	<input  type="hidden" name="group" value="${group}" />
		  	<input  type="hidden" name="s_ContentPropertyValueManager_valueId_Experience" value="${s_ContentPropertyValueManager_valueId_Experience}" />
		  	<input  type="hidden" name="s_ContentPropertyValueManager_valueId_Profil" value="${s_ContentPropertyValueManager_valueId_Profil}" />
		  	<input  type="hidden" name="s_ContentPropertyValue_valueId_Cuisine" value="${s_ContentPropertyValue_valueId_Cuisine}" />
		  	<input  type="hidden" name="s_ContentPropertyValueManager_valueId_Quartier" value="${s_ContentPropertyValueManager_valueId_Quartier}" />
		  	<input  type="hidden" name="s_ContentPropertyValueManager_valueId_ShoppingCategory" value="${s_ContentPropertyValueManager_valueId_ShoppingCategory}" />
		  	<input  type="hidden" name="s_periodFromDate" value="${s_periodFromDate}" />
		  	<input  type="hidden" name="s_periodToDate" value="${s_periodToDate}" />
		  	<input  type="hidden" name="s_ContentPropertyValueManager_valueId_Category" value="${s_ContentPropertyValueManager_valueId_Category}" />
		  	<input  type="hidden" name="s_guided_tour_valueId_language" value="${s_guided_tour_valueId_language}" />
            <input  type="hidden" name="s_ContentPropertyValueManager_valueId_Stars" value="${s_ContentPropertyValueManager_valueId_Stars}" />
            <input  type="hidden" name="s_ContentPropertyValueManager_valueId_gmScore" value="${s_ContentPropertyValueManager_valueId_gmScore}" />

		  	
		   <wa:mls>of</wa:mls> ${lastPage} </div>
	      <c:if test="${ (page + 1) le lastPage }"> 
				<a href="?clt=${culture}&page=${page + 1 }&f_search_query=${queryString}&contentType=${contentType}&group=${group}&s_ContentPropertyValueManager_valueId_Experience=${s_ContentPropertyValueManager_valueId_Experience}&s_ContentPropertyValueManager_valueId_Profil=${s_ContentPropertyValueManager_valueId_Profil}&s_ContentPropertyValueManager_valueId_Quartier=${s_ContentPropertyValueManager_valueId_Quartier}&s_ContentPropertyValue_valueId_Cuisine=${s_ContentPropertyValue_valueId_Cuisine}&s_ContentPropertyValueManager_valueId_ShoppingCategory=${s_ContentPropertyValueManager_valueId_ShoppingCategory}&s_periodFromDate=${s_periodFromDate}&s_periodToDate=${s_periodToDate}&s_guided_tour_valueId_language=${s_guided_tour_valueId_language}&s_ContentPropertyValueManager_valueId_Category=${s_ContentPropertyValueManager_valueId_Category}
				&s_ContentPropertyValueManager_valueId_Stars=${s_ContentPropertyValueManager_valueId_Stars}
				&s_ContentPropertyValueManager_valueId_gmScore=${s_ContentPropertyValueManager_valueId_gmScore}" class="arrow_right">
			        <img src="${staticSite}/img/ml/btn_arrow_right.png" alt="<wa:mls>next</wa:mls>"/>
	            </a>
	      </c:if>
	      <c:if test="${ (page + 1) gt lastPage }"> 
	         <a class="arrow_right"> <img src="${staticSite}/img/ml/btn_arrow_right_opacity.png" alt="<wa:mls>next</wa:mls>"/></a>
	      </c:if>
	      <div class="clr"></div>
	     </form> 
</div>

