<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>

<%--test--%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="form_search" >
      <div>
        <h3 class="no_margin"><wa:mls>Recherchez</wa:mls></h3>
        <div class="arrow"></div>
        <form action="<wa:url URI="${site}/search/displayHeritage"/>" method="get" class="search">

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
           	
				
				<div id="ListTypeHeritage"  class="align_left">
                    <label for="s_heritage_place"><wa:mls>Place</wa:mls> <input id="s_heritage_place" name="s_heritage_place" type="checkbox" checked /></label>
                    <label for="s_heritage_event"><wa:mls>Event</wa:mls> <input id="s_heritage_event" name="s_heritage_event" type="checkbox" checked /></label>
				</div>
				
				<div id="ListQuartiers" class="align_right">
					<label for="s_ContentPropertyValueManager_valueId_Location"><wa:mls>Commune</wa:mls></label>
					<wa:include URI="front/dropdown/dropList">
						<wa:param name="class" value="com.bitc.utils.KeyValueDropdownBean" />
						<wa:param name="manager" value="com.bitc.utils.Utils" />
						<wa:param name="method" value="getLocationsList_${culture}" />
						<wa:param name="identity" value="key" />
						<wa:param name="display" value="value" />
						<wa:param name="name" value="s_ContentPropertyValueManager_valueId_Location" />
						<wa:param name="selectedValues" value="${waParam.s_ContentPropertyValueManager_valueId_Location}" />
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