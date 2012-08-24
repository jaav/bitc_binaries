
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
										<label for="s_name"><wa:mls>name</wa:mls></label>
										<input name="s_name" type="text" <c:choose><c:when test="${waParam.s_name!=null}">value="${waParam.s_name}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									<div>
										<label for="s_visible"><wa:mls>visible</wa:mls></label>
										<select name="s_visible">
											<option value=""></option>
											<option value="ALL" <c:if test="${waParam.s_visible == 'ALL'}">selected="selected"</c:if> >ALL</option>
											<option value="VISIT" <c:if test="${waParam.s_visible == 'VISIT'}">selected="selected"</c:if> >VISIT</option>
											<option value="PRESS" <c:if test="${waParam.s_visible == 'PRESS'}">selected="selected"</c:if> >PRESS</option>
											<option value="TRADE" <c:if test="${waParam.s_visible == 'TRADE'}">selected="selected"</c:if> >TRADE</option>
											<option value="MEETINGS" <c:if test="${waParam.s_visible == 'MEETINGS'}">selected="selected"</c:if> >MEETINGS</option>	
										</select>
									</div>
									<div>
										<label for="s_position"><wa:mls>position</wa:mls></label>
										<input name="s_position" type="text" <c:choose><c:when test="${waParam.s_position!=null}">value="${waParam.s_position}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>


									<!-- SEARCH BUTTONS -->
									<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
									<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
								</form>
							</div>
						</div>
					</div>


					<h2><wa:mls>NltType</wa:mls></h2>
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
									<td class="left visible">
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
										<td class="left position">
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
									<td class="left show"></td>
								</tr>

								<!-- LINES -->
								<c:forEach var="item" items="${list}" varStatus="loop">
									<tr class="line${((loop.count+1)%2)+1}">
									
										<td class="center checkbox"><input type="checkbox" value="${item.id}"></td>
										<td class="center id"><a href="${context}/${site}/nltType/editItem/id/${item.id}.do" title="<wa:mls>Edit id</wa:mls>">${item.id}</a></td>
										<td class="left name">${item.name}&nbsp;</td>
										<td class="left visible">${item.visible}&nbsp;</td>
										<td class="right position">${item.position}&nbsp;</td>
										<td class="left show"><a href="${context}/${site}/nltUserType/nltUserTypeList.do?s_nltType_id=${item.id}&s_submit=Search"><wa:mls>Show users</wa:mls></a></td>
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
						<input name="name" id="c_name" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>name</wa:mls></label>
					</div>
					<div>
						<input name="visible" id="c_visible" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>visible</wa:mls></label>
					</div>
					<div>
						<input name="position" id="c_position" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>position</wa:mls></label>
					</div>
				</div>

				<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
				<script>
					path='${context}/${site}/${module}';
					idName='id';
				</script>


		
