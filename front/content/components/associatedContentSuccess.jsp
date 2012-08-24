<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--tab:start-->
<c:if test="${not empty userLiked or  not empty hotel or  not empty bnb or  not empty resto or  not empty quartier or  not empty profile or  not empty experience  }">
		<div class="Tabbe_Content_Group">
		<div class="tab_paging">
		            <wa:include URI="${site}/content/navNumberForAssociatedContent" />
		       <!--  <div class="select">
		          <form>
		            <fieldset>
		              <label for="f_page"><wa:mls>Sort by :</wa:mls></label>
		              <select name="f_page" id="f_page" onchange=sortBy("${URI}/","${group}")>
		                <option value="0" <c:if test="${empty waParam.orderBy}">SELECTED</c:if>><wa:mls>Choix</wa:mls></option>
		                <option value="3" <c:if test="${waParam.orderBy == 'id' && waParam.asc == '1'}">SELECTED</c:if> ><wa:mls>Article (le plus récent)</wa:mls></option>
		                <option value="4" <c:if test="${waParam.orderBy == 'id' && waParam.asc == '0'}">SELECTED</c:if>><wa:mls>Article (le moins récent)</wa:mls></option>
		              </select>
		            </fieldset>
		          </form>
		        </div> -->
		      </div>
     <ul class="tab_list_simple">
      <c:if test="${listNull == '1'}"><wa:mls>aucun contenu trouvé</wa:mls></c:if>
      <c:forEach var="item" items="${list}" varStatus="loop">
             <li>
		        	<c:choose>
			        	<c:when test="${item.group == 'HOTEL'}">
						    <a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" >
					        		<c:choose>
								          	<c:when test="${not empty item.mainSmallImage}">	
								        		<img src="${item.mainSmallImage}" alt="${item.mainTitle}" width = '91'/>
								          	</c:when>
								          	<c:otherwise>
								        		<img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.mainTitle}" width = '91'/>
								          	</c:otherwise>
          							</c:choose>
					        </a>
					    </c:when>
	      			    <c:otherwise>
		      			    <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" >
			        		   <c:choose>
								          	<c:when test="${not empty item.mainSmallImage}">	
								        		<img src="${item.mainSmallImage}" alt="${item.mainTitle}" width = '91'/>
								          	</c:when>
								          	<c:otherwise>
								        		<img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.mainTitle}" width = '91'/>
								          	</c:otherwise>
          							</c:choose>
			        	    </a>
	      			    </c:otherwise>
	      			</c:choose>

      			<div class="txt">
	            <h3 class="no_margin">
	            <c:choose>
		        	<c:when test="${item.group == 'HOTEL'}">
					   <a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" title="${item.mainTitle}" >${item.mainTitle}</a>
				    </c:when>
      			    <c:otherwise>
	      			    <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" title="${item.mainTitle}" >${item.mainTitle}</a>
      			    </c:otherwise>
      			</c:choose>
	            	
	            </h3>
	            <c:choose>
            	<c:when test="${contentType ne 'ContentArticle' && empty item.mainAbstract_}">
            		<c:if test="${not empty item.address}">
	        			<p> ${item.address} </p>
	      				<p>
	      				<c:if test="${not empty item.zipcode && item.zipcode > 0}">
	      					${item.zipcode}
	      				</c:if>
	      			 	<c:if test="${not empty item.city}">
		      			 	${item.city}
		      			 </c:if>
	    		  		</p>
	       			</c:if>
	       			  <p>
	       	<c:if test="${not empty item.phone}">
	       		<strong><wa:mls>Tel :</wa:mls></strong> ${item.phone}<br />
	       	</c:if>
	       	<c:if test="${not empty item.mobile}">
	       		<strong><wa:mls>Mobile :</wa:mls></strong> ${item.mobile}<br />
	       	</c:if>
	       	<c:if test="${not empty item.fax}">
	       		<strong><wa:mls>Fax :</wa:mls></strong> ${item.fax}<br />
	       	</c:if>
	       	<c:if test="${not empty item.email &&  item.group ne 'RESTO'}">
          		<strong><wa:mls>Email :</wa:mls></strong>
          		<span ><a href="mailto:${item.email}">${item.email}</a></span> <br />
	        </c:if>
	        <c:if test="${not empty item.URLWebsite and item.group ne 'HOTEL'}">
          		<strong><wa:mls>Website :</wa:mls></strong>
          		<span><a href="${item.URLWebsite}" target="_blank">${item.URLWebsite}</a></span>
	        </c:if>
	       </p>
            	</c:when>
            	<c:otherwise>${item.mainAbstract_}</c:otherwise>
            </c:choose>
            <c:if test="${tabbedPanelsTab eq 'event'}">
            <c:if test="${not empty item.periodFromDate}">
	            <div class="clr"></div>
	            <div class="float_left"><strong><wa:mls>Date de début :</wa:mls></strong>
	            	<span><c:choose>
					<c:when test="${item.periodFromHour eq '00'}">
						<fmt:formatDate pattern="dd/MM/yyyy" value="${item.periodFromDate}"/>
					</c:when>
					<c:otherwise>
						<fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${item.periodFromDate}"/>
					</c:otherwise>
				</c:choose></span>
	            </div>
			    <div class="clr"></div>
			     <div class="float_left"><strong><wa:mls>Date de fin :</wa:mls></strong>
	            	<span><c:choose>
					<c:when test="${item.periodToHour eq '00'}">
						<fmt:formatDate pattern="dd/MM/yyyy" value="${item.periodToDate}"/>
					</c:when>
					<c:otherwise>
						<fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${item.periodToDate}"/>
					</c:otherwise>
				</c:choose></span>
	            </div>
	         </c:if>
	         </c:if>
	         <c:if test="${tabbedPanelsTab eq 'resto'}">
	         <c:if test="${not empty item.ranking and item.ranking > 0}">
	            <div class="float_left"><strong><wa:mls>Category :</wa:mls></strong></div>
		            <c:forEach var="rankingLoopCount" begin="1" end="${item.ranking}">
						<img src="${staticSite}/img/ml/visu_iris.jpg" alt="" class="float_left"/> 
					</c:forEach>
				</c:if>
			</c:if>
			<div class="clr"></div>
	            </div>
	            	<div class="more_info">
						<c:choose>
				        	<c:when test="${item.group == 'HOTEL'}">
							   <a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" class="btn_more_info" title="${item.mainTitle}"><wa:mls>More info</wa:mls></a>
						    </c:when>
		      			    <c:otherwise>
			      			    <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="btn_more_info" title="${item.mainTitle}"><wa:mls>More info</wa:mls></a>
		      			    </c:otherwise>
		      			</c:choose>
      				</div>
	          <div class="clr"></div>
             </li>
        </c:forEach>
    
      </ul>
       <div class="tab_paging">
      
        <wa:include URI="${site}/content/navNumberForAssociatedContent" />
      
      </div></div>
      <div class="clr"></div>    
</c:if>

