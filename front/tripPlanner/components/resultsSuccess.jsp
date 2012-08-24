<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="wa" uri="WanabeTags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:choose>
	<c:when test="${not empty ERROR_SEARCH}">
		<div class="TabbedPanelsContentGroup">
            <div class="Tabbe_Content_Group">
            	<div class="tab_paging">
           	 		<wa:include URI="${site}/tripPlanner/navNumber" />
     			</div>
				<div class="clr"></div>
      			<ul class="tab_list_complete">
     				${ERROR_SEARCH}
      			</ul>
      			<div class="tab_paging">
            		<wa:include URI="${site}/tripPlanner/navNumber" />
     			</div>
    		</div>
    	</div>
	</c:when>
	<c:when test="${panelGroup == 'HOTEL'}">
		<wa:include URI="front/tripPlanner/listStays">
			<wa:param name="group" value="${panelGroup}" />
		</wa:include>
	</c:when>
	<c:when test="${panelGroup == 'BnB'}">
		<c:choose>
			<c:when test="${originTripSearch eq 'BnB'}">
				<wa:include URI="front/tripPlanner/listBnBSearch">
					<wa:param name="group" value="${panelGroup}" />
				</wa:include>
			</c:when>
			<c:otherwise>
				<wa:include URI="front/tripPlanner/listStays">
					<wa:param name="group" value="${panelGroup}" />
				</wa:include>
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:when
		test="${panelContentType == 'ContentStay' and panelGroup eq 'ALL'}">
		<wa:include URI="front/tripPlanner/listStays">
			<wa:param name="group" value="${panelGroup}" />
		</wa:include>
	</c:when>
	<c:when test="${panelContentType == 'ContentRestaurant'}">
		<wa:include URI="front/tripPlanner/listResto">
			<wa:param name="group" value="${panelGroup}" />
		</wa:include>
	</c:when>
	<c:when test="${panelContentType == 'ContentEvent'}">
		<c:choose>
			<c:when test="${originTripSearch eq 'event'}">
				<wa:include URI="front/tripPlanner/listAgendaSearch">
					<wa:param name="group" value="${panelGroup}" />
					<wa:param name="originTripSearch" value="${originTripSearch}" />
					<wa:param name="periodFromDate" value="${periodFromDate}" />
					<wa:param name="periodToDate" value="${periodToDate}" />
				</wa:include>
			</c:when>
			<c:otherwise>
				<wa:include URI="front/tripPlanner/listAgenda">
					<wa:param name="group" value="${panelGroup}" />
				</wa:include>
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:when
		test="${panelContentType == 'ContentPlace' && panelGroup ne 'MUSEUM_AND_ATTRACTIONS'}">
		<wa:include URI="front/tripPlanner/list">
			<wa:param name="group" value="${panelGroup}" />
		</wa:include>
	</c:when>
	<c:when test="${panelGroup == 'MUSEUM_AND_ATTRACTIONS'}">
		<wa:include URI="front/tripPlanner/list">
			<wa:param name="group" value="${panelGroup}" />
		</wa:include>
	</c:when>
	<c:when test="${panelGroup == 'WALK'}">
		<wa:include URI="front/tripPlanner/list">
			<wa:param name="group" value="WALK" />
		</wa:include>
	</c:when>
</c:choose>