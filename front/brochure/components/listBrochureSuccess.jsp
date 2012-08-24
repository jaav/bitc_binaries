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

<style type="text/css" media="screen">
@import url("${static}/front/css/nyroModal.css");
</style>
<script type="text/javascript" src="${static}/front/js/jquery.nyroModal-1.6.1.pack.js"></script>

<!--tab:start-->

   <div class="TabbedPanelsContentGroup">
            <div class="Tabbe_Content_Group">
   
       <div class="tab_paging">
            <wa:include URI="${site}/content/navNumber" />
       <div class="select">
     <!--      <form>
            <fieldset>
              <label for="f_page"><wa:mls>Sort by :</wa:mls></label>
              <select name="f_page" id="f_page" onchange=sortBy("${URI}/","${group}")>
                <option value="0"><wa:mls>Choix</wa:mls></option>
                <option value="1" <c:if test="${ orderBy == 'name' and  asc == 'true'}"> SELECTED</c:if>><wa:mls>Nom  (asc)</wa:mls></option>
                <option value="2" <c:if test="${ orderBy == 'name' and  asc == 'false'}"> SELECTED</c:if>><wa:mls>Nom (desc)</wa:mls></option>
              </select>
            </fieldset>
          </form>
           -->
        </div>
      </div>
      <ul class="tab_list_complete">
      <c:if test="${listNull == '1'}"><wa:mls>Liste vide</wa:mls></c:if>
      <c:forEach var="item" items="${list}" varStatus="loop">
             <li> 
               <a href="<wa:url URI="${site}/brochure/displayDetail/id/${item.id}"/>" > 
          <c:choose>
          	<c:when test="${not empty item.mainSmallImage}">	
        		<img src="${item.mainSmallImage}" alt="${item.mainTitle}" width="165"/>
          	</c:when>
          	<c:otherwise>
        		<img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.mainTitle}" width="165"/>
          	</c:otherwise>
          </c:choose>
          </a>
              <div class="txt">
	            <h3 class="no_margin">
	            	<a href="<wa:url URI="${site}/brochure/displayDetail/id/${item.id}"/>"  title="${item.mainTitle}">${item.mainTitle}</a></h3>
		            ${item.mainAbstract_}
	            </div>
	          <div class="btn">
	          <c:set var="varTmp" value="\"" />
	          
					<div class="more_info"><a href="<wa:url URI="${site}/brochure/displayDetail/id/${item.id}"/>" class="btn_more_info" title="${item.mainTitle}"><wa:mls>More info</wa:mls></a></div>
					<a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share"  addthis:url="${config['URL']}/${site}/content/displayDetail/group/${item.group}/id/${item.id}.do" addthis:title="${item.mainTitle}" addthis:description="${fn:replace(wa:html2txt(item.mainAbstract_),varTmp,'&quot;')}"><img src="${staticSite}/img/ml/btn_share.gif" alt="<wa:mls>Share</wa:mls>"/></a>
			      	<div class="ilike" rel="${item.group}|${item.id}"></div>
	          	
	          
	          </div>
	          <div class="clr"></div>
	        </li>
	        <c:if test="${loop.count eq 1}">
	        	<c:set var="group" value="${item.group}"></c:set>
	        </c:if>
        </c:forEach>
      </ul>
      <div class="tab_paging">
      
        <wa:include URI="${site}/content/navNumber" />
      
      </div>
    </div></div>
    <!--tab:end-->

<script language='javascript'>
function sortBy(newURI,group)
{

	var sort= $("#f_page").val();
	var orderby;
	var asc;
	if(sort == 0){
	}
	if(sort == 1){
		orderBy = "name";
		asc = "0";
	}	
	if(sort == 2){
		orderBy = "name";
		asc = "1";
	}
	var uri = '<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="clt"/><wa:param name="clt" value="${culture}"/><wa:exceptParam name="orderBy"/><wa:exceptParam name="asc"/><wa:exceptParam name="page"/></wa:url>';
	if(uri.indexOf('?') >= 0)
		document.forms[0].action=uri+"&"+"orderBy="+orderBy+"&asc="+asc;
	else 
		document.forms[0].action=uri+"?"+"orderBy="+orderBy+"&asc="+asc;
	window.location.href= document.forms[0].action;
}
</script>
