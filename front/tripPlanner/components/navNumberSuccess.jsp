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
		        <a href="<wa:url URI="${URI}" ></wa:url>?page=${page + 1 }&panelContentType=${waParam.panelContentType}<c:if test="${day_begin != null}">&f_day_begin=${day_begin}</c:if><c:if test="${month_begin != null}">&f_month_begin=${month_begin}</c:if><c:if test="${day_end != null}">&f_day_end=${day_end}</c:if><c:if test="${month_end != null}">&f_month_end=${month_end}</c:if>&panelGroup=${waParam.panelGroup}&rub=${waParam.rub}"  class="arrow_left">
			        <img src="${staticSite}/img/ml/btn_arrow_left.jpg" alt="<wa:mls>previous</wa:mls>"/>
	            </a>
	        </c:if>
		    <c:if test="${ (page - 1) eq 0 }">
		        <a class="arrow_left"><img src="${staticSite}/img/ml/btn_arrow_left_opacity.png" alt="<wa:mls>previous</wa:mls>"/></a>
			</c:if>
		 <div style="float:left"> <wa:mls>Page</wa:mls> 
		
		  	<input  type="text" name="page" value="${page}" size="3"  class="first_number"/> 
		  	<input  type="hidden" name="maxPage" value="${lastPage}" />
		  	<c:if test="${not empty waParam.orderBy}">
			  	<input  type="hidden" name="orderBy" value="${waParam.orderBy}" />
			  	<input  type="hidden" name="asc" value="${waParam.asc}" />
		  	</c:if>
		  		<input  type="hidden" name="panelContentType" value="${waParam.panelContentType}" />
			  	<input  type="hidden" name="panelGroup" value="${waParam.panelGroup}" />
			  	<input  type="hidden" name="rub" value="${waParam.rub}" />
		   <wa:mls>of</wa:mls> ${lastPage} </div>
		   
		   
		   
	      <c:if test="${ (page + 1) le lastPage }">   
				<a href="<wa:url URI="${URI}" ></wa:url>?page=${page + 1 }&panelContentType=${waParam.panelContentType}<c:if test="${day_begin != null}">&f_day_begin=${day_begin}</c:if><c:if test="${month_begin != null}">&f_month_begin=${month_begin}</c:if><c:if test="${day_end != null}">&f_day_end=${day_end}</c:if><c:if test="${month_end != null}">&f_month_end=${month_end}</c:if>&panelGroup=${waParam.panelGroup}&rub=${waParam.rub}" class="arrow_right">
			        <img src="${staticSite}/img/ml/btn_arrow_right.png" alt="<wa:mls>next</wa:mls>"/>
	            </a>
	      </c:if>
	      <c:if test="${ (page + 1) gt lastPage }"> 
	         <a class="arrow_right"> <img src="${staticSite}/img/ml/btn_arrow_right_opacity.png" alt="<wa:mls>next</wa:mls>"/></a>
	      </c:if>
	      <div class="clr"></div>
	     </form> 
</div>

