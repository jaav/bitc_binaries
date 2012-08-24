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
<div id="toolBox">
	<div class="content" id="actions">
		<a href="javascript:void(0);" id ="back_btn"><wa:mls>Back to List</wa:mls></a>
		<c:if test="${legend != null}">
			<a href="" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
		</c:if>
		<div class="clr"></div>
	</div>
</div>
<h2><wa:mls>VisiteBooked</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean!=null && bean.id>0}"><wa:mls>(view)</wa:mls></c:if>
</h2>
<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
			<fieldset>
				<legend>&nbsp;</legend>
				<c:if test="${bean!=null && bean.id>0}">
				<div class="bgGrey">
					<label><wa:mls>id</wa:mls></label>
					<span>${bean.id}</span>
					<input name="id" type="hidden" value="${bean.id}"/>
				</div>
				</c:if>
				 <div class="bgWhite">
					<label for="f_eventId"><wa:mls>eventId</wa:mls></label>
					<span>${bean.eventId}</span>
				</div> 
				 <div class="bgGrey">
					<label for="f_titre"><wa:mls>titre</wa:mls></label>
					<span>${bean.titre}</span>
				</div> 
				<div class="bgWhite">
					<label for="f_eventCulture"><wa:mls>eventCulture</wa:mls></label>
					<span>${bean.eventCulture}</span>
				</div> 
				<div class="bgGrey">
					<label for="f_date"><wa:mls>date</wa:mls></label>
					<span>${bean.date}</span>
				</div>
				<div class="bgWhite">
					<label for="f_price"><wa:mls>price</wa:mls></label>
					<span>${bean.price}</span>
				</div>
				<div class="bgGrey">
					<label for="f_reservationEmail"><wa:mls>reservationEmail</wa:mls></label>
					<span>${bean.reservationEmail}</span>
				</div>
				<div class="bgWhite">
					<label for="f_association"><wa:mls>association</wa:mls></label>
					<span>${bean.association}</span>
				</div>    
				<div class="bgGrey">
					<label for="f_userId"><wa:mls>userId</wa:mls></label>
					<span><wa:include URI="${site}/user/lookup"><wa:param name="id" value="${bean.userId}"/></wa:include>&nbsp;</span>
				</div>  
				<div class="bgWhite">
					<label for="f_comment"><wa:mls>comment</wa:mls></label>
					<span>${bean.comment}</span>
				</div> 
				<div class="bgGrey">
					<label for="f_numParticipant"><wa:mls>numParticipant</wa:mls></label>
					<span>${bean.numParticipant}</span>
				</div>  
				<div class="bgWhite">
					<label for="f_greeting"><wa:mls>greeting</wa:mls></label>
					<span>${bean.greeting}</span>
				</div>         
				<div class="bgGrey">
					<label for="f_firstname"><wa:mls>firstname</wa:mls></label>
					<span>${bean.firstname}</span>
				</div>  
				<div class="bgWhite">
					<label for="f_lastname"><wa:mls>lastname</wa:mls></label>
					<span>${bean.lastname}</span>
				</div>  
				<div class="bgGrey">
					<label for="f_email"><wa:mls>email</wa:mls></label>
					<span>${bean.email}</span>
				</div>
				<div class="bgWhite">
					<label for="f_street"><wa:mls>street</wa:mls></label>
					<span>${bean.street}</span>
				</div> 
				<div class="bgGrey">
					<label for="f_num"><wa:mls>num</wa:mls></label>
					<span>${bean.num}</span>
				</div>     
				<div class="bgWhite">
					<label for="f_box"><wa:mls>box</wa:mls></label>
					<span>${bean.box}</span>
				</div>  
				<div class="bgGrey">
					<label for="f_zipcode"><wa:mls>zipcode</wa:mls></label>
					<span>${bean.zipcode}</span>
				</div>  
				<div class="bgWhite">
					<label for="f_city"><wa:mls>city</wa:mls></label>
					<span>${bean.city}</span>
				</div>  
				<div class="bgGrey">
					<label for="f_country"><wa:mls>country</wa:mls></label>
					<span>${bean.country}</span>
				</div>
				<div class="bgWhite">
					<label for="f_phone"><wa:mls>phone</wa:mls></label>
					<span>${bean.phone}</span>
				</div>    
			</fieldset>
			<div id="errorMessage">
				<c:if test="${waParam.msgError != null}">
					<img src="${static}/${site}/img/stop.png" alt="<wa:mls>Error</wa:mls>" />
					<wa:mls>${waParam.msgError}</wa:mls>
				</c:if>
			</div>
			<div id="containerButton">
			<!--	<input type="button" name="cancel" id="cancel" class="cancel" value="<wa:mls>Cancel</wa:mls>"/>-->
			<!-- 	<input type="submit" name="submit" class="submit" value="<wa:mls>Enregistrer</wa:mls>"/> -->
			</div>
		</form>
	</div>
</div>
</div>	
<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
<script>
path='${context}/${site}/${module}';
idName='${bean.id}';
</script>
<!--tool boxes:end-->
