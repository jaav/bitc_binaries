 <%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false" 
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="mainContent">
<div id="toolBox">
	<div class="content" id="actions">
		<a href="javascript:void(0);" id="search_btn" class="allways"><wa:mls>search</wa:mls></a>
		<a href="javascript:void(0);" id="add_btn"><wa:mls>add</wa:mls></a>
		<a href="javascript:void(0);" id="duplicate_btn"><wa:mls>duplicate</wa:mls></a>
		<a href="javascript:void(0);" id="delete_btn"><wa:mls>delete</wa:mls></a>
		<a href="javascript:void(0);" id="edit_btn"><wa:mls>edit</wa:mls></a>
		<a href="javascript:void(0);" id="publish_btn"><wa:mls>publish</wa:mls></a>
		<a href="javascript:void(0);" id="export_btn"><wa:mls>export</wa:mls></a>
		<a href="javascript:void(0);" id="import_btn"><wa:mls>import</wa:mls></a>
		<a href="javascript:void(0);" id="addListToNltContent_btn"><wa:mls>addToNltContent</wa:mls></a>
		<a href="javascript:void(0);" id="addResearchToNltContent_btn" class="allways"><wa:mls>add Research ToNltContent</wa:mls></a>
		
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
	<div id="searchBox" style="width:300px">
		<h2><wa:mls>Search Box</wa:mls></h2>
		<div id="searchclose"></div>
		<div class="content">
			<form name="searchForm" id="searchForm" action="${context}/${site}/${module}/${action}.do${filterString}">
				<div>
					<label for="s_id"><wa:mls>id</wa:mls></label>
					<input name="s_id" type="text" <c:choose><c:when test="${waParam.s_id!=null}">value="${waParam.s_id}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
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
					<label for="s_title"><wa:mls>title</wa:mls></label>
					<input name="s_title" type="text" <c:choose><c:when test="${waParam.s_title!=null}">value="${waParam.s_title}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>		
				<div>
					<label for="s_body"><wa:mls>Body</wa:mls></label>
					<input name="s_body" type="text" <c:choose><c:when test="${waParam.s_body!=null}">value="${waParam.s_body}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_position"><wa:mls>position</wa:mls></label>
					<input name="s_position" type="text" <c:choose><c:when test="${waParam.s_position!=null}">value="${waParam.s_position}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_createdOn"><wa:mls>createdOn</wa:mls></label>
					<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnStart" name="s_createdOnStart" value="${waParam.s_createdOnStart}" maxlength="10" /></p>
					<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnEnd" name="s_createdOnEnd" value="${waParam.s_createdOnEnd}" maxlength="10" /></p>
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
					<label for="s_visible"><wa:mls>visible</wa:mls></label>
					<input type="radio"<c:if test="${waParam.s_visible=='0'}"> checked="checked"</c:if> value="0" name="s_visible" style="margin-left:50px;"/><wa:mls>No</wa:mls>
					<input type="radio"<c:if test="${waParam.s_visible=='1'}"> checked="checked"</c:if> value="1" name="s_visible"/><wa:mls>Yes</wa:mls>
				</div>
				<div>
					<label for="s_status"><wa:mls>status</wa:mls></label>
					<input type="checkbox"<c:if test="${wa:contain(waParams.s_status,'0')}"> checked="checked"</c:if> value="0" name="s_status"/><wa:mls>DRAFT</wa:mls>
					<input type="checkbox"<c:if test="${wa:contain(waParams.s_status,'1')}"> checked="checked"</c:if> value="1" name="s_status"/><wa:mls>PUBLISHED</wa:mls>
					<input type="checkbox"<c:if test="${wa:contain(waParams.s_status,'2')}"> checked="checked"</c:if> value="2" name="s_status"/><wa:mls>ARCHIVED</wa:mls>
					<input type="checkbox"<c:if test="${wa:contain(waParams.s_status,'3')}"> checked="checked"</c:if> value="3" name="s_status"/><wa:mls>DELETED</wa:mls>
					<input type="checkbox"<c:if test="${wa:contain(waParams.s_status,'4')}"> checked="checked"</c:if> value="4" name="s_status"/><wa:mls>DRAFT_IMPORTED</wa:mls>
					<input type="checkbox"<c:if test="${wa:contain(waParams.s_status,'5')}"> checked="checked"</c:if> value="5" name="s_status"/><wa:mls>DRAFT_CENTRAL</wa:mls>
				</div>
				<div>
					<label for="s_publishContent_id"><wa:mls>publishContent</wa:mls></label>
					<input name="s_publishContent_id" type="text" <c:choose><c:when test="${waParam.s_publishContent_id!=null}">value="${waParam.s_publishContent_id}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
	
				<div>
					<label for="s_group"><wa:mls>group</wa:mls></label>	<br />
					<wa:include URI="${site}/dropdown/dropList">
							<wa:param name="class" value="com.wanabe.cms.hdata.ContentGroup" />
							<wa:param name="manager" value="com.wanabe.cms.manager.ContentGroupManager" />
							<wa:param name="method" value="listByTypeContentStay" />
							<wa:param name="identity" value="name" />
							<wa:param name="display" value="name" />
							<wa:param name="name" value="s_group" />
							<wa:param name="selectedValues" value="${waParam.s_group}" />
					</wa:include>
				</div>

				<c:if test="${fn:length(listProperties) > 0}">
				<label for="s_property_link"><wa:mls>PROPERTIES FOR GROUP</wa:mls> ${fn:toUpperCase(waParam.s_group)} : </label>
				<c:forEach var="property" items="${listProperties}">
				<div>
				
					<label for="s_property_link"><wa:mls>${fn:toLowerCase(property.name)}</wa:mls></label>
										
					<c:if test="${property.type!='FREE'}">
					<wa:include URI="admin/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue" />
						<wa:param name="manager" value="com.wanabe.cms.manager.ContentPropertyValueManager" />
						<wa:param name="identity" value="valueId" />
						<wa:param name="display" value="name" />
						<wa:param name="method" value="listByPropertyName" />
						<wa:param name="propertyName" value="${property.name}" />
						<wa:param name="name" value="s_property_link_${fn:toLowerCase(property.name)}" />
						<wa:param name="parentValue" value="parent" />
						<wa:param name="selectedValues" value="${waParam[property.propertyLinkName]}" />
					</wa:include>
					</c:if>

					<c:if test="${property.type=='FREE'}">
						<input type="text" name="s_property_link_${fn:toLowerCase(property.name)}" value="${waParam[property.propertyLinkName]}"/>				
					</c:if>					

				</div>
				</c:forEach>
				</c:if>
				
				<div>
					<label for="s_adresse"><wa:mls>Adresse</wa:mls></label>
					<input name="s_adresse" type="text" <c:choose><c:when test="${waParam.s_adresse!=null}">value="${waParam.s_adresse}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_city"><wa:mls>City</wa:mls></label>
					<input name="s_city" type="text" <c:choose><c:when test="${waParam.s_city!=null}">value="${waParam.s_city}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_zipcode"><wa:mls>Zipcode</wa:mls></label>
					<input name="s_zipcode" type="text" <c:choose><c:when test="${waParam.s_zipcode!=null}">value="${waParam.s_zipcode}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_email"><wa:mls>Email</wa:mls></label>
					<input name="s_email" type="text" <c:choose><c:when test="${waParam.s_email!=null}">value="${waParam.s_email}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_phone"><wa:mls>Phone</wa:mls></label>
					<input name="s_phone" type="text" <c:choose><c:when test="${waParam.s_phone!=null}">value="${waParam.s_phone}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_mobile"><wa:mls>Mobile</wa:mls></label>
					<input name="s_mobile" type="text" <c:choose><c:when test="${waParam.s_mobile!=null}">value="${waParam.s_mobile}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_fax"><wa:mls>Fax</wa:mls></label>
					<input name="s_fax" type="text" <c:choose><c:when test="${waParam.s_fax!=null}">value="${waParam.s_fax}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_website"><wa:mls>Website</wa:mls></label>
					<input name="s_website" type="text" <c:choose><c:when test="${waParam.s_website!=null}">value="${waParam.s_website}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_latitude"><wa:mls>Latitude</wa:mls></label>
					<input name="s_latitude" type="text" <c:choose><c:when test="${waParam.s_latitude!=null}">value="${waParam.s_latitude}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_longitude"><wa:mls>Longitude</wa:mls></label>
					<input name="s_longitude" type="text" <c:choose><c:when test="${waParam.s_longitude!=null}">value="${waParam.s_longitude}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_ranking"><wa:mls>Ranking</wa:mls></label>
					<input name="s_ranking" type="text" <c:choose><c:when test="${waParam.s_ranking!=null}">value="${waParam.s_ranking}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_hasAMeetingRoom"><wa:mls>ha a meeting room ?</wa:mls></label>
					<input type="radio"<c:if test="${waParam.s_hasAMeetingRoom=='0'}"> checked="checked"</c:if> value="0" name="s_hasAMeetingRoom" style="margin-left:50px;"/><wa:mls>No</wa:mls>
					<input type="radio"<c:if test="${waParam.s_hasAMeetingRoom=='1'}"> checked="checked"</c:if> value="1" name="s_hasAMeetingRoom"/><wa:mls>Yes</wa:mls>
				</div>
				<div>
					<label for="s_capacity"><wa:mls>Capacity</wa:mls></label>
					<input name="s_capacity" type="text" <c:choose><c:when test="${waParam.s_capacity!=null}">value="${waParam.s_capacity}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_rooms"><wa:mls>Rooms</wa:mls></label>
					<input name="s_rooms" type="text" <c:choose><c:when test="${waParam.s_rooms!=null}">value="${waParam.s_rooms}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_price"><wa:mls>Price</wa:mls></label>
					<input name="s_price" type="text" <c:choose><c:when test="${waParam.s_price!=null}">value="${waParam.s_price}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_descriptionPrice"><wa:mls>Description Price</wa:mls></label>
					<input name="s_descriptionPrice" type="text" <c:choose><c:when test="${waParam.s_descriptionPrice!=null}">value="${waParam.s_descriptionPrice}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				
				<div>
					<label for="s_valid"><wa:mls>Valid</wa:mls></label>
					<input type="radio"<c:if test="${waParam.s_valid=='0'}"> checked="checked"</c:if> value="0" name="s_valid" style="margin-left:50px;"/><wa:mls>No</wa:mls>
					<input type="radio"<c:if test="${waParam.s_valid=='1'}"> checked="checked"</c:if> value="1" name="s_valid"/><wa:mls>Yes</wa:mls>
				</div>
				<input type="hidden" name="s_submit" value="Search" />
				<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
				<input type="submit" name="s_submit2" class="submit" value="<wa:mls>Search</wa:mls>"></input>						
			</form>
		</div>
	</div>
<!--searchBox:end-->
</div>
<!--floatLeft:end-->
<h2><wa:mls>contentStay${waParam.group}</wa:mls></h2>
<div id="list">
	<div id="mask">
		<table cellspacing=0 cellpadding=0>
			<tr class="header">
				<td></td>
				<td class="center checkbox">
					<input type="checkbox" id="checkboxAll"/>
				</td>
					<td class="center id">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>id</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="id" />
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
					<td class="left title">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>title</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="title" />
						</wa:link>			
					</td>
					<td class="center position">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>position</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="position" />
						</wa:link>			
					</td>
					<td class="center createdOn">
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
					<td class="center fromDate">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>fromDate</wa:mls>
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
							<wa:mls>toDate</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="toDate" />
						</wa:link>			
					</td>
					<td class="center visible">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>visible</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="visible" />
						</wa:link>			
					</td>
					<td class="center status">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>status</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="status" />
						</wa:link>			
					</td>
					<td class="center group">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>group</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="group" />
						</wa:link>			
					</td>
					<td class="center publishContent">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>publishContent</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="publishContent" />
						</wa:link>			
					</td>
					<td class="center Preview">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>Preview</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="publishContent" />
						</wa:link>			
					</td>
					<td class="center actions">
						<wa:mls>Actions</wa:mls>
					</td>
			</tr>
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr class="line${((loop.count+1)%2)+1}">
						<td 
						<c:if test="${item.status == 0 || item.status == 4}">class="blueStatus"</c:if>
						<c:if test="${item.status == 1}">class="greenStatus"</c:if>
						<c:if test="${item.status == 2}">class="orangeStatus"</c:if>
						<c:if test="${item.status == 3}">class="redStatus"</c:if>
					>&nbsp;</td>
					<td class="center checkbox"><input type="checkbox" value="${item.id}"></td>
					<td class="center id"><a href="${context}/${site}/contentStay/editItem/id/${item.id}.do" title="<wa:mls>Edit id</wa:mls>">${item.id}</a></td>
					<td class="center culture">${item.culture}&nbsp;</td>
					<td class="left name">${item.name}&nbsp;</td>
					<td class="left title">${item.title}&nbsp;</td>
					<td class="center position">${item.position}&nbsp;</td>
					<td class="center createdOn"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.createdOn}"/>&nbsp;</td>
					<td class="center fromDate"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.fromDate}"/>&nbsp;</td>
					<td class="center toDate"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.toDate}"/>&nbsp;</td>
					<td class="center visible">
						<c:if test="${item.visible == 1}">
							X&nbsp;
						</c:if>
					</td>
					<td class="center status"> 
						<c:if test="${item.status == 0}">DRAFT</c:if>
						<c:if test="${item.status == 1}">PUBLISHED</c:if>
						<c:if test="${item.status == 2}">ARCHIVED ${item.versionId}</c:if>
						<c:if test="${item.status == 3}">DELETED</c:if>
						<c:if test="${item.status == 4}">DRAFT_IMPORTED</c:if>
						<c:if test="${item.status == 5}">DRAFT_CENTRAL</c:if>
					</td>
					<td class="center group">${item.group}&nbsp;</td>
					<td class="center publishContent">
							${item.publishContent.id}
					</td>
					<td class="center publishContent">
						<a href="${context}/front/content/displayDetail/group/${item.group}/id/${item.id}.do" target="site"><wa:mls>Preview</wa:mls></a>
					</td>
					<td class="center actions">
						<a href="javascript:deleteInLine('${item.id}');" title="<wa:mls>Delete</wa:mls>"><img src="${static}/${site}/img/ico_delete.png"  alt="<wa:mls>Delete</wa:mls>"/></a>
						<c:if test="${item.status != 1}">
							<a href="javascript:publishInLine('${item.id}');" title="<wa:mls>Publish</wa:mls>"><img src="${static}/${site}/img/ico_publish.png" alt="<wa:mls>Publish</wa:mls>"/></a>
						</c:if>
						<a href="${context}/${site}/${module}/duplicate/id/${item.id}.do" title="<wa:mls>Duplicate</wa:mls>"><img src="${static}/${site}/img/ico_duplicate.png" alt="<wa:mls>Duplicate</wa:mls>"/></a>
						
						
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
			<input name="id" id="c_id" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>id</wa:mls></label>
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
			<input name="title" id="c_title" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>title</wa:mls></label>
		</div>
		<div>
			<input name="position" id="c_position" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>position</wa:mls></label>
		</div>
		<div>
			<input name="createdOn" id="c_createdOn" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>createdOn</wa:mls></label>
		</div>
		<div>
			<input name="fromDate" id="c_fromDate" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>fromDate</wa:mls></label>
		</div>
		<div>
			<input name="toDate" id="c_toDate" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>toDate</wa:mls></label>
		</div>
		<div>
			<input name="visible" id="c_visible" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>visible</wa:mls></label>
		</div>
		<div>
			<input name="status" id="c_status" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>status</wa:mls></label>
		</div>
		<div>
			<input name="group" id="c_group" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>group</wa:mls></label>
		</div>
		<div>
			<input name="publishContent" id="c_publishContent" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>publishContent</wa:mls></label>
		</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
path='${context}/${site}/${module}';
idName='id';
addParams='?group=${waParam.group}'

document.searchForm.s_group.id='s_group';
$('s_group').addEvent('change',function(){
	document.searchForm.submit();
});

function deleteInLine(id){
	var cfrm=confirm('Do you want to delete this element : '+id);
	if (cfrm==true){
		window.location=path+'/deleteItems/items/'+id+'.do';
	}
}
function publishInLine(id){
	var cfrm=confirm('Do you want to publish this element : '+id);
	if (cfrm==true){
		window.location=path+'/publishItems/items/'+id+'.do';
	}
}
numOfElement='${listSize}';
</script>
<script>
contentType='ContentStay';
</script>
<script type="text/javascript" src="${static}/${site}/js/actionsNltContent.js"></script>

