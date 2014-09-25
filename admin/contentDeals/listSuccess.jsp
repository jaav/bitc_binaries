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
		<a href="javascript:void(0);" id="valid_btn"><wa:mls>valid</wa:mls></a>
		<a href="javascript:void(0);" id="publish_btn"><wa:mls>publish</wa:mls></a>
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
					<label for="s_periodFromDate"><wa:mls>periodFromDate</wa:mls></label>
					<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_periodFromDateStart" name="s_periodFromDateStart" value="${waParam.s_periodFromDateStart}" maxlength="10" /></p>
					<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_periodFromDateEnd" name="s_periodFromDateEnd" value="${waParam.s_periodFromDateEnd}" maxlength="10" /></p>
				</div>
				<div>
					<label for="s_periodToDate"><wa:mls>periodToDate</wa:mls></label>
					<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_periodToDateStart" name="s_periodToDateStart" value="${waParam.s_periodToDateStart}" maxlength="10" /></p>
					<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_periodToDateEnd" name="s_periodToDateEnd" value="${waParam.s_periodToDateEnd}" maxlength="10" /></p>
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
					<label for="s_valid"><wa:mls>valid</wa:mls></label>
					<input type="radio"<c:if test="${waParam.s_valid=='0'}"> checked="checked"</c:if> value="0" name="s_valid" style="margin-left:50px;"/><wa:mls>No</wa:mls>
					<input type="radio"<c:if test="${waParam.s_valid=='1'}"> checked="checked"</c:if> value="1" name="s_valid"/><wa:mls>Yes</wa:mls>
				</div>
	
				<div>
					<label for="s_group"><wa:mls>group</wa:mls></label>	<br />
					<wa:include URI="${site}/dropdown/dropList">
							<wa:param name="class" value="com.wanabe.cms.hdata.ContentGroup" />
							<wa:param name="manager" value="com.wanabe.cms.manager.ContentGroupManager" />
							<wa:param name="method" value="listByTypeContentDeals" />
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
				
				 
					<div><label for="f_type"><wa:mls>type</wa:mls></label>
						
							<wa:include URI="${site}/dropdown/dropList">
								<wa:param name="class" value="com.bitc.cms.ContentDealsType" />
								<wa:param name="manager" value="com.bitc.cms.manager.ContentDealsTypeManager" />
								<wa:param name="method" value="listAll" />
								<wa:param name="identity" value="name" />
								<wa:param name="display" value="name" />
								<wa:param name="name" value="f_type" />
								<wa:param name="choiceMsg" value="${bean.type}" />
								<wa:param name="selectedValues" value="${bean.type}" />
							</wa:include>
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
					<label for="s_price"><wa:mls>Price</wa:mls></label>
					<input name="s_price" type="text" <c:choose><c:when test="${waParam.s_price!=null}">value="${waParam.s_price}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				 
			 
				 <div>
					<label for="s_maxParticipants"><wa:mls>max Participants</wa:mls></label>
					<input name="s_maxParticipants" type="text" <c:choose><c:when test="${waParam.s_maxParticipants!=null}">value="${waParam.s_maxParticipants}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
				</div>
				<div>
					<label for="s_minParticipants"><wa:mls>min Participants</wa:mls></label>
					<input name="s_minParticipants" type="text" <c:choose><c:when test="${waParam.s_minParticipants!=null}">value="${waParam.s_minParticipants}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
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
<h2><wa:mls>contentDeals${waParam.group}</wa:mls></h2>
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
					<td class="center periodFromDate">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>periodFromDate</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="periodFromDate" />
						</wa:link>			
					</td>
					<td class="center periodToDate">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>periodToDate</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="periodToDate" />
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
					<td class="center periodVisibility">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>peridVisibility</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="peridVisibility" />
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
					<td class="center valid">
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
					<td class="center currentOrderStatus">
						<wa:link URI="${URI}" allParams="true">
							<wa:mls>currentOrderStatus</wa:mls>
							<wa:exceptParam name="page"/>
							<wa:param name="page" value="1" />
							<wa:exceptParam name="orderDir"/>
							<wa:param name="orderDir" value="${orderDir}" />
							<wa:exceptParam name="orderBy"/>
							<wa:param name="orderBy" value="currentOrderStatus" />
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
					<td class="center List">
						<wa:mls>Liens</wa:mls>
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
					<td class="center id"><a href="${context}/${site}/contentDeals/editItem/id/${item.id}.do" title="<wa:mls>Edit id</wa:mls>">${item.id}</a></td>
					<td class="center culture">${item.culture}&nbsp;</td>
					<td class="left name">${item.name}&nbsp;</td>
					<td class="left title">${item.title}&nbsp;</td>
					<td class="center position">${item.position}&nbsp;</td>
					<td class="center createdOn"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.createdOn}"/>&nbsp;</td>
					<td class="center periodFromDate"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.periodFromDate}"/>&nbsp;</td>
					<td class="center periodToDate"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.periodToDate}"/>&nbsp;</td>
					<td class="center visible">
						<c:if test="${item.visible == 1}">
							X&nbsp;
						</c:if>
					</td>
					<td class="center periodVisibility">
						<fmt:formatDate pattern="MMMM/yyyy" value="${item.periodVisibility}"/>
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
					
					<td class="center valid"> 
						<c:if test="${not empty item.valid and item.valid}">
							X&nbsp;
						</c:if>
					</td>
					<td class="center currentOrderStatus">
							${item.currentOrderStatus}
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
						<td class="center List">
					<a href="${context}/admin/dealsAnswer/list.do?s_contentDeals_id=${item.id}&s_submit=Search"><wa:mls>Voir reponses</wa:mls>
					<c:choose><c:when test="${item.countResponses> 0}"><Strong><span class="txt_orange"> (${item.countResponses})</span></Strong></c:when><c:otherwise>(0)</c:otherwise></c:choose>
					</a>
					- <a href="${context}/admin/dealsOrder/dealsOrderList.do?s_contentDeals_id=${item.id}&s_submit=Search"><wa:mls>Voir commandes</wa:mls>
                        <c:choose><c:when test="${item.countOrders> 0}"><Strong><span class="txt_orange"> (${item.countOrders})</span></Strong></c:when><c:otherwise>(0)</c:otherwise></c:choose>
                        </a>
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
			<input name="periodFromDate" id="c_periodFromDate" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>fromDate</wa:mls></label>
		</div>
		<div>
			<input name="periodToDate" id="c_periodToDate" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>toDate</wa:mls></label>
		</div>
		<div>
			<input name="visible" id="c_visible" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>visible</wa:mls></label>
		</div>
		<div>
			<input name="periodVisibility" id="c_periodVisibility" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>periodVisibility</wa:mls></label>
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
		<div>
			<input name="valid" id="c_valid" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>valid</wa:mls></label>
		</div>
		<div>
			<input name="currentOrderStatus" id="c_currentOrderStatus" type="checkbox" value="1" checked="checked"/>
			<label><wa:mls>currentOrderStatus</wa:mls></label>
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
function valid(){
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
	var cfrm=confirm('Do you want to '+status+' this elements : '+id);
	if (cfrm==true){
		location.href=path+'/validItems/items/'+id+'.do';
	}
}
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
function admin_valid(){
	valid();
	 
}
btn = $('valid_btn');
if(btn!=null){
	btn.addClass('atLeastOne');
	btn.href="#";
	btn.addEvent('click',admin_valid)
}
numOfElement='${listSize}';
</script>
<script>
contentType='ContentDeals';
</script>
<script type="text/javascript" src="${static}/${site}/js/actionsNltContent.js"></script>
