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

		<div class="clr"></div>
	</div>
</div>

<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/doImport.do" method="post" id="detailForm" enctype="multipart/form-data">
			<fieldset>
				<legend><wa:mls>Import File</wa:mls></legend>
					<div class="bgWhite">
						<label for="file"><wa:mls>upload</wa:mls></label>
						<input name="file" type="file" value=""/>
					</div>
					<div>
						<label for="f_exportOtherType"><wa:mls>Separator if it's not excel, csv or text (tab-separated)</wa:mls></label>
						<input type="text" name="f_exportOtherType" value=""/>
					</div>
					<ul>
					<c:if test="${importInsert}">
						<li>
							<input type="radio" name="f_importType" value="insert" checked /><wa:mls>Delete and insert records</wa:mls> 
						</li>
					</c:if>
					<c:if test="${importUpdate}">
						<li>
							<input type="radio" name="f_importType" value="update" /><wa:mls>Update or insert records</wa:mls>
						</li>
					</c:if>
					<c:if test="${importAppend}">
						<li>
							<input type="radio" name="f_importType" value="append" /><wa:mls>Append all records</wa:mls>
						</li>
					</c:if>
					<c:if test="${importDelete}">
						<li>
							<input type="radio" name="f_importType" value="delete" /><wa:mls>Delete selected records</wa:mls> 
						</li>
					</c:if>
					</ul>
				</fieldset>
			<div class="clr"></div>

			<div id="errorMessage">
				<c:if test="${waParam.msgError != null}">
					<img src="${static}/${site}/img/stop.png" alt="<wa:mls>Error</wa:mls>" />
					<wa:mls>${waParam.msgError}</wa:mls>
				</c:if>
			</div>
			<div id="containerButton">
				<input type="submit" name="submit" class="submit" value="<wa:mls>Import</wa:mls>"/>
			</div>
		</form>
	</div>
</div>
</div>	


<!--tool boxes:end-->
