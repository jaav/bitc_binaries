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
		        <a href="<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="page"/><wa:exceptParam name="s_periodToDate"/><wa:exceptParam name="s_periodFromDate"/><wa:exceptParam name="clt"/><wa:exceptParam name="lg"/><wa:param name="clt" value="${culture}"/><wa:param name="idCongressiste" value="${idCongressiste}"/></wa:url>?page=${page - 1}<c:if test="${not empty waParam.contentType}">&contentType=${waParam.contentType}&panel=${waParam.panel}</c:if><c:if test="${not empty waParam.orderBy}">&orderBy=${waParam.orderBy}&asc=${waParam.asc}</c:if><c:if test="${not empty waParam.s_periodFromDate}">&s_periodFromDate=${s_periodFromDate }</c:if><c:if test="${not empty waParam.s_periodToDate}">&s_periodToDate=${s_periodToDate}</c:if>" class="arrow_left">
			        <img src="${staticSite}/img/ml/btn_arrow_left.jpg" alt="<wa:mls>previous</wa:mls>"/>
	            </a>
	        </c:if>
		    <c:if test="${ (page - 1) eq 0 }">
		        <a class="arrow_left"><img src="${staticSite}/img/ml/btn_arrow_left_opacity.png" alt="<wa:mls>previous</wa:mls>"/></a>
			</c:if>
		 <div style="float:left"> <wa:mls>Page</wa:mls> 
		
		  	<input  type="text" name="page" value="${page}" size="3"  class="first_number"/> 
		  	<input  type="hidden" name="maxPage" value="${lastPage}" />
		  	<c:if test="${not empty waParam.contentType}">
		  		<input  type="hidden" name="contentType" value="${waParam.contentType}" />
		  	</c:if>
		  	<c:if test="${not empty waParam.panel}">
		  		<input  type="hidden" name="panel" value="${waParam.panel}" />
		  	</c:if>
		  	<c:if test="${not empty waParam.orderBy}">
			  	<input  type="hidden" name="orderBy" value="${waParam.orderBy}" />
			  	<input  type="hidden" name="asc" value="${waParam.asc}" />
		  	</c:if>
		   <wa:mls>of</wa:mls> ${lastPage} </div>
	      <c:if test="${ (page + 1) le lastPage }"> 
				<a href="<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="page"/><wa:exceptParam name="s_periodToDate"/><wa:exceptParam name="s_periodFromDate"/><wa:exceptParam name="clt"/><wa:exceptParam name="lg"/><wa:param name="clt" value="${culture}"/><wa:param name="idCongressiste" value="${idCongressiste}"/></wa:url>?page=${page + 1}<c:if test="${not empty waParam.contentType}">&contentType=${waParam.contentType}&panel=${waParam.panel}</c:if><c:if test="${not empty waParam.orderBy}">&orderBy=${waParam.orderBy}&asc=${waParam.asc}</c:if><c:if test="${not empty waParam.s_periodFromDate}">&s_periodFromDate=${s_periodFromDate }</c:if><c:if test="${not empty waParam.s_periodToDate}">&s_periodToDate=${s_periodToDate}</c:if>" class="arrow_right">
			        <img src="${staticSite}/img/ml/btn_arrow_right.png" alt="<wa:mls>next</wa:mls>"/>
	            </a>
	      </c:if>
	      <c:if test="${ (page + 1) gt lastPage }"> 
	         <a class="arrow_right"> <img src="${staticSite}/img/ml/btn_arrow_right_opacity.png" alt="<wa:mls>next</wa:mls>"/></a>
	      </c:if>
	      <div class="clr"></div>
	     </form> 
</div>

