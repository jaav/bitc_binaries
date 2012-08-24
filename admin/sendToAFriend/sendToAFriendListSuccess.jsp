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
		<a href="javascript:void(0);" id="edit_btn"><wa:mls>view</wa:mls></a>
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
					<label for="s_sendToAFriendId"><wa:mls>SendToAFriendId</wa:mls></label>
					<input name="s_sendToAFriendId" type="text" <c:choose><c:when test="${waParam.s_sendToAFriendId!=null}">value="${waParam.s_sendToAFriendId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_fromLastname"><wa:mls>Lastname (From)</wa:mls></label>
					<input name="s_fromLastname" type="text" <c:choose><c:when test="${waParam.s_fromLastname!=null}">value="${waParam.s_fromLastname}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_fromFirstname"><wa:mls>Firstname (From)</wa:mls></label>
					<input name="s_fromFirstname" type="text" <c:choose><c:when test="${waParam.s_fromFirstname!=null}">value="${waParam.s_fromFirstname}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_fromEmail"><wa:mls>Email (From)</wa:mls></label>
					<input name="s_fromEmail" type="text" <c:choose><c:when test="${waParam.s_fromEmail!=null}">value="${waParam.s_fromEmail}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_toLastname"><wa:mls>Lastname (To)</wa:mls></label>
					<input name="s_toLastname" type="text" <c:choose><c:when test="${waParam.s_toLastname!=null}">value="${waParam.s_toLastname}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_toFirstname"><wa:mls>Firstname (To)</wa:mls></label>
					<input name="s_toFirstname" type="text" <c:choose><c:when test="${waParam.s_toFirstname!=null}">value="${waParam.s_toFirstname}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_toEmail"><wa:mls>Email (To)</wa:mls></label>
					<input name="s_toEmail" type="text" <c:choose><c:when test="${waParam.s_toEmail!=null}">value="${waParam.s_toEmail}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_toLanguageid"><wa:mls>Languageid (To)</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropListCulture">
							<wa:param name="name" value="s_toLanguageid" />
							<wa:param name="choiceMsg" value="Choose the languageid" />
							<wa:param name="selectedValues" value="${waParam.s_toLanguageid}" />
							<wa:param name="excludeBE" value="true" />
							<wa:param name="isUpper" value="true" />
					</wa:include>
				</div>
				<div>
					<label for="s_message"><wa:mls>Message</wa:mls></label>
					<input name="s_message" type="text" <c:choose><c:when test="${waParam.s_message!=null}">value="${waParam.s_message}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_url"><wa:mls>URL</wa:mls></label>
					<input name="s_url" type="text" <c:choose><c:when test="${waParam.s_url!=null}">value="${waParam.s_url}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
			</form>
		</div>
	</div>
<!--searchBox:end-->
</div>
<!--floatLeft:end-->
<h2><wa:mls>SendToAFriend</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
				<td class="center sendToAFriendId">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>SendToAFriendId</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="sendToAFriendId" />
					</wa:link>			
				</td>
				<td class="left fromLastname">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Lastname (From)</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="fromLastname" />
					</wa:link>			
				</td>
				<td class="left fromFirstname">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Firstname (From)</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="fromFirstname" />
					</wa:link>			
				</td>
				<td class="left fromEmail">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Email (From)</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="fromEmail" />
					</wa:link>			
				</td>
				<td class="left toLastname">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Lastname (To)</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="toLastname" />
					</wa:link>			
				</td>
				<td class="left toFirstname">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Firstname (To)</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="toFirstname" />
					</wa:link>			
				</td>
				<td class="left toEmail">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Email (To)</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="toEmail" />
					</wa:link>			
				</td>
				<td class="center toLanguageid">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Languageid (To)</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="toLanguageid" />
					</wa:link>			
				</td>
				<td class="left message">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Message</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="message" />
					</wa:link>			
				</td>
				<td class="left url">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>URL</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="url" />
					</wa:link>			
				</td>
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">
					<td class="center checkbox"><input type="checkbox" value="${item.sendToAFriendId}"></td>
					<td class="center sendToAFriendId"><a href="${context}/${site}/sendToAFriend/editItem/id/${item.sendToAFriendId}.do" title="<wa:mls>Edit</wa:mls>">${item.sendToAFriendId}</a></td>
					<td class="left fromLastname">${item.fromLastname}</td>
					<td class="left fromFirstname">${item.fromFirstname}</td>
					<td class="left toEmail">${item.toEmail}</td>
					<td class="left toLastname">${item.toLastname}</td>
					<td class="left toFirstname">${item.toFirstname}</td>
					<td class="left toEmail">${item.toEmail}</td>
					<td class="center toLanguageid">${item.toLanguageid}</td>
					<td class="left message">${item.message}</td>
					<td class="left url"><a href="${item.url}" target="site">${item.url}</a></td>
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
		<input name="sendToAFriendId" id="c_sendToAFriendId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>SendToAFriendId</wa:mls></label>
	</div>
	<div>
		<input name="fromLastname" id="c_fromLastname" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Lastname (From)</wa:mls></label>
	</div>
	<div>
		<input name="fromFirstname" id="c_fromFirstname" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Firstname (From)</wa:mls></label>
	</div>
	<div>
		<input name="fromEmail" id="c_fromEmail" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Email (From)</wa:mls></label>
	</div>
	<div>
		<input name="toLastname" id="c_toLastname" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Lastname (To)</wa:mls></label>
	</div>
	<div>
		<input name="toFirstname" id="c_toFirstname" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Firstname (To)</wa:mls></label>
	</div>
	<div>
		<input name="toEmail" id="c_toEmail" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Email (To)</wa:mls></label>
	</div>
	<div>
		<input name="toLanguageid" id="c_toLanguageid" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Languageid (To)</wa:mls></label>
	</div>
	<div>
		<input name="message" id="c_message" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Message</wa:mls></label>
	</div>
	<div>
		<input name="url" id="c_url" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>URL</wa:mls></label>
	</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='sendToAFriendId';
</script>