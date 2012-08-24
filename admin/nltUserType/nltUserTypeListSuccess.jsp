
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
										<label for="s_nltType_id"><wa:mls>nltType</wa:mls></label>
										<wa:include URI="${site}/dropdown/dropList">
											<wa:param name="class" value="com.bitc.hdata.NltType" />
											<wa:param name="manager" value="com.bitc.hdata.manager.NltTypeManager" />
											<wa:param name="method" value="listAll" />
											<wa:param name="identity" value="id" />
											<wa:param name="display" value="name" />
											<wa:param name="name" value="s_nltType_id" />
											<wa:param name="selectedValues" value="${waParam.s_nltType_id}" />
										</wa:include>
									</div>
									<div>
										<label for="s_user_userId"><wa:mls>userId</wa:mls></label>
										<input name="s_user_userId" type="text" <c:choose><c:when test="${waParam.s_user_userId!=null}">value="${waParam.s_user_userId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									<div>
										<label for="s_value"><wa:mls>value</wa:mls></label>
										<input name="s_value" type="text" <c:choose><c:when test="${waParam.s_value!=null}">value="${waParam.s_value}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									

									<div>
										<label for="s_optinOn"><wa:mls>optinOn</wa:mls></label>
										<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_optinOnStart" name="s_optinOnStart" value="${waParam.s_optinOnStart}" maxlength="10" /></p>
										<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_optinOnEnd" name="s_optinOnEnd" value="${waParam.s_optinOnEnd}" maxlength="10" /></p>
									</div>
									<div>
										<label for="s_optoutOn"><wa:mls>optoutOn</wa:mls></label>
										<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_optoutOnStart" name="s_optoutOnStart" value="${waParam.s_optoutOnStart}" maxlength="10" /></p>
										<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_optoutOnEnd" name="s_optoutOnEnd" value="${waParam.s_optoutOnEnd}" maxlength="10" /></p>
									</div>

									<!-- SEARCH BUTTONS -->
									<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
									<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
								</form>
							</div>
						</div>
					</div>


					<h2><wa:mls>Nlt User optin</wa:mls></h2>
					<div id="list">
						<div id="mask">
							<table cellspacing=0 cellpadding=0>

								<!-- HEADERS -->
								<tr class="header">
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
									<td class="left nltType">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>nltType</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="nltType" />
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
									<td class="left value">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>value</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="value" />
										</wa:link>
									</td>
									
									<td class="center optinOn">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>optinOn</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="optinOn" />
										</wa:link>
									</td>
									<td class="center optoutOn">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>optoutOn</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="optoutOn" />
										</wa:link>
									</td>
								</tr>

								<!-- LINES -->
								<c:forEach var="item" items="${list}" varStatus="loop">
									<tr class="line${((loop.count+1)%2)+1}">
										<td class="center checkbox"><input type="checkbox" value="${item.id}"></td>
										<td class="center id"><a href="${context}/${site}/${module}/editItem/id/${item.id}.do" title="<wa:mls>Edit id</wa:mls>">${item.id}</a></td>
										<td class="left nltType"><wa:link URI="${site}/nltType/editItem/id/${item.nltType.id}"> ${item.nltType.name}&nbsp;</wa:link></td>
										<td class="left user"><wa:link URI="${site}/user/editItem/id/${item.user.userId}"> ${item.user.firstname}&nbsp;${item.user.lastname}&nbsp;(${item.user.userId})&nbsp;</wa:link></td>
										<td class="center value"><c:if test="${item.value == 1}">X</c:if></td>
										<td class="center optinOn"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.optinOn}"/>&nbsp;</td>
										<td class="center optoutOn"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.optoutOn}"/>&nbsp;</td>
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
						<input name="nltType" id="c_nltType" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>nltType</wa:mls></label>
					</div>
					<div>
						<input name="user" id="c_user" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>user</wa:mls></label>
					</div>
					<div>
						<input name="optinOn" id="c_optinOn" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>optinOn</wa:mls></label>
					</div>
					<div>
						<input name="optoutOn" id="c_optoutOn" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>optoutOn</wa:mls></label>
					</div>
				</div>

				<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
				<script>
					path='${context}/${site}/${module}';
					idName='id';
				</script>


		
