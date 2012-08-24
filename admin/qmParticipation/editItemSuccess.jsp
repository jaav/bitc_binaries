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
<h2><wa:mls>QmParticipation</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean!=null && bean.qmParticipationId>0}"><wa:mls>(View)</wa:mls></c:if>
</h2>
<div id="list">
	<div id="mask">
			<form  id="detailForm">
			<fieldset>
				<legend>&nbsp;</legend>
				<div class="bgGrey">
					<label for="f_id"><wa:mls>QmParticipationId</wa:mls></label>
					<span>${bean.qmParticipationId}</span>
				</div>
				<div class="bgWhite">
					<label for="f_userId"><wa:mls>User</wa:mls></label>
					<wa:include URI="${site}/user/lookup">
						<wa:param name="id" value="${bean.userId}"/>
					</wa:include> &nbsp;(${bean.userId})
					
				</div>
				<div class="bgGrey">
					<label for="f_qmQuestionnaire_qmQuestionnaireId"><wa:mls>QmQuestionnaire</wa:mls></label>
					<wa:include URI="${site}/qmQuestionnaire/lookup">
						<wa:param name="id" value="${bean.qmQuestionnaire.qmQuestionnaireId}"/>
					</wa:include> &nbsp;(${bean.qmQuestionnaire.qmQuestionnaireId})
					
					
				</div>
				<div class="bgWhite">
					<label for="f_question"><wa:mls>Question</wa:mls></label>
					<wa:include URI="${site}/qmNode/lookup">
						<wa:param name="id" value="${bean.question}"/>
					</wa:include> &nbsp;(${bean.question})
					
				</div>
				<div class="bgGrey">
					<label for="f_answer"><wa:mls>Answer</wa:mls></label>
					<wa:include URI="${site}/qmNode/lookup">
						<wa:param name="id" value="${bean.answer}"/>
					</wa:include> &nbsp;(${bean.answer})
				</div>
				<div class="bgWhite">
					<label for="f_createdOn"><wa:mls>CreatedOn</wa:mls></label>
					<span>${bean.createdOn}</span>
				
				</div>
			</fieldset>
			
			
		</form>
	</div>
</div>
<div>&nbsp;</div>
</div>	
<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
<script>
path='${context}/${site}/${module}';
idName='${bean.qmParticipationId}';
</script>
<!--tool boxes:end-->
