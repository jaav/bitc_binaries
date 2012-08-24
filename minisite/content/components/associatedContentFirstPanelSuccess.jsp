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

        <c:if test="${not empty hotel}"><li class="<c:if test="${tabbedPanelsTab eq 'Hotels'}">TabbedPanelsTabSelected</c:if><c:if test="${tabbedPanelsTab ne 'Hotels'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${site}/content/${pageDetail }/group/${group }/id/${contentId }/name/${waParam.name}"/>?tabbedPanelsTab=Hotels&property=ALL#associatedContent"><div><wa:mls>Hotels</wa:mls></div></a></li></c:if>
     
        <c:if test="${not empty resto}"> <li class="<c:if test="${tabbedPanelsTab eq 'resto'}">TabbedPanelsTabSelected</c:if><c:if test="${tabbedPanelsTab ne 'resto'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${site}/content/${pageDetail }/group/${group }/id/${contentId }/name/${waParam.name}"/>?tabbedPanelsTab=resto&property=ALL#associatedContent"><div><wa:mls>Restaurant</wa:mls></div></a></li></c:if>
        <c:if test="${not empty event}"> <li class="<c:if test="${tabbedPanelsTab eq 'event'}">TabbedPanelsTabSelected</c:if><c:if test="${tabbedPanelsTab ne 'event'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${site}/content/${pageDetail }/group/${group }/id/${contentId }/name/${waParam.name}"/>?tabbedPanelsTab=event&property=ALL#associatedContent"><div><wa:mls>Events</wa:mls></div></a></li></c:if>
        <c:if test="${not empty quartier}"><li class="<c:if test="${tabbedPanelsTab eq 'quartier'}">TabbedPanelsTabSelected</c:if><c:if test="${tabbedPanelsTab ne 'quartier'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${site}/content/${pageDetail }/group/${group }/id/${contentId }/name/${waParam.name}"/>?tabbedPanelsTab=quartier&property=QUARTIERS#associatedContent"><div><wa:mls>Quartier</wa:mls></div></a></li></c:if>
        <c:if test="${not empty profile}"><li class="<c:if test="${tabbedPanelsTab eq 'profile'}">TabbedPanelsTabSelected</c:if><c:if test="${tabbedPanelsTab ne 'profile'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${site}/content/${pageDetail }/group/${group }/id/${contentId }/name/${waParam.name}"/>?tabbedPanelsTab=profile&property=PROFILES#associatedContent"><div><wa:mls>You Want</wa:mls></div></a></li></c:if>
        <c:if test="${not empty experience}"><li class="<c:if test="${tabbedPanelsTab eq 'experience'}">TabbedPanelsTabSelected</c:if><c:if test="${tabbedPanelsTab ne 'experience'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${site}/content/${pageDetail }/group/${group }/id/${contentId }/name/${waParam.name}"/>?tabbedPanelsTab=experience&property=EXPERIENCE#associatedContent"><div><wa:mls>You Are</wa:mls></div></a></li></c:if>

