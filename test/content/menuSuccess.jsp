<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css" media="screen">
@import url("${static}/front/css/nyroModal.css");
</style>
<script type="text/javascript" src="${static}/front/js/jquery.nyroModal-1.6.1.pack.js"></script>
<script src="${static}/ajax/js/tripPlannerMethods.js" type="text/javascript"></script> 
<script src="${static}/ajax/js/meetingPlannerMethods.js" type="text/javascript"></script>

   <div class="TabbedPanelsContentGroup">
      <c:forEach var="item" items="${list}" varStatus="loop">
        	${item.title}--->${item.url}<br/><p></p>
        </c:forEach>
        <c:forEach var="item" items="${list2}" varStatus="loop">
        	${item.title}--->${item.url}<br/><p></p>
        </c:forEach>
        <c:forEach var="item" items="${list3}" varStatus="loop">
        	${item.title}--->${item.url}<br/><p></p>
        </c:forEach>
        <c:forEach var="item" items="${list4}" varStatus="loop">
        	${item.title}--->${item.url}<br/><p></p>
        </c:forEach>
        
    </div>
 