
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
								<form name="searchForm" id="searchForm" action="${context}///.do">

									<div>
										<label for="s_title"><wa:mls>title</wa:mls></label>
										<input name="s_title" type="text" <c:choose><c:when test="${waParam.s_title!=null}">value="${waParam.s_title}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>

									<div>
										<label for="s_createdOn"><wa:mls>createdOn</wa:mls></label>
										<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnStart" name="s_createdOnStart" value="${waParam.s_createdOnStart}" maxlength="10" /></p>
										<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_createdOnEnd" name="s_createdOnEnd" value="${waParam.s_createdOnEnd}" maxlength="10" /></p>
									</div>

									<!-- SEARCH BUTTONS -->
									<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
									<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
								</form>
							</div>
						</div>
					</div>


					<h2><wa:mls>ReqproposalReqservices</wa:mls></h2>
					<div id="list">
						<div id="mask">
							<table cellspacing=0 cellpadding=0>

								<!-- HEADERS -->
								<tr class="header">
									<td class="center checkbox">
										<input type="checkbox" id="checkboxAll"/>
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
										<td class="center checkbox"><input type="checkbox" value="${item.myIdentity}"></td>
										<td class="left title">${item.title}</td>
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
						<input name="title" id="c_title" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>title</wa:mls></label>
					</div>
					<div>
						<input name="createdOn" id="c_createdOn" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>createdOn</wa:mls></label>
					</div>
				</div>

				<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
				<script>
					path='${context}/${site}/${module}';
					idName='myIdentity';
				</script>


		
