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
<h2><wa:mls>Congressiste</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean==null || bean.id<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.id>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>

<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm" enctype="multipart/form-data" >
			<fieldset>
				<legend>&nbsp;</legend>
				<c:if test="${bean!=null && bean.id>0}">
					<div class="bgGrey"> 
						<label for="f_id"><wa:mls>id</wa:mls></label>
						<span>${bean.id}</span>
						<input name="id" type="hidden" value="${bean.id}"/>
					</div>
				</c:if>
					<div class="bgWhite">
						<label for="f_name"><wa:mls>name</wa:mls></label>
						<textarea name="f_name" class="textfield" >${bean.name}</textarea>
					</div>
						<div class="bgGrey">
						<label for="f_title"><wa:mls>MainTitle</wa:mls></label>
						<textarea name="f_title" class="textfield" >${bean.title}</textarea>
					</div>
						 
						<div class="bgWhite">
						<label for="f_colorTitle"><wa:mls>Color MainTitle (ex #F30000)</wa:mls></label>
						<textarea name="f_colorTitle" class="textfield" >${bean.colorTitle}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_urlLink"><wa:mls>Url Link</wa:mls></label>
						<textarea name="f_urlLink" class="textfield" >${bean.urlLink}</textarea> 
					</div>
					 <div class="bgWhite">
						<label for="image"><wa:mls>upload Logo</wa:mls></label>
						<input name="image" type="file" value=""/>
					  </div>
					 	
					 	 <c:if test="${bean!=null && bean.logo!=null}">
						<div class="bgGrey">
						<label for="f_urlImage"><wa:mls>url Logo</wa:mls></label>
						<span>${bean.logo}</span>
					   </div>
					 </c:if>	
					 		 
					 		 <div class="bgWhite">
				 
						<label for="f_visible"><wa:mls>visible</wa:mls></label>
						<input type="radio"<c:if test="${bean.visible=='0'}"> checked="checked"</c:if> value="0" name="f_visible"/><wa:mls>visible_0</wa:mls>
                        <input type="radio"<c:if test="${bean.visible ==  null || bean.visible=='1'}"> checked="checked"</c:if> value="1" name="f_visible"/><wa:mls>visible_1</wa:mls>	 
					</div>
							<c:if test="${bean!=null && bean.id>0}">
					<div class="clr"></div>
				 
					<legend>&nbsp;</legend>
					<div class="bgWhite">
						<label for="f_createdOn"><wa:mls>createdOn</wa:mls></label>
						<span>${bean.createdOn}</span>
					</div>
			
				 
					</c:if> 
				 		<c:if test="${bean!=null && bean.logo!=null}">
						<div class="clr"></div>
						<fieldset>
						<legend>&nbsp;</legend>
						<div class="bgGrey">
							<label ><wa:mls>Logo</wa:mls></label>
							<span><img src="${bean.logo}"  width="300"height="300"/></span>
						</div>
						</fieldset>
					</c:if>
				
					 
					 
				</fieldset>
			
					
				
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
<script>
path='${context}/${site}/${module}';
idName='${bean.id}';
 
</script>
<!--tool boxes:end-->
