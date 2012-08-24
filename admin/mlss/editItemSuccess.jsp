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
<h2><wa:mls>MLSS</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean==null || bean.mlssId<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.mlssId>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>
<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
			<fieldset>
				<legend>&nbsp;</legend>
				<c:if test="${bean!=null && bean.mlssId>0}">
					<div class="bgGrey">
						<label for="f_mlssId"><wa:mls>mlssId</wa:mls></label> 
						<span>${bean.mlssId}</span>
						<input name="id" type="hidden" value="${bean.mlssId}" />
					</div>
				</c:if>
				<c:if test="${bean!=null && bean.id != null}">
					<div class="bgWhite">
						<label for="f_id"><wa:mls>id</wa:mls></label>
						<span>${bean.id}</span>
						<input name="f_id" type="hidden" value="${bean.id}" />
					</div>
				</c:if>
					<div class="bgGrey">
						<label for="f_lg"><wa:mls>lg</wa:mls></label> 
						<c:if test="${bean!=null && bean.mlssId>0}">
							<span>${bean.lg}</span>
						</c:if>
						<c:if test="${bean==null || bean.mlssId<=0}">
							<wa:include URI="admin/dropdown/dropListCulture">
								<wa:param name="name" value="f_lg" />
								<wa:param name="choiceMsg" value="Select your language" />
								<wa:param name="selectedValues" value="${bean.lg}" />
								<wa:param name="excludeBE" value="true" />
								<wa:param name="isUpper" value="true" />
							</wa:include>
						</c:if>
					</div>
					<div class="bgWhite">
						<label for="f_page"><wa:mls>page</wa:mls></label> 
						<c:if test="${bean!=null && bean.mlssId>0}">
							<span>${bean.page}</span>
						</c:if>
						<c:if test="${bean==null || bean.mlssId<=0}">
							<textarea name="f_page" class="textfield">${bean.page}</textarea>
						</c:if>
					</div>
					<div class="bgGrey">
						<label for="f_val"><wa:mls>val</wa:mls></label> 
						<textarea name="f_val" id="f_val" class="textarea2">${bean.val}</textarea>
					</div>
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
idName='${bean.mlssId}';
</script>
<!--tool boxes:end-->
