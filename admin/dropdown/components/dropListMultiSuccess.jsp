<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<div style="text-align:center; margin:10px auto">
			<div class="selectArea">
				<select id="${name}" size="10" multiple="multiple" name="${name}" style="width:100%">
					<c:if test="${listDropdown!=null}">
						<c:forEach var="itemDropdown" items="${listDropdown}">
							<option value="${itemDropdown.id}" />${itemDropdown.value}</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
				
			<div class="multiSelectTools">
		         	<a href="javascript:wa_add('${name}')"><img src="${static}/${site}/img/ico_arrow_right.png" alt="Add" /></a>
		         	<div class="mt5"></div>
		         	<a href="javascript:wa_remove('${name}')"><img src="${static}/${site}/img/ico_arrow_left.png" alt="Remove" /></a>
		   </div>
				
			<div class="selectArea">
				<select id="${name}Selected" multiple="multiple" size="10" name="${name}Selected" style="width:100%">
					<c:if test="${listS!=null}">
						<c:forEach var="item" items="${listS}">
							<option value="${item.id}">${item.value}</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
			
			<input id="${name}SelectedValues" name="${name}SelectedValues" type="hidden" value="${stringSelected}"/>
		</div>
		
		