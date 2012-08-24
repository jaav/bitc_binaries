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
					<label for="s_qmQuestionnaireId"><wa:mls>QmQuestionnaireId</wa:mls></label>
					<input name="s_qmQuestionnaireId" type="text" <c:choose><c:when test="${waParam.s_qmQuestionnaireId!=null}">value="${waParam.s_qmQuestionnaireId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_name"><wa:mls>name</wa:mls></label>
					<input name="s_name" type="text" <c:choose><c:when test="${waParam.s_name!=null}">value="${waParam.s_name}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_culture"><wa:mls>Culture</wa:mls></label>
					<wa:include URI="admin/dropdown/dropListCulture">
						<wa:param name="name" value="s_culture" />
						<wa:param name="choiceMsg" value="Choose the Culture" />
						<wa:param name="selectedValues" value="${waParam.s_culture}" />
					</wa:include>
				</div>
				<div>
					<label for="s_qmGroup_qmGroupId"><wa:mls>QmGroup</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.qm.hdata.QmGroup" />
						<wa:param name="manager" value="com.wanabe.qm.manager.QmGroupManager" />
						<wa:param name="identity" value="qmGroupId" />
						<wa:param name="display" value="name" />
						<wa:param name="name" value="s_qmGroup_qmGroupId" />
						<wa:param name="choiceMsg" value="Choose the Group" />
						<wa:param name="selectedValues" value="${waParam.s_qmGroup_qmGroupId}" />
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
<h2><wa:mls>QmQuestionnaire</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
				<td class="center qmQuestionnaireId">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>QmQuestionnaireId</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="qmQuestionnaireId" />
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
				<td class="center culture">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Culture</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="culture" />
					</wa:link>			
				</td>
				<td class="center qmGroupId">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>QmGroupId</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="qmGroup_qmGroupId" />
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
				<td class="center actions">
					<wa:mls>Actions</wa:mls>
				</td>
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">
					<td class="center checkbox"><input type="checkbox" value="${item.qmQuestionnaireId}"></td>
					<td class="center qmQuestionnaireId"><a href="${context}/${site}/qmQuestionnaire/editItem/id/${item.qmQuestionnaireId}.do" title="<wa:mls>Edit groupid</wa:mls>">${item.qmQuestionnaireId}</a></td>
					<td class="left name">${item.name}&nbsp;</td>
					<td class="center culture">${item.culture}&nbsp;</td>
					<td class="center qmGroupId">
					<c:if test="${item.qmGroup !=null}">
						(${item.qmGroup.qmGroupId})<a href="${context}/${site}/qmGroup/editItem/id/${item.qmGroup.qmGroupId}.do" >${item.qmGroup.name}</a>
					</c:if>
					</td>
					<td class="center createdOn"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.createdOn}"/>&nbsp;</td>
					<td class="center actions">
						<a href="${context}/${site}/qmNode/qmNodeList.do?s_qmQuestionnaire_qmQuestionnaireId=${item.qmQuestionnaireId}&s_submit=Search">Show qmNodes</a>
						<c:if test="${item.qmGroup.type == 'CONTEST'}">
							&nbsp;|&nbsp;<a href="${context}/${site}/contentArticle/contentArticleList.do?s_group=ARTICLE+CONTEST&s_property_link_qm_questionnaire_id=${item.qmQuestionnaireId}&s_submit=Search" target="news"><wa:mls>News</wa:mls></a>
							&nbsp;|&nbsp;<a href="${context}/${site}/contentBody/contentBodyList.do?s_group=BODY+CONTEST&s_property_link_contest_content_type=393&s_property_link_qm_questionnaire_id=${item.qmQuestionnaireId}&s_submit=Search" target="news"><wa:mls>Waiting</wa:mls></a>
							&nbsp;|&nbsp;<a href="${context}/${site}/contentBody/contentBodyList.do?s_group=BODY+CONTEST&s_property_link_contest_content_type=379&s_property_link_qm_questionnaire_id=${item.qmQuestionnaireId}&s_submit=Search" target="news"><wa:mls>Closed</wa:mls></a>
							&nbsp;|&nbsp;<a href="${context}/${site}/contentBody/contentBodyList.do?s_group=BODY+CONTEST&s_property_link_contest_content_type=380&s_property_link_qm_questionnaire_id=${item.qmQuestionnaireId}&s_submit=Search" target="news"><wa:mls>Already</wa:mls></a>
							&nbsp;|&nbsp;<a href="${context}/${site}/contentBody/contentBodyList.do?s_group=BODY+CONTEST&s_property_link_contest_content_type=377&s_property_link_qm_questionnaire_id=${item.qmQuestionnaireId}&s_submit=Search" target="news"><wa:mls>Confirm</wa:mls></a>
							&nbsp;|&nbsp;<a href="${context}/${site}/contentBody/contentBodyList.do?s_group=BODY+CONTEST&s_property_link_contest_content_type=381&s_property_link_qm_questionnaire_id=${item.qmQuestionnaireId}&s_submit=Search" target="news"><wa:mls>Rules</wa:mls></a>
							&nbsp;|&nbsp;<a href="${context}/${site}/contentBody/contentBodyList.do?s_group=BODY+CONTEST&s_property_link_contest_content_type=378&s_property_link_qm_questionnaire_id=${item.qmQuestionnaireId}&s_submit=Search" target="news"><wa:mls>Error</wa:mls></a>
						</c:if>
						<c:if test="${item.qmGroup.type == 'QUIZZ'}">
							&nbsp;|&nbsp;<a href="${context}/${site}/contentArticle/contentArticleList.do?s_group=ARTICLE+QUIZZ&s_property_link_qm_questionnaire_id=${item.qmQuestionnaireId}&s_submit=Search" target="news"><wa:mls>News</wa:mls></a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="clr"></div>
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
		<input name="qmQuestionnaireId" id="c_qmQuestionnaireId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>QmQuestionnaireId</wa:mls></label>
	</div>
	<div>
		<input name="name" id="c_name" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>name</wa:mls></label>
	</div>
	<div>
		<input name="culture" id="c_culture" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Culture</wa:mls></label>
	</div>
	<div>
		<input name="qmGroupId" id="c_qmGroupId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>QmGroupId</wa:mls></label>
	</div>
	<div>
		<input name="createdOn" id="c_createdOn" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>CreatedOn</wa:mls></label>
	</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='qmQuestionnaireId';
</script>