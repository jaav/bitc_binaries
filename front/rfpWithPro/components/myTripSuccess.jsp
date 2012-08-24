<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="clear"></div>
<script src="${static}/ajax/js/meetingPlannerMethods.js" type="text/javascript"></script>
<div id="rubrique">
 <a class="blue"><wa:mls>Professional for RFP</wa:mls></a>
     <div class="group_item bg_dark_blue">
	     <div id="pro">
	          <c:forEach var="item" items="${list}" varStatus="loop">
		       	<div class="item"> <a href="javascript:deleteRfpProfessionalFromDb('pro','${item.userid}');" class="btn_delete"></a>
	            <p><strong>${item.firstname}</strong><strong>${item.lastname}</strong></p>
	            <div class="clr"></div>
	          </div>
		       </c:forEach>
		  </div>
	      <div class="clr"></div>
     </div>
    <div class="clr"></div>
</div>