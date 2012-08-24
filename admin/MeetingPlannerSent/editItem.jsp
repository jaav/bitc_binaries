

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

				<h2><wa:mls>${className} </wa:mls>&nbsp;-&nbsp;
					<c:if test="${bean!=null && bean.myIdentity>0}"><wa:mls>(View)</wa:mls></c:if>
				</h2>
				<div id="list">
					<div id="mask">
						<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
							<fieldset>
								<legend><wa:mls>Main informations</wa:mls></legend>
								<c:if test="${bean!=null && bean.myIdentity>0}">
									<div class="bgGrey">
										<label for="f_id"><wa:mls>MyIdentity</wa:mls></label>
										<span>${bean.myIdentity}</span>
									</div>
								</c:if>
								<div class="bgGrey">
									<label for="f_title"><wa:mls>Title</wa:mls></label>
									<span>${bean.title}</span>
								</div>
							</fieldset>
						</form>
					</div>
				</div>

			</div>

			<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
			<script>
				path='${context}/${site}/${module}';
				idName='${bean.myIdentity}';
			</script>

		
