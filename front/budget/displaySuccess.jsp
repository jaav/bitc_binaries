<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  <!--btnback:start-->
	  <div id="btn_back">
		  <a href="javascript:history.back()"><wa:mls>Back</wa:mls></a>
	  </div>
  <!--btnback:end-->
  <div class="clear"></div>
  <div id="content_main">
  	<h1 class="${contentPropertyValue.name}">
		<wa:mls>${contentPropertyValue.mainTitle}</wa:mls>
	</h1>
 <p>${contentPropertyValue.mainDescription}</p>
	<wa:include URI="front/budget/list">
	<wa:param name="name" value="${contentPropertyValue.name}"/>
	</wa:include>
	
			
  </div>
