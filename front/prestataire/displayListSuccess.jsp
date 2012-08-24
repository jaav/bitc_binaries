<%@ page 
language="java"
contentType="text/html; charset=utf-8"
pageEncoding="utf-8"
isELIgnored ="false"
%>

<%@ taglib prefix="wa" uri="WanabeTags" %>

	  <div id="btn_back"><a href="javascript:history.back();"><wa:mls>Back</wa:mls></a></div>
  <!--btnback:end-->
  <div class="clear"></div>
	  <div id="content_main">
		  <wa:include URI="${site}/${module}/introList" />
			<wa:include URI="${site}/${module}/list" />
      </div>
