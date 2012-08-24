
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
							<a href="javascript:void(0);" id="add_btn"><wa:mls>add</wa:mls></a>
							<a href="javascript:void(0);" id="duplicate_btn"><wa:mls>duplicate</wa:mls></a>
							<a href="javascript:void(0);" id="delete_btn"><wa:mls>delete</wa:mls></a>
							<a href="javascript:void(0);" id="edit_btn"><wa:mls>edit</wa:mls></a>
							<a href="javascript:void(0);" id="accept_btn"><wa:mls>accept</wa:mls></a>
							<a href="javascript:void(0);" id="refuse_btn"><wa:mls>refuse</wa:mls></a>
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
									<label for="s_id"><wa:mls>id</wa:mls></label>
									<input name="s_id" type="text" <c:choose><c:when test="${waParam.s_id!=null}">value="${waParam.s_id}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
								</div>	
									<div>
										<label for="s_accessSection_id"><wa:mls>accessSection</wa:mls></label>
										<wa:include URI="${site}/dropdown/dropList">
											<wa:param name="class" value="com.bitc.hdata.AccessSection" />
											<wa:param name="manager" value="com.bitc.hdata.manager.AccessSectionManager" />
											<wa:param name="method" value="listAll" />
											<wa:param name="identity" value="id" />
											<wa:param name="display" value="name" />
											<wa:param name="name" value="s_accessSection_id" />
											<wa:param name="selectedValues" value="${waParam.s_accessSection_id}" />
										</wa:include>
									</div>
									<div>
										<label for="s_user_userId"><wa:mls>userId</wa:mls></label>
										<input name="s_user_userId" type="text" <c:choose><c:when test="${waParam.s_user_userId!=null}">value="${waParam.s_user_userId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									<div>
										<label for="s_user_status"><wa:mls>userStatus</wa:mls></label>
										<input name="s_user_status" type="text" <c:choose><c:when test="${waParam.s_user_status!=null}">value="${waParam.s_user_status}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									<div>
										<label for="s_userComment"><wa:mls>userComment</wa:mls></label>
										<input name="s_userComment" type="text" <c:choose><c:when test="${waParam.s_userComment!=null}">value="${waParam.s_userComment}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									<div>
										<label for="s_adminComment"><wa:mls>adminComment</wa:mls></label>
										<input name="s_adminComment" type="text" <c:choose><c:when test="${waParam.s_adminComment!=null}">value="${waParam.s_adminComment}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
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
										<label for="s_modifiedOn"><wa:mls>modifiedOn</wa:mls></label>
										<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_modifiedOnStart" name="s_modifiedOnStart" value="${waParam.s_modifiedOnStart}" maxlength="10" /></p>
										<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_modifiedOnEnd" name="s_modifiedOnEnd" value="${waParam.s_modifiedOnEnd}" maxlength="10" /></p>
									</div>

									<!-- SEARCH BUTTONS -->
									<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
									<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
								</form>
							</div>
						</div>
					</div>


					<h2><wa:mls>AccessUserSection</wa:mls></h2>
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
									<td class="left accessSection">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>accessSection</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="accessSection" />
										</wa:link>
									</td>
									<td class="left user">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>user</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="user" />
										</wa:link>
									</td>
									<td class="left userStatus">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>userStatus</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="user_status" />
										</wa:link>
									</td>
									<td class="left userComment">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>userComment</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="userComment" />
										</wa:link>
									</td>
									<td class="left adminComment">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>adminComment</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="adminComment" />
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
									<td class="center modifiedOn">
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

								<!-- LINES -->
								<c:forEach var="item" items="${list}" varStatus="loop">
									<tr class="line${((loop.count+1)%2)+1}">
									<td 
										<c:if test="${item.status == 'ACC'}">class="greenStatus"</c:if>
										<c:if test="${item.status == 'WAIT'}">class="orangeStatus"</c:if>
										<c:if test="${item.status == 'REF'}">class="redStatus"</c:if>
						            >&nbsp;</td>
										<td class="center checkbox"><input type="checkbox" value="${item.id}"></td>
										<td class="center id"><a href="${context}/${site}/accessUserSection/editItem/id/${item.id}.do" title="<wa:mls>Edit id</wa:mls>">${item.id}</a></td>
										<td class="left accessSection"><wa:link URI="${site}/accessSection/editItem/id/${item.accessSection.id}"> ${item.accessSection.name}&nbsp;</wa:link></td>
										<td class="left user"><wa:link URI="${site}/user/editItem/id/${item.user.userId}"> ${item.user.firstname}&nbsp;${item.user.lastname}&nbsp;(${item.user.userId})&nbsp;</wa:link></td>
										<td class="left user_status">${item.user.status}</td>
										<td class="left userComment">${item.userComment}</td>
										<td class="left adminComment">${item.adminComment}</td>
										<td class="left status">${item.status}</td>
										<td class="center createdOn"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.createdOn}"/>&nbsp;</td>
										<td class="center modifiedOn"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.modifiedOn}"/>&nbsp;</td>
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
						<input name="id" id="c_id" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>id</wa:mls></label>
					</div>
					<div>
						<input name="accessSection" id="c_accessSection" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>accessSection</wa:mls></label>
					</div>
					<div>
						<input name="user" id="c_user" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>user</wa:mls></label>
					</div>
					<div>
						<input name="userComment" id="c_userComment" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>userComment</wa:mls></label>
					</div>
					<div>
						<input name="adminComment" id="c_adminComment" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>adminComment</wa:mls></label>
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
						<input name="modifiedOn" id="c_modifiedOn" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>modifiedOn</wa:mls></label>
					</div>
				</div>

				<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
				<script>
					path='${context}/${site}/${module}';
					idName='id';
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

		
