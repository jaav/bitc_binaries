<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false" 
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- Form -->
	<div id="errorMsg"><wa:mls>${waParam.msgError}</wa:mls></div>
		<div id="listBox">
			<h1><wa:mls>contentGroup - Edit</wa:mls></h1>
			<div id="detail">
			<div id="mask">
				<div id="validationMessage"></div>
			  	<form action="${context}/${site}/${module}/saveItem.do" method="post">
					<div>
						<label for="f_linkid"><wa:mls>Link ID</wa:mls></label>
						<span>${bean.linkid}</span>
						<input name="linkid" type="hidden" value="${bean.linkid}"/>
					</div>
					
					<div>
						<label for="f_contentGroup_groupid"><wa:mls>Content Group</wa:mls></label>
						<wa:include URI="${site}/dropdown/dropList">
							<wa:param name="class" value="com.inno.hdata.ContentGroup" />
							<wa:param name="manager" value="com.inno.hdata.manager.ContentGroupManager" />
							<wa:param name="identity" value="groupid" />
							<wa:param name="display" value="name" />
							<wa:param name="name" value="f_contentGroup_groupid" />
							<wa:param name="selectedValues" value="${bean.contentGroup.groupid}" />
							<wa:param name="method" value="listAll" />
						</wa:include>
					</div>
			
					<div>
						<label for="f_contentProperty_propertyid"><wa:mls>Content Property</wa:mls></label>
						<wa:include URI="${site}/dropdown/dropList">
							<wa:param name="class" value="com.inno.hdata.ContentProperty" />
							<wa:param name="manager" value="com.inno.hdata.manager.ContentPropertyManager" />
							<wa:param name="identity" value="propertyid" />
							<wa:param name="display" value="name" />
							<wa:param name="name" value="f_contentProperty_propertyid" />
							<wa:param name="selectedValues" value="${bean.contentProperty.propertyid}" />
							<wa:param name="method" value="listAll" />
						</wa:include>
					</div>
		
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
		<div class="clr"></div>
	</div>

<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
<script>
path='${context}/${site}/${module}';
idName='${bean.linkid}';
</script>
<!--tool boxes:end-->
