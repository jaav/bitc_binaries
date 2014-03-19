<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="form_search" >
      <div>
        <h3 class="no_margin"><wa:mls>Recherchez</wa:mls></h3>
        <div class="arrow"></div>
        <form action="<wa:url URI="${site}/search/display/all/${waParam.all}"/>" method="get" class="search">

		    <input type="text" name="f_search_query" value=""/>
		    <input type="submit" value="<wa:mls>Recherche</wa:mls>" class="btn_form"/>
		    <div class="arrow"></div>
		    <a onClick="changeDisplay()" class="advanced_search"><wa:mls>Advanced search</wa:mls></a>
		    
		    <input type ="hidden" name ="group" value="${group}">
		    <input type ="hidden" name ="name" value="${waParam.name}">
		    <c:if test="${displayAllContents}">
            	<input type="hidden" name="all" value="1" />
            </c:if>

           	<div class="clr"></div>
           	
           	<div style="display:none" id="advanced_search">
           	
				
				<div id="ListTypeCuisine"  class="align_left">
					<label for="s_ContentPropertyValue_valueId_Cuisine"><wa:mls>Type de cuisine</wa:mls></label>
					<wa:include URI="front/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue" />
						<wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentPropertyValueManager" />
						<wa:param name="method" value="listCuisinesTypes" />
						<wa:param name="identity" value="valueId" />
						<wa:param name="display" value="mainTitle" />
						<wa:param name="name" value="s_ContentPropertyValue_valueId_Cuisine" />
						<wa:param name="selectedValues" value="${waParam.s_ContentPropertyValue_valueId_Cuisine}" />
					</wa:include>
				</div>
				
				<div id="ListQuartiers" class="align_right">
					<label for="s_ContentPropertyValueManager_valueId_Quartier"><wa:mls>Quartiers</wa:mls></label>
					<wa:include URI="front/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue" />
						<wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentPropertyValueManager" />
						<wa:param name="method" value="listQuartiers" />
						<wa:param name="identity" value="valueId" />
						<wa:param name="display" value="mainTitle" />
						<wa:param name="name" value="s_ContentPropertyValueManager_valueId_Quartier" />
						<wa:param name="selectedValues" value="${waParam.s_ContentPropertyValueManager_valueId_Quartier}" />
					</wa:include>
				</div>

                <div class="clr"></div>

                <div id="ListStars" class="align_left">
                    <label for="s_ContentPropertyValueManager_valueId_Stars"><wa:mls>Stars</wa:mls></label>
                    <wa:include URI="front/dropdown/dropList">
                        <wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue" />
                        <wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentPropertyValueManager" />
                        <wa:param name="method" value="listRestoStars" />
                        <wa:param name="identity" value="valueId" />
                        <wa:param name="display" value="mainTitle" />
                        <wa:param name="name" value="s_ContentPropertyValueManager_valueId_Stars" />
                        <wa:param name="selectedValues" value="${waParam.s_ContentPropertyValueManager_valueId_Stars}" />
                    </wa:include>
                </div>

                <div id="ListGMScore" class="align_right">
                    <label for="s_ContentPropertyValueManager_valueId_gmScore"><wa:mls>GM score</wa:mls></label>
                    <wa:include URI="front/dropdown/dropList">
                        <wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue" />
                        <wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentPropertyValueManager" />
                        <wa:param name="method" value="listGMScore" />
                        <wa:param name="identity" value="valueId" />
                        <wa:param name="display" value="mainTitle" />
                        <wa:param name="name" value="s_ContentPropertyValueManager_valueId_gmScore" />
                        <wa:param name="selectedValues" value="${waParam.s_ContentPropertyValueManager_valueId_gmScore}" />
                    </wa:include>
                </div>
			
			</div>
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
<script>
    $(document).ready(function() {
        changeDisplay();
    });
</script>