<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
/*FOOTER PERSO > TO BE CONTINUED*/
/*#nav_sub {background:#bed000 url(../img/ml/bg_nav_supp.jp) repeat-x top left; min-width:1200px;}*/
</style>
  <!--btnback:start-->
	  <div id="btn_back">
		  <a href="javascript:history.back();"><wa:mls>Back</wa:mls></a>
	  </div>
  <!--btnback:end-->
  <div class="clear"></div>
  <div id="content_main">
  	<h1 class="${contentPropertyValue.name}">
		${contentPropertyValue.mainTitle}
	</h1>
 <p>${contentPropertyValue.mainDescription}</p>
 	<c:if test="${group == 'FOODY'}">
	 	<wa:include URI="front/content/findBestKitchen" >
			<wa:param name="group" value="${group}"/>
		</wa:include>
	</c:if>
	<wa:include URI="front/propertyValue/list">
		<wa:param name="name" value="${contentPropertyValue.name}"/>
	</wa:include>
  </div>
 