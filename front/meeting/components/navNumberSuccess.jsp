<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="wa" uri="WanabeTags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="nav_number">
	<form name="idform${waCompParam.navId}">
		<c:if test="${ (page - 1) ne 0 }">
			<a
				href="<wa:url URI="${URI}"><wa:exceptParam  name="clt"/><wa:exceptParam  name="group"/><wa:param name="clt" value="${culture}"/><wa:param name="group" value="${waParam.group}"/></wa:url>?page=${page - 1}<c:if test="${not empty waParam.orderBy}">&orderBy=${waParam.orderBy}&asc=${waParam.asc}</c:if><c:if test="${not empty waParam.s_periodFromDate}">&s_periodFromDate=${s_periodFromDate }</c:if><c:if test="${not empty waParam.s_periodToDate}">&s_periodToDate=${s_periodToDate}</c:if><c:if test="${not empty waParam.title}">&title=${waParam.title}</c:if><c:if test="${not empty waParam.room}">&room=${waParam.room}</c:if><c:if test="${not empty waParam.ranking}">&ranking=${waParam.ranking}</c:if><c:if test="${not empty waParam.f_config}">&f_config=${waParam.f_config}</c:if><c:if test="${not empty waParam.f_persons}">&f_persons=${waParam.f_persons}</c:if><c:if test="${not empty waParam.s_ContentPropertyValue_valueId_Cuisine}">&s_ContentPropertyValue_valueId_Cuisine=${waParam.s_ContentPropertyValue_valueId_Cuisine}</c:if><c:if test="${not empty waParam.panel}">&panel=${waParam.panel}</c:if><c:if test="${not empty waParam.s_ContentPropertyValueManager_valueId_Quartier}">&s_ContentPropertyValueManager_valueId_Quartier=${waParam.s_ContentPropertyValueManager_valueId_Quartier}</c:if><c:if test="${not empty waParam.f_nbrSalles}">&f_nbrSalles=${waParam.f_nbrSalles}</c:if><c:if test="${not empty waParam.f_typeVenue}">&f_typeVenue=${waParam.f_typeVenue}</c:if><c:if test="${not empty waParam.f_nbrBedrooms}">&f_nbrBedrooms=${waParam.f_nbrBedrooms}</c:if><c:if test="${not empty waParam.f_categoryVenue}">&f_categoryVenue=${waParam.f_categoryVenue}</c:if>"
				class="arrow_left"> <img src="${staticSite}/img/ml/btn_arrow_left.jpg" alt="<wa:mls>previous</wa:mls>" />
			</a>
		</c:if>
		<c:if test="${ (page - 1) eq 0 }">
			<a class="arrow_left"><img src="${staticSite}/img/ml/btn_arrow_left_opacity.png" alt="<wa:mls>previous</wa:mls>" /></a>
		</c:if>
		<div style="float: left">
			<wa:mls>Page</wa:mls>

			<input type="text" name="page" value="${page}" size="3" class="first_number" /> <input type="hidden" name="maxPage" value="${lastPage}" />
			<c:if test="${not empty waParam.orderBy}">
				<input type="hidden" name="orderBy" value="${waParam.orderBy}" />
				<input type="hidden" name="asc" value="${waParam.asc}" />

			</c:if>
			<c:if test="${not empty waParam.s_periodFromDate}">
				<input type="hidden" name="s_periodFromDate" value="${waParam.s_periodFromDate}" />
			</c:if>
			<c:if test="${not empty waParam.s_periodToDate}">
				<input type="hidden" name="s_periodToDate" value="${waParam.s_periodToDate}" />
			</c:if>
			<c:if test="${not empty waParam.title}">
				<input type="hidden" name="title" value="${waParam.title}" />
			</c:if>
			<c:if test="${not empty waParam.room}">
				<input type="hidden" name="room" value="${waParam.room}" />
			</c:if>
			<c:if test="${not empty waParam.ranking}">
				<input type="hidden" name="ranking" value="${waParam.ranking}" />
			</c:if>
			<c:if test="${not empty waParam.f_config}">
				<input type="hidden" name="f_config" value="${waParam.f_config}" />
			</c:if>
			<c:if test="${not empty waParam.f_persons}">
				<input type="hidden" name="f_persons" value="${waParam.f_persons}" />
			</c:if>
			<c:if test="${not empty waParam.s_ContentPropertyValue_valueId_Cuisine}">
				<input type="hidden" name="s_ContentPropertyValue_valueId_Cuisine" value="${waParam.s_ContentPropertyValue_valueId_Cuisine}" />
			</c:if>
			<c:if test="${not empty waParam.panel}">
				<input type="hidden" name="panel" value="${waParam.panel}" />
			</c:if>
			<c:if test="${not empty waParam.s_ContentPropertyValueManager_valueId_Quartier}">
				<input type="hidden" name="s_ContentPropertyValueManager_valueId_Quartier" value="${waParam.s_ContentPropertyValueManager_valueId_Quartier}" />
			</c:if>
			<c:if test="${not empty waParam.f_nbrSalles}">
				<input type="hidden" name="f_nbrSalles" value="${waParam.f_nbrSalles}" />
			</c:if>
			<c:if test="${not empty waParam.f_typeVenue}">
				<input type="hidden" name="f_typeVenue" value="${waParam.f_typeVenue}" />
			</c:if>
			<c:if test="${not empty waParam.f_nbrBedrooms}">
				<input type="hidden" name="f_nbrBedrooms" value="${waParam.f_nbrBedrooms}" />
			</c:if>
			<c:if test="${not empty waParam.f_categoryVenue}">
				<input type="hidden" name="f_categoryVenue" value="${waParam.f_categoryVenue}" />
			</c:if>
			<wa:mls>of</wa:mls>
			${lastPage}
		</div>
		<c:if test="${ (page + 1) le lastPage }">
			<a
				href="<wa:url URI="${URI}"><wa:exceptParam  name="clt"/><wa:exceptParam  name="group"/><wa:param name="clt" value="${culture}"/><wa:param name="group" value="${waParam.group}"/></wa:url>?page=${page + 1}<c:if test="${not empty waParam.orderBy}">&orderBy=${waParam.orderBy}&asc=${waParam.asc}</c:if><c:if test="${not empty waParam.s_periodFromDate}">&s_periodFromDate=${s_periodFromDate }</c:if><c:if test="${not empty waParam.s_periodToDate}">&s_periodToDate=${s_periodToDate}</c:if><c:if test="${not empty waParam.title}">&title=${waParam.title}</c:if><c:if test="${not empty waParam.room}">&room=${waParam.room}</c:if><c:if test="${not empty waParam.ranking}">&ranking=${waParam.ranking}</c:if><c:if test="${not empty waParam.f_config}">&f_config=${waParam.f_config}</c:if><c:if test="${not empty waParam.f_persons}">&f_persons=${waParam.f_persons}</c:if><c:if test="${not empty waParam.s_ContentPropertyValue_valueId_Cuisine}">&s_ContentPropertyValue_valueId_Cuisine=${waParam.s_ContentPropertyValue_valueId_Cuisine}</c:if><c:if test="${not empty waParam.panel}">&panel=${waParam.panel}</c:if><c:if test="${not empty waParam.s_ContentPropertyValueManager_valueId_Quartier}">&s_ContentPropertyValueManager_valueId_Quartier=${waParam.s_ContentPropertyValueManager_valueId_Quartier}</c:if><c:if test="${not empty waParam.f_nbrSalles}">&f_nbrSalles=${waParam.f_nbrSalles}</c:if><c:if test="${not empty waParam.f_typeVenue}">&f_typeVenue=${waParam.f_typeVenue}</c:if><c:if test="${not empty waParam.f_nbrBedrooms}">&f_nbrBedrooms=${waParam.f_nbrBedrooms}</c:if><c:if test="${not empty waParam.f_categoryVenue}">&f_categoryVenue=${waParam.f_categoryVenue}</c:if>"
				class="arrow_right"> <img src="${staticSite}/img/ml/btn_arrow_right.png" alt="<wa:mls>next</wa:mls>" />
			</a>
		</c:if>
		<c:if test="${ (page + 1) gt lastPage }">
			<a class="arrow_right"> <img src="${staticSite}/img/ml/btn_arrow_right_opacity.png" alt="<wa:mls>next</wa:mls>" /></a>
		</c:if>
		<div class="clr"></div>
	</form>
</div>

