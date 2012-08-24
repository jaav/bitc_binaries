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
      <div class="bg_picto_hotel">
        <h2 class="no_margin"><wa:mls>Find </wa:mls></h2>
        <form>
          <fieldset>
            <span id="tfv_room_type">
	            <label for="f_page"><wa:mls>Recherche: </wa:mls></label>
	        </span>
	        <input type="text" name="s_texte"/>
            <div class="clr"></div>
            <a onClick="changeDisplay()"><wa:mls>Advanced search</wa:mls></a>
           	<div class="clr"></div>
           	<div style="display:none" id="advanced_search">
            <div id="ListExperience">
				<label for="s_ContentPropertyValueManager_valueId"><wa:mls>Experience</wa:mls></label>
				<wa:include URI="${site}/dropdown/dropList">
					<wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue" />
					<wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentPropertyValueManager" />
					<wa:param name="method" value="listExperience" />
					<wa:param name="identity" value="valueId" />
					<wa:param name="display" value="mainTitle" />
					<wa:param name="name" value="s_ContentPropertyValueManager_valueId" />
					<wa:param name="selectedValues" value="${waParam.s_ContentPropertyValueManager_valueId}" />
				</wa:include>
			</div>
			<div class="clr"></div>
			<div id="ListProfiles">
				<label for="s_ContentPropertyValueManager_valueId"><wa:mls>Profiles</wa:mls></label>
				<wa:include URI="${site}/dropdown/dropList">
					<wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue" />
					<wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentPropertyValueManager" />
					<wa:param name="method" value="listProfiles" />
					<wa:param name="identity" value="valueId" />
					<wa:param name="display" value="mainTitle" />
					<wa:param name="name" value="s_ContentPropertyValueManager_valueId" />
					<wa:param name="selectedValues" value="${waParam.s_ContentPropertyValueManager_valueId}" />
				</wa:include>
			</div>
			<div class="clr"></div>
			<div id="ListQuartiers">
				<label for="s_ContentPropertyValueManager_valueId"><wa:mls>Quartiers</wa:mls></label>
				<wa:include URI="${site}/dropdown/dropList">
					<wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue" />
					<wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentPropertyValueManager" />
					<wa:param name="method" value="listQuartiers" />
					<wa:param name="identity" value="valueId" />
					<wa:param name="display" value="mainTitle" />
					<wa:param name="name" value="s_ContentPropertyValueManager_valueId" />
					<wa:param name="selectedValues" value="${waParam.s_ContentPropertyValueManager_valueId}" />
				</wa:include>
			</div>
			</div>
			<div class="clr"></div>
			 <input type="submit" value="Recherche" class="btn_form"/>
            <div class="clr"></div>
          </fieldset>
        </form>
      </div>
    </div>
<script language='javascript'>
	function changeDisplay()
	{
		
		
		if($("#advanced_search").css('display')=="block"){
        	$("#advanced_search").css("display", "none");
        }
		else{
			$("#advanced_search").css("display", "block");
          }
         
		
	}
</script> 