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
					<wa:mls>contentComment</wa:mls>&nbsp;-&nbsp;
					<c:if test="${bean!=null && bean.commentId>0}"><wa:mls>(Edit)</wa:mls></c:if>
				</h2>
				<div id="list">
					<div id="mask">
						<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
							<fieldset>
								<legend>&nbsp;</legend>
								<c:choose>
								<c:when test="${bean!=null && bean.commentId>0}">
									<div class="bgGrey">
										<label for="id"><wa:mls>commentId</wa:mls></label>
										<input name="id" type="hidden" value="${bean.commentId}" />
										<span>${bean.commentId}</span>
									</div>
							<div class="bgWhite body">
						    <label for="f_message" style="float:left;"><wa:mls>Message</wa:mls></label>
						<div style="float:left; margin-left:3px; width:95%">
						<textarea name="f_message" id="f_message" class="textarea2 " style="float:left; margin-left:3px;">${bean.message}</textarea>
						</div>
						<div class="clr"></div>
					      </div>
								<div class="bgGrey">
									<label for="f_contentType"><wa:mls>ContentType</wa:mls></label>
									<textarea name="f_contentType" class="textfield" >${bean.contentType}</textarea>
								</div>
								<div class="bgWhite">
									<label for="f_contentId"><wa:mls>ContentId</wa:mls></label>
									<textarea name="f_contentId" class="textfield" >${bean.contentId}</textarea>
								</div>
								<div class="bgGrey">
									<label for="f_userId"><wa:mls>userId</wa:mls></label>
									<textarea name="f_userId" class="textfield" >${bean.userId}</textarea>
								</div>
								<div class="bgWhite">
									<label for="f_status"><wa:mls>status</wa:mls></label>
									<c:choose>
									<c:when test="${bean!=null && bean.commentId>0}">
									<select name="f_status">
										<c:if test="${bean.status == 'WAIT'}">
											<option value="WAIT" <c:if test="${bean.status == 'WAIT'}">selected="selected"</c:if>>WAIT</option>
										</c:if>
										<option value="ACC" <c:if test="${bean.status == 'ACC'}">selected="selected"</c:if>>ACC</option>
										<option value="REF" <c:if test="${bean.status == 'REF'}">selected="selected"</c:if>>REF</option> 
										<option value="NC" <c:if test="${bean.status == 'NC'}">selected="selected"</c:if>>NC</option>
									</select>
									</c:when>
									<c:otherwise>
										<span>ACC</span>
										<input type="hidden" value="ACC" name="f_status"/>
									</c:otherwise>
									</c:choose>
								</div>
								
								<div id="containerButton">
									<input type="button" name="cancel" id="cancel" class="cancel" value="<wa:mls>Cancel</wa:mls>"/>
									<input type="submit" name="submit" class="submit" value="<wa:mls>Enregistrer</wa:mls>"/>
								</div>
								<script>
	window.onload = function()
{
	var rootPath = '${static}/${site}/';
 
	var oFCKeditor = new FCKeditor('f_message','100%','500px');
	oFCKeditor.BasePath = 'fckeditor/';
	oFCKeditor.EditorPath = rootPath;
	oFCKeditor.LocationPath = window.location.href;
	oFCKeditor.ToolbarSet = 'Custom' ;
	oFCKeditor.ReplaceTextarea();
	 

 
} 
</script>	
								</c:when>
							</c:choose>
							</fieldset>
						</form>
					</div>
				</div>

			</div>

			<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
			<script type="text/javascript" src="${static}/${site}/fckeditor/fckeditor.js"></script>
			<script>
				path='${context}/${site}/${module}';
				idName='${bean.commentId}';
			</script>
	
