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
		<a href="javascript:void(0);" id="edit_btn"><wa:mls>view</wa:mls></a>
		<a href="javascript:void(0);" id="closeContact_btn"><wa:mls>close</wa:mls></a>
		<a href="javascript:void(0);" id="export_btn"><wa:mls>export</wa:mls></a>
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
					<label for="s_contactUsId"><wa:mls>ContactUsId</wa:mls></label>
					<input name="s_contactUsId" type="text" <c:choose><c:when test="${waParam.s_contactUsId!=null}">value="${waParam.s_contactUsId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_lastname"><wa:mls>Lastname</wa:mls></label>
					<input name="s_lastname" type="text" <c:choose><c:when test="${waParam.s_lastname!=null}">value="${waParam.s_lastname}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_firstname"><wa:mls>Firstname</wa:mls></label>
					<input name="s_firstname" type="text" <c:choose><c:when test="${waParam.s_firstname!=null}">value="${waParam.s_firstname}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_email"><wa:mls>Email</wa:mls></label>
					<input name="s_email" type="text" <c:choose><c:when test="${waParam.s_email!=null}">value="${waParam.s_email}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_languageid"><wa:mls>Languageid</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropListCulture">
							<wa:param name="name" value="s_languageid" />
							<wa:param name="choiceMsg" value="Choose the languageid" />
							<wa:param name="selectedValues" value="${waParam.s_languageid}" />
							<wa:param name="excludeBE" value="true" />
							<wa:param name="isUpper" value="true" />
					</wa:include>
				</div>
				<div>
					<label for="s_contactUsTypeQuestion_id"><wa:mls>TypeQuestion</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
							<wa:param name="class" value="com.bitc.hdata.ContactUsTypeQuestion" />
							<wa:param name="manager" value="com.bitc.hdata.manager.ContactUsTypeQuestionManager" />
							<wa:param name="method" value="listAll" />
							<wa:param name="identity" value="id" />
							<wa:param name="display" value="name" />
							<wa:param name="name" value="s_contactUsTypeQuestion_id" />
							<wa:param name="selectedValues" value="${waParam.s_contactUsTypeQuestion_id}" />
					</wa:include>
				</div>
				<div>
					<label for="s_message"><wa:mls>Message</wa:mls></label>
					<input name="s_message" type="text" <c:choose><c:when test="${waParam.s_message!=null}">value="${waParam.s_message}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
			</form>
		</div>
	</div>
<!--searchBox:end-->
</div>
<!--floatLeft:end-->
<h2><wa:mls>ContactUs</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center status"></td>
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
				<td class="center contactUsId">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>ContactUsId</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="contactUsId" />
					</wa:link>			
				</td>
				<td class="left lastname">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Lastname</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="lastname" />
					</wa:link>			
				</td>
				<td class="left firstname">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Firstname</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="firstname" />
					</wa:link>			
				</td>
				<td class="left email">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Email</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="email" />
					</wa:link>			
				</td>
				<td class="center languageid">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>Languageid</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="languageid" />
					</wa:link>			
				</td>
				<td class="left typeQuestion">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>TypeQuestion</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="typeQuestion" />
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
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">
					<td 
						<c:if test="${item.closed=='1'}">class="redStatus"</c:if>
						<c:if test="${item.closed=='0'}">class="greenStatus"</c:if>
					>&nbsp;</td>
					<td class="center checkbox"><input type="checkbox" value="${item.contactUsId}"></td>
					<td class="center contactUsId"><a href="${context}/${site}/contactUs/editItem/id/${item.contactUsId}.do" title="<wa:mls>Edit</wa:mls>">${item.contactUsId}</a></td>
					<td class="left lastname">${item.lastname}</td>
					<td class="left firstname">${item.firstname}</td>
					<td class="left email">${item.email}</td>
					<td class="center languageid">${item.languageid}</td>
					<td class="left typeQuestion">${item.contactUsTypeQuestion.name}</td>
					<td class="left message">${item.message}</td>
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
		<input name="contactUsId" id="c_contactUsId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>ContactUsId</wa:mls></label>
	</div>
	<div>
		<input name="lastname" id="c_lastname" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Lastname</wa:mls></label>
	</div>
	<div>
		<input name="firstname" id="c_firstname" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Firstname</wa:mls></label>
	</div>
	<div>
		<input name="email" id="c_email" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Email</wa:mls></label>
	</div>
	<div>
		<input name="languageid" id="c_languageid" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Languageid</wa:mls></label>
	</div>
	<div>
		<input name="typeQuestion" id="c_typeQuestion" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>TypeQuestion</wa:mls></label>
	</div>
	<div>
		<input name="message" id="c_message" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>Message</wa:mls></label>
	</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='contactUsId';
numOfElement='${listSize}'; 
</script>
<script type="text/javascript">
<!--
function admin_closeContact(){
	var checks = $$('#mask input[type="checkbox"]');
	var id = "";
	var count = 0;
	for(i=0;i<checks.length;i++ ){
		if(checks[i].checked){
			if(count > 0)
				id += ',';
			id += checks[i].value;
			count++;
		}
	}
	var cfrm=confirm('Do you want to close this elements : '+id);
	if (cfrm==true){
		location.href=path+'/closeItems/items/'+id+'.do';
	}
}

btn = $('closeContact_btn');
if(btn!=null){
	btn.addClass('atLeastOne');
	btn.href="#";
	btn.addEvent('click',admin_closeContact)
}
//-->
</script>
