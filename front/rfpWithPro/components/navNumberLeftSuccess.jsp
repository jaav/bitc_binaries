<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<a href="<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="page"/><wa:param name="page" value="${page - 1}"/></wa:url>" class="arrow_left">
		<img src="${staticSite}/img/ml/btn_arrow.png" alt="<wa:mls>previous</wa:mls>"/>
</a>