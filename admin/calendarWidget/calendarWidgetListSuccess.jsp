
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
		<a href="javascript:void(0);" id="edit_btn"><wa:mls>edit</wa:mls></a>
		<a href="javascript:void(0);" id="add_btn"><wa:mls>add</wa:mls></a>
		<a href="javascript:void(0);" id="valid_btn"><wa:mls>Valid</wa:mls></a>
		<a href="javascript:void(0);" id="unvalid_btn"><wa:mls>Unvalid</wa:mls></a>
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
					<label for="s_widgetId"><wa:mls>ID</wa:mls></label>
					<input name="s_widgetId" type="text" <c:choose><c:when test="${waParam.s_widgetId!=null}">value="${waParam.s_widgetId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_name"><wa:mls>name</wa:mls></label>
						<input name="s_name" type="text" <c:choose><c:when test="${waParam.s_name!=null}">value="${waParam.s_name}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_calendarPartner_partnerId"><wa:mls>Partner</wa:mls></label>					
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.bitc.hdata.CalendarPartner" />
						<wa:param name="manager" value="com.bitc.hdata.manager.CalendarPartnerManager" />
						<wa:param name="method" value="listAll" />
						<wa:param name="identity" value="partnerId" />
						<wa:param name="display" value="name" />
						<wa:param name="name" value="s_calendarPartner_partnerId" />
						<wa:param name="selectedValues" value="${waParam.s_calendarPartner_partnerId}" />
						<wa:param name="choiceMsg" value="Choose" />
					</wa:include>
				</div>
				<div>
					<label for="s_url"><wa:mls>url</wa:mls></label>
						<input name="s_url" type="text" <c:choose><c:when test="${waParam.s_url!=null}">value="${waParam.s_url}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
						
						<div>
						<label for="s_height"><wa:mls>height</wa:mls></label>
						<input name="s_height" type="text" <c:choose><c:when test="${waParam.s_height!=null}">value="${waParam.s_height}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
						</div>
						<div>
						<label for="s_width"><wa:mls>width</wa:mls></label>
						<input name="s_width" type="text" <c:choose><c:when test="${waParam.s_width!=null}">value="${waParam.s_width}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
						</div>
						<div class="">
								<label for="s_valid"><wa:mls>valid</wa:mls></label>
								<input type="radio" value="0" name="s_valid" <c:if test="${waParam.s_valid== '0'}">checked="checked"</c:if> /><wa:mls>No</wa:mls>
								<input type="radio" value="1" name="s_valid" <c:if test="${waParam.s_valid== '1'}">checked="checked"</c:if>/><wa:mls>Yes</wa:mls>					
							</div>
							<div>
								<label for="s_createdOn"><wa:mls>createdOn</wa:mls></label>
								<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnStart" name="s_createdOnStart" value="${waParam.s_createdOnStart}" maxlength="10" /></p>
								<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnEnd" name="s_createdOnEnd" value="${waParam.s_createdOnEnd}" maxlength="10" /></p>
							</div>
						
							<div>
								<label for="s_modifiedOn"><wa:mls>modifiedOn</wa:mls></label>
								<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_modifiedOnStart" name="s_modifiedOnStart" value="${waParam.s_modifiedOnStart}" maxlength="10" /></p>
								<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_modifiedOnEnd" name="s_modifiedOnEnd" value="${waParam.s_modifiedOnEnd}" maxlength="10" /></p>
							</div>
						
							
						
						
						
		<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
			</form>
		</div>
	</div>
<!--searchBox:end-->
</div>
<!--floatLeft:end-->
<h2><wa:mls>Calendar Widget</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
				<td class="center widgetId">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>widgetId</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="widgetId" />
					</wa:link>			
				</td>
				<td class="center PartnerId">
					<wa:link URI="${URI}" allParams="true">
						<wa:mls>PartnerId</wa:mls>
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="1" />
						<wa:exceptParam name="orderDir"/>
						<wa:param name="orderDir" value="${orderDir}" />
						<wa:exceptParam name="orderBy"/>
						<wa:param name="orderBy" value="widgetId" />
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
						<td class="left url">
							<wa:link URI="${URI}" allParams="true">
								<wa:mls>url</wa:mls>
								<wa:exceptParam name="page"/>
								<wa:param name="page" value="1" />
								<wa:exceptParam name="orderDir"/>
								<wa:param name="orderDir" value="${orderDir}" />
								<wa:exceptParam name="orderBy"/>
								<wa:param name="orderBy" value="url" />
							</wa:link>			
						</td>
					
						<td class="left height">
							<wa:link URI="${URI}" allParams="true">
								<wa:mls>height</wa:mls>
								<wa:exceptParam name="page"/>
								<wa:param name="page" value="1" />
								<wa:exceptParam name="orderDir"/>
								<wa:param name="orderDir" value="${orderDir}" />
								<wa:exceptParam name="orderBy"/>
								<wa:param name="orderBy" value="height" />
							</wa:link>			
						</td>
					
						<td class="left width">
							<wa:link URI="${URI}" allParams="true">
								<wa:mls>width</wa:mls>
								<wa:exceptParam name="page"/>
								<wa:param name="page" value="1" />
								<wa:exceptParam name="orderDir"/>
								<wa:param name="orderDir" value="${orderDir}" />
								<wa:exceptParam name="orderBy"/>
								<wa:param name="orderBy" value="width" />
							</wa:link>			
						</td>
					<td class="left valid">
							<wa:link URI="${URI}" allParams="true">
								<wa:mls>valid</wa:mls>
								<wa:exceptParam name="page"/>
								<wa:param name="page" value="1" />
								<wa:exceptParam name="orderDir"/>
								<wa:param name="orderDir" value="${orderDir}" />
								<wa:exceptParam name="orderBy"/>
								<wa:param name="orderBy" value="valid" />
							</wa:link>			
						</td>
						<td class="left createdOn">
							<wa:link URI="${URI}" allParams="true">
								<wa:mls>createdOn</wa:mls>
								<wa:exceptParam name="page"/>
								<wa:param name="page" value="1" />
								<wa:exceptParam name="orderDir"/>
								<wa:param name="orderDir" value="${orderDir}" />
								<wa:exceptParam name="orderBy"/>
								<wa:param name="orderBy" value="createdOn" />
							</wa:link>			
						</td>
					
						<td class="left modifiedOn">
							<wa:link URI="${URI}" allParams="true">
								<wa:mls>modifiedOn</wa:mls>
								<wa:exceptParam name="page"/>
								<wa:param name="page" value="1" />
								<wa:exceptParam name="orderDir"/>
								<wa:param name="orderDir" value="${orderDir}" />
								<wa:exceptParam name="orderBy"/>
								<wa:param name="orderBy" value="modifiedOn" />
							</wa:link>			
						</td>
					
						
					
						
					
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">
					
					<td class="center checkbox"><input type="checkbox" value="${item.widgetId}"></td>
					<td class="center id"><a href="${context}/${site}/calendarWidget/editItem/id/${item.widgetId}.do" title="<wa:mls>Edit id</wa:mls>">${item.widgetId}</a></td>
					<td class="center partnerId">
						<wa:include URI="${site}/calendarPartner/lookup">
							<wa:param name="id" value="${item.calendarPartner.partnerId}"/>
						</wa:include>
					</td>		
					<td class="left name">${item.name}</td>	
								<td class="left url">${item.url}</td>
								
								<td class="left height">${item.height}</td>
							
								<td class="left width">${item.width}</td>
							<td class="left valid">${item.valid}</td>
								<td class="left createdOn">${item.createdOn}</td>
							
								<td class="left modifiedOn">${item.modifiedOn}</td>
							
								
							
								
							
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

<div id="fieldList">
	<div>
		<input name="widgetId" id="c_widgetId" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>widgetId</wa:mls></label>
	</div>
	
	<div>
		<input name="url" id="c_url" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>url</wa:mls></label>
	</div>
	
	<div>
		<input name="height" id="c_height" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>height</wa:mls></label>
	</div>
	
	<div>
		<input name="width" id="c_width" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>width</wa:mls></label>
	</div>
	
	<div>
		<input name="createdOn" id="c_createdOn" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>createdOn</wa:mls></label>
	</div>
	
	<div>
		<input name="modifiedOn" id="c_modifiedOn" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>modifiedOn</wa:mls></label>
	</div>
	
	<div>
		<input name="valid" id="c_valid" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>valid</wa:mls></label>
	</div>
	
	<div>
		<input name="name" id="c_name" type="checkbox" value="1" checked="checked"/>
		<label><wa:mls>name</wa:mls></label>
	</div>
	
</div>
<script type="text/javascript">

function setAddParams(){
	var value = searchForm.s_calendarPartner_partnerId.value
	alert(value);
	return "f_calendarPartner_partnerI="+value;
}
</script>

	<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
	<script>
	path='${context}/${site}/${module}';
	idName='widgetId';
	<c:if test="${not empty waParam.s_calendarPartner_partnerId}">
	addParams="?f_calendarPartner_partnerId=${waParam.s_calendarPartner_partnerId}"
	</c:if>
	</script>
	<script type="text/javascript">


	
	
	
	function changeValid(status){
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
		var cfrm;
		if(status == '1')
			cfrm=confirm('Do you want to Valid this elements : '+id);
		else
			cfrm=confirm('Do you want to Unvalid this elements : '+id);
		if (cfrm==true){
			location.href=path+'/changeValidItems/status/'+status+'/items/'+id+'.do';
		}
	}
	function admin_valid(){
		changeValid('1');
	}
	function admin_unvalid(){
		changeValid('0');
	}
	
	btn = $('valid_btn');
	if(btn!=null){
		btn.addClass('atLeastOne');
		btn.href="#";
		btn.addEvent('click',admin_valid)
	}
	btn = $('unvalid_btn');
	if(btn!=null){
		btn.addClass('atLeastOne');
		btn.href="#";
		btn.addEvent('click',admin_unvalid)
	}

</script>
	