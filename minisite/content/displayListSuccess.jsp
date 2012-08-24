<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- !!!! Don't put elements here. Content MUST be in content_main div below !!! -->


	  <div id="content_main">
	  <div id="btn_back"><a href="javascript:history.back();"><wa:mls>Back</wa:mls></a></div>
			<wa:include URI="${site}/content/introList" />
			<c:choose>
				<c:when test="${group eq 'CULTURE' || group eq 'GO_OUT'}">
					<wa:include URI="${site}/content/findAgenda">
						<wa:param name="group" value="${group}"/>
					</wa:include>
				</c:when>
				<c:when test="${group ne 'WALK' && group ne 'PRESS_REPORT'}">
					<wa:include URI="${site}/content/find">
						<wa:param name="group" value="${group}"/>
					</wa:include>
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${group eq 'CULTURE' || group eq 'GO_OUT' || group eq 'CULTURE_1'}">
					<wa:include URI="${site}/content/listAgenda" />	
				</c:when>
				<c:otherwise>
					<wa:include URI="${site}/content/list" />	
				</c:otherwise>
			</c:choose>
			
			
      </div>
