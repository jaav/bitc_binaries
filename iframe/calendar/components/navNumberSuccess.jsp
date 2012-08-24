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
		        <a href="<wa:url URI="${URI}"></wa:url>?code=${waParam.code}&page=${page - 1}<c:if test="${not empty waParam.date}">&date=${waParam.date}</c:if><c:if test="${not empty waParam.clt}">&clt=${waParam.clt}</c:if><c:if test="${not empty waParam.type}">&type=${waParam.type}</c:if><c:if test="${not empty waParam.txt}">&txt=${waParam.txt}</c:if><c:if test="${not empty waParam.categ}">&categ=${waParam.categ}</c:if><c:if test="${not empty waParam.f_search_submit}">&f_search_submit=${waParam.f_search_submit}</c:if>" class="arrow_left">
			        <img src="${staticSite}/img/ml/btn_arrow_left_opacity.png" alt="<wa:mls>previous</wa:mls>"/>
	            </a>
	        </c:if>
		   
		 <div style="float:left"> <wa:mls>Page</wa:mls>
		
		  	<input  type="text" name="page" value="${page}" size="3"  class="first_number"/> 
		  	<input  type="hidden" name="maxPage" value="${lastPage}" />
		  	<c:if test="${not empty waParam.orderBy}">
			  	<input  type="hidden" name="orderBy" value="${waParam.orderBy}" />
			  	<input  type="hidden" name="asc" value="${waParam.asc}" />
		  	</c:if>
		   <wa:mls>of</wa:mls> ${lastPage} </div>
	      <c:if test="${ (page + 1) le lastPage }"> 
				 <a href="<wa:url URI="${URI}"></wa:url>?code=${waParam.code}&page=${page + 1}<c:if test="${not empty waParam.date}">&date=${waParam.date}</c:if><c:if test="${not empty waParam.clt}">&clt=${waParam.clt}</c:if><c:if test="${not empty waParam.type}">&type=${waParam.type}</c:if><c:if test="${not empty waParam.txt}">&txt=${waParam.txt}</c:if><c:if test="${not empty waParam.categ}">&categ=${waParam.categ}</c:if><c:if test="${not empty waParam.f_search_submit}">&f_search_submit=${waParam.f_search_submit}</c:if>" class="arrow_right">
			        <img src="${staticSite}/img/ml/btn_arrow_right_opacity.png" alt="<wa:mls>next</wa:mls>"/>
	            </a>
	      </c:if>
	    
	      <div class="clr"></div>
	     </form> 
</div>

