

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

				<!-- TOOLBOX -->
				<div id="toolBox">
					<div class="content" id="actions">
						<a href="javascript:void(0);" id ="back_btn"><wa:mls>Back to List</wa:mls></a>
						<c:if test="${legend != null}">
							<a href="" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
						</c:if>
						<div class="clr"></div>
					</div>
				</div>

				<h2>
					<wa:mls>NltType</wa:mls>&nbsp;-&nbsp;
					<c:if test="${bean==null || bean.id<=0}"><wa:mls>(Add)</wa:mls></c:if>
					<c:if test="${bean!=null && bean.id>0}"><wa:mls>(Edit)</wa:mls></c:if>
				</h2>
				<div id="list">
					<div id="mask">
						<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
							<fieldset>
								<legend>&nbsp;</legend>
								<c:if test="${bean!=null && bean.id>0}">
									<div class="bgGrey">
										<label for="f_id"><wa:mls>id</wa:mls></label>
										<input name="id" type="hidden" value="${bean.id}" />
										<span>${bean.id}</span>
									</div>
								</c:if>
								<div class="bgWhite">
									<label for="f_name"><wa:mls>name</wa:mls></label> 
									<textarea name="f_name" class="textfield">${bean.name}</textarea>
								</div>
								<div class="bgGrey">
									<label for="f_visible"><wa:mls>visible</wa:mls></label> 
									<select name="f_visible">
											<option value=""></option>
											<option value="ALL" <c:if test="${bean.visible == 'ALL'}">selected="selected"</c:if> >ALL</option>
											<option value="VISIT" <c:if test="${bean.visible == 'VISIT'}">selected="selected"</c:if> >VISIT</option>
											<option value="PRESS" <c:if test="${bean.visible == 'PRESS'}">selected="selected"</c:if> >PRESS</option>
											<option value="TRADE" <c:if test="${bean.visible == 'TRADE'}">selected="selected"</c:if> >TRADE</option>
											<option value="MEETINGS" <c:if test="${bean.visible == 'MEETINGS'}">selected="selected"</c:if> >MEETINGS</option>	
										</select>
								</div>
								<div class="bgWhite">
									<label for="f_position"><wa:mls>position</wa:mls></label> 
									<textarea name="f_position" class="textfield">${bean.position}</textarea>
								</div>
								
								<div id="containerButton">
									<input type="button" name="cancel" id="cancel" class="cancel" value="<wa:mls>Cancel</wa:mls>"/>
									<input type="submit" name="submit" class="submit" value="<wa:mls>Enregistrer</wa:mls>"/>
								</div>
							</fieldset>
						</form>
					</div>
				</div>

			</div>

			<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
			<script>
				path='${context}/${site}/${module}';
				idName='${bean.id}';
			</script>

		
