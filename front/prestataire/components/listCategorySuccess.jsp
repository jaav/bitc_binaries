<%@ page 
language="java"
contentType="text/html; charset=utf-8"
pageEncoding="utf-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--tab:start-->
<div class="TabbedPanelsContentGroup">
	<div class="Tabbe_Content_Group">
   		<ul class="tab_list_complete">
      		<c:choose>
      			<c:when test="${empty list}"><wa:mls>Liste vide</wa:mls></c:when>
      			<c:otherwise>
      				<c:forEach var="item" items="${list}" varStatus="loop">
             			<li> 
             				<a href="<wa:url URI="${site}/${module}/displayList/id/${item.id}"/>" > 
	         					<c:choose>
	         						<c:when test="${not empty item.mainSmallImage}">	
	       							<img src="${item.mainSmallImage}" alt="${item.formatMainTitle}" width="165"/>
	         						</c:when>
	         						<c:otherwise>
	       							<img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.formatMainTitle}" width="165"/>
	         						</c:otherwise>
	         					</c:choose>
          					</a>
              				<div class="txt">
	            				<h3 class="no_margin">
		           					<a href="<wa:url URI="${site}/${module}/displayList/id/${item.id}"/>"  title="${item.formatMainTitle}">${item.mainTitle}</a>
		           				</h3>
		            			${item.mainAbstract_}
	            			</div>
	          				<div class="btn">
								<div class="more_info"><a href="<wa:url URI="${site}/${module}/displayList/id/${item.id}"/>" class="btn_more_info" title="${item.formatMainTitle}"><wa:mls>More info</wa:mls></a></div>
	          				</div>
	          				<div class="clr"></div>
        				</li>        	
        			</c:forEach>
        		</c:otherwise>
        	</c:choose>
      </ul>
  	</div>
</div>
<!--tab:end-->


