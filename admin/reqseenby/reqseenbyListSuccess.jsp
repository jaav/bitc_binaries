
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
									<label for="s_reqid"><wa:mls>Req Id</wa:mls></label>
									<input name="s_reqid" type="text" <c:choose><c:when test="${waParam.s_reqid!=null}">value="${waParam.s_reqid}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
								</div>
								<div>
									<label for="s_professionalId"><wa:mls>Professional Id</wa:mls></label>
									<input name="s_professionalId" type="text" <c:choose><c:when test="${waParam.s_professionalId!=null}">value="${waParam.s_professionalId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
								</div>
								<div>
									<label for="s_createdon"><wa:mls>created On</wa:mls></label>
									<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdonStart" name="s_createdonStart" value="${waParam.s_createdonStart}" maxlength="10" /></p>
									<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdonEnd" name="s_createdonEnd" value="${waParam.s_createdonEnd}" maxlength="10" /></p>
								</div>
									<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
									<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
								</form>
							</div>
						</div>
						<!-- SEARCH BUTTONS -->
					</div>


					<h2><wa:mls>ReqSeenBy</wa:mls></h2>
					<div id="list">
						<div id="mask">
							<table cellspacing=0 cellpadding=0>

								<!-- HEADERS -->
								<tr class="header">
									<!--<td></td>
									 <td class="center checkbox">
										<input type="checkbox" id="checkboxAll"/>
									</td> -->
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
									<td class="center reqid">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>reqid</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="reqid" />
										</wa:link>
									</td>
									<td class="center professionalId">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>professionalId</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="professionalId" />
										</wa:link>
									</td>
									<td class="center createdon">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>createdon</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="createdon" />
										</wa:link>
									</td>
									<td class="left ip">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>IP</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="ip" />
										</wa:link>
									</td>
									<td class="left user">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>User</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="" />
										</wa:link>
									</td>
								</tr>

								<!-- LINES -->
								<c:forEach var="item" items="${list}" varStatus="loop">
									<tr class="line${((loop.count+1)%2)+1}">
									<!--<td class="center checkbox"><input type="checkbox" value="${item.id}"></td>-->
										<td class="center id">${item.id}</td>
										<td class="center reqid"><a href="${context}/${site}/reqforproposal/editItem/id/${item.reqid}.do" title="<wa:mls>Edit id</wa:mls>">${item.reqid}</a></td>
										<td class="center professionalId">${item.professionalId}</td>
										<td class="center createdon"><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${item.createdon}"/>&nbsp;</td>
										<td class="left ip">${item.ip}</td>
										<td class="left user">
											<wa:include URI="${site}/acxAdminusers/lookup">
											<wa:param name="id" value="${item.professionalId}"/>
											</wa:include>
										</td>
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
						<label><wa:mls>Id</wa:mls></label>
					</div>
					<div>
						<input name="reqid" id="c_reqid" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>reqid</wa:mls></label>
					</div>
					<div>
						<input name="professionalId" id="c_professionalId" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>professionalId</wa:mls></label>
					</div>
					<div>
						<input name="createdon" id="c_createdon" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>created On</wa:mls></label>
					</div>
					<div>
						<input name="ip" id="c_ip" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>IP</wa:mls></label>
					</div>
				</div>
				

				<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
				<script>
					path='${context}/${site}/${module}';
					idName='id';
				</script>

		
