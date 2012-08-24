<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	  <div id="btn_back"><a href="javascript:history.back();"><wa:mls>Back</wa:mls></a></div>
  <!--btnback:end-->
  <div class="clear"></div>
	  <div id="content_main">
		 	<wa:include URI="front/content/introList" />
			<c:choose>
				<c:when test="${group eq 'BnB'}">
					<wa:include URI="front/content/findBnB" >
						<wa:param name="group" value="${group}"/>
					</wa:include>
				</c:when>
				<%-- <c:when test="${group eq 'HOTEL'}">
					<wa:include URI="front/content/findStay" >
						<wa:param name="group" value="${group}"/>
					</wa:include>
				</c:when> --%>
				<c:when test="${group ne 'HOTEL'}">
					<c:if test="${group ne 'AUBERGE'}">
						<wa:include URI="front/content/find" >
							<wa:param name="group" value="${group}"/>
						</wa:include>
					</c:if>
				</c:when>
			</c:choose>
	 	<wa:include URI="front/content/listStays" />  
      </div>
