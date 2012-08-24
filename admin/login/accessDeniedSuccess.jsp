<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="mainContent">
<h2><wa:mls>Access Denied</wa:mls></h2>
<!-- Place your content here !!! -->
<div id="dashMask">
	<wa:mls>Vous n'avez pas le droit de voir cette rubrique</wa:mls>
</div>
<script>
path='${context}/${site}/${module}';
</script>
</div>