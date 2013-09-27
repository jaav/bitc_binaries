<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="form_search">

      <div>
        <h3 class="no_margin"><wa:mls>Recherchez</wa:mls></h3>
        <div class="arrow"></div>
        <form action="<wa:url URI="${site}/search/display/all/${waParam.all}"/>" method="get" class="search">

		        <input class="first_input" type="text" name="f_search_query" value=""/>
		        <input type="submit" value="<wa:mls>Recherche</wa:mls>" class="btn_form"/>
		        <div class="arrow"></div>
		        
		    <input type ="hidden" name ="group" value="${group}">
		    <input type ="hidden" name ="name" value="${waParam.name}">
		    <c:if test="${displayAllContents}">/all/1</c:if>
            <c:if test="${group eq 'SHOPPING' or group eq 'BFOSPOT' or group eq 'BFOCOMPANY'}">
            <a onClick="changeDisplay()" class="advanced_search"><wa:mls>Advanced search</wa:mls></a>
            
           	<div class="clr"></div>

           	<div style="display:none" id="advanced_search">
                <c:if test="${group eq 'SHOPPING'}">
                    <div id="ListQuartiers">
                        <label for="s_ContentPropertyValueManager_valueId_ShoppingCategory"><wa:mls>Shopping Category</wa:mls></label>
                        <wa:include URI="front/dropdown/dropList">
                            <wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue" />
                            <wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentPropertyValueManager" />
                            <wa:param name="method" value="listShoppingCategory" />
                            <wa:param name="identity" value="valueId" />
                            <wa:param name="display" value="mainTitle" />
                            <wa:param name="name" value="s_ContentPropertyValueManager_valueId_ShoppingCategory" />
                            <wa:param name="selectedValues" value="${waParam.s_ContentPropertyValueManager_valueId_ShoppingCategory}" />
                        </wa:include>
                    </div>
                </c:if>
                <c:if test="${group eq 'BFOSPOT'}">
                    <label for="s_spotProfile"><wa:mls>Spot Profile</wa:mls></label>
                    <%--<input class="first_input" type="text" name="s_spotProfile" id="s_spotProfile" value=""/>--%>
                    <wa:include URI="front/dropdown/dropList">
                        <wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue" />
                        <wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentPropertyValueManager" />
                        <wa:param name="method" value="listSpotProfiles" />
                        <wa:param name="identity" value="valueId" />
                        <wa:param name="display" value="mainTitle" />
                        <wa:param name="name" value="s_spotProfile" />
                        <wa:param name="selectedValues" value="${waParam.s_spotProfile}" />
                    </wa:include>
                </c:if>
                <c:if test="${group eq 'BFOCOMPANY'}">
                    <label for="s_bfoService"><wa:mls>Service</wa:mls></label>
                    <wa:include URI="front/dropdown/dropList">
                        <wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue" />
                        <wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentPropertyValueManager" />
                        <wa:param name="method" value="listBFOServices" />
                        <wa:param name="identity" value="valueId" />
                        <wa:param name="display" value="mainTitle" />
                        <wa:param name="name" value="s_bfoService" />
                        <wa:param name="selectedValues" value="${waParam.s_bfoService}" />
                    </wa:include>
                </c:if>
			</div>
			</c:if>
			<input type="submit" value="<wa:mls>Recherche</wa:mls>" class="btn_form2" />
			<div class="clr"></div>
			 
        </form>
         </div>
         </div>
      
    
<script language='javascript'>

function changeDisplay(){
	if($("#advanced_search").css('display')=="block"){
		$("#advanced_search").slideUp(200);
		$(".btn_form2").hide(200, function(){$(".btn_form").show(200)})
    }else{
		$("#advanced_search").slideDown(200)
		$(".btn_form").hide(200, function(){$(".btn_form2").show(200)})
    }
	$("a.advanced_search").toggleClass("advanced_search_active");
}

</script> 
