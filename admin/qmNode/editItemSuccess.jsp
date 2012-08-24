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
<h2><wa:mls>QmNode</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean==null || bean.qmNodeId<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.qmNodeId>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>
<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
			<fieldset>
				<legend>&nbsp;</legend>
				<input type="hidden" name="f_parent" value="${bean.parent.qmNodeId}" />
				<c:if test="${bean!=null && bean.qmNodeId>0}">
				<div class="bgGrey">
					<label for="f_id"><wa:mls>QmNodeId</wa:mls></label>
					<span>${bean.qmNodeId}</span>
					<input name=id type="hidden" value="${bean.qmNodeId}"/>
				</div>
				</c:if>
				<div class="bgWhite">
					<label for="f_qmQuestionnaire_qmQuestionnaireId"><wa:mls>QmQuestionnaire</wa:mls></label>
					<c:if test="${bean.qmQuestionnaire == null}" >
						<wa:include URI="${site}/dropdown/dropList">
							<wa:param name="class" value="com.wanabe.qm.hdata.QmQuestionnaire" />
							<wa:param name="manager" value="com.wanabe.qm.manager.QmQuestionnaireManager" />
							<wa:param name="identity" value="qmQuestionnaireId" />
							<wa:param name="display" value="name" />
							<wa:param name="choiceMsg" value="Choose the QmQuestionnaire" />
							<wa:param name="name" value="f_qmQuestionnaire_qmQuestionnaireId" />
							<wa:param name="selectedValues" value="${bean.qmQuestionnaire.qmQuestionnaireId}" />
						</wa:include>
					</c:if>
					<c:if test="${bean.qmQuestionnaire != null}" >
						<span><a href="${context}/${site}/qmQuestionnaire/editItem/id/${bean.qmQuestionnaire.qmQuestionnaireId}.do">${bean.qmQuestionnaire.name}</a></span>
						<input name=f_qmQuestionnaire_qmQuestionnaireId type="hidden" value="${bean.qmQuestionnaire.qmQuestionnaireId}"/>
					</c:if>
				</div>
				<div class="bgGrey">
					<label for="f_name"><wa:mls>Name</wa:mls></label>
					<textarea name="f_name" class="textfield" >${bean.name}</textarea>
				</div>
				<div class="bgWhite">
					<label for="f_answerType"><wa:mls>AnswerType</wa:mls></label>
					<select name="f_answerType">
						<option value=""><wa:mls>Choose the type</wa:mls></option>
						<option value="1" <c:if test="${bean.answerType=='1'}">selected="selected"</c:if>>SINGLE_SELECT</option>
						<option value="2" <c:if test="${bean.answerType=='2'}">selected="selected"</c:if>>MULTIPLE_SELECT</option>
						<option value="3" <c:if test="${bean.answerType=='3'}">selected="selected"</c:if>>FREE_TEXT</option>
						<option value="4" <c:if test="${bean.answerType=='4'}">selected="selected"</c:if>>SINGLE_SELECT_MATRIX</option>
						<option value="5" <c:if test="${bean.answerType=='5'}">selected="selected"</c:if>>SINGLE_SELECT_DROP</option>
					</select>
				</div>
				<div class="bgGrey">
					<label for="f_title"><wa:mls>Title</wa:mls></label>
					<textarea name="f_title" class="textfield" >${bean.title}</textarea>
				</div>
				<div class="bgWhite">
					<label for="f_description" style="float:left;"><wa:mls>Description</wa:mls></label>
					<textarea name="f_description" class="textarea2" style="float:left; margin-left:3px">${bean.description}</textarea>
					<div class="clr"></div>
				</div>
				<div class="bgGrey">
					<label for="f_correctValue"><wa:mls>CorrectValue</wa:mls></label>
					<textarea name="f_correctValue" class="textfield" >${bean.correctValue}</textarea>
				</div>
				<c:if test="${bean.level == 2 or bean.level == 4}">
					<div class="bgWhite">
						<label for="f_isCorrect"><wa:mls>IsCorrect</wa:mls></label>
						<input type="radio" value="0" name="f_isCorrect" <c:if test="${bean.isCorrect}">checked="checked"</c:if>/><wa:mls>No</wa:mls>
						<input type="radio" value="1" name="f_isCorrect" <c:if test="${bean.isCorrect}">checked="checked"</c:if>/><wa:mls>Yes</wa:mls>
					</div>
				
				
				</c:if>
			</fieldset>
			<c:if test="${bean!=null && bean.qmNodeId>0}">
			<div class="clr"></div>	
			<fieldset>
				<legend>&nbsp;</legend>
				<div class="bgWhite">
					<label for="f_createdOn"><wa:mls>createdOn</wa:mls></label>
					<span>${bean.createdOn}</span>
				</div>
				<div class="bgGrey">
					<label for="f_modifiedOn"><wa:mls>modifiedOn</wa:mls></label>
					<span>${bean.modifiedOn}</span>
				</div>
			</fieldset>
			<div class="clr"></div>	
			<fieldset>
				<legend><wa:mls>TREE informations</wa:mls></legend>
				<div class="bgWhite">
					<label for="f_level"><wa:mls>level</wa:mls></label>
					<span>${bean.level}</span>
					<input type="hidden" name="f_level" class="textfield" value="${bean.level}"/>
				</div>					
				<div class="bgGrey">
					<label for="f_position"><wa:mls>position</wa:mls></label>
					<span>${bean.pos}</span>
					<input type="hidden" name="f_pos" class="textfield" value="${bean.pos}"/>
				</div>
				<div class="bgWhite">
					<label for="f_left"><wa:mls>leftSibling</wa:mls></label>
					<span>${bean.left}</span>
					<input type="hidden" name="f_left" class="textfield" value="${bean.left}"/>
				</div>
				<div class="bgGrey">
					<label for="f_right"><wa:mls>rightSibling</wa:mls></label>
					<span>${bean.right}</span>
					<input type="hidden" name="f_right" class="textfield" value="${bean.right}"/>
				</div>
			</fieldset>
			</c:if>
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
idName='${bean.qmNodeId}';
</script>
<!--tool boxes:end-->
