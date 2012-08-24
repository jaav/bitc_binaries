<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${culture.language == 'fr' || culture.language == 'nl'}">
    <!-- component arsene50:start -->
        <div id="arsene50">
      <h2 class="float_left"><wa:mls>Last Minute</wa:mls></h2><img src="${staticSite}/img/ml/logo_arsene50.jpg" alt="" class="float_left"/>
      <div class="clr"></div>
      <h3 class="txt_red"><wa:mls>avec Arsène 50</wa:mls></h3>
      <c:if test="${not empty Arsene50List}">
      	<c:forEach items="${Arsene50List}" var="item">
      	<div class="feedArsene50Be">
      			<p>
      				<c:choose>
      					<c:when test="${ not empty item.link}">
      						<a href="${item.link}" target="_blank">${item.title}</a>
      					</c:when>
      					<c:otherwise>
      						${item.title}
      					</c:otherwise>
      				</c:choose>
      				<c:if test="${not empty item.place}">- <span class="feedArsene50BePlace">${item.place}</span></c:if>
      			</p>
      			<c:forEach items="${item.tickets}" var="ticket">
      				<p class="feedArsene50BeTickets">
      					${ticket.availabletickets} <wa:mls>tickets disponibles à</wa:mls> ${ticket.arsenePrice} &euro;. <wa:mls>Prix original :</wa:mls><strike>${ticket.originalPrice} &euro;</strike>
      				</p>
      			</c:forEach>
      		</div>	
      		
      	</c:forEach>
      </c:if>
 
    <span><a href="http://www.arsene50.be/${culture.language}" title="<wa:mls>Arsène 50</wa:mls>" target="_blank"><wa:mls>Découvrez tous les Last Minutes</wa:mls></a></span>
    </div>
     <!-- component arsene50:end -->
</c:if>