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
		<a href="javascript:void(0);" id="search_btn" class="allways"><wa:mls>search</wa:mls></a>
		<a href="javascript:void(0);" id="delete_btn"><wa:mls>delete</wa:mls></a>
		<c:if test="${legend != null}">
			<a href="javascript:void(0);" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
		</c:if>
	</div>
	<div id="pagingTop">
    	<wa:include URI="${site}/boxes/pageNav">
        	<wa:param name="orderBy" value="${waParam.orderBy}"/>
            <wa:param name="orderDir" value="${waParam.orderDir}"/>
        </wa:include>
    </div>
    <div style="clear:both"></div>
</div>
<!--floatLeft:start (important to toggle-slide search box)-->
<div class="fl">
<!--searchBox:start (hide by default)-->
	<div id="searchBox">
		<h2><wa:mls>Search Box</wa:mls></h2>
		<div id="searchclose"></div>
		<div class="content">
			<form name="searchForm" id="searchForm" action="${context}/${site}/${module}/${action}.do${filterString}"> 
				<div>
					<label for="s_qmParticipationId"><wa:mls>QmParticipationId</wa:mls></label>
					<input name="s_qmParticipationId" type="text" <c:choose><c:when test="${waParam.s_qmParticipationId!=null}">value="${waParam.s_qmParticipationId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_userId"><wa:mls>UserId</wa:mls></label>
					<input name="s_userId" type="text" <c:choose><c:when test="${waParam.s_userId!=null}">value="${waParam.s_userId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_answer"><wa:mls>Answer</wa:mls></label>
					<input name="s_answer" type="text" <c:choose><c:when test="${waParam.s_answer!=null}">value="${waParam.s_answer}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_question"><wa:mls>Question</wa:mls></label>
					<input name="s_question" type="text" <c:choose><c:when test="${waParam.s_question!=null}">value="${waParam.s_question}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_qmQuestionnaire_qmQuestionnaireId"><wa:mls>QmQuestionnaire</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.qm.hdata.QmQuestionnaire" />
						<wa:param name="manager" value="com.wanabe.qm.manager.QmQuestionnaireManager" />
						<wa:param name="identity" value="qmQuestionnaireId" />
						<wa:param name="display" value="name" />
						<wa:param name="choiceMsg" value="Choose the QmQuestionnaire" />
						<wa:param name="name" value="s_qmQuestionnaire_qmQuestionnaireId" />
						<wa:param name="selectedValues" value="${waParam.s_qmQuestionnaire_qmQuestionnaireId}" />
					</wa:include>	
				</div>
				<div>
					<label for="s_createdOn"><wa:mls>CreatedOn</wa:mls></label>
					<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnStart" name="s_createdOnStart" value="${waParam.s_createdOnStart}" maxlength="10" /></p>
					<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnEnd" name="s_createdOnEnd" value="${waParam.s_createdOnEnd}" maxlength="10" /></p>
				</div>
				<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
			</form>
		</div>
	</div>
<!--searchBox:end-->
</div>
<!--floatLeft:end-->
<h2><wa:mls>QmParticipation</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
				<td class="center qmParticipationId">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>QmParticipationId</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="qmParticipationId" />
					</wa:link>			
				</td>
				<td class="center userId">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>User</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="userId" />
					</wa:link>			
				</td>
				<td class="left qmQuestionnaire">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>QmQuestionnaire</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="qmQuestionnaire" />
					</wa:link>			
				</td>
				<td class="center question">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Question</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="question" />
					</wa:link>			
				</td>
				<td class="center answer">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Answer</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="answer" />
					</wa:link>			
				</td>
				<td class="center createdOn">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>CreatedOn</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="createdOn" />
					</wa:link>			
				</td>
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">
					<td class="center checkbox"><input type="checkbox" value="${item.qmParticipationId}"></td>
					<td class="center qmParticipationId"><a href="${context}/${site}/qmParticipation/editItem/id/${item.qmParticipationId}.do" title="<wa:mls>Edit groupid</wa:mls>">${item.qmParticipationId}</a></td>
					<td class="center userId">
						<wa:include URI="${site}/user/lookup">
							<wa:param name="id" value="${item.userId}"/>
						</wa:include>
						&nbsp;(${item.userId})
					</td>
					<td class="left qmQuestionnaire">
					<wa:include URI="${site}/qmQuestionnaire/lookup">
						<wa:param name="id" value="${item.qmQuestionnaire.qmQuestionnaireId}"/>
					</wa:include>
						&nbsp;(${item.qmQuestionnaire.qmQuestionnaireId})
				
					</td>
					<td class="left question">
						<wa:include URI="${site}/qmNode/lookup">
							<wa:param name="id" value="${item.question}"/>
						</wa:include>
						&nbsp;(${item.question})
					</td>
					<td class="left answer">
						<wa:include URI="${site}/qmNode/lookup">
							<wa:param name="id" value="${item.answer}"/>
						</wa:include>
						&nbsp;(${item.answer})
				
					</td>
					<td class="center createdOn"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.createdOn}"/>&nbsp;</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	 <div style="clear:both"></div>
</div>
<!-- paginationBottom:start-->
<div id="pagingBottom">
	<wa:include URI="${site}/boxes/pageNav">
		<wa:param name="orderBy" value="${waParam.orderBy}"/>
		<wa:param name="orderDir" value="${waParam.orderDir}"/>
	</wa:include>
</div>
<!-- paginationBottom:end-->
</div>
<!--content:end-->

<!--wrapper:end-->


<div id="fieldList">
	<div>
		<input name="qmParticipationId" id="c_qmParticipationId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>QmParticipationId</wa:mls></label>
	</div>
	<div>
		<input name="userId" id="c_userId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>UserId</wa:mls></label>
	</div>
	<div>
		<input name="answer" id="c_answer" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Answer</wa:mls></label>
	</div>
	<div>
		<input name="question" id="c_question" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Question</wa:mls></label>
	</div>
	<div>
		<input name="qmQuestionnaire" id="c_qmQuestionnaire" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>QmQuestionnaire</wa:mls></label>
	</div>
	<div>
		<input name="createdOn" id="c_createdOn" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>CreatedOn</wa:mls></label>
	</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='campaignId';
</script>