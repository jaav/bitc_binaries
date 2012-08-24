<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false" 
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


	<div id="errorMsg"><wa:mls>${waParam.msgError}</wa:mls></div>
		<div id="listBox">
			<h1><wa:mls>ContentLinkPropertyvalueContent - Edit</wa:mls></h1>
				<div id="detail">
				<div id="mask">
					<div id="validationMessage"></div>
				  	<form action="${context}/${site}/${module}/saveItem.do" method="post">
					<div>
						<label for="f_linkid"><wa:mls>ID</wa:mls></label>
						<span>${bean.linkid}</span>
						<input name="f_linkid" type="hidden" value="${bean.linkid}"/>
					</div>
					
					<div>
						<label for="f_contentType"><wa:mls>Type</wa:mls></label>
						<select name="f_contentType">
							<option value=""><wa:mls>chooseValue</wa:mls></option>
							<option value="article" <c:if test="${bean.contentType=='article'}">selected="selected"</c:if>>article</option>
							<option value="body" <c:if test="${bean.contentType=='body'}">selected="selected"</c:if>>body</option>
							<option value="menu" <c:if test="${bean.contentType=='menu'}">selected="selected"</c:if>>menu</option>
						</select>
					</div>
					<div>
						<label for="f_contentid"><wa:mls>contentid</wa:mls></label>
						<textarea name="f_contentid" class="textfield" >${bean.contentid}</textarea>
					</div>
					
					<div>
						<label for="f_propertyid"><wa:mls>property</wa:mls></label>
						<wa:include URI="${site}/contentProperty/dropList">
							<wa:param name="def" value="${bean.propertyid}"/>
							<wa:param name="selectName" value="f_propertyid"/>
						</wa:include>
					</div>
					
					!!! Gestion des valeurs  et du nom de la property!!! 
					
					<input type="submit" name="submit"/>
				  </form>
			</div>
		</div>
	</div>
<!--tool boxes:start-->
<div id="toolBox">
	<div class="content" id="actions">
			<a href="" id ="back_btn"><wa:mls>Back to List</wa:mls></a>
			<a href="" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
	</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
<script>
path='${context}/${site}/${module}';
idName='${bean.propertyid}';
</script>
<!--tool boxes:end-->
