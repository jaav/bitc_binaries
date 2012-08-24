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
										<label for="s_commentId"><wa:mls>commentId</wa:mls></label>
										<input name="s_commentId" type="text" <c:choose><c:when test="${waParam.s_commentId!=null}">value="${waParam.s_commentId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
								    </div>	
								    <div>
										<label for="s_message"><wa:mls>message</wa:mls></label>
										<input name="s_message" type="text" <c:choose><c:when test="${waParam.s_message!=null}">value="${waParam.s_message}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>	
									<div>
										<label for="s_contentType"><wa:mls>contentType</wa:mls></label>
										<input name="s_contentType" type="text" <c:choose><c:when test="${waParam.s_contentType!=null}">value="${waParam.s_contentType}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									<div>
										<label for="s_contentId"><wa:mls>contentId</wa:mls></label>
										<input name="s_contentId" type="text" <c:choose><c:when test="${waParam.s_contentId!=null}">value="${waParam.s_contenId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									<div>
										<label for="s_userId"><wa:mls>userId</wa:mls></label>
										<input name="s_userId" type="text" <c:choose><c:when test="${waParam.s_userId!=null}">value="${waParam.s_userId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									
									
									<div>
											<label for="s_status"><wa:mls>status</wa:mls></label>
											<table>
												<tr>
													<td><input type="checkbox"<c:if test="${wa:contain(waParams.s_status,'ACC')}"> checked="checked"</c:if> value="ACC" name="s_status"/><wa:mls>ACCEPTED</wa:mls></td>
													<td><input type="checkbox"<c:if test="${wa:contain(waParams.s_status,'WAIT')}"> checked="checked"</c:if> value="WAIT" name="s_status"/><wa:mls>WAIT</wa:mls></td>
													<td><input type="checkbox"<c:if test="${wa:contain(waParams.s_status,'REF')}"> checked="checked"</c:if> value="REF" name="s_status"/><wa:mls>REFUSED</wa:mls></td>
													<td><input type="checkbox"<c:if test="${wa:contain(waParams.s_status,'NC')}"> checked="checked"</c:if> value="NC" name="s_status"/><wa:mls>Not Confirmed</wa:mls></td>
												</tr>
											
											</table>
									</div>

									<div>
										<label for="s_createdOn"><wa:mls>createdOn</wa:mls></label>
										<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnStart" name="s_createdOnStart" value="${waParam.s_createdOnStart}" maxlength="10" /></p>
										<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnEnd" name="s_createdOnEnd" value="${waParam.s_createdOnEnd}" maxlength="10" /></p>
									</div>
									<div>
										<label for="s_statusOn"><wa:mls>statusOn</wa:mls></label>
										<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_statusOnStart" name="s_statusOnStart" value="${waParam.s_statusOnStart}" maxlength="10" /></p>
										<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_statusOnEnd" name="s_statusOnEnd" value="${waParam.s_statusOnEnd}" maxlength="10" /></p>
									</div>

									<!-- SEARCH BUTTONS -->
									<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
									<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
								</form>
							</div>
						</div>
					</div>


					<h2><wa:mls>ContentComment</wa:mls></h2>
					<div id="list">
						<div id="mask">
							<table cellspacing=0 cellpadding=0>

								<!-- HEADERS -->
								<tr class="header">
									<td></td>
									<td class="center checkbox">
										<input type="checkbox" id="checkboxAll"/>
									</td>
									<td class="center commentId">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>commentId</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="commentId" />
										</wa:link>
									</td>
									<td class="left message">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>message</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="message" />
										</wa:link>
									</td>
									<td class="left contentType">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>contentType</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="contentType" />
										</wa:link>
									</td>
									<td class="center contentId">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>contentId</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="contentId" />
										</wa:link>
									</td>
									<td class="center userId">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>userId</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="userId" />
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
									<td class="center statusOn">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>statusOn</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="statusOn" />
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
										<td class="center checkbox"><input type="checkbox" value="${item.commentId}"></td>
										<td class="center commentId"><a href="${context}/${site}/contentComment/editItem/id/${item.commentId}.do" title="<wa:mls>Edit id</wa:mls>">${item.commentId}</a></td>
										<td class="left message">${item.message}</td>
										<td class="left contentType">${item.contentType}</td>
										<td class="center contentId">${item.contentId}</td>
										<td class="center userId">${item.userId}</td>
										<td class="left status">${item.status}</td>
										<td class="center createdOn"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.createdOn}"/>&nbsp;</td>
										<td class="center statusOn"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.statusOn}"/>&nbsp;</td>
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
						<input name="commentId" id="commentId" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>commentId</wa:mls></label>
					</div>
					<div>
						<input name="message" id="c_message" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>message</wa:mls></label>
					</div>
					<div>
						<input name="contentType" id="c_contentType" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>contentType</wa:mls></label>
					</div>
					<div>
						<input name="contentId" id="c_contentId" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>contentId</wa:mls></label>
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
						<input name="StatusOn" id="c_StatusOn" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>StatusOn</wa:mls></label>
					</div>
				</div>

				<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
				<script>
					path='${context}/${site}/${module}';
					idName='commentId';
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

		
