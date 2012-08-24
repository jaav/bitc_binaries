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
					<label for="s_mailId"><wa:mls>mailId</wa:mls></label>
					<input name="s_mailId" type="text" <c:choose><c:when test="${waParam.s_mailId!=null}">value="${waParam.s_mailId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_culture"><wa:mls>culture</wa:mls></label>
					<wa:include URI="admin/dropdown/dropListCulture">
							<wa:param name="name" value="s_culture" />
							<wa:param name="choiceMsg" value="Choose the culture" />
							<wa:param name="selectedValues" value="${waParam.s_culture}" />
					</wa:include>
				</div>
				<div>
					<label for="s_name"><wa:mls>name</wa:mls></label>
					<input name="s_name" type="text" <c:choose><c:when test="${waParam.s_name!=null}">value="${waParam.s_name}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_subject"><wa:mls>subject</wa:mls></label>
					<input name="s_subject" type="text" <c:choose><c:when test="${waParam.s_subject!=null}">value="${waParam.s_subject}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_urlTxt"><wa:mls>urlTxt</wa:mls></label>
					<input name="s_urlTxt" type="text" <c:choose><c:when test="${waParam.s_urlTxt!=null}">value="${waParam.s_urlTxt}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>	
				<div>
					<label for="s_urlHtml"><wa:mls>urlHtml</wa:mls></label>
					<input name="s_urlHtml" type="text" <c:choose><c:when test="${waParam.s_urlHtml!=null}">value="${waParam.s_urlHtml}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>	
				<div>
					<label for="s_fromName"><wa:mls>fromName</wa:mls></label>
					<input name="s_fromName" type="text" <c:choose><c:when test="${waParam.s_fromName!=null}">value="${waParam.s_fromName}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>	
				<div>
					<label for="s_fromEmail"><wa:mls>fromEmail</wa:mls></label>
					<input name="s_fromEmail" type="text" <c:choose><c:when test="${waParam.s_fromEmail!=null}">value="${waParam.s_fromEmail}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>	
				<div>
					<label for="s_toName"><wa:mls>toName</wa:mls></label>
					<input name="s_toName" type="text" <c:choose><c:when test="${waParam.s_toName!=null}">value="${waParam.s_toName}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>	
				<div>
					<label for="s_toEmail"><wa:mls>toEmail</wa:mls></label>
					<input name="s_toEmail" type="text" <c:choose><c:when test="${waParam.s_toEmail!=null}">value="${waParam.s_toEmail}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>	
				<div>
					<label for="s_mailmachineMailid"><wa:mls>mailmachineMailid</wa:mls></label>
					<input name="s_mailmachineMailid" type="text" <c:choose><c:when test="${waParam.s_mailmachineMailid!=null}">value="${waParam.s_mailmachineMailid}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
			</form>
		</div>
	</div>
<!--searchBox:end-->
</div>
<!--floatLeft:end-->
<h2><wa:mls>Mails</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
					<td class="center mailId">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>mailId</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="mailId" />
						</wa:link>			
					</td>
					<td class="center culture">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>culture</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="culture" />
						</wa:link>			
					</td>
					<td class="left name">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>name</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="name" />
						</wa:link>			
					</td>
					<td class="left subject">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>subject</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="subject" />
						</wa:link>			
					</td>
					<td class="left urlTxt">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>urlTxt</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="urlTxt" />
						</wa:link>			
					</td>
					<td class="left urlHtml">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>urlHtml</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="urlHtml" />
						</wa:link>			
					</td>
						<td class="left fromName">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>fromName</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="fromName" />
						</wa:link>			
					</td>
						<td class="left fromEmail">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>fromEmail</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="fromEmail" />
						</wa:link>			
					</td>
						<td class="left toName">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>toName</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="toName" />
						</wa:link>			
					</td>
						<td class="left toEmail">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>toEmail</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="toEmail" />
						</wa:link>			
					</td>
						<td class="center mailmachineMailid">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>mailmachineMailid</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="mailmachineMailid" />
						</wa:link>			
					</td>
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">
					<td class="center checkbox"><input type="checkbox" value="${item.mailId}"></td>
					<td class="center mailId"><a href="${context}/${site}/mail/editItem/id/${item.mailId}.do" title="<wa:mls>Edit id</wa:mls>">${item.mailId}</a></td>
					<td class="center culture">${item.culture}&nbsp;</td>
					<td class="left name">${item.name}&nbsp;</td>
					<td class="left subject">${item.subject}&nbsp;</td>
					<td class="left urlTxt">${item.urlTxt}&nbsp;</td>
					<td class="left urlHtml">${item.urlHtml}&nbsp;</td>
					<td class="left fromName">${item.fromName}&nbsp;</td>
					<td class="left fromEmail">${item.fromEmail}&nbsp;</td>
					<td class="left toName">${item.toName}&nbsp;</td>
					<td class="left toEmail">${item.toEmail}&nbsp;</td>
					<td class="center mailmachineMailid">${item.mailmachineMailid}&nbsp;</td>	
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
			<input name="mailId" id="c_mailId" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>mailId</wa:mls></label>
		</div>
		<div>
			<input name="culture" id="c_culture" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>culture</wa:mls></label>
		</div>
		<div>
			<input name="name" id="c_name" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>name</wa:mls></label>
		</div>
		<div>
			<input name="subject" id="c_subject" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>subject</wa:mls></label>
		</div>
		<div>
			<input name="urlTxt" id="c_urlTxt" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>urlTxt</wa:mls></label>
		</div>
		<div>
			<input name="urlHtml" id="c_urlHtml" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>urlHtml</wa:mls></label>
		</div>
		<div>
			<input name="fromName" id="c_fromName" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>fromName</wa:mls></label>
		</div>
		<div>
			<input name="fromEmail" id="c_fromEmail" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>fromEmail</wa:mls></label>
		</div>
		<div>
			<input name="toName" id="c_toName" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>toName</wa:mls></label>
		</div>
		<div>
			<input name="toEmail" id="c_toEmail" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>toEmail</wa:mls></label>
		</div>
		<div>
			<input name="mailmachineMailid" id="c_mailmachineMailid" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>mailmachineMailid</wa:mls></label>
		</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='mailId';
</script>