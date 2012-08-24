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
		<a href="javascript:void(0);" id="add_btn"><wa:mls>add</wa:mls></a>
		<a href="javascript:void(0);" id="delete_btn"><wa:mls>delete</wa:mls></a>
		<a href="javascript:void(0);" id="edit_btn"><wa:mls>edit</wa:mls></a>
		<a href="${context}/${site}/${module}/reorderMenu.do" id="reload_btn" class="allways"><wa:mls>Reorder menu</wa:mls></a>
		<c:if test="${legend != null}">
			<a href="javascript:void(0);" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
		</c:if>
		<c:if test="${cutNode !=null}">
			<a href="${context}/${site}/${module}/clearCutElement.do"  id="clear_cut" class="allways"><wa:mls>Clear cut element</wa:mls></a>
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
					<label for="s_qmNodeId"><wa:mls>QmNodeId</wa:mls></label>
					<input name="s_qmNodeId" type="text" <c:choose><c:when test="${waParam.s_qmNodeId!=null}">value="${waParam.s_qmNodeId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_nodeId"><wa:mls>NodeId</wa:mls></label>
					<input name="s_nodeId" type="text" <c:choose><c:when test="${waParam.s_nodeId!=null}">value="${waParam.s_nodeId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_title"><wa:mls>Title</wa:mls></label>
					<input name="s_title" type="text" <c:choose><c:when test="${waParam.s_title!=null}">value="${waParam.s_title}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_name"><wa:mls>Name</wa:mls></label>
					<input name="s_name" type="text" <c:choose><c:when test="${waParam.s_name!=null}">value="${waParam.s_name}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_answerType"><wa:mls>AnswerType</wa:mls></label>
					<select name="s_answerType">
						<option value=""><wa:mls>Choose the type</wa:mls></option>
						<option value="1" <c:if test="${waParam.s_answerType=='1'}">selected="selected"</c:if>>SINGLE_SELECT</option>
						<option value="2" <c:if test="${waParam.s_answerType=='2'}">selected="selected"</c:if>>MULTIPLE_SELECT</option>
						<option value="3" <c:if test="${waParam.s_answerType=='3'}">selected="selected"</c:if>>FREE_TEXT</option>
						<option value="4" <c:if test="${waParam.s_answerType=='4'}">selected="selected"</c:if>>SINGLE_SELECT_MATRIX</option>
						<option value="5" <c:if test="${waParam.s_answerType=='5'}">selected="selected"</c:if>>SINGLE_SELECT_DROP</option>
						<option value="6" <c:if test="${waParam.s_answerType=='6'}">selected="selected"</c:if>>COMMENT</option>
					</select>
				</div>
				<div>
					<label for="s_correctValue"><wa:mls>CorrectValue</wa:mls></label>
					<input name="s_correctValue" type="text" <c:choose><c:when test="${waParam.s_correctValue!=null}">value="${waParam.s_correctValue}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_isCorrect"><wa:mls>IsCorrect</wa:mls></label>
					<input type="radio" value="0" name="s_isCorrect" <c:if test="${waParam.s_isCorrect=='0'}">checked="checked"</c:if>/><wa:mls>No</wa:mls>
					<input type="radio" value="1" name="s_isCorrect" <c:if test="${waParam.s_isCorrect=='1'}">checked="checked"</c:if>/><wa:mls>Yes</wa:mls>
				</div>
				<div>
					<label for="s_description"><wa:mls>Description</wa:mls></label>
					<input name="s_description" type="text" <c:choose><c:when test="${waParam.s_description!=null}">value="${waParam.s_description}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
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
<h2><wa:mls>QmNode</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center status"></td>
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
				<td class="center qmNodeId">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>QmNodeId</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="qmNodeId" />
					</wa:link>			
				</td>
				
				<td class="left title">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Title</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="title" />
					</wa:link>			
				</td>
				<td class="left name">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Name</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="name" />
					</wa:link>			
				</td>
				<td class="left answerType">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>AnswerType</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="answerType" />
					</wa:link>			
				</td>
				<td class="left correctValue">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>CorrectValue</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="correctValue" />
					</wa:link>			
				</td>
				<td class="center isCorrect">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>IsCorrect</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="isCorrect" />
					</wa:link>			
				</td>
				<td class="left description">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Description</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="description" />
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
				<td class="left action"><wa:mls>Actions</wa:mls></td>	
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1} <c:if test="${item.left >= cutNode.left && item.right <= cutNode.right}" >cut</c:if>">
					
					<td 
						<c:if test="${item.level=='1'}">class="blueStatus"</c:if>
						<c:if test="${item.level=='2'}">class="greenStatus"</c:if>
						<c:if test="${item.level=='3'}">class="orangeStatus"</c:if>
						<c:if test="${item.level=='4'}">class="redStatus"</c:if>
					>&nbsp;</td>
				<td class="center checkbox"><input type="checkbox" value="${item.qmNodeId}"></td>
					
					<td class="center qmNodeId"><a href="${context}/${site}/qmNode/editItem/id/${item.qmNodeId}.do" title="<wa:mls>Edit groupid</wa:mls>">${item.qmNodeId}</a></td>
					
						<td class="left title">
						<c:if test="${item.level==1}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<c:if test="${item.level==2}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<c:if test="${item.level==3}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<c:if test="${item.level==4}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<c:if test="${item.level==5}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						${item.title}&nbsp;
					</td>
					<td class="left name">${item.name}</td>
					<td class="left answerType">
						
						<c:if test="${item.answerType=='1'}">SINGLE_SELECT</c:if>
						<c:if test="${item.answerType=='2'}">MULTIPLE_SELECT</c:if>
						<c:if test="${item.answerType=='3'}">FREE_TEXT</c:if>
						<c:if test="${item.answerType=='4'}">SINGLE_SELECT_MATRIX</c:if>
						<c:if test="${item.answerType=='5'}">SINGLE_SELECT_DROP</c:if>
				
					</td>
					<td class="left correctValue">${item.correctValue}</td>
					<td class="center isCorrect">${item.isCorrect}</td>
					<td class="left description">${item.description}</td>
					<td class="left qmQuestionnaire">
						<c:if test="${item.qmQuestionnaire != null}">
							<a href="${context}/${site}/qmQuestionnaire/editItem/id/${item.qmQuestionnaire.qmQuestionnaireId}.do">${item.qmQuestionnaire.name}</a>
						</c:if>
					</td>
					<td class="center createdOn"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.createdOn}"/>&nbsp;</td>
					<td class="left action"> 
				
						
						<c:if test="${item.tree != null}">  
							<c:if test="${item.level < 4}">
						 		<a href="${context}/${site}/${module}/insertNode/nodeId/${item.qmNodeId}<c:if test="${waParam.page!=null}">/page/${waParam.page}</c:if>.do" title="Insert child"><img src="${static}/${site}/img/ico_add.png" /></a>   
							</c:if>
							<a href="${context}/${site}/${module}/deleteNode/nodeId/${item.qmNodeId}<c:if test="${waParam.page!=null}">/page/${waParam.page}</c:if>.do" title="Delete node"><img src="${static}/${site}/img/ico_delete.png" /></a>  
							<c:if test="${item.tree.qmNodeId != item.qmNodeId}">
							 	<a href="${context}/${site}/${module}/movedownNode/nodeId/${item.qmNodeId}<c:if test="${waParam.page!=null}">/page/${waParam.page}</c:if>.do" title="Move down"><img src="${static}/${site}/img/ico_arrow_down.png" /></a>  
							 	<a href="${context}/${site}/${module}/moveupNode/nodeId/${item.qmNodeId}<c:if test="${waParam.page!=null}">/page/${waParam.page}</c:if>.do" title="Move up"><img src="${static}/${site}/img/ico_arrow_up.png" /></a>
								<c:if test="${item.level < 4}">
							 	<a href="${context}/${site}/${module}/insertSibling/nodeId/${item.qmNodeId}<c:if test="${waParam.page!=null}">/page/${waParam.page}</c:if>.do" title="Add brother"><img src="${static}/${site}/img/ico_add_sibling.png" /></a>
								</c:if>
								<c:if test="${cutNode==null}"> 
									 <a href="${context}/${site}/${module}/cutNode/nodeId/${item.qmNodeId}<c:if test="${waParam.page!=null}">/page/${waParam.page}</c:if>.do" title="Cut node"><img src="${static}/${site}/img/ico_cut.png" /></a>
								</c:if> 
							</c:if>
							<c:if test="${cutNode!=null && (item.left < cutNode.left || item.right > cutNode.right)}"> 
								<a href="${context}/${site}/${module}/pasteNode/nodeId/${item.qmNodeId}<c:if test="${waParam.page!=null}">/page/${waParam.page}</c:if>.do" title="Paste node as a child"><img src="${static}/${site}/img/ico_paste_child.png" /></a>
								<a href="${context}/${site}/${module}/pasteNodeSibling/nodeId/${item.qmNodeId}<c:if test="${waParam.page!=null}">/page/${waParam.page}</c:if>.do" title="Paste node as a brother"><img src="${static}/${site}/img/ico_paste_sibling.png" /></a>	
							</c:if>
						</c:if>
					
					
					</td>
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
		<input name="qmNodeId" id="c_qmNodeId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>qmNodeId</wa:mls></label>
	</div>
	<div>
		<input name="nodeId" id="c_nodeId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>NodeId</wa:mls></label>
	</div>
	<div>
		<input name="title" id="c_title" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Title</wa:mls></label>
	</div>
	<div>
	<input name="name" id="c_name" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Name</wa:mls></label>
	</div>
	<div>
		<input name="answerType" id="c_answerType" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>AnswerType</wa:mls></label>
	</div>
	<div>
		<input name="correctValue" id="c_correctValue" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>CorrectValue</wa:mls></label>
	</div>
	<div>
		<input name="isCorrect" id="c_isCorrect" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>IsCorrect</wa:mls></label>
	</div>
	<div>
		<input name="description" id="c_descriptione" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Description</wa:mls></label>
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
idName='qmNodeId';
</script>