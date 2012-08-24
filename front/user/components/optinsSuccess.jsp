<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div  id="box_news">
  <c:forEach var="item" items="${listNltType}" varStatus="loop">
	<c:choose>
	<c:when test="${loop.count mod 2 ne 0}">
	<div class="box_news_left">
       	<!--<span id="tfv_nlt_${item.id}">-->
	        <label for="f_nlt_${item.id}" class="label_radio_news"><wa:mls>${item.name}</wa:mls></label>
	        <c:set var="optinId" value="f_nlt_${item.id}" />
	        <div class="box_input_radio"> 
	          <input name="f_nlt_${item.id}" type="checkbox" value="1" class="radio" 
	          	<c:choose>
		        	<c:when test="${mapOptins[optinId] == true}">checked="checked" hello</c:when>
		        	<c:when test="${mapOptins[optinId] != false && item.value == true}">checked="checked"</c:when>
		        </c:choose>
	          />
	         </div>
	         <div class="clr"></div>
	        <!--<img src="${staticSite}/img/ml/ok.png" class="validMsg"/> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
	        <div class="radioRequiredMsg clr"><wa:mls>Veuillez faire un choix</wa:mls></div>
        </span>-->
                </div>
        </c:when>
        <c:otherwise>
	<div class="box_news_right">
        
        	<span id="tfv_nlt_${item.id}">
	        <label for="f_nlt_${item.id}" class="label_radio_news"><wa:mls>${item.name}</wa:mls></label>
	        <c:set var="optinId" value="f_nlt_${item.id}" />
	        <div class="box_input_radio"> 
	          <input name="f_nlt_${item.id}" type="checkbox" value="1" class="radio" 
	          	<c:choose>
		        	<c:when test="${mapOptins[optinId] == true}">checked="checked"</c:when>
		        	<c:when test="${mapOptins[optinId] != false && item.value == true}">checked="checked"</c:when>
		        </c:choose>
	          />
	         </div>
	         <div class="clr"></div>
	    
                </div>
                
        </c:otherwise>
        </c:choose>
    </c:forEach>
    	         <div class="clr"></div>
</div>