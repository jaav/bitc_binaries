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


<!--contentMain:start-->
  <div id="content_main">
    <h1 class="line_pink"><wa:mls>ACHETER EN LIGNE</wa:mls></h1>
   
    <br clear="all" />
    <div class="clr"></div>
    <hr class="dashed" />
     <p><wa:mls>${ogoneError}</wa:mls></p>
     <a href="${context}/${site}/${module}/displayBasket.do" ><wa:mls>voir le panier</wa:mls></a> 
    <hr class="m17"/>
    <div class="clr"></div>
  </div>
  <!--contentMain:end-->

