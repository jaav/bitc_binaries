<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--tab:start-->

   <div class="TabbedPanelsContentGroup">
         <div class="Tabbe_Content_Group">
   
       <div class="tab_paging">
            <wa:include URI="${site}/content/navNumber" />
       <div class="select">
          
        </div>
      </div>
      <ul class="tab_list_complete">
      <c:if test="${listNull == '1'}"><wa:mls>Liste vide</wa:mls></c:if>
      <c:forEach var="item" items="${list}" varStatus="loop">
             <li> 
             <a href="<wa:url URI="${site}/eshop/displayEsProduct/id/${item.id}"/>" > 
          <c:choose>
          	<c:when test="${not empty item.mainSmallImage}">	
        		<img src="${item.mainSmallImage}" alt="${item.mainTitle}" width="165"/>
          	</c:when>
          	<c:otherwise>
        		<img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.mainTitle}" width="165"/>
          	</c:otherwise>
          </c:choose>
          </a>
              <div class="txt">
	            <h3 class="no_margin">
		           <a href="<wa:url URI="${site}/eshop/displayEsProduct/id/${item.id}"/>"  title="${item.mainTitle}">${item.mainTitle}</a></h3>
		            ${item.mainAbstract_}
	            </div>
	          <div class="btn">
					<div class="more_info"><a href="<wa:url URI="${site}/eshop/displayEsProduct/id/${item.id}"/>" class="btn_more_info" title="${item.mainTitle}"><wa:mls>More info</wa:mls></a></div>
	          </div>
	          <div class="clr"></div>
	        </li>
	        <c:if test="${loop.count eq 1}">
	        	<c:set var="group" value="${item.group}"></c:set>
	        </c:if>
        </c:forEach>
      </ul>
      <div class="tab_paging">
      
        <wa:include URI="${site}/content/navNumber" />
      
      </div>
    </div></div>
    <!--tab:end-->


