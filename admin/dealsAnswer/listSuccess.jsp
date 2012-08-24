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

					<!--TOOLBOX: buttons to interact with displayed lines -->
					<div id="toolBox">
						<div class="content" id="actions">
							<a href="javascript:void(0);" id="search_btn" class="allways"><wa:mls>search</wa:mls></a>
							<a href="javascript:void(0);" id="add_btn"><wa:mls>add</wa:mls></a>
							<a href="javascript:void(0);" id="duplicate_btn"><wa:mls>duplicate</wa:mls></a>
							<a href="javascript:void(0);" id="delete_btn"><wa:mls>delete</wa:mls></a>
							<a href="javascript:void(0);" id="edit_btn"><wa:mls>edit</wa:mls></a>
							<a href="javascript:void(0);" id="accept_btn"><wa:mls>accept</wa:mls></a>
							<a href="javascript:void(0);" id="refuse_btn"><wa:mls>refuse</wa:mls></a>
							<a href="javascript:void(0);" id="export_btn"><wa:mls>export</wa:mls></a>
							<c:if test="${legend != null}">
								<a href="javascript:void(0);" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
							</c:if>
						</div>
						<div id="pagingTop">
							<!-- Nav component TOP -->
							<wa:include URI="${site}/boxes/pageNav">
								<wa:param name="orderBy" value="${waParam.orderBy}"/>
								<wa:param name="orderDir" value="${waParam.orderDir}"/>
							</wa:include>
						</div>
						<div style="clear:both"></div>
					</div>

					<div class="fl">
						<!--SEARCH BOX -->
						<div id="searchBox">
							<h2><wa:mls>Search Box</wa:mls></h2>
							<div id="searchclose"></div>
							<div class="content">
								<form name="searchForm" id="searchForm" action="${context}/${site}/${module}/${action}.do${filterString}">
								    <div>
										<label for="s_id"><wa:mls>Id</wa:mls></label>
										<input name="s_id" type="text" <c:choose><c:when test="${waParam.s_id!=null}">value="${waParam.s_id}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
								    </div>	
								        <div>
										<label for="s_contentDeals_id"><wa:mls>DealsId</wa:mls></label>
										<input name="s_contentDeals_id" type="text" <c:choose><c:when test="${waParam.s_contentDeals_id!=null}">value="${waParam.s_contentDeals_id}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
								    </div>	
								    <div>
										<label for="s_organisme"><wa:mls>organisme</wa:mls></label>
										<input name="s_organisme" type="text" <c:choose><c:when test="${waParam.s_organisme!=null}">value="${waParam.s_organisme}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									<div>
										<label for="s_lastname"><wa:mls>lastname</wa:mls></label>
										<input name="s_lastname" type="text" <c:choose><c:when test="${waParam.s_lastname!=null}">value="${waParam.s_lastname}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>	
									<div>
										<label for="s_firstname"><wa:mls>firstname</wa:mls></label>
										<input name="s_firstname" type="text" <c:choose><c:when test="${waParam.s_firstname!=null}">value="${waParam.s_firstname}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									<div>
										<label for="s_numParticipant"><wa:mls>numParticipant</wa:mls></label>
										<input name="s_numParticipant" type="text" <c:choose><c:when test="${waParam.s_numParticipant!=null}">value="${waParam.s_numParticipant}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									
									
									
									<div>
											<label for="s_status"><wa:mls>status</wa:mls></label>
											<table>
												<tr>
													<td><input type="checkbox"<c:if test="${wa:contain(waParams.s_status,'ACC')}"> checked="checked"</c:if> value="ACC" name="s_status"/><wa:mls>ACCEPTED</wa:mls></td>
													<td><input type="checkbox"<c:if test="${wa:contain(waParams.s_status,'WAIT')}"> checked="checked"</c:if> value="WAIT" name="s_status"/><wa:mls>WAIT</wa:mls></td>
													<td><input type="checkbox"<c:if test="${wa:contain(waParams.s_status,'REF')}"> checked="checked"</c:if> value="REF" name="s_status"/><wa:mls>REFUSED</wa:mls></td>
													
												</tr>
											
											</table>
									</div>

									<div>
										<label for="s_createdOn"><wa:mls>createdOn</wa:mls></label>
										<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnStart" name="s_createdOnStart" value="${waParam.s_createdOnStart}" maxlength="10" /></p>
										<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnEnd" name="s_createdOnEnd" value="${waParam.s_createdOnEnd}" maxlength="10" /></p>
									</div>
									
                                     <div>
											<label for="s_stay"><wa:mls>Logement</wa:mls></label>
											<table>
												<tr>
												
													<td><input type="checkbox"<c:if test="${wa:contain(waParams.s_stay,'true')}"> checked="checked"</c:if> value="true" name="s_stay"/><wa:mls>oui</wa:mls></td>
													<td><input type="checkbox"<c:if test="${wa:contain(waParams.s_stay,'false')}"> checked="checked"</c:if> value="false" name="s_stay"/><wa:mls>non</wa:mls></td>
													 
													
												</tr>
											
											</table>
									</div>
									 <div>
											<label for="s_optin"><wa:mls>Optin</wa:mls></label>
											<table>
												<tr>
													<td><input type="checkbox"<c:if test="${wa:contain(waParams.s_optin,'true')}"> checked="checked"</c:if> value="true" name="s_optin"/><wa:mls>oui</wa:mls></td>
													<td><input type="checkbox"<c:if test="${wa:contain(waParams.s_optin,'false')}"> checked="checked"</c:if> value="false" name="s_optin"/><wa:mls>non</wa:mls></td>
													 
													
												</tr>
											
											</table>
									</div>
									<!-- SEARCH BUTTONS -->
									<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
									<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
								</form>
							</div>
						</div>
					</div>


					<h2><wa:mls>Responces Deals</wa:mls></h2>
					<div id="list">
						<div id="mask">
							<table cellspacing=0 cellpadding=0>

								<!-- HEADERS -->
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
									<td class="left dealsId">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>deals id</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="dealsId" />
										</wa:link>
									</td>
									<td class="left info">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>info</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="contentType" />
										</wa:link>
									</td>
									<td class="center numParticipant">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>numParticipant</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="numParticipant" />
										</wa:link>
									</td>
									<td class="center organisme">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>organisme</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="organisme" />
										</wa:link>
									</td>
									<td class="left status">
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
									<td class="center lastname">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>lastname</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="lastname" />
										</wa:link>
									</td>
									<td class="center firstname">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>firstname</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="firstname" />
										</wa:link>
									</td>
								</tr>

								<!-- LINES -->
								<c:forEach var="item" items="${list}" varStatus="loop">
									<tr class="line${((loop.count+1)%2)+1}">
									<td 
										<c:if test="${item.status == 'ACC'}">class="greenStatus"</c:if>
										<c:if test="${item.status == 'WAIT'}">class="orangeStatus"</c:if>
										<c:if test="${item.status == 'REF'}">class="redStatus"</c:if>
										<c:if test="${item.status == 'NC'}">class="redStatus"</c:if>
						            >&nbsp;</td>
										<td class="center checkbox"><input type="checkbox" value="${item.id}"></td>
										<td class="center id"><a href="${context}/${site}/dealsAnswer/editItem/id/${item.id}.do" title="<wa:mls>Edit id</wa:mls>">${item.id}</a></td>
										<td class="left message">${item.contentDeals.id}</td>
										<td class="left contentType">${item.info}</td>
										<td class="center contentId">${item.numParticipant}</td>
										<td class="center userId">${item.organisme}</td>
										<td class="left status">${item.status}</td>
										<td class="center createdOn"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.createdOn}"/>&nbsp;</td>
										 <td class="left status">${item.lastname}</td>
										 <td class="left status">${item.firstname}</td>
									</tr>
								</c:forEach>

							</table>
						</div>
						<div style="clear:both"></div>
					</div>

					<!-- Nav component DOWN -->
					<div id="pagingBottom">
						<wa:include URI="${site}/boxes/pageNav">
							<wa:param name="orderBy" value="${waParam.orderBy}"/>
							<wa:param name="orderDir" value="${waParam.orderDir}"/>
						</wa:include>
					</div>

				</div>

				<!--COLUMN WICH CAN BE HIDED -->
				<div id="fieldList">
					<div>
						<input name="id" id="id" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>id</wa:mls></label>
					</div>
					<div>
						<input name="dealsId" id="c_dealsId" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>dealsId</wa:mls></label>
					</div>
					<div>
						<input name="info" id="c_info" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>info</wa:mls></label>
					</div>
					<div>
						<input name="numParticipant" id="c_numParticipant" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>numParticipant</wa:mls></label>
					</div>
				
				
						<div>
						<input name="organisme" id="c_organisme" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>organisme</wa:mls></label>
					</div>
						<div>
						<input name="status" id="c_status" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>status</wa:mls></label>
					</div>
						<div>
						<input name="createdOn" id="c_createdOn" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>createdOn</wa:mls></label>
					</div>
					<div>
						<input name="lastname" id="c_lastname" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>lastname</wa:mls></label>
					</div>
						<div>
						<input name="firstname" id="c_firstname" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>firstname</wa:mls></label>
					</div>
				</div>

				<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
			 
				<script>
					path='${context}/${site}/${module}';
					idName='id';
					addParams='?group=${waParam.group}'
					numOfElement='${listSize}';
				</script>
<script type="text/javascript">
<!--
function changeStatus(status){
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
		location.href=path+'/changeStatusItems/status/'+status+'/items/'+id+'.do';
	}
}
 
function deleteInLine(id){
	var cfrm=confirm('Do you want to delete this element : '+id);
	if (cfrm==true){
		window.location=path+'/deleteItems/items/'+id+'.do';
	}
}
function admin_accept(){
	changeStatus('ACC');
	 
}
function admin_refuse(){
	changeStatus('REF');
}

btn = $('accept_btn');
if(btn!=null){
	btn.addClass('atLeastOne');
	btn.href="#";
	btn.addEvent('click',admin_accept)
}
btn = $('refuse_btn');
if(btn!=null){
	btn.addClass('atLeastOne');
	btn.href="#";
	btn.addEvent('click',admin_refuse)
}
//-->
 

</script>
 

		
