<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${culture.language == 'fr' || culture.language == 'nl' || culture.language == 'en'}">
    <!-- component congresInscription:start -->
      <div id="congres">
      <a href="<wa:url URI="${site}/event/displayCongresForm"/>"><img src="${staticSite}/img/${culture.language}/congres_inscription.jpg" alt="<wa:mls>Congres Inscription</wa:mls>" class="float_left"/></a>
      </div>
      <div class="clr"></div>
     <!-- component congresInscription:end -->
</c:if>