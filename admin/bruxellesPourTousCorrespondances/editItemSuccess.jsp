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
<h2><wa:mls>Bruxelles Pour Tous Correspondances</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean==null || bean.id<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.id>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>

<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm" >
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
						<label for="f_sourceId"><wa:mls>Bruxelles pour tous Id</wa:mls></label>
						<textarea name="f_sourceId" class="textfield" >${bean.sourceId}</textarea>
					</div>
						<div class="bgGrey">
						<label for="f_idContent"><wa:mls>Visitbrussels Content Id</wa:mls></label>
						<textarea name="f_idContent" class="textfield" >${bean.idContent}</textarea>
					</div>
						 
						<div class="bgWhite">
						<label for="f_contentType"><wa:mls>content Type</wa:mls></label>
						<textarea name="f_contentType" class="textfield" >${bean.contentType}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_contentName"><wa:mls>content Name</wa:mls></label>
						<textarea name="f_contentName" class="textfield" >${bean.contentName}</textarea> 
					</div>
					  	
					<div class="bgWhite">
						<label for="f_urlBruxellespourtous"><wa:mls>url Bruxellespourtous</wa:mls></label>
						<textarea name="f_urlBruxellespourtous" class="textfield" >${bean.urlBruxellespourtous}</textarea> 
					</div> 
				<c:if test="${bean!=null && bean.id>0}">
					<div class="clr"></div>
				 
				 
					<div class="bgGrey">
						<label for="f_createdOn"><wa:mls>createdOn</wa:mls></label>
						<span>${bean.createdOn}</span>
					</div>
		      	<div class="bgWhite">
						<label for="f_createdBy"><wa:mls>createdBy</wa:mls></label>
						<span>${bean.createdBy}</span>
					</div>
				 <div class="bgGrey">
						<label for="f_lastModifiedOn"><wa:mls>lastModifiedOn</wa:mls></label>
						<span>${bean.lastModifiedOn}</span>
					</div>
					<div class="bgWhite">
						<label for="f_lastModifiedBy"><wa:mls>lastModifiedBy</wa:mls></label>
						<span>${bean.lastModifiedBy}</span>
					</div>
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
