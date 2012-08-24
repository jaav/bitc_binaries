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
<div id="toolBox">
	<div class="content" id="actions">
		<a href="javascript:void(0);" id ="back_btn" ><wa:mls>Back to List</wa:mls></a>
		<c:if test="${legend != null}">
			<a href="" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
		</c:if>
		<div class="clr"></div>
	</div>
</div>
<h2><wa:mls>contentEvent</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean==null || bean.id<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.id>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>
<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm" name="detailForm">
			<fieldset>
				<legend>&nbsp;</legend>
				<c:if test="${bean!=null && bean.id>0 && duplicate eq null}">
					<div class="bgGrey">
						<label for="f_id"><wa:mls>id</wa:mls></label>
						<span>${bean.id}</span>
						<input name="id" type="hidden" value="${bean.id}"/>
					</div>
					<div class="bgWhite">
						<label for="f_culture"><wa:mls>Default culture</wa:mls> </label>
						<span>${bean.culture}</span>
					</div>
				</c:if>
					<div class="bgGrey" id="v_name">
						<label for="f_name"><wa:mls>name</wa:mls></label>
						<textarea name="f_name" class="textfield" >${bean.name}</textarea>
	            		<div class="textareaRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
	            		<script type="text/javascript">
							var v_name = new Spry.Widget.ValidationTextarea("v_name", {minChars:1, maxChars:100,validateOn:["blur","change"]});
						</script> 
					</div>
					<div class="bgWhite" id="v_group">
						<label for="f_group"><wa:mls>group</wa:mls></label>
						<c:if test="${bean.group==null || bean.group ==''}">
							<wa:include URI="${site}/dropdown/dropList">
								<wa:param name="class" value="com.wanabe.cms.hdata.ContentGroup" />
								<wa:param name="manager" value="com.wanabe.cms.manager.ContentGroupManager" />
								<wa:param name="method" value="listByTypeContentEvent" />
								<wa:param name="identity" value="name" />
								<wa:param name="display" value="name" />
								<wa:param name="name" value="f_group" />
								<wa:param name="selectedValues" value="${bean.group}" />
							</wa:include>
							<div class="selectRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
	            			<script type="text/javascript">
								var v_group = new Spry.Widget.ValidationSelect("v_group", {isRequired:true,validateOn:["blur","change"]});
							</script>
						</c:if>
						
						<c:if test="${bean.group != null && bean.group !=''}">
							<span>${bean.group}</span>
							<input name="f_group" type="hidden" value="${bean.group}"/>
						</c:if>
					</div>
					
					<div class="bgGrey" id="v_author">
						<label for="f_author"><wa:mls>author</wa:mls></label>
						<textarea name="f_author" class="textfield" >${bean.author}</textarea>
						<script type="text/javascript">
							var v_author = new Spry.Widget.ValidationTextarea("v_author", {isRequired:false,maxChars:100});
						</script> 
					</div>
					<c:if test="${bean!=null && bean.source!=null}">
					<div class="bgWhite">
						<label for="f_source"><wa:mls>Source</wa:mls></label>
						<span>${bean.source}</span>
					</div>
					<div class="bgGrey">
						<label for="f_sourceId"><wa:mls>SourceId</wa:mls></label>
						<span>${bean.sourceId}</span> 
					</div>
					</c:if>
					</fieldset>
					<fieldset>
						<legend><wa:mls>Event Infos</wa:mls></legend>
						<div class="bgWhite" id="v_adresseFr">
							<label for="f_adresseFr"><wa:mls>adresseFr</wa:mls></label>
							<textarea name="f_adresseFr" class="textfield" >${bean.adresseFr}</textarea>
							<script type="text/javascript">
								var v_adresseFr = new Spry.Widget.ValidationTextarea("v_adresseFr", {isRequired:false,maxChars:150});
							</script> 
						</div>
						<div class="bgGrey" id="v_adresseNl">
							<label for="f_adresseNl"><wa:mls>adresseNl</wa:mls></label>
							<textarea name="f_adresseNl" class="textfield" >${bean.adresseNl}</textarea>
							<script type="text/javascript">
								var v_adresseNl = new Spry.Widget.ValidationTextarea("v_adresseNl", {isRequired:false,maxChars:150});
							</script> 
						</div>
						<div class="bgWhite" id="v_placeNameFr">
							<label for="f_placeNameFr"><wa:mls>placeNameFr</wa:mls></label>
							<textarea name="f_placeNameFr" class="textfield" >${bean.placeNameFr}</textarea>
							
						</div>
						<div class="bgGrey" id="v_placeNameNl">
							<label for="f_placeNameNl"><wa:mls>placeNameNl</wa:mls></label>
							<textarea name="f_placeNameNl" class="textfield" >${bean.placeNameNl}</textarea>
							 
						</div>
						<div class="bgWhite" id="v_zipcode">
							<label for="f_zipcode"><wa:mls>zipcode</wa:mls></label>
							<textarea name="f_zipcode" class="textfield" >${bean.zipcode}</textarea>
							<script type="text/javascript">
								var v_adresseFr = new Spry.Widget.ValidationTextarea("v_zipcode", {isRequired:false,maxChars:4});
							</script> 
						</div>
						<div class="bgGrey" id="v_cityFr">
							<label for="f_cityFr"><wa:mls>cityFr</wa:mls></label>
							<textarea name="f_cityFr" class="textfield" >${bean.cityFr}</textarea>
							<script type="text/javascript">
								var v_cityFr = new Spry.Widget.ValidationTextarea("v_cityFr", {isRequired:false,maxChars:100});
							</script> 
						</div>
						<div class="bgWhite" id="v_cityNl">
							<label for="f_cityNl"><wa:mls>cityNl</wa:mls></label>
							<textarea name="f_cityNl" class="textfield" >${bean.cityNl}</textarea>
							<script type="text/javascript">
								var v_cityNl = new Spry.Widget.ValidationTextarea("v_cityNl", {isRequired:false,maxChars:100});
							</script> 
						</div>
						<div class="bgGrey" id="v_email">
							<label for="f_email"><wa:mls>email</wa:mls></label>
							<textarea name="f_email" class="textfield" >${bean.email}</textarea>
							<script type="text/javascript">
								var v_email = new Spry.Widget.ValidationTextarea("v_email", {isRequired:false,maxChars:100});
							</script> 
						</div>
						<div class="bgWhite" id="v_phone">
							<label for="f_phone"><wa:mls>phone</wa:mls></label>
							<textarea name="f_phone" class="textfield" >${bean.phone}</textarea>
							<script type="text/javascript">
								var v_phone = new Spry.Widget.ValidationTextarea("v_phone", {isRequired:false,maxChars:20});
							</script> 
						</div>
						<div class="bgGrey" id="v_mobile">
							<label for="f_mobile"><wa:mls>mobile</wa:mls></label>
							<textarea name="f_mobile" class="textfield" >${bean.mobile}</textarea>
							<script type="text/javascript">
								var v_mobile = new Spry.Widget.ValidationTextarea("v_mobile", {isRequired:false,maxChars:20});
							</script> 
						</div>
						<div class="bgWhite" id="v_fax">
							<label for="f_fax"><wa:mls>fax</wa:mls></label>
							<textarea name="f_fax" class="textfield" >${bean.fax}</textarea>
							<script type="text/javascript">
								var v_fax = new Spry.Widget.ValidationTextarea("v_fax", {isRequired:false,maxChars:20});
							</script> 
						</div>
						<div class="bgGrey" id="v_website">
							<label for="f_website"><wa:mls>website</wa:mls></label>
							<textarea name="f_website" class="textfield" >${bean.website}</textarea>
							<script type="text/javascript">
								var v_website = new Spry.Widget.ValidationTextarea("v_website", {isRequired:false,maxChars:100});
							</script> 
						</div>
						<div class="bgWhite" id="v_latitude">
							<label for="f_latitude"><wa:mls>latitude</wa:mls></label>
							<textarea name="f_latitude" class="textfield" >${bean.latitude}</textarea>
							<script type="text/javascript">
								var v_latitude = new Spry.Widget.ValidationTextarea("v_latitude", {isRequired:false,maxChars:10});
							</script> 
						</div>
						<div class="bgGrey" id="v_longitude">
							<label for="f_longitude"><wa:mls>longitude</wa:mls></label>
							<textarea name="f_longitude" class="textfield" >${bean.longitude}</textarea>
							<script type="text/javascript">
								var v_longitude = new Spry.Widget.ValidationTextarea("v_longitude", {isRequired:false,maxChars:10});
							</script> 
						</div>
						<div class="bgWhite" id="v_periodFromDate">
						<label for="f_periodFromDate"><wa:mls>periodFromDate</wa:mls></label>
						<input type="text" class="w8em format-d-m-y divider-slash  no-transparency" id="f_periodFromDate" name="f_periodFromDate" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${bean.periodFromDate}"/>" maxlength="10" />
						<div class="textfieldRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
						<div class="textfieldInvalidFormatMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Valeur invalide  : dd/MM/yyyy</wa:mls></div>
	            		
	            		<script type="text/javascript">
							var v_periodFromDate = new Spry.Widget.ValidationTextField("v_periodFromDate","date", {format:"dd/mm/yyyy",isRequired:true,validateOn:["blur","change"]});
						</script>
					</div>
					<div class="bgGrey" id="v_periodToDate">	
						<label for="f_periodToDate"><wa:mls>periodToDate</wa:mls></label>
						<input type="text" class="w8em format-d-m-y divider-slash  no-transparency" id="f_periodToDate" name="f_periodToDate" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${bean.periodToDate}"/>" maxlength="10" />
						<div class="textfieldRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
						<div class="textfieldInvalidFormatMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Valeur invalide  : dd/MM/yyyy</wa:mls></div>
						<script type="text/javascript">
							var v_periodToDate = new Spry.Widget.ValidationTextField("v_periodToDate","date", {format:"dd/mm/yyyy",isRequired:true,validateOn:["blur","change"]});
						</script>
					</div>
					<div class="bgWhite" id="v_numParticipation">
						<label for="f_numParticipation"><wa:mls>numParticipation</wa:mls></label>
						<textarea name="f_numParticipation" class="textfield" >${bean.numParticipation}</textarea>
						<script type="text/javascript">
							var v_numParticipation = new Spry.Widget.ValidationTextarea("v_numParticipation", {isRequired:false,maxChars:10});
						</script> 
					</div>
					<div class="bgGrey">
						<label for="f_highlight"><wa:mls>highlight</wa:mls></label>
						<input type="radio"<c:if test="${bean.highlight ==  null || bean.highlight==false}"> checked="checked"</c:if> value="0" name="f_highlight"/><wa:mls>no</wa:mls>
						<input type="radio"<c:if test="${bean.highlight==true}"> checked="checked"</c:if> value="1" name="f_highlight"/><wa:mls>yes</wa:mls>
					</div>
					</fieldset>
					<div class="clr"></div>
					<div class="TabbedPanels" id="TabbedPanels1">
						<ul class="TabbedPanelsTabGroup">
							<c:forEach var="clt" items="${culture.allCultures}" varStatus="loop">
								<li class="TabbedPanelsTab">${clt}</li>
							</c:forEach>
						</ul>
						<div class="TabbedPanelsContentGroup">
						<c:forEach var="clt" items="${culture.allCultures}" varStatus="loop">
						<div class="TabbedPanelsContent">
					<c:if test="${bean!=null && bean.source!=null && bean.contentEventClts[clt].sourceTitle!=null}">
					<div class="bgGrey">
						<label for="f_${clt}_sourceTitle"><wa:mls>title </wa:mls> (source)</label>
						<span>${bean.contentEventClts[clt].sourceTitle}</span>
					</div>
					</c:if>		
					<div class="bgGrey" style="height:50px;" id="v_${clt}_title">
						<label for="f_${clt}_title" style="float:left;"><wa:mls>title</wa:mls></label>
						<textarea name="f_${clt}_title" style="float:left;" class="textfield textForAll" id="f_${clt}_title" >${bean.contentEventClts[clt].title}</textarea>
						<div class="textareaRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
						<c:if test="${bean==null || bean.source==null || bean.contentEventClts[clt].sourceTitle==null}">
	            		<script type="text/javascript">
							var v_${clt}_title = new Spry.Widget.ValidationTextarea("v_${clt}_title", {isRequired:true,minChars:1, maxChars:200,validateOn:["blur","change"]});
						</script>
						</c:if>
						<a href="#null"  class="image_btn_apply" onclick="applyValueForAll('textForAll','f_${clt}_title')" title="<wa:mls>Appliquer pour toutes les langues</wa:mls>">&nbsp;</a>
					</div>
					<c:if test="${bean!=null && bean.source!=null && bean.contentEventClts[clt].sourceAbstract!=null}">
					<div class="bgWhite">
						<label for="f_${clt}_sourceAbstract_Not" style="float:left;"><wa:mls>abstract_ (source) - Not editable</wa:mls></label>
						<textarea name="f_${clt}_sourceAbstractNot" id="f_${clt}_sourceAbstractNot" class="textarea2" style="float:left; margin-left:3px;">${bean.contentEventClts[clt].sourceAbstract}</textarea>
						<div class="clr"></div>	
					</div>
					</c:if>
					<input type="checkbox"  class="check_abstract"  /><span class="text_check_block_abstract" style="display:none;"><wa:mls>afficher zone abstract</wa:mls></span><span class="text_check_none_abstract"  style="display:none;"><wa:mls>masquer zone abstract</wa:mls></span>
					<div class="bgWhite abstract">
						<label for="f_${clt}_abstract_" style="float:left;"><wa:mls>abstract_</wa:mls></label>
						<div  style="float:left; margin-left:3px; width:95%">
						<textarea name="f_${clt}_abstract_" id="f_${clt}_abstract_" class="textarea2" style="float:left; margin-left:3px;">${bean.contentEventClts[clt].abstract_}</textarea>
						</div>
						<div class="clr"></div>
					</div>
	
					<c:if test="${bean!=null && bean.source!=null && bean.contentEventClts[clt].sourceBody!=null}">
					<div class="bgGrey">
						<label for="f_${clt}_sourceBodyNot" style="float:left;"><wa:mls>body (source) - Not editable</wa:mls></label>
						<textarea name="f_${clt}_sourceBodyNot" id="f_${clt}_sourceBodyNot" class="textarea2" style="float:left; margin-left:3px;">${bean.contentEventClts[clt].sourceBody}</textarea>
						<div class="clr"></div>	
					</div>
					</c:if>
					<input type="checkbox"  class="check_body"  /><span class="text_check_block_body" style="display:none;"><wa:mls>afficher zone body</wa:mls></span><span class="text_check_none_body" style="display:none;"><wa:mls>masquer zone body</wa:mls></span>
					<div class="bgGrey body">
						<label for="f_${clt}_body" style="float:left;"><wa:mls>body</wa:mls></label>
						<div  style="float:left; margin-left:3px; width:95%">
							<textarea name="f_${clt}_body" id="f_${clt}_body"  class="textarea2" >${bean.contentEventClts[clt].body}</textarea>
						</div>
						<div class="clr"></div>	
						
					</div>
					<c:if test="${bean!=null && bean.source!=null && bean.contentEventClts[clt].sourceInfo!=null}">
					<div class="bgWhite">
						<label for="f_${clt}_sourceInfoNot" style="float:left;"><wa:mls>info (source) - Not editable</wa:mls></label>
						<textarea name="f_${clt}_sourceInfoNot" id="f_${clt}_sourceInfoNot" class="textarea2" style="float:left; margin-left:3px;">${bean.contentEventClts[clt].sourceInfo}</textarea>
						<div class="clr"></div>	
					</div>
					</c:if>
					<input type="checkbox"  class="check_info"  /><span class="text_check_block_info" style="display:none;"><wa:mls>afficher zone info</wa:mls></span><span class="text_check_none_info" style="display:none;"><wa:mls>masquer zone info</wa:mls></span>
					<div class="bgWhite info">
						<label for="f_${clt}_info" style="float:left;"><wa:mls>info</wa:mls></label>
						<div  style="float:left; margin-left:3px; width:95%">
							<textarea name="f_${clt}_info" id="f_${clt}_info"  class="textarea2" >${bean.contentEventClts[clt].info}</textarea>
						</div>
						<div class="clr"></div>	
						
					</div>
					<div class="bgGrey" id="v_${clt}_bigImage">
						<label for="f_${clt}_bigImage" style="float:left;" ><wa:mls>bigImage</wa:mls></label>
						<textarea name="f_${clt}_bigImage" id="f_${clt}_bigImage" class="textfield bigImageForAll" style="float:left; margin-left:3px">${bean.contentEventClts[clt].bigImage}</textarea>
						<a href="${context}/${site}/contentImage/contentImageList.do?openerField=f_${clt}_bigImage" target="image" class="image_btn" title="<wa:mls>Upload an image</wa:mls>">&nbsp;</a>
						<a href="#null"  class="image_btn_apply" onclick="applyValueForAll('bigImageForAll','f_${clt}_bigImage')" title="<wa:mls>Appliquer pour toutes les langues</wa:mls>">&nbsp;</a>
						<div class="clr"></div>	
	            		<script type="text/javascript">
							var v_${clt}_bigImage = new Spry.Widget.ValidationTextarea("v_${clt}_bigImage", {isRequired:false,maxChars:300,validateOn:["blur","change"]});
						</script>
					</div>
					<div class="bgWhite" id="v_${clt}_smallImage">
						<label for="f_${clt}_smallImage" style="float:left;" ><wa:mls>smallImage</wa:mls></label>
						<textarea name="f_${clt}_smallImage" id="f_${clt}_smallImage" class="textfield smallImageForAll" style="float:left; margin-left:3px">${bean.contentEventClts[clt].smallImage}</textarea>
						<a href="${context}/${site}/contentImage/contentImageList.do?openerField=f_${clt}_smallImage" target="image" class="image_btn" title="<wa:mls>Upload an image</wa:mls>">&nbsp;</a>
						<a href="#null"  class="image_btn_apply" onclick="applyValueForAll('smallImageForAll','f_${clt}_smallImage')" title="<wa:mls>Appliquer pour toutes les langues</wa:mls>">&nbsp;</a>
						<div class="clr"></div>
						<script type="text/javascript">
							var v_${clt}_smallImage = new Spry.Widget.ValidationTextarea("v_${clt}_smallImage", {isRequired:false,maxChars:300,validateOn:["blur","change"]});
						</script>	
					</div>
					<div class="bgGrey" id="v_${clt}_url">
						<label for="f_${clt}_url" style="float:left;"><wa:mls>url</wa:mls></label>
						<textarea name="f_${clt}_url"  id="f_${clt}_url" class="textfield urlForAll"  style="float:left; margin-left:3px">${bean.contentEventClts[clt].url}</textarea>
						<a href="${context}/${site}/contentLink/contentLinkList.do?openerField=f_${clt}_url" target="link" class="track_link_btn" title="<wa:mls>Track a link</wa:mls>">&nbsp;</a>
						<a href="#null"  class="image_btn_apply" onclick="applyValueForAll('urlForAll','f_${clt}_url')" title="<wa:mls>Appliquer pour toutes les langues</wa:mls>">&nbsp;</a>
						<div class="clr"></div>
						<script type="text/javascript">
							var v_${clt}_url = new Spry.Widget.ValidationTextarea("v_${clt}_url", {isRequired:false,maxChars:300,validateOn:["blur","change"]});
						</script>
					</div>
					<div class="bgWhite" id="v_${clt}_urlLabel">
						<label for="f_${clt}_urlLabel"><wa:mls>urlLabel</wa:mls></label>
						<textarea name="f_${clt}_urlLabel" class="textfield" >${bean.contentEventClts[clt].urlLabel}</textarea>
						<script type="text/javascript">
							var v_${clt}_urlLabel = new Spry.Widget.ValidationTextarea("v_${clt}_urlLabel", {isRequired:false,maxChars:200,validateOn:["blur","change"]});
						</script>
					</div>
					<c:if test="${bean!=null && bean.id>0 && duplicate eq null}">		
					<div class="bgGrey">
						<label for="f_${clt}_openCount"><wa:mls>openCount</wa:mls></label>
						<span><c:if test="${bean.contentEventClts[clt].openCount==null}">0</c:if>${bean.contentEventClts[clt].openCount}</span>
					</div>
					<div class="bgWhite">
						<label for="f_${clt}_commentCount"><wa:mls>commentCount</wa:mls></label>
						<span><c:if test="${bean.contentEventClts[clt].commentCount==null}">0</c:if>${bean.contentEventClts[clt].commentCount}</span>
					</div>
					
					</c:if>
					<fieldset>
						<legend><wa:mls>Event Infos</wa:mls></legend>
						<div class="bgGrey" id="v_${clt}_price">
						<label for="f_${clt}_price"><wa:mls>price</wa:mls></label>
						<textarea name="f_${clt}_price" class="textfield" >${bean.contentEventClts[clt].price}</textarea>
						<script type="text/javascript">
							var v_${clt}_price = new Spry.Widget.ValidationTextarea("v_${clt}_price", {isRequired:false,maxChars:50,validateOn:["blur","change"]});
						</script>
						</div>
						<div class="bgWhite" id="v_${clt}_descriptionPrice">
							<label for="f_${clt}_descriptionPrice"><wa:mls>descriptionPrice</wa:mls></label>
							<textarea name="f_${clt}_descriptionPrice" class="textfield" >${bean.contentEventClts[clt].descriptionPrice}</textarea>
							<script type="text/javascript">
								var v_${clt}_descriptionPrice = new Spry.Widget.ValidationTextarea("v_${clt}_descriptionPrice", {isRequired:false,maxChars:300,validateOn:["blur","change"]});
							</script>
						</div>
						<div class="bgGrey" id="v_${clt}_organisationInformation">
							<label for="f_${clt}_organisationInformation"><wa:mls>urlLabel</wa:mls></label>
							<textarea name="f_${clt}_organisationInformation" class="textfield" >${bean.contentEventClts[clt].organisationInformation}</textarea>
							<script type="text/javascript">
								var v_${clt}_organisationInformation = new Spry.Widget.ValidationTextarea("v_${clt}_organisationInformation", {isRequired:false,maxChars:2000,validateOn:["blur","change"]});
							</script>
						</div>
					</fieldset>
						</div>
						</c:forEach>
					</div>
					</div>
					<div class="clr"></div>
					<fieldset>	
					<legend><wa:mls>Accessibility information</wa:mls></legend>
					<div class="bgGrey" id="v_fromDate">
						<label for="f_fromDate"><wa:mls>fromDate</wa:mls></label>
						<input type="text" class="w8em format-d-m-y divider-slash  no-transparency" id="f_fromDate" name="f_fromDate" value="<c:choose><c:when test="${bean.fromDate == null }"><fmt:formatDate pattern="dd/MM/yyyy" value="${dateSys}"/></c:when><c:when test="${bean.fromDate != null }"><fmt:formatDate pattern="dd/MM/yyyy" value="${bean.fromDate}"/></c:when></c:choose>" maxlength="10" />
						<div class="textfieldRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
						<div class="textfieldInvalidFormatMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Valeur invalide  : dd/MM/yyyy</wa:mls></div>
	            		
	            		<script type="text/javascript">
							var v_fromDate = new Spry.Widget.ValidationTextField("v_fromDate","date", {format:"dd/mm/yyyy",isRequired:true,validateOn:["blur","change"]});
						</script>
					</div>
					<div class="bgWhite" id="v_toDate">	
						<label for="f_toDate"><wa:mls>toDate</wa:mls></label>
						<input type="text" class="w8em format-d-m-y divider-slash  no-transparency" id="f_toDate" name="f_toDate" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${bean.toDate}"/>" maxlength="10" />
						<div class="textfieldInvalidFormatMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Valeur invalide  : dd/MM/yyyy</wa:mls></div>
						<script type="text/javascript">
							var v_toDate = new Spry.Widget.ValidationTextField("v_toDate","date", {format:"dd/mm/yyyy",isRequired:false,validateOn:["blur","change"]});
						</script>
					</div>
					<div class="bgGrey">
						<label for="f_visible"><wa:mls>visible</wa:mls></label>
						<input type="radio"<c:if test="${bean.visible=='0'}"> checked="checked"</c:if> value="0" name="f_visible"/><wa:mls>visible_0</wa:mls>
						<input type="radio"<c:if test="${bean.visible ==  null || bean.visible=='1'}"> checked="checked"</c:if> value="1" name="f_visible"/><wa:mls>visible_1</wa:mls>
					</div>
					<div class="bgWhite">
						<label for="f_status"><wa:mls>status</wa:mls></label>
						<c:if test="${bean.status=='0'}"><wa:mls>DRAFT</wa:mls></c:if> 
						<c:if test="${bean.status=='1'}"><wa:mls>PUBLISH</wa:mls></c:if>
						<c:if test="${bean.status=='2'}"><wa:mls>ARCHIVED</wa:mls>&nbsp;${bean.versionId}</c:if>
						<c:if test="${bean.status=='3'}"><wa:mls>DELETED</wa:mls></c:if>	
					</div>
					<div class="bgWhite">
						<label for="f_position" style="float:left;"><wa:mls>position</wa:mls></label>
						<input type="text" name="f_position" id="f_position" value="<c:choose><c:when test="${bean.position  eq null}">0</c:when><c:otherwise>${bean.position}</c:otherwise></c:choose>" maxlength="3"  style="float:left; margin-left:3px;width:35px" onkeyup="javascript:wa_validateNum('f_position')"/>
						<a href="javascript:wa_addOne('f_position');" class="more" title="<wa:mls>Add one</wa:mls>">+</a>
						<a href="javascript:wa_removeOne('f_position');" class="minus" title="<wa:mls>Remove one</wa:mls>">-</a>
						<div class="clr"></div>
					</div>
					</fieldset>
					<c:if test="${bean!=null && bean.id>0 && duplicate eq null}">
						<div class="clr"></div>
						<fieldset>	
						<legend><wa:mls>Creation/Modification informations</wa:mls></legend>
						<div class="bgGrey">
							<label for="f_createdOn"><wa:mls>createdOn</wa:mls></label>
							<span>${bean.createdOn}</span>
						</div>
						<div class="bgWhite">
							<label for="f_createdBy"><wa:mls>created By</wa:mls></label>
							<span>
								<wa:include URI="${site}/acxAdminusers/lookup">
									<wa:param name="login" value="${bean.createdBy}"/>
								</wa:include>
							</span>
						</div>
						<div class="bgGrey">
							<label for="f_lastModifiedOn"><wa:mls>lastModifiedOn</wa:mls></label>
							<span>${bean.lastModifiedOn}</span>
						</div>
						<div class="bgWhite">
							<label for="f_lastModifiedBy"><wa:mls>lastModifiedBy</wa:mls></label>
							<span>
								<wa:include URI="${site}/acxAdminusers/lookup">
								<wa:param name="login" value="${bean.lastModifiedBy}"/>
								</wa:include>
							</span>
						</div>
						</fieldset> 
						<div class="clr"></div>
					
					</c:if>
				
					
					
					
					
					<!-- DISPLAY PROPERTIES -->
				<c:choose>
					<c:when test="${bean.id !=0 && duplicate eq null}">
						<c:forEach var="property" items="${listProperties}">
							<div>
								<wa:include URI="admin/dropdown/dropListProperty">
									<wa:param name="propertyName" value="${property.name}" />
									<wa:param name="contentType" value="ContentEvent"/>
									<wa:param name="contentId" value="${bean.id}" />
								</wa:include>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach var="property" items="${listProperties}">
							<div>
								<wa:include URI="admin/dropdown/dropListProperty">
									<wa:param name="propertyName" value="${property.name}" />
									<wa:param name="contentType" value="ContentEvent"/>
									<wa:param name="contentId" value="${oldId}" />
								</wa:include>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
					<div id="ajaxProperties"></div>
               <div class="clr"></div>
               <fieldset>
			 			 
			
						<legend><wa:mls>Google Street View</wa:mls></legend>
				 	 <a href="<wa:url URI="${site}/googleStreetView/display/ContentType/ContentEvent/id/${bean.id}"/>" target="admin"><wa:mls>Google Street View </wa:mls></a>
			
			</fieldset>
			<div id="errorMessage">
				<c:if test="${waParam.msgError != null}">
					<img src="${static}/${site}/img/stop.png" alt="<wa:mls>Error</wa:mls>" />
					<wa:mls>${waParam.msgError}</wa:mls>
				</c:if>
			</div>
			<div id="containerButton">
				<input type="button" name="cancel" id="cancel" class="cancel" value="<wa:mls>Cancel</wa:mls>"/>
				<input type="submit" name="submit" class="submit" value="<wa:mls>Enregistrer</wa:mls>"/>
			</div>
		</form>
	</div>
</div>
</div>	
<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
<script type="text/javascript" src="${static}/${site}/fckeditor/fckeditor.js"></script>
 
<script type="text/javascript">
 
window.onload = function()
{

	var rootPath = '${static}/${site}/';
<c:forEach var="clt" items="${culture.allCultures}" varStatus="loop">
	var oFCKeditor = new FCKeditor('f_${clt}_body','100%','500px');
	oFCKeditor.BasePath = 'fckeditor/';
	oFCKeditor.EditorPath = rootPath;
	oFCKeditor.LocationPath = window.location.href;
	oFCKeditor.ToolbarSet = 'Custom' ;
	oFCKeditor.ReplaceTextarea();
	var oFCKeditor2 = new FCKeditor('f_${clt}_abstract_','100%','500px');
	oFCKeditor2.BasePath = 'fckeditor/';
	oFCKeditor2.EditorPath = rootPath;
	oFCKeditor2.LocationPath = window.location.href;
	oFCKeditor2.ToolbarSet = 'Custom' ;
	oFCKeditor2.ReplaceTextarea();
	var oFCKeditor3 = new FCKeditor('f_${clt}_info','100%','500px');
	oFCKeditor3.BasePath = 'fckeditor/';
	oFCKeditor3.EditorPath = rootPath;
	oFCKeditor3.LocationPath = window.location.href;
	oFCKeditor3.ToolbarSet = 'Custom' ;
	oFCKeditor3.ReplaceTextarea();
	<c:if test="${bean!=null && bean.source!=null && bean.contentEventClts[clt].sourceBody!=null}">
	var oFCKeditor4 = new FCKeditor('f_${clt}_sourceBodyNot','100%','500px');
	oFCKeditor4.BasePath = 'fckeditor/';
	oFCKeditor4.EditorPath = rootPath;
	oFCKeditor4.LocationPath = window.location.href;
	oFCKeditor4.ToolbarSet = 'Import' ;
	oFCKeditor4.ReplaceTextarea();
	</c:if>
	<c:if test="${bean!=null && bean.source!=null && bean.contentEventClts[clt].sourceAbstract!=null}">
	var oFCKeditor5 = new FCKeditor('f_${clt}_sourceAbstractNot','100%','500px');
	oFCKeditor5.BasePath = 'fckeditor/';
	oFCKeditor5.EditorPath = rootPath;
	oFCKeditor5.LocationPath = window.location.href;
	oFCKeditor5.ToolbarSet = 'Import' ;
	oFCKeditor5.ReplaceTextarea(); 
	</c:if>
	<c:if test="${bean!=null && bean.source!=null && bean.contentEventClts[clt].sourceInfo!=null}">
	var oFCKeditor6 = new FCKeditor('f_${clt}_sourceInfoNot','100%','500px');
	oFCKeditor6.BasePath = 'fckeditor/';
	oFCKeditor6.EditorPath = rootPath;
	oFCKeditor6.LocationPath = window.location.href;
	oFCKeditor6.ToolbarSet = 'Import' ;
	oFCKeditor6.ReplaceTextarea();
	</c:if>

</c:forEach>
} 
</script>
<script> 
path='${context}/${site}/${module}';
idName='${bean.id}';

document.detailForm.f_group.id='f_group';
$('f_group').addEvent('change',function(){ 
	var myRequest = new Request({
		url : '${context}/${site}/ajax/properties.do?type=article&realType=ContentEvent',
		method :'get',
		onSuccess:function(responseText,responseXML){
			$('ajaxProperties').set('html',responseText);
		}
	});
	myRequest.send('group='+$('f_group').value);
	
});
</script>
<script type="text/javascript">
	var TP1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script> 

<!--tool boxes:end-->
