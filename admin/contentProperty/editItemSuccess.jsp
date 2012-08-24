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
<h2><wa:mls>ContentProperty</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean==null || bean.propertyid<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.propertyid>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>

<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
			<fieldset>
			<input type="hidden" name="f_oldName" value="${oldName}"/>
				<legend>&nbsp;</legend>
				<c:if test="${bean!=null && bean.propertyid>0}">
				<div class="bgGrey">
					<label for="f_propertyid"><wa:mls>Property ID</wa:mls></label>
					<span>${bean.propertyid}</span>
					<input name="id" type="hidden" value="${bean.propertyid}"/>
				</div>
				</c:if>
				<div class="bgWhite">
					<label for="f_name"><wa:mls>Name</wa:mls></label>
					<textarea name="f_name" class="textfield">${bean.name}</textarea>
				</div>
				<div class="bgGrey">
					<label for="f_type"><wa:mls>Type</wa:mls></label>
					<select name="f_type" id="f_type">
						<option value="">...</option>
						<option value="FREE" 	<c:if test="${'FREE'==bean.type}">selected="selected"		</c:if>>FREE</option>
						<option value="CLOSED" 	<c:if test="${'CLOSED'==bean.type}">selected="selected"	</c:if>>CLOSED</option>
						<option value="OPEN" 	<c:if test="${'OPEN'==bean.type}">selected="selected"		</c:if>>OPEN</option>
						<option value="DB" 	<c:if test="${'DB'==bean.type}">selected="selected"		</c:if>>DB</option>
					</select>
				</div>
				<div class="bgWhite"> 
					<label for="f_multivalue"><wa:mls>Multivalued</wa:mls></label>
					<select name="f_multivalue">
						<option value="1" <c:if test="${bean.multivalue==true}">selected="selected"</c:if>>YES</option>
						<option value="0" <c:if test="${bean.multivalue==false}">selected="selected"</c:if>>NO</option>
					</select>
				</div>
				<div class="bgGrey">
					<label for="f_tree"><wa:mls>Tree</wa:mls></label>
					<select name="f_tree">
						<option value="1" <c:if test="${bean.tree==true}">selected="selected"</c:if>>YES</option>
						<option value="0" <c:if test="${bean.tree==false}">selected="selected"</c:if>>NO</option>
					</select>
				</div>
				<div id="db_infos" style="display:none;">	
					<div class="bgWhite">
					<label for="f_className"><wa:mls>className</wa:mls></label>
					<textarea name="f_className" class="textfield">${bean.className}</textarea>
					</div>
					<div class="bgGrey">
					<label for="f_manager"><wa:mls>manager</wa:mls></label>
					<textarea name="f_manager" class="textfield">${bean.manager}</textarea>
					</div>
					<div class="bgWhite">
					<label for="f_method"><wa:mls>method</wa:mls></label>
					<textarea name="f_method" class="textfield">${bean.method}</textarea>
					</div>
					<div class="bgGrey">
					<label for="f_identity"><wa:mls>identity</wa:mls></label>
					<textarea name="f_identity" class="textfield">${bean.identity}</textarea>
					</div>
					<div class="bgWhite">
					<label for="f_display"><wa:mls>display</wa:mls></label>
					<textarea name="f_display" class="textfield">${bean.display}</textarea>
					</div>
				</div>
				<div class="bgWhite">
					<label for="f_linkgroup"><wa:mls>LinkPropertyGroup</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropListMulti">
						<wa:param name="class" value="com.wanabe.cms.hdata.ContentGroup" />
						<wa:param name="manager" value="com.wanabe.cms.manager.ContentGroupManager" />
						<wa:param name="identity" value="groupid" />
						<wa:param name="display" value="name" />
						<wa:param name="name" value="f_contentGroups" />
						<wa:param name="selectedValues" value="${listeSelected}" />
					</wa:include>
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
<script>
window.addEvent('domready', function() {
	$("f_type").addEvent("change",checkIfDb);
	checkIfDb();
})
function checkIfDb(){
	if($("f_type").value == 'DB' ){	
		$("db_infos").setStyle('display','block');
	}
	else{
		$("db_infos").setStyle('display','none');
	}
}

</script>
<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
<script>
path='${context}/${site}/${module}';
idName='${bean.propertyid}';
</script>
<!--tool boxes:end-->
