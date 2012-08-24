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
										<label for="s_id"><wa:mls>id</wa:mls></label>
										<input name="s_id" type="text" <c:choose><c:when test="${waParam.s_id!=null}">value="${waParam.s_id}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									<div>
										<label for="s_eventId"><wa:mls>eventId</wa:mls></label>
										<input name="s_eventId" type="text" <c:choose><c:when test="${waParam.s_eventId!=null}">value="${waParam.s_eventId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									<div>
										<label for="s_titre"><wa:mls>titre</wa:mls></label>
										<input name="s_titre" type="text" <c:choose><c:when test="${waParam.s_titre!=null}">value="${waParam.s_titre}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									<div>
										<label for="s_eventCulture"><wa:mls>evenetCulture</wa:mls></label>
										<input name="s_eventCulture" type="text" <c:choose><c:when test="${waParam.s_eventCulture!=null}">value="${waParam.s_eventCulture}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									

									<div>
										<label for="s_date"><wa:mls>date</wa:mls></label>
										<p><wa:mls>from</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_dateOnStart" name="s_dateStart" value="${waParam.s_dateStart}" maxlength="10" /></p>
										<p><wa:mls>to</wa:mls> <input type="text" class="w8em format-d-m-y divider-dash highlight-days-12 no-transparency date" id="s_dateEnd" name="s_dateEnd" value="${waParam.s_dateEnd}" maxlength="10" /></p>
									</div>
									<div>
										<label for="s_price"><wa:mls>price</wa:mls></label>
										<input name="s_price" type="text" <c:choose><c:when test="${waParam.s_price!=null}">value="${waParam.s_price}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									<div>
										<label for="s_association"><wa:mls>association</wa:mls></label>
										<input name="s_association" type="text" <c:choose><c:when test="${waParam.s_association!=null}">value="${waParam.s_association}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									<div>
										<label for="s_userId"><wa:mls>userId</wa:mls></label>
										<input name="s_userId" type="text" <c:choose><c:when test="${waParam.s_userId!=null}">value="${waParam.s_userId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									<div>
										<label for="s_numParticipant"><wa:mls>numParticipant</wa:mls></label>
										<input name="s_numParticipant" type="text" <c:choose><c:when test="${waParam.s_numParticipant!=null}">value="${waParam.s_numParticipant}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									<div>
										<label for="s_city"><wa:mls>city</wa:mls></label>
										<input name="s_city" type="text" <c:choose><c:when test="${waParam.s_city!=null}">value="${waParam.s_city}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									<div>
										<label for="s_country"><wa:mls>country</wa:mls></label>
										<input name="s_country" type="text" <c:choose><c:when test="${waParam.s_country!=null}">value="${waParam.s_country}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
									</div>
									<!-- SEARCH BUTTONS -->
									<input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
									<input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
								</form>
							</div>
						</div>
					</div>


					<h2><wa:mls>VisiteBooked</wa:mls></h2>
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
									<td class="center eventId">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>eventId</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="eventId" />
										</wa:link>
									</td>
									<td class="left titre">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>titre</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="titre" />
										</wa:link>
									</td>
									<td class="left eventCulture">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>eventCulture</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="eventCulture" />
										</wa:link>
									</td>
									<td class="center date">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>date</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="date" />
										</wa:link>
									</td>
									<td class="left price">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>price</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="price" />
										</wa:link>
									</td>
									<td class="left association">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>association</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="association" />
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
									<td class="left comment">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>comment</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="comment" />
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
									<td class="left greeting">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>greeting</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="greeting" />
										</wa:link>
									</td>
									<td class="left firstname">
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
									<td class="left lastname">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>lastname</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="firstname" />
										</wa:link>
									</td>
									<td class="left email">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>email</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="email" />
										</wa:link>
									</td>
										<td class="left street">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>street</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="street" />
										</wa:link>
									</td>
									
										<td class="left num">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>num</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="num" />
										</wa:link>
									</td>
										
									<td class="left box">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>box</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="box" />
										</wa:link>
									</td>
									<td class="left zipcode">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>zipcode</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="zipcode" />
										</wa:link>
									</td>
									<td class="left city">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>city</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="city" />
										</wa:link>
									</td>
									<td class="left country">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>country</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="country" />
										</wa:link>
									</td>
									<td class="left phone">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>phone</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="phone" />
										</wa:link>
									</td> 
								</tr>

								<!-- LINES -->
								<c:forEach var="item" items="${list}" varStatus="loop">
									<tr class="line${((loop.count+1)%2)+1}">
										<td class="center checkbox"><input type="checkbox" value="${item.id}"></td>
										<td class="right id"><a href="${context}/${site}/visiteBooked/editItem/id/${item.id}.do" title="<wa:mls>view</wa:mls>">${item.id}&nbsp;</a></td>
										 <td class="right eventId">${item.eventId}&nbsp;</td>
										<td class="left titre">${item.titre}&nbsp;</td>
										<td class="right eventCulture">${item.eventCulture}&nbsp;</td>
										<td class="center date"><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.date}"/>&nbsp;</td>
										<td class="right price">${item.price}&nbsp;</td>
										<td class="right association">${item.association}&nbsp;</td>
										<td class="center userId"><wa:include URI="${site}/user/lookup"><wa:param name="id" value="${item.userId}"/></wa:include>&nbsp;</td>
										<td class="left comment">${item.comment}&nbsp;</td>
										<td class="right numParticipant">${item.numParticipant}&nbsp;</td>
										<td class="left greeting">${item.greeting}&nbsp;</td>
										<td class="left firstname">${item.firstname}&nbsp;</td>
										<td class="left lastname">${item.lastname}&nbsp;</td>
										<td class="left email">${item.email}&nbsp;</td>
										<td class="left street">${item.street}&nbsp;</td>
										<td class="left num">${item.num}&nbsp;</td>
										<td class="left box">${item.box}&nbsp;</td>
										<td class="left zipcode">${item.zipcode}&nbsp;</td>
										<td class="left city">${item.city}&nbsp;</td>
										<td class="left country">${item.country}&nbsp;</td>
										<td class="left phone">${item.phone}&nbsp;</td> 
										
										
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
						<input name="eventId" id="c_eventId" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>eventId</wa:mls></label>
					</div>
					<div>
						<input name="titre" id="c_titre" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>titre</wa:mls></label>
					</div>
					<div>
						<input name="eventCulture" id="c_eventCulture" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>eventCulture</wa:mls></label>
					</div>
					<div>
						<input name="date" id="c_date" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>date</wa:mls></label>
					</div>
					<div>
						<input name="price" id="c_price" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>price</wa:mls></label>
					</div>
					<div>
						<input name="reservationEmail" id="c_reservationEmail" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>reservationEmail</wa:mls></label>
					</div>
					<div>
						<input name="association" id="c_association" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>association</wa:mls></label>
					</div>
					<div>
						<input name="userId" id="c_userId" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>userId</wa:mls></label>
					</div>
					<div>
						<input name="comment" id="c_comment" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>comment</wa:mls></label>
					</div>
					<div>
						<input name="numParticipant" id="c_numParticipant" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>numParticipant</wa:mls></label>
					</div>
					<div>
						<input name="greeting" id="c_greeting" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>greeting</wa:mls></label>
					</div>
					<div>
						<input name="firstname" id="c_firstname" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>firstname</wa:mls></label>
					</div>
					<div>
						<input name="lastname" id="c_lastname" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>lastname</wa:mls></label>
					</div>
					<div>
						<input name="email" id="c_email" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>email</wa:mls></label>
					</div>
					<div>
						<input name="street" id="c_street" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>street</wa:mls></label>
					</div>
					<div>
						<input name="num" id="c_num" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>num</wa:mls></label>
					</div>
					<div>
						<input name="box" id="c_box" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>box</wa:mls></label>
					</div>
					<div>
						<input name="zipcode" id="c_zipcode" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>zipcode</wa:mls></label>
					</div>
					<div>
						<input name="city" id="c_city" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>city</wa:mls></label>
					</div>
					<div>
						<input name="country" id="c_country" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>country</wa:mls></label>
					</div>
					<div>
						<input name="phone" id="c_phone" type="checkbox" value="1" checked="checked"/>
						<label><wa:mls>phone</wa:mls></label>
					</div>
				</div>

				<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
				<script>
					path='${context}/${site}/${module}';
					idName='id';
				</script>


		