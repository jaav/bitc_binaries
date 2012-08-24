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
		<a href="javascript:void(0);" id="duplicate_btn"><wa:mls>duplicate</wa:mls></a>
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
					<label for="s_qmGroupId"><wa:mls>QmGroupId</wa:mls></label>
					<input name="s_qmGroupId" type="text" <c:choose><c:when test="${waParam.s_qmGroupId!=null}">value="${waParam.s_qmGroupId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_name"><wa:mls>Name</wa:mls></label>
					<input name="s_name" type="text" <c:choose><c:when test="${waParam.s_name!=null}">value="${waParam.s_name}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_type"><wa:mls>Type</wa:mls></label>
					<select name="s_type">
						<option value=""><wa:mls>Choose the type</wa:mls></option>
						<option value="CONTEST" <c:if test="${waParam.s_type eq 'CONTEST'}">selected="selected"</c:if>><wa:mls>CONTEST</wa:mls></option>
						<option value="QUICKPOLL" <c:if test="${waParam.s_type eq 'QUICKPOLL'}">selected="selected"</c:if>><wa:mls>QUICKPOLL</wa:mls></option>
						<option value="QUIZZ" <c:if test="${waParam.s_type eq 'QUIZZ'}">selected="selected"</c:if>><wa:mls>QUIZZ</wa:mls></option>
					</select>
				</div>
				<div>
					<label for="s_campaignId"><wa:mls>Campaign</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.hdata.Campaign" />
						<wa:param name="manager" value="com.wanabe.manager.CampaignManager" />
						<wa:param name="identity" value="campaignId" />
						<wa:param name="display" value="name" />
						<wa:param name="name" value="s_campaignId" />
						<wa:param name="choiceMsg" value="Choose the Campaign" />
						<wa:param name="selectedValues" value="${waParam.s_campaignId}" />
					</wa:include>
				</div>
				<div>
					<label for="s_visible"><wa:mls>Visible</wa:mls></label>
					<input type="radio" value="0" name="s_visible" <c:if test="${waParam.s_visible=='0'}">checked="checked"</c:if>/><wa:mls>No</wa:mls>
					<input type="radio" value="1" name="s_visible" <c:if test="${waParam.s_visible=='1'}">checked="checked"</c:if>/><wa:mls>Yes</wa:mls>
				</div>
				<div>
					<label for="s_fromDate"><wa:mls>fromDate</wa:mls></label>
					<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_fromDateStart" name="s_fromDateStart" value="${waParam.s_fromDateStart}" maxlength="10" /></p>
					<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_fromDateEnd" name="s_fromDateEnd" value="${waParam.s_fromDateEnd}" maxlength="10" /></p>
				</div>
				<div>
					<label for="s_toDate"><wa:mls>toDate</wa:mls></label>
					<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_toDateStart" name="s_toDateStart" value="${waParam.s_toDateStart}" maxlength="10" /></p>
					<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_toDateEnd" name="s_toDateEnd" value="${waParam.s_toDateEnd}" maxlength="10" /></p>
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
<h2><wa:mls>QmGroup</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
				<td class="center qmGroupId">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>QmGroupId</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="qmGroupId" />
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
				<td class="left type">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Type</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="type" />
					</wa:link>			
				</td>
				<td class="left campaign">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Campaign</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="campaignId" />
					</wa:link>			
				</td>
				<td class="center visible">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Visible</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="visible" />
					</wa:link>			
				</td>
				<td class="center fromDate">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>FromDate</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="fromDate" />
					</wa:link>			
				</td>
				<td class="center toDate">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>ToDate</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="toDate" />
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
					<td class="center checkbox"><input type="checkbox" value="${item.qmGroupId}"></td>
					<td class="center qmGroupId"><a href="${context}/${site}/qmGroup/editItem/id/${item.qmGroupId}.do" title="<wa:mls>Edit groupid</wa:mls>">${item.qmGroupId}</a></td>
					<td class="left name">${item.name}&nbsp;</td>
					<td class="left type">${item.type}&nbsp;</td>
					<td class="left campaign">
						<wa:include URI="${site}/campaign/lookup">
							<wa:param name="id" value="${item.campaignId}"/>
						</wa:include>
					</td>
					<td class="center visible"><c:if test="${item.visible=='1'}">X&nbsp;</c:if></td>
					<td class="center fromDate"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.fromDate}"/>&nbsp;</td>
					<td class="center toDate"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.toDate}"/>&nbsp;</td>
					<td class="center createdOn"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.createdOn}"/>&nbsp;</td>
					<td class="center actions"><a href="${context}/${site}/qmQuestionnaire/qmQuestionnaireList.do?s_qmGroup_qmGroupId=${item.qmGroupId}&s_submit=Search">Show questionnaire</a></td>
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
		<input name="qmGroupId" id="c_qmGroupId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>QmGroupId</wa:mls></label>
	</div>
	<div>
		<input name="name" id="c_name" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Name</wa:mls></label>
	</div>
	<div>
		<input name="type" id="c_type" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Type</wa:mls></label>
	</div>
	<div>
		<input name="campaign" id="c_campaignd" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Campaign</wa:mls></label>
	</div>
	<div>
		<input name="visible" id="c_visible" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Visible</wa:mls></label>
	</div>
	<div>
		<input name="fromDate" id="c_fromDate" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>FromDate</wa:mls></label>
	</div>
	<div>
		<input name="toDate" id="c_toDate" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>ToDate</wa:mls></label>
	</div>
	<div>
		<input name="createdOn" id="c_createdOn" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>CreatedOn</wa:mls></label>
	</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='qmGroupId';
</script>