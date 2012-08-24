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
	</div>
	<div id="list">
		<div id="mask">			
			<form action="${context}/${site}/${module}/doExport.do${filterString}" id="detailForm"  method="post">		
			<fieldset>
				<legend><wa:mls>Export</wa:mls>&nbsp;<wa:mls>${module}</wa:mls></legend>
				<wa:mls>Total Records :</wa:mls> ${waParam.num} 
				<br/><br/><div>		
				<c:forEach var="fieldItem" items="${fieldList}" varStatus="loop">
				<div>				
				<input type="checkbox" name="f_chkField" id="f_chkField_${loop.count}" value="${fieldItem}" checked="checked"> ${fieldItem}
				</div>
				</c:forEach>
				</div>
			</fieldset>
			<div style="clear:both"></div>		
			<fieldset>
				<legend><wa:mls>Export Format</wa:mls></legend>
				<br />
				<div>
					<input type="radio" name="f_exportType" value="txt"/><wa:mls>Text (File with Tab-separated values)</wa:mls>
					<div style="clear:both"></div>
					<input type="radio" name="f_exportType" value="csv" checked="checked"/><wa:mls>CSV (File with Comma-separated values)</wa:mls>	
					<div style="clear:both"></div>		
					<c:choose>
						<c:when test="${waParam.num < 65000}">
							<input type="radio" name="f_exportType" value="xls"/><wa:mls>XLS</wa:mls>
						</c:when>
					</c:choose>
					<div style="clear:both"></div>
					<input type="radio" name="f_exportType" value="other"/><wa:mls>Other (Except #):</wa:mls>
					<input type="text" name="f_exportOtherType" value=""/>
				</div>
				
			</fieldset>

			<div id="containerButton">
				<input type="submit" name="s_submitExport" class="submit" value="<wa:mls>Export</wa:mls>"></input>
			</div>
			<input type="hidden" name="reloadSearch" value="1" />
			
			</form>
		</div>
		<div style="clear:both"></div>
	</div>
</div>