<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<a href="${context}/${site}/qmNode/editItem/id/${lookup_node.qmNodeId}.do" title="<wa:mls>Node</wa:mls>" target="_blank">
		${lookup_node.title}
	</a>

