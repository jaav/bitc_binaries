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

<div id="mainContent">
	<h2><wa:mls>Cache</wa:mls></h2>
	<div id ="dashMask">	
		<c:if test="${waParam.key!=null}">
			<wa:mls>The group {key} has been emptied.
				<wa:param name="key" value="${waParam.key}"/><br/>
			</wa:mls>
		</c:if>
		<wa:mls>Dependencies</wa:mls> :
		<ul>
			<c:forEach var="dependency" items="${dependencies}">
				<c:if test="${fn:startsWith(dependency, 'BITC_')}">
					<li>
						${dependency} 
						<wa:link URI="admin/cache/invalidate">clear
							<wa:param name="key" value="${dependency}"/>
						</wa:link>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</div>
<script>
path='${context}/${site}/${module}';
</script>

