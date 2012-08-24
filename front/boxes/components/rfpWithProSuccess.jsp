<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<a href="<wa:url URI="${site}/rfpWithPro/displayFormDescEvent"/>" >
	<img src="${context}/static/${site}/img/${culture.language}/rfp_pro.gif" alt="<wa:mls>Demander une assistance</wa:mls>" />
</a> 