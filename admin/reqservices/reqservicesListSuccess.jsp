
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
										<label for="s_serviceid"><wa:mls>Service id</wa:mls></label>
										<input name="s_serviceid" type="text" <c:choose><c:when test="${waParam.s_serviceid!=null}">value="${waParam.s_serviceid}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									<div>
										<label for="s_lg"><wa:mls>Langue</wa:mls></label>
										<wa:include URI="admin/dropdown/dropListCulture">
											<wa:param name="excludeBE" value="1" />
											<wa:param name="name" value="s_lg" />
											<wa:param name="choiceMsg" value="Choose the culture" />
											<wa:param name="selectedValues" value="${waParam.s_lg}" />
										</wa:include>
									</div>
									<div>
										<label for="s_label"><wa:mls>Label</wa:mls></label>
										<input name="s_label" type="text" <c:choose><c:when test="${waParam.s_label!=null}">value="${waParam.s_label}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									<div>
										<label for="s_active"><wa:mls>Active</wa:mls></label>
										<input type="radio"<c:if test="${waParam.s_active=='0'}"> checked="checked"</c:if> value="0" name="s_active" style="margin-left:50px;"/><wa:mls>No</wa:mls>
										<input type="radio"<c:if test="${waParam.s_active=='1'}"> checked="checked"</c:if> value="1" name="s_active"/><wa:mls>Yes</wa:mls>
									</div>
									<div>
										<label for="s_displayorder"><wa:mls>Display Order</wa:mls></label>
										<input name="s_displayorder" type="text" <c:choose><c:when test="${waParam.s_displayorder!=null}">value="${waParam.s_displayorder}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									<!-- SEARCH BUTTONS -->
									<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
									<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
								</form>
							</div>
						</div>
					</div>


					<h2><wa:mls>Req Services</wa:mls></h2>
					<div id="list">
						<div id="mask">
							<table cellspacing=0 cellpadding=0>

								<!-- HEADERS -->
								<tr class="header">
									<td class="center checkbox">
										<input type="checkbox" id="checkboxAll"/>
									</td>
									<td class="left serviceid">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>id</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="title" />
										</wa:link>
									</td>
									<td class="center langue">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>lg</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="createdOn" />
										</wa:link>
									</td>
									<td class="center label">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>label</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="createdOn" />
										</wa:link>
									</td>
									<td class="center active">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>active</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="createdOn" />
										</wa:link>
									</td>
									<td class="center displayorder">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>displayorder</wa:mls>
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
										<td class="center checkbox"><input type="checkbox" value="${item.serviceid}"></td>
										<td class="center id"><a href="${context}/${site}/reqservices/editItem/id/${item.serviceid}.do" title="<wa:mls>Edit id</wa:mls>">${item.serviceid}</a></td>
										<td class="left langue">${item.lg}</td>
										<td class="left label">${item.label}</td>
										<td class="center active">${item.active}</td>
										<td class="left displayorder">${item.displayorder}</td>
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
						<input name="serviceid" id="c_serviceid" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>serviceid</wa:mls></label>
					</div>
					<div>
						<input name="lg" id="c_lg" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>Langue</wa:mls></label>
					</div>
					<div>
						<input name="label" id="c_label" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>label</wa:mls></label>
					</div>
					<div>
						<input name="active" id="c_active" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>active</wa:mls></label>
					</div>
					<div>
						<input name="displayorder" id="c_displayorder" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>displayorder</wa:mls></label>
					</div>
				</div>

				<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
				<script>
					path='${context}/${site}/${module}';
					idName='id';
				</script>


		
