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
			<wa:include URI="front/content/findEventMice" />
			<wa:include URI="front/content/listEventMice" />
			
      </div>
