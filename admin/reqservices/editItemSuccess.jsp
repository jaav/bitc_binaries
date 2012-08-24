

			<%@ page
			language="java"
			contentType="text/html; charset=UTF-8"
			pageEncoding="UTF-8"
			isELIgnored ="false"
			%>
			<%@ taglib prefix="wa" uri="WanabeTags" %>
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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

				<h2><wa:mls>Reqservices</wa:mls>&nbsp;-&nbsp;
					<c:if test="${bean!=null && bean.serviceid>0}"><wa:mls>(EDIT)</wa:mls></c:if>
				</h2>
				<div id="list">
					<div id="mask">
						<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
							<fieldset>
								<legend><wa:mls>Main Information</wa:mls></legend>
								<c:if test="${bean!=null && bean.serviceid>0}">
									<div class="bgGrey">
										<label for="f_serviceid"><wa:mls>serviceid</wa:mls></label>
										<input name="id" type="hidden" value="${bean.serviceid}" />
										<span>${bean.serviceid}</span>
									</div>
								</c:if>
								<div class="bgWhite">
										<label for="f_lg"><wa:mls> Langue</wa:mls></label>
										<wa:include URI="admin/dropdown/dropListCulture">
											<wa:param name="excludeBE" value="1" />
											<wa:param name="name" value="f_lg" />
											<wa:param name="choiceMsg" value="Choose the culture" />
											<wa:param name="selectedValues" value="${fn:toLowerCase(bean.lg)}" />
										</wa:include>
								</div>
								<div class="bgGrey">
									<label for="f_label"><wa:mls>Label</wa:mls></label>
									<textarea name="f_label" class="textfield" >${bean.label}</textarea>
								</div>
								<div class="bgWhite"> 
										<label for="f_active"><wa:mls>Active</wa:mls></label>
										<input type="radio" value="0" name="f_active" <c:if test="${bean.active==0}">checked="checked"</c:if>/><wa:mls>NO</wa:mls>
										<input type="radio" value="1" name="f_active" <c:if test="${bean.active==1}">checked="checked"</c:if>/><wa:mls>YES</wa:mls>
								</div>
								<div class="bgGrey">
									<label for="f_displayorder"><wa:mls>Display Order</wa:mls></label>
									<textarea name="f_displayorder" class="textfield" >${bean.displayorder}</textarea>
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
				idName='${bean.serviceid}';
			</script>

		
