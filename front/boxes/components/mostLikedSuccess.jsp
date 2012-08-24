<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/tagcloud.css" media="screen, projection"/>

<!-- component tagcloud:start -->
    <div id="tagcloud">
    	<img src="${staticSite}/img/ml/title_most_liked.gif" alt="Most Liked" />
		<ul class="nav">
			<c:forEach items="${listMostliked}" var="mostLiked" varStatus="loop">
				<c:if test="${not empty mostLiked.tag}">
					<li><a class="${mostLiked.size}" href="<wa:url URI="${site}/content/displayDetail/group/${mostLiked.group}/id/${mostLiked.id}"/>">${mostLiked.tag}</a></li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
<!-- component tagcloud:end -->


	
