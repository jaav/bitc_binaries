
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
	<h2><wa:mls>CalendarWidget</wa:mls>&nbsp;-&nbsp;
		<c:if test="${bean==null || bean.widgetId<=0}"><wa:mls>(Add)</wa:mls></c:if>
		<c:if test="${bean!=null && bean.widgetId>0}"><wa:mls>(Edit)</wa:mls></c:if>
	</h2>
	<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">

		<input name="widgetId" type="hidden"/>
				<c:if test="${bean.widgetId != null && bean.widgetId != 0}">
				<div class="">
					<label for="f_widgetId"><wa:mls>ID</wa:mls></label>
					<span>${bean.widgetId}</span>
					<input name="id" type="hidden" value="${bean.widgetId}"/>
				</div>
				</c:if>
				<div class="bgGrey" id="v_calendarPartner">
					<label for="f_calendarPartner_id"><wa:mls>calendarPartner</wa:mls></label>
					
							<c:choose><c:when test="${bean.calendarPartner.partnerId != null && bean.calendarPartner.partnerId > 0}"><c:set var="partnerId" value="${bean.calendarPartner.partnerId}" scope="page"/></c:when><c:otherwise><c:set var="partnerId" value="${waParam.f_calendarPartner_partnerId}" scope="page"/></c:otherwise></c:choose>
							<wa:include URI="${site}/dropdown/dropList">
									<wa:param name="class" value="com.bitc.hdata.CalendarPartner" />
									<wa:param name="manager" value="com.bitc.hdata.manager.CalendarPartnerManager" />
									<wa:param name="method" value="listAll" />
									<wa:param name="identity" value="partnerId" />
									<wa:param name="display" value="name" />
									<wa:param name="choiceMsg" value="Choose the Partner" />
									<wa:param name="name" value="f_calendarPartner_partnerId" />
									<wa:param name="selectedValues" value="${partnerId}" />
							</wa:include>
					<div class="selectRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
		        	<script type="text/javascript">
						var v_calendarPartner = new Spry.Widget.ValidationSelect("v_calendarPartner", {isRequired:true,validateOn:["blur","change"]});
					</script>
				</div>
		<div class="bgWhite">
				<div class="">
					<label for="f_name"><wa:mls>name</wa:mls></label>
						<textarea name="f_name" class="textfield">${bean.name}</textarea>
					
				</div>
				
		</div>
		<div class="bgWhite" id="v_url">
				<div class="">
					<label for="f_url"><wa:mls>url</wa:mls></label>
					<textarea name="f_url" class="textfield" >${bean.url}</textarea>
					<div class="textareaRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
				</div>
				<script type="text/javascript">
							var v_url = new Spry.Widget.ValidationTextarea("v_url", {minChars:1, maxChars:200,validateOn:["blur","change"]});
				</script> 
				
		</div>
		<div class="bgGrey" id="v_height">
			<div class="">
					<label for="f_height"><wa:mls>height</wa:mls></label>
					<input name="f_height" type="text" value="${bean.height}"/><br/>
					<div class="textfieldRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
			</div>		
			<script type="text/javascript">
				var v_height = new Spry.Widget.ValidationTextField("v_height", "integer", {validateOn:["blur"], isRequired:true});
			</script> 
		</div>
		<div class="bgWhite" id="v_width">
		<div class="">
				<label for="f_width"><wa:mls>width</wa:mls></label>
				<input name="f_width" type="text" value="${bean.width}"/><br/>
				<div class="textfieldRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
		</div>		
		<script type="text/javascript">
				var v_width = new Spry.Widget.ValidationTextField("v_width", "integer", {validateOn:["blur"], isRequired:true});
		</script> 
		</div>
		<div class="bgGrey">
				<label for="f_valid"><wa:mls>valid</wa:mls></label>
				<input type="radio"<c:if test="${bean.valid==false}"> checked="checked"</c:if> value="0" name="f_valid"/><wa:mls>no</wa:mls>
				<input type="radio"<c:if test="${bean.valid==null || bean.valid==true}"> checked="checked"</c:if> value="1" name="f_valid"/><wa:mls>yes</wa:mls>
		</div>	
		<c:if test="${bean.widgetId != null && bean.widgetId != 0}">
			<div class="bgWhite">
					<div class="">
						<label for="f_iframe"><wa:mls>iframe</wa:mls></label>
						&lt;iframe height="${bean.height}" width="${bean.width}" src="${domain}/bitc/iframe/calendar/widget.do?code=${bean.calendarPartner.cryptedId}-${bean.widgetId}&lg=fr"&gt;&lt;/iframe&gt;
					</div>
					
			</div>
		</c:if>
		<c:if test="${bean.widgetId != null && bean.widgetId != 0}">
			<div class="bgGrey">
					<div class="">
						<label for="f_createdOn"><wa:mls>createdOn</wa:mls></label>
						<span><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${bean.createdOn}"/></span>
						</div>
					
			</div>
			<div class="bgWhite">
					<div class="">
						<label for="f_modifiedOn"><wa:mls>modifiedOn</wa:mls></label>
						<span><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${bean.modifiedOn}"/></span>
						</div>
					
			</div>
		</c:if>
		
		
		
		
		<div class="bgWhite">
			<div>
					<c:choose>
					<c:when test="${bean.widgetId !=0 && duplicate eq null}">
						<c:forEach var="property" items="${listProperties}">
							<div>
								<wa:include URI="admin/dropdown/dropListProperty">
									<wa:param name="propertyName" value="${property.name}" />
									<wa:param name="contentType" value="CalendarWidget"/>
									<wa:param name="contentId" value="${bean.widgetId}" />
								</wa:include>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach var="property" items="${listProperties}">
							<div>
								<wa:include URI="admin/dropdown/dropListProperty">
									<wa:param name="propertyName" value="${property.name}" />
									<wa:param name="contentType" value="CalendarWidget"/>
									<wa:param name="contentId" value="0" />
								</wa:include>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<div id="ajaxProperties"></div>
		</div>
		
		<div id="errorMessage">
				<c:if test="${waParam.msgError != null}">
					<img src="${static}/${site}/img/stop.png" alt="<wa:mls>Error</wa:mls>" />
					<wa:mls>${waParam.msgError}</wa:mls>
				</c:if>
			</div>
			<div id="containerButton">
				<input type="button" name="cancel" id="cancel" class="cancel" value="<wa:mls>Cancel</wa:mls>"/>
				<input type="submit" name="submit" class="submit" value="<wa:mls>Enregistrer</wa:mls>"/>
			</div>
		</form>
	</div>
	</div>
</div>
	<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
	<script type="text/javascript" src="${static}/admin/fckeditor/fckeditor.js"></script>
	<script>
	path='${context}/${site}/${module}';
	idName='${bean.widgetId}';
	</script>
