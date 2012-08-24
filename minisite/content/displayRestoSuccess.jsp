<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- !!!! Don't put elements here. Content MUST be in content_main div below !!! -->

	  <div id="content_main">
	  	<div id="btn_back"><a href="javascript:history.back();"><wa:mls>Back</wa:mls></a></div>
			<wa:include URI="${site}/${module}/introList" />
			<wa:include URI="${site}/content/findResto" >
				<wa:param name="group" value="${group}"/>
			</wa:include>
			<wa:include URI="${site}/${module}/listResto" />		
      </div>
