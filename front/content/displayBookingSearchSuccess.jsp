<%@ page
        language="java"
        contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"
        isELIgnored="false"
        %>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="wadt" uri="DateToolsTags" %>
<div id="btn_back"><a href="javascript:history.back()"><wa:mls>Back</wa:mls></a></div>
<!--btnback:end-->
<div class="clear"></div>
<div id="content_main">
    <wa:include URI="front/content/introList"/>
    <c:choose>
        <c:when test="${group eq 'BnB'}">
            <wa:include URI="front/content/findBnB">
                <wa:param name="group" value="${group}"/>
            </wa:include>
        </c:when>
        <c:otherwise>
            <wa:include URI="front/content/findStay">
                <wa:param name="group" value="${group}"/>
            </wa:include>
        </c:otherwise>
    </c:choose>
    <wa:include URI="front/content/listBookingSearch">
        <wa:param name="group" value="${group}"/>
    </wa:include>
</div>

