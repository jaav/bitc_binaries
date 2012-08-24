<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="list">
			<c:choose>
				<c:when test="${list == null || fn:length(list) == 0}">
					<span id="msg"><wa:mls>Aucun résultat</wa:mls></span>
				</c:when>	
				<c:otherwise>
					<div class="tab_paging">
			    		<wa:include URI="${site}/${module}/navNumber" /> 
		       		</div>
		       		<span id="msg">${resultsSize} <wa:mls>Résultats de recherche</wa:mls></span>
		       		<div class="clr"></div>
		       		<ul>	
		       		<%--Debut Tab list Event --%>		
						<c:forEach items="${list}" var="item" varStatus="loop">
							<li>
								<c:if test="${empty waParam.type || waParam.type eq 'highlight'}">
									<c:choose>					
			          					<c:when test="${not empty item.smallImage}">	
			        						<a href="<wa:url URI="${site}/${module}/detail"/>?id=${item.id}&code=${waParam.code}#detail" >
			        							<img src="${item.smallImage}" alt="${item.formatMainTitle}" width="165"/>
			        						</a>
			          					</c:when>
			          					<c:otherwise>
			          						<a href="<wa:url URI="${site}/${module}/detail"/>?id=${item.id}&code=${waParam.code}#detail" >
			        							<img src="${context}/static/front/img/ml/default_content.jpg" alt="${item.formatMainTitle}" width="165"/>
			        						</a>
							          	</c:otherwise>
			          				</c:choose>
		          				</c:if>
		          				<div class="itemInfo">
			          				<span class="title">
			          					<a href="<wa:url URI="${site}/${module}/detail"/>?id=${item.id}&code=${waParam.code}#detail">${item.mainTitle}</a>
			          				</span>
			          				<span class="description">
			          					${item.mainAbstract_}
			          				</span>
			          				<span class="dates">
			          					<c:if test="${not empty item.periodFromDate}">
								            <div class="clr"></div>
								            <p class="float_left"><strong><wa:mls>Date de début :</wa:mls></strong>
								            	<span><c:choose>
												<c:when test="${item.periodFromHour eq '00'}">
													<fmt:formatDate pattern="dd/MM/yyyy" value="${item.periodFromDate}"/>
												</c:when>
												<c:otherwise>
													<fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${item.periodFromDate}"/>
												</c:otherwise>
											</c:choose></span>
								            </p>
										    
										     <p class="float_left margin_left10"><strong><wa:mls>Date de fin :</wa:mls></strong>
								            	<span><c:choose>
												<c:when test="${item.periodToHour eq '00'}">
													<fmt:formatDate pattern="dd/MM/yyyy" value="${item.periodToDate}"/>
												</c:when>
												<c:otherwise>
													<fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${item.periodToDate}"/>
												</c:otherwise>
											</c:choose></span>
								            </p>
								         </c:if>
			          				</span>
			          				<div class="clr"></div>
			          				<span class="place">
			          					${item.zipcode} ${item.city}
			          				</span>
		          				</div>
		          				
		          				<div class="more_info">
									<a href="<wa:url URI="${site}/${module}/detail"/>?id=${item.id}&code=${waParam.code}#detail" class="btn_more_info" title="${item.formatMainTitle}"><wa:mls>More info</wa:mls></a>
								</div>
								<div class="clr"></div>
							</li>
						</c:forEach>
						<%--Fin Tab list Event --%>
						
					</ul>
					<div class="tab_paging">
			    		<wa:include URI="${site}/${module}/navNumber" /> 
		       		</div>
				</c:otherwise>
			</c:choose>
			
		</div>
