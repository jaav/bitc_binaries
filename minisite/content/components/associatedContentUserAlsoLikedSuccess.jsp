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
<c:if test="${not empty userLiked or  not empty hotel or  not empty bnb or  not empty resto or  not empty quartier or  not empty profile or  not empty experience  }">
		<div class="Tabbe_Content_Group">
		<div class="tab_paging">
		            <wa:include URI="${site}/content/navNumberForAssociatedContent" />
		</div>
     <ul class="tab_list_simple">
      <c:if test="${listNull == '1'}"><wa:mls>aucun contenu trouvé</wa:mls></c:if>
      <c:forEach var="item" items="${list}" varStatus="loop">
             <li>
		        	<c:choose>
			        	<c:when test="${item.group == 'HOTEL'}">
						    <a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" >
					        		<c:choose>
								          	<c:when test="${not empty item.mainSmallImage}">	
								        		<img src="${item.mainSmallImage}" alt="${item.mainTitle}"  width = '91'/>
								          	</c:when>
								          	<c:otherwise>
								        		<img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.mainTitle}"  width = '91'/>
								          	</c:otherwise>
          							</c:choose>
					        </a>
					    </c:when>
	      			    <c:otherwise>
		      			    <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" >
			        		    <c:choose>
								          	<c:when test="${not empty item.mainSmallImage}">	
								        		<img src="${item.mainSmallImage}" alt="${item.mainTitle}" width='91' />
								          	</c:when>
								          	<c:otherwise>
								        		<img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.mainTitle}" width = '91' />
								          	</c:otherwise>
          							</c:choose>
			        	    </a>
	      			    </c:otherwise>
	      			</c:choose>

      			<div class="txt">
	            <h3 class="no_margin">
	            <c:choose>
		        	<c:when test="${item.group == 'HOTEL'}">
					   <a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" title="${item.mainTitle}" >${item.mainTitle}</a>
				    </c:when>
      			    <c:otherwise>
	      			    <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" title="${item.mainTitle}" >${item.mainTitle}</a>
      			    </c:otherwise>
      			</c:choose>
	            	
	            </h3>
	            ${item.mainAbstract_}
	            </div>
	            	<div class="more_info">
						<c:choose>
				        	<c:when test="${item.group == 'HOTEL'}">
							   <a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" class="btn_more_info" title="${item.mainTitle}"><wa:mls>More info</wa:mls></a>
						    </c:when>
		      			    <c:otherwise>
			      			    <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="btn_more_info" title="${item.mainTitle}"><wa:mls>More info</wa:mls></a>
		      			    </c:otherwise>
		      			</c:choose>
      				</div>
	          <div class="clr"></div>
             </li>
        </c:forEach>
    
      </ul>
       <div class="tab_paging">
  			<wa:include URI="${site}/content/navNumberForAssociatedContent" />
  	   </div>
      </div>
</c:if>

