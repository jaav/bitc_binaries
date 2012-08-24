<%@ page language="java" contentType="text/xml; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="KEYWORDS" content="" />
<meta name="DESCRIPTION" content="" />
<link rel="stylesheet" type="text/css" href="${static}/front/css/screen.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/print.css" media="print"/>
<title>Visitbrussels</title>
</head>
<body>
<div class="popin_eshop">
<c:choose>
	<c:when test="${status == 'ok'}">
			
			<div class="box"> 
			<c:if test="${not empty article.mainBigImage}">
				<img src="${article.mainBigImage}" class="float_left"/>
			</c:if>
			<div class="txt_popin">
			
					<p><wa:mls>Vous avez ajouté ce contenu dans votre meeting planner :</wa:mls> </p>
				  	<h2>${article.mainTitle}</h2>
				  	 <c:choose>
            	<c:when test="${contentType ne 'ContentArticle' && empty article.mainAbstract_}">
            		<c:if test="${not empty article.address}">
	        			<p> ${article.address} </p>
	      				<p>
	      				<c:if test="${not empty article.zipcode && article.zipcode > 0}">
	      					${article.zipcode}
	      				</c:if>
	      			 	<c:if test="${not empty article.city}">
		      			 	${article.city}
		      			 </c:if>
	    		  		</p>
	       			</c:if>
	       			  <p>
	       	<c:if test="${not empty article.phone}">
	       		<strong><wa:mls>Tel :</wa:mls></strong> ${article.phone}<br />
	       	</c:if>
	       	<c:if test="${not empty article.mobile}">
	       		<strong><wa:mls>Mobile :</wa:mls></strong> ${article.mobile}<br />
	       	</c:if>
	       	<c:if test="${not empty article.fax}">
	       		<strong><wa:mls>Fax :</wa:mls></strong> ${article.fax}<br />
	       	</c:if>
	       	<c:if test="${not empty article.email}">
          		<strong><wa:mls>Email :</wa:mls></strong>
          		<span ><a href="mailto:${article.email}">${article.email}</a></span> <br />
	        </c:if>
	        <c:if test="${not empty article.URLWebsite}">
          		<strong><wa:mls>Website :</wa:mls></strong>
          		<span><a href="${article.URLWebsite}">${article.URLWebsite}</a></span>
	        </c:if>
	       </p>
            	</c:when>
            	<c:otherwise><p>${article.mainAbstract_}</p></c:otherwise>
            </c:choose>
				  	
				  	</div> 
		</c:when>
	<c:when test="${status == 'already'}">
		
			<div class="box"> 
			<c:choose>
          	<c:when test="${not empty article.mainBigImage}">	
        		<img src="${article.mainBigImage}" class="float_left"/>
          	</c:when>
          	<c:otherwise>
        		<img src="${context}/static/${site}/img/ml/default_content_big.jpg" alt="${article.mainTitle}" width="300" class="float_left"/>
          	</c:otherwise>
          </c:choose>
			
			<div class="txt_popin">
			
					<p><wa:mls>Ce contenu a déjà été ajouté à votre meeting planner :</wa:mls> </p>
				  	<h2>${article.mainTitle}</h2>
				  	 <c:choose>
            	<c:when test="${contentType ne 'ContentArticle' && empty article.mainAbstract_}">
            		<c:if test="${not empty article.address}">
	        			<p> ${article.address} </p>
	      				<p>
	      				<c:if test="${not empty article.zipcode && article.zipcode > 0}">
	      					${article.zipcode}
	      				</c:if>
	      			 	<c:if test="${not empty article.city}">
		      			 	${article.city}
		      			 </c:if>
	    		  		</p>
	       			</c:if>
	       			  <p>
	       	<c:if test="${not empty article.phone}">
	       		<strong><wa:mls>Tel :</wa:mls></strong> ${article.phone}<br />
	       	</c:if>
	       	<c:if test="${not empty article.mobile}">
	       		<strong><wa:mls>Mobile :</wa:mls></strong> ${article.mobile}<br />
	       	</c:if>
	       	<c:if test="${not empty article.fax}">
	       		<strong><wa:mls>Fax :</wa:mls></strong> ${article.fax}<br />
	       	</c:if>
	       	<c:if test="${not empty article.email}">
          		<strong><wa:mls>Email :</wa:mls></strong>
          		<span ><a href="mailto:${article.email}">${article.email}</a></span> <br />
	        </c:if>
	        <c:if test="${not empty article.URLWebsite}">
          		<strong><wa:mls>Website :</wa:mls></strong>
          		<span><a href="${article.URLWebsite}">${article.URLWebsite}</a></span>
	        </c:if>
	       </p>
            	</c:when>
            	<c:otherwise><p>${article.mainAbstract_}</p></c:otherwise>
            </c:choose>
				  	</div> 
		
	</c:when>
	<c:otherwise>
		<div class="txt_popin">
		<wa:mls>error</wa:mls>
		</div>
	</c:otherwise>
</c:choose>

<div class="clr"></div>
</div>
<a href="javascript:parent.$.nyroModalRemove()" class="btn_previous_eshop float_left nyroModalClose"><wa:mls>Continuer</wa:mls></a>
<a href="<wa:url URI="${site}/meetingPlanner/display"/>?panelContentType=${panelContentType}&panelGroup=${panelGroup}" target="_parent" class="btn_goto float_right"><wa:mls>go to Meeting planner</wa:mls></a>
</body>
</html>