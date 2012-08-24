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
<h2><wa:mls>ContentGroup</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean==null || bean.groupid<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.groupid>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>

<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
			
			<fieldset>
				<legend>&nbsp;</legend>
				<c:if test="${bean!=null && bean.groupid>0}">
				<div class="bgGrey">
					<label for="id"><wa:mls>groupid</wa:mls></label>
					<span>${bean.groupid}</span>
					<input name="id" type="hidden" value="${bean.groupid}"/>
				</div>
				</c:if>
				<div class="bgWhite">
					<label for="f_name"><wa:mls>name</wa:mls></label>
					<textarea name="f_name" class="textfield" >${bean.name}</textarea>
				</div>
				<div class="bgGrey">
					<label for="f_contentGroupType_name"><wa:mls>Type</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.cms.hdata.ContentGroupType" />
						<wa:param name="manager" value="com.wanabe.cms.manager.ContentGroupTypeManager" />
						<wa:param name="identity" value="name" />
						<wa:param name="display" value="name" />
						<wa:param name="name" value="f_contentGroupType_name" />
						<wa:param name="selectedValues" value="${bean.contentGroupType.name}" />
					</wa:include>	
				</div>
			</fieldset>
		
			<div class="clr" style="margin:5px 0px 5px 0px"></div>
			<fieldset>
					<label for="f_contentLinkGroupProperties"><wa:mls>ContentLinkGroupProperties</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropListMulti">
						<wa:param name="class" value="com.wanabe.cms.hdata.ContentProperty" />
						<wa:param name="manager" value="com.wanabe.cms.manager.ContentPropertyManager" />
						<wa:param name="identity" value="propertyid" />
						<wa:param name="selectedValues" value="${listeSelected}" />
						<wa:param name="name" value="f_properties" />
						<wa:param name="display" value="name" />
					</wa:include>	
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
idName='${bean.groupid}';
</script>
<!--tool boxes:end-->
