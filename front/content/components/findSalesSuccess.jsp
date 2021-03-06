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
        <h3 class="no_margin"><wa:mls>Search</wa:mls></h3>
        <div class="arrow"></div>
        <form action="<wa:url URI="${site}/salesGuide/display"/>" method="get" class="search">

		    <input type="text" name="f_search_query" value="${waParam.f_search_query}"/>
		    <input type="submit" value="<wa:mls>Recherche</wa:mls>" class="btn_form"/>
		    <div class="arrow"></div>
		    <a onClick="changeDisplay()" class="advanced_search"><wa:mls>Advanced search</wa:mls></a>

		    <input type ="hidden" name ="group" value="${group}">

           	<div class="clr"></div>
           	
           	<div style="display:none" id="advanced_search">
           	
	            <div id="ListExperience" class="align_left">
					<label for="s_ContentPropertyValueManager_valueId_Sales_guide"><wa:mls>Categories</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue" />
						<wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentPropertyValueManager" />
						<wa:param name="method" value="listSales" />
						<wa:param name="identity" value="valueId" />
						<wa:param name="display" value="mainTitle" />
						<wa:param name="name" value="s_ContentPropertyValueManager_valueId_Sales_guide" />
						<wa:param name="selectedValues" value="${waParam.s_ContentPropertyValueManager_valueId_Sales_guide}" />
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
changeDisplay();
</script> 