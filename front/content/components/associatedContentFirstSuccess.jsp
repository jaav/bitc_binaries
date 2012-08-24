<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!--tab:start-->
<c:if test="${not empty userLiked or  not empty hotel or  not empty bnb or  not empty resto or  not empty quartier or  not empty profile or  not empty experience  }">
<p><wa:mls>Retrouvez ci-dessous d'autres idées de lieux ou d'événements à voir ou à faire à Bruxelles, qu'ils soient appréciés par d'autres utilisateurs qui ont choisi ce lieu, qu'ils soient dans le même quartier, du même profil ou de même type d'expérience.</wa:mls></p>

      <ul class="TabbedPanels">
        <c:if test="${not empty userLiked}">
          <li class="<c:if test="${tabbedPanelsTab eq 'UserAlsoLiked'}">TabbedPanelsTabSelected</c:if>
          <c:if test="${tabbedPanelsTab ne 'UserAlsoLiked'}">TabbedPanelsTab</c:if>">
          <a href="<wa:url URI="${site}/content/${pageDetail }/group/${group }/id/${contentId}"/>?tabbedPanelsTab=UserAlsoLiked&property=none#associatedContent"><wa:mls>Users <br />also liked</wa:mls></a></li>
        </c:if>
        <wa:include URI="${site}/content/associatedContentFirstPanel">
          <wa:param name="tabbedPanelsTab" value="${tabbedPanelsTab}"/>
        </wa:include>
      </ul>
     <c:choose>
	     <c:when test="${tabbedPanelsTab eq 'UserAlsoLiked'}">
		     <wa:include URI="${site}/content/associatedContentUserAlsoLiked">
		     	<wa:param name="contentType" value="${contentType}"/>
		     	<wa:param name="contentId" value="${contentId}"/>
		     </wa:include>
	     </c:when>
	     <c:otherwise>
	    <!--  valueNames = ${valueNames} -->
		     <wa:include URI="${site}/content/associatedContent">
		      	<wa:param name="valueNames" value="${valueNames}"/>
				<wa:param name="contentType" value="${contentGroupType}"/>
				<wa:param name="group" value="${bean.group}"/>
				<wa:param name="contentId" value="${bean.id}"/>
				<wa:param name="userId" value="${userId}"/>
				<wa:param name="tabbedPanelsTab" value="${tabbedPanelsTab}"/>
			</wa:include>
		</c:otherwise>
	</c:choose>
</c:if>
<script language='javascript'>
function sortBy(newURI,group)
{

	var sort= $("#f_page").val();
	var orderby;
	var asc;
	if(sort == 0){
	}
	if(sort == 1){
		orderBy = "title";
		asc = "0";
	}	
	if(sort == 2){
		orderBy = "title";
		asc = "1";
	}
	if(sort == 3){
		orderBy = "id";
		asc = "1";
	}
	if(sort == 4){
		orderBy = "id";
		asc = "0";
	}
	if(sort == 5){
		orderBy = "price";
		asc = "0";
	}
	if(sort == 6){
		orderBy = "price";
		asc = "1";
	}
	 	 	 
if(sort == 7){
		orderBy = "ranking";
		asc = "0";
	}
	if(sort == 8){
		orderBy = "ranking";
		asc = "1";
	}
	 
	var uri = '<wa:url URI="${URI}" allParams = "true"><wa:exceptParam name="orderBy"/><wa:exceptParam name="asc"/><wa:exceptParam name="page"/></wa:url>';
	document.forms[0].action=uri+"&"+"orderBy="+orderBy+"&asc="+asc;
	window.location.href= document.forms[0].action;
}
</script>
