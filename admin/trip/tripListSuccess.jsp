
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
							<a href="javascript:void(0);" id="edit_btn"><wa:mls>view</wa:mls></a>
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
										<label for="s_tripId"><wa:mls>tripId</wa:mls></label>
										<input name="s_tripId" type="text" <c:choose><c:when test="${waParam.s_tripId!=null}">value="${waParam.s_tripId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									<div>
										<label for="s_contentType"><wa:mls>contentType</wa:mls></label>
										<wa:include URI="${site}/dropdown/dropList">
											<wa:param name="class" value="com.wanabe.cms.hdata.ContentGroupType" />
											<wa:param name="manager" value="com.wanabe.cms.manager.ContentGroupTypeManager" />
											<wa:param name="method" value="listAll" />
											<wa:param name="identity" value="name" />
											<wa:param name="display" value="name" />
											<wa:param name="name" value="s_contentType" />
											<wa:param name="selectedValues" value="${waParam.s_contentType}" />
										</wa:include>
									</div>
									<div>
										<label for="s_contentId"><wa:mls>contentId</wa:mls></label>
										<input name="s_contentId" type="text" <c:choose><c:when test="${waParam.s_contentId!=null}">value="${waParam.s_contentId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									<div>
										<label for="s_userId"><wa:mls>userId</wa:mls></label>
										<input name="s_userId" type="text" <c:choose><c:when test="${waParam.s_userId!=null}">value="${waParam.s_userId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									
									<div>
										<label for="s_createdOn"><wa:mls>createdOn</wa:mls></label>
										<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash no-transparency date" id="s_createdOnStart" name="s_createdOnStart" value="${waParam.s_createdOnStart}" maxlength="10" /></p>
										<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash no-transparency date" id="s_createdOnEnd" name="s_createdOnEnd" value="${waParam.s_createdOnEnd}" maxlength="10" /></p>
									</div>

									<!-- SEARCH BUTTONS -->
									<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
									<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
								</form>
							</div>
						</div>
					</div>


					<h2><wa:mls>Trip</wa:mls></h2>
					<div id="list">
						<div id="mask">
							<table cellspacing=0 cellpadding=0>

								<!-- HEADERS -->
								<tr class="header">
									<td class="center checkbox">
										<input type="checkbox" id="checkboxAll"/>
									</td>
									<td class="center tripId">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>tripId</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="tripId" />
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
								</tr>

								<!-- LINES -->
								<c:forEach var="item" items="${list}" varStatus="loop">
									<tr class="line${((loop.count+1)%2)+1}">
										<td class="center checkbox"><input type="checkbox" value="${item.tripId}"></td>
										<td class="center tripId"><a href="${context}/${site}/trip/editItem/id/${item.tripId}.do" title="<wa:mls>view</wa:mls>">${item.tripId}&nbsp;</a></td>
										<td class="left contentType">${item.contentType}</td>
										<td class="center contentId">${item.contentId}</td>
										<td class="center userId"><wa:include URI="${site}/user/lookup"><wa:param name="id" value="${item.userId}"/></wa:include>&nbsp;</td>
										<td class="center createdOn"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.createdOn}"/>&nbsp;</td>
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
						<input name="tripId" id="c_tripId" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>tripId</wa:mls></label>
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
						<input name="userId" id="c_userId" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>userId</wa:mls></label>
					</div>
					<div>
						<input name="createdOn" id="c_createdOn" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>createdOn</wa:mls></label>
					</div>
				</div>

				<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
				<script>
					path='${context}/${site}/${module}';
					idName='id';
				</script>


		
