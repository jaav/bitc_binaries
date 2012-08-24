
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

					<!--TOOLBOX: buttons to interact with displayed lines -->
					<div id="toolBox">
						<div class="content" id="actions">
							<a href="javascript:void(0);" id="search_btn" class="allways"><wa:mls>search</wa:mls></a>
							
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
									<label for="s_reqid"><wa:mls>reqid</wa:mls></label>
									<input name="s_reqid" type="text" <c:choose><c:when test="${waParam.s_reqid!=null}">value="${waParam.s_reqid}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
								</div>
								<div>
									<label for="s_firstname"><wa:mls>Firstname</wa:mls></label>
									<input name="s_firstname" type="text" <c:choose><c:when test="${waParam.s_firstname!=null}">value="${waParam.s_firstname}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
								</div>
								<div>
									<label for="s_lastname"><wa:mls>Lastname</wa:mls></label>
									<input name="s_lastname" type="text" <c:choose><c:when test="${waParam.s_lastname!=null}">value="${waParam.s_lastname}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
								</div>	
								<div>
									<label for="s_email"><wa:mls>Email</wa:mls></label>
									<input name="s_email" type="text" <c:choose><c:when test="${waParam.s_email!=null}">value="${waParam.s_email}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
								</div>	
								<div>
									<label for="s_zip"><wa:mls>Zip</wa:mls></label>
									<input name="s_zip" type="text" <c:choose><c:when test="${waParam.s_zip!=null}">value="${waParam.s_zip}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
								</div>
								<div>
									<label for="s_city"><wa:mls>City</wa:mls></label>
									<input name="s_city" type="text" <c:choose><c:when test="${waParam.s_city!=null}">value="${waParam.s_city}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
								</div>	
								<div>
									<label for="s_company"><wa:mls>Company</wa:mls></label>
									<input name="s_company" type="text" <c:choose><c:when test="${waParam.s_company!=null}">value="${waParam.s_company}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
								</div>
								<div>
									<label for="s_createdOn"><wa:mls>createdOn</wa:mls></label>
									<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnStart" name="s_createdOnStart" value="${waParam.s_createdOnStart}" maxlength="10" /></p>
									<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnEnd" name="s_createdOnEnd" value="${waParam.s_createdOnEnd}" maxlength="10" /></p>
								</div>
								<div>
									<label for="s_meetingName"><wa:mls>Meeting Name</wa:mls></label>
									<input name="s_meetingName" type="text" <c:choose><c:when test="${waParam.s_meetingName!=null}">value="${waParam.s_meetingName}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
								</div>
								<div>
									<label for="s_status"><wa:mls>status</wa:mls></label>
									<input type="checkbox" value="0" name="s_status" <c:if test="${wa:contain(waParams.s_status,'0')}">checked="checked"</c:if>/><wa:mls>WAIT</wa:mls>
									<input type="checkbox" value="1" name="s_status" <c:if test="${wa:contain(waParams.s_status,'1')}">checked="checked"</c:if>/><wa:mls>ACC</wa:mls>
									<input type="checkbox" value="2" name="s_status" <c:if test="${wa:contain(waParams.s_status,'2')}">checked="checked"</c:if>/><wa:mls>REF</wa:mls>					
								</div>
									<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
									<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
								</form>
							</div>
						</div>
						<!-- SEARCH BUTTONS -->
					</div>


					<h2><wa:mls>ReqForProposal</wa:mls></h2>
					<div id="list">
						<div id="mask">
							<table cellspacing=0 cellpadding=0>

								<!-- HEADERS -->
								<tr class="header">
									<td></td>
									<td class="center checkbox">
										<input type="checkbox" id="checkboxAll"/>
									</td>
									<td class="center reqid">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>id</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="reqid" />
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
									<td class="center zipcode">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>Zip</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="zip" />
										</wa:link>			
									</td>
									<td class="left city">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>City</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="city" />
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
									<td class="center company">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>company</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="company" />
										</wa:link>
									</td>
										<td class="center meetingName">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>meetingName</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="meetingName" />
										</wa:link>
									</td>
									<td class="center">
									</td>
								</tr>

								<!-- LINES -->
								<c:forEach var="item" items="${list}" varStatus="loop">
									<tr class="line${((loop.count+1)%2)+1}">
									<td 
										<c:if test="${item.status == '1'}">class="greenStatus"</c:if>
										<c:if test="${item.status == '0'}">class="orangeStatus"</c:if>
										<c:if test="${item.status == '2'}">class="redStatus"</c:if>
						            >&nbsp;</td>
										<td class="center checkbox"><input type="checkbox" value="${item.reqid}"></td>
										<td class="center id"><a href="${context}/${site}/reqforproposal/editItem/id/${item.reqid}.do" title="<wa:mls>Edit id</wa:mls>">${item.reqid}</a></td>
										<td class="left firstname">${item.firstname}</td>
										<td class="left lastname">${item.lastname}</td>
										<td class="left email">${item.email}</td>
										<td class="center zipcode">${item.zip}</td>
										<td class="left city">${item.city}</td>
										<td class="left status"><c:if test="${item.status == '1'}">ACC</c:if>
										<c:if test="${item.status == '0'}">WAIT</c:if>
										<c:if test="${item.status == '2'}">REF</c:if></td>
										<td class="center createdOn"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.createdOn}"/>&nbsp;</td>
										<td class="center company">${item.company}</td>
										<td class="center meetingName">${item.meetingName}</td>
										<td class="center id"><c:if test="${item.type eq 'WITHPRO'}"><a href="${context}/${site}/reqseenby/reqseenbyList/reqId/${item.reqid}.do" title="<wa:mls>Viewed By</wa:mls>"><wa:mls>Viewed By</wa:mls></a></c:if></td>
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
						<input name="reqid" id="c_reqid" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>reqid</wa:mls></label>
					</div>
					<div>
						<input name="firstname" id="c_firstname" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>Firstname</wa:mls></label>
					</div>
					<div>
						<input name="lastname" id="c_lastname" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>Lastname</wa:mls></label>
					</div>	
					<div>
						<input name="email" id="c_email" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>Email</wa:mls></label>
					</div>	
					<div>
						<input name="zip" id="c_zip" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>Zip</wa:mls></label>
					</div>
					<div>
						<input name="city" id="c_city" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>City</wa:mls></label>
					</div>
					
				</div>
				

				<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
				<script>
					path='${context}/${site}/${module}';
					idName='id';
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
function admin_accept(){
	changeStatus('1');
}
function admin_refuse(){
	changeStatus('2');
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

		
