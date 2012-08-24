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
<h2><wa:mls>catalogProduct</wa:mls>&nbsp;-&nbsp;
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
								<wa:param name="method" value="listByTypeCatalogProduct" />
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
						<legend><wa:mls>Product Infos</wa:mls></legend>
						
							<div class="bgWhite">
								<label for="f_category"><wa:mls>category</wa:mls></label>
								<wa:include URI="${site}/dropdown/dropList">
									<wa:param name="class" value="com.bitc.cms.hdata.ContentArticleFirst" />
									<wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentManager" />
									<wa:param name="method" value="listbyGroupCategroy" />
									<wa:param name="identity" value="id" />
									<wa:param name="display" value="name" />
									<wa:param name="name" value="f_category" />
									<wa:param name="selectedValues" value="${bean.category.id}" />
	                               </wa:include>
								<div class="selectRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
		            			<script type="text/javascript">
								var v_category = new Spry.Widget.ValidationTextarea("v_category", {isRequired:true,maxChars:10,validateOn:["blur","change"]});
								</script> 
							</div>
							<div class="bgGrey">
								<label for="f_partner_id"><wa:mls>partner</wa:mls></label>
								<wa:include URI="${site}/dropdown/dropList">
									<wa:param name="class" value="com.bitc.cms.hdata.ContentArticleFirst" />
									<wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentManager" />
									<wa:param name="method" value="listbyGroupPartner" />
									<wa:param name="identity" value="id" />
									<wa:param name="display" value="name" />
									<wa:param name="name" value="f_partner" />
									<wa:param name="selectedValues" value="${bean.partner.id}" />
								</wa:include>
								<div class="selectRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
		            			<script type="text/javascript">
								var v_category = new Spry.Widget.ValidationTextarea("v_partner", {isRequired:true,maxChars:10,validateOn:["blur","change"]});
								</script> 
								
							</div>
						
						<!-- <div class="bgWhite" id="v_category">
							<label for="f_category"><wa:mls>category</wa:mls></label>
							<textarea name="f_category" class="textfield" >${bean.category.id}</textarea>
							<div class="textareaRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
							<script type="text/javascript">
								var v_category = new Spry.Widget.ValidationTextarea("v_category", {isRequired:true,maxChars:10,validateOn:["blur","change"]});
							</script> 
						</div>
						<div class="bgGrey" id="v_partner">
							<label for="f_partner"><wa:mls>partner</wa:mls></label>
							<textarea name="f_partner" class="textfield" >${bean.partner.id}</textarea>
							<div class="textareaRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
							<script type="text/javascript">
								var v_partner = new Spry.Widget.ValidationTextarea("v_partner", {isRequired:true,maxChars:10,validateOn:["blur","change"]});
							</script> 
						</div> -->
						<div class="bgWhite" id="v_promoType">
						<label for="f_promoType"><wa:mls>promoType</wa:mls></label>
							<wa:include URI="${site}/dropdown/dropList">
								<wa:param name="class" value="com.bitc.catalog.hdata.CatalogPromo" />
								<wa:param name="manager" value="com.bitc.catalog.hdata.manager.CatalogPromoManager" />
								<wa:param name="method" value="listAll" />
								<wa:param name="identity" value="id" />
								<wa:param name="display" value="name" />
								<wa:param name="name" value="f_promoType" />
								<wa:param name="selectedValues" value="${bean.promoType.id}" />
							</wa:include>
							<div class="selectRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
	            			<script type="text/javascript">
								var v_promoType = new Spry.Widget.ValidationSelect("v_promoType", {isRequired:false,validateOn:["blur","change"]});
							</script>
						</div>
						<div class="bgWhite" id="v_daysBeforePrestation">
							<label for="f_daysBeforePrestation"><wa:mls>daysBeforePrestation</wa:mls></label>
							<textarea name="f_daysBeforePrestation" class="textfield" >${bean.daysBeforePrestation}</textarea>
							<script type="text/javascript">
								var v_daysBeforePrestation = new Spry.Widget.ValidationTextarea("v_daysBeforePrestation", {isRequired:false,maxChars:10});
							</script> 
						</div>
						<div class="bgGrey" id="v_stockLevel">
							<label for="f_stockLevel"><wa:mls>stockLevel</wa:mls></label>
							<textarea name="f_stockLevel" class="textfield" >${bean.stockLevel}</textarea>
							<script type="text/javascript">
								var v_stockLevel = new Spry.Widget.ValidationTextarea("v_stockLevel", {isRequired:false,maxChars:10});
							</script> 
						</div>
						<div class="bgWhite" id="v_lockLevel">
							<label for="f_lockLevel"><wa:mls>lockLevel</wa:mls></label>
							<textarea name="f_lockLevel" class="textfield" >${bean.lockLevel}</textarea>
							<script type="text/javascript">
								var v_lockLevel = new Spry.Widget.ValidationTextarea("v_lockLevel", {isRequired:false,maxChars:10});
							</script> 
						</div>
						<div class="bgGrey" id="v_taxe">
							<label for="f_taxe"><wa:mls>taxe</wa:mls></label>
							<textarea name="f_taxe" class="textfield" >${bean.taxe}</textarea>
							<script type="text/javascript">
								var v_taxe = new Spry.Widget.ValidationTextarea("v_taxe", {isRequired:false,maxChars:10});
							</script> 
						</div>
						<div class="bgWhite" id="v_weight">
							<label for="f_weight"><wa:mls>weight</wa:mls></label>
							<textarea name="f_weight" class="textfield" >${bean.weight}</textarea>
							<script type="text/javascript">
								var v_weight = new Spry.Widget.ValidationTextarea("v_weight", {isRequired:false,maxChars:10});
							</script> 
						</div>
						<div class="bgGrey" id="v_height">
							<label for="f_height"><wa:mls>height</wa:mls></label>
							<textarea name="f_height" class="textfield" >${bean.height}</textarea>
							<script type="text/javascript">
								var v_height = new Spry.Widget.ValidationTextarea("v_height", {isRequired:false,maxChars:10});
							</script> 
						</div>
						<div class="bgWhite" id="v_width">
							<label for="f_width"><wa:mls>width</wa:mls></label>
							<textarea name="f_width" class="textfield" >${bean.width}</textarea>
							<script type="text/javascript">
								var v_width = new Spry.Widget.ValidationTextarea("v_width", {isRequired:false,maxChars:10});
							</script> 
						</div>
						<div class="bgGrey" id="v_depth">
							<label for="f_depth"><wa:mls>depth</wa:mls></label>
							<textarea name="f_depth" class="textfield" >${bean.depth}</textarea>
							<script type="text/javascript">
								var v_depth = new Spry.Widget.ValidationTextarea("v_depth", {isRequired:false,maxChars:10});
							</script> 
						</div>
						<div class="bgWhite">
							<label for="f_closedMonday"><wa:mls>closedMonday</wa:mls></label>
							<input type="radio"<c:if test="${bean.closedMonday ==  null || bean.closedMonday==false}"> checked="checked"</c:if> value="0" name="f_closedMonday"/><wa:mls>no</wa:mls>
							<input type="radio"<c:if test="${bean.closedMonday==true}"> checked="checked"</c:if> value="1" name="f_closedMonday"/><wa:mls>yes</wa:mls>
						</div>
						<div class="bgGrey">
							<label for="f_closedTuesday"><wa:mls>closedTuesday</wa:mls></label>
							<input type="radio"<c:if test="${bean.closedTuesday ==  null || bean.closedTuesday==false}"> checked="checked"</c:if> value="0" name="f_closedTuesday"/><wa:mls>no</wa:mls>
							<input type="radio"<c:if test="${bean.closedTuesday==true}"> checked="checked"</c:if> value="1" name="f_closedTuesday"/><wa:mls>yes</wa:mls>
						</div>
						<div class="bgWhite">
							<label for="f_closedWednesday"><wa:mls>closedWednesday</wa:mls></label>
							<input type="radio"<c:if test="${bean.closedWednesday ==  null || bean.closedWednesday==false}"> checked="checked"</c:if> value="0" name="f_closedWednesday"/><wa:mls>no</wa:mls>
							<input type="radio"<c:if test="${bean.closedWednesday==true}"> checked="checked"</c:if> value="1" name="f_closedWednesday"/><wa:mls>yes</wa:mls>
						</div>
						<div class="bgGrey">
							<label for="f_closedThursday"><wa:mls>closedThursday</wa:mls></label>
							<input type="radio"<c:if test="${bean.closedThursday ==  null || bean.closedThursday==false}"> checked="checked"</c:if> value="0" name="f_closedThursday"/><wa:mls>no</wa:mls>
							<input type="radio"<c:if test="${bean.closedThursday==true}"> checked="checked"</c:if> value="1" name="f_closedThursday"/><wa:mls>yes</wa:mls>
						</div>
						<div class="bgWhite">
							<label for="f_closedFriday"><wa:mls>closedFriday</wa:mls></label>
							<input type="radio"<c:if test="${bean.closedFriday ==  null || bean.closedFriday==false}"> checked="checked"</c:if> value="0" name="f_closedFriday"/><wa:mls>no</wa:mls>
							<input type="radio"<c:if test="${bean.closedFriday==true}"> checked="checked"</c:if> value="1" name="f_closedFriday"/><wa:mls>yes</wa:mls>
						</div>
						<div class="bgGrey">
							<label for="f_closedSaturday"><wa:mls>closedSaturday</wa:mls></label>
							<input type="radio"<c:if test="${bean.closedSaturday ==  null || bean.closedSaturday==false}"> checked="checked"</c:if> value="0" name="f_closedSaturday"/><wa:mls>no</wa:mls>
							<input type="radio"<c:if test="${bean.closedSaturday==true}"> checked="checked"</c:if> value="1" name="f_closedSaturday"/><wa:mls>yes</wa:mls>
						</div>
						<div class="bgWhite">
							<label for="f_closedSunday"><wa:mls>closedSunday</wa:mls></label>
							<input type="radio"<c:if test="${bean.closedSunday ==  null || bean.closedSunday==false}"> checked="checked"</c:if> value="0" name="f_closedSunday"/><wa:mls>no</wa:mls>
							<input type="radio"<c:if test="${bean.closedSunday==true}"> checked="checked"</c:if> value="1" name="f_closedSunday"/><wa:mls>yes</wa:mls>
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
					<c:if test="${bean!=null && bean.source!=null && bean.catalogProductClts[clt].sourceTitle!=null}">
					<div class="bgGrey">
						<label for="f_${clt}_sourceTitle"><wa:mls>title </wa:mls> (source)</label>
						<span>${bean.catalogProductClts[clt].sourceTitle}</span>
					</div>
					</c:if>		
					<div class="bgGrey" style="height:50px;" id="v_${clt}_title">
						<label for="f_${clt}_title" style="float:left;"><wa:mls>title</wa:mls></label>
						<textarea name="f_${clt}_title" style="float:left;" id="f_${clt}_title" class="textfield textForAll" >${bean.catalogProductClts[clt].title}</textarea>
						<div class="textareaRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls> </div>
	            		<script type="text/javascript">
							var v_${clt}_title = new Spry.Widget.ValidationTextarea("v_${clt}_title", {isRequired:true,minChars:1, maxChars:200,validateOn:["blur","change"]});
						</script>
						<a href="#null"  class="image_btn_apply" onclick="applyValueForAll('textForAll','f_${clt}_title')" title="<wa:mls>Appliquer pour toutes les langues</wa:mls>">&nbsp;</a>
						
					</div>
					<c:if test="${bean!=null && bean.source!=null && bean.catalogProductClts[clt].sourceAbstract!=null}">
					<div class="bgWhite">
						<label for="f_${clt}_sourceAbstract_Not" style="float:left;"><wa:mls>abstract_ (source) - Not editable</wa:mls></label>
						<textarea name="f_${clt}_sourceAbstractNot" id="f_${clt}_sourceAbstractNot" class="textarea2" style="float:left; margin-left:3px;">${bean.catalogProductClts[clt].sourceAbstract}</textarea>
						<div class="clr"></div>	
					</div>
					</c:if>
					<input type="checkbox"  class="check_abstract"  /><span class="text_check_block_abstract" style="display:none;"><wa:mls>afficher zone abstract</wa:mls></span><span class="text_check_none_abstract"  style="display:none;"><wa:mls>masquer zone abstract</wa:mls></span>
					<div class="bgWhite abstract">
						<label for="f_${clt}_abstract_" style="float:left;"><wa:mls>abstract_</wa:mls></label>
						<div style="float:left; margin-left:3px; width:95%">
						<textarea name="f_${clt}_abstract_" id="f_${clt}_abstract_" class="textarea2 " style="float:left; margin-left:3px;">${bean.catalogProductClts[clt].abstract_}</textarea>
						</div>
						<div class="clr"></div>
					</div>
	
					<c:if test="${bean!=null && bean.source!=null && bean.catalogProductClts[clt].sourceBody!=null}">
					<div class="bgGrey">
						<label for="f_${clt}_sourceBodyNot" style="float:left;"><wa:mls>body (source) - Not editable</wa:mls></label>
						<textarea name="f_${clt}_sourceBodyNot" id="f_${clt}_sourceBodyNot" class="textarea2" style="float:left; margin-left:3px;">${bean.catalogProductClts[clt].sourceBody}</textarea>
						<div class="clr"></div>	
					</div>
					</c:if>
					<input type="checkbox"  class="check_body"  /><span class="text_check_block_body" style="display:none;"><wa:mls>afficher zone body</wa:mls></span><span class="text_check_none_body" style="display:none;"><wa:mls>masquer zone body</wa:mls></span>
					<div class="bgGrey body">
						<label for="f_${clt}_body" style="float:left;"><wa:mls>body</wa:mls></label>
						<div  style="float:left; margin-left:3px; width:95%">
							<textarea name="f_${clt}_body" id="f_${clt}_body"  class="textarea2" >${bean.catalogProductClts[clt].body}</textarea>
						</div>
						<div class="clr"></div>	
						
					</div>
					<c:if test="${bean!=null && bean.source!=null && bean.catalogProductClts[clt].sourceBody!=null}">
					<div class="bgWhite">
						<label for="f_${clt}_sourceInfoNot" style="float:left;"><wa:mls>info (source) - Not editable</wa:mls></label>
						<textarea name="f_${clt}_sourceInfoNot" id="f_${clt}_sourceInfoNot" class="textarea2" style="float:left; margin-left:3px;">${bean.catalogProductClts[clt].sourceInfo}</textarea>
						<div class="clr"></div>	
					</div>
					</c:if>
					<input type="checkbox"  class="check_info"  /><span class="text_check_block_info" style="display:none;"><wa:mls>afficher zone info</wa:mls></span><span class="text_check_none_info" style="display:none;"><wa:mls>masquer zone info</wa:mls></span>
					<div class="bgWhite info">
						<label for="f_${clt}_info" style="float:left;"><wa:mls>info</wa:mls></label>
						<div  style="float:left; margin-left:3px; width:95%">
							<textarea name="f_${clt}_info" id="f_${clt}_info"  class="textarea2" >${bean.catalogProductClts[clt].info}</textarea>
						</div>
						<div class="clr"></div>	
						
					</div>
					<div class="bgGrey" id="v_${clt}_bigImage">
						<label for="f_${clt}_bigImage" style="float:left;" ><wa:mls>bigImage</wa:mls></label>
						<textarea name="f_${clt}_bigImage" id="f_${clt}_bigImage" class="textfield bigImageForAll" style="float:left; margin-left:3px">${bean.catalogProductClts[clt].bigImage}</textarea>
						<a href="${context}/${site}/contentImage/contentImageList.do?openerField=f_${clt}_bigImage" target="image" class="image_btn" title="<wa:mls>Upload an image</wa:mls>">&nbsp;</a>
						<a href="#null"  class="image_btn_apply" onclick="applyValueForAll('bigImageForAll','f_${clt}_bigImage')" title="<wa:mls>Appliquer pour toutes les langues</wa:mls>">&nbsp;</a>
						<div class="clr"></div>	
	            		<script type="text/javascript">
							var v_${clt}_bigImage = new Spry.Widget.ValidationTextarea("v_${clt}_bigImage", {isRequired:false,maxChars:300,validateOn:["blur","change"]});
						</script>
						
					</div>
					<div class="bgWhite" id="v_${clt}_smallImage">
						<label for="f_${clt}_smallImage" style="float:left;" ><wa:mls>smallImage</wa:mls></label>
						<textarea name="f_${clt}_smallImage" id="f_${clt}_smallImage" class="textfield smallImageForAll" style="float:left; margin-left:3px">${bean.catalogProductClts[clt].smallImage}</textarea>
						<a href="${context}/${site}/contentImage/contentImageList.do?openerField=f_${clt}_smallImage" target="image" class="image_btn" title="<wa:mls>Upload an image</wa:mls>">&nbsp;</a>
						<a href="#null"  class="image_btn_apply" onclick="applyValueForAll('smallImageForAll','f_${clt}_smallImage')" title="<wa:mls>Appliquer pour toutes les langues</wa:mls>">&nbsp;</a>
						<div class="clr"></div>
						<script type="text/javascript">
							var v_${clt}_smallImage = new Spry.Widget.ValidationTextarea("v_${clt}_smallImage", {isRequired:false,maxChars:300,validateOn:["blur","change"]});
						</script>
					
					</div>
					<div class="bgGrey" id="v_${clt}_url">
						<label for="f_${clt}_url" style="float:left;"><wa:mls>url</wa:mls></label>
						<textarea name="f_${clt}_url"  id="f_${clt}_url" class="textfield urlForAll"  style="float:left; margin-left:3px">${bean.catalogProductClts[clt].url}</textarea>
						<a href="${context}/${site}/contentLink/contentLinkList.do?openerField=f_${clt}_url" target="link" class="track_link_btn" title="<wa:mls>Track a link</wa:mls>">&nbsp;</a>
						<a href="#null"  class="image_btn_apply" onclick="applyValueForAll('urlForAll','f_${clt}_url')" title="<wa:mls>Appliquer pour toutes les langues</wa:mls>">&nbsp;</a>
						<div class="clr"></div>
						<script type="text/javascript">
							var v_${clt}_url = new Spry.Widget.ValidationTextarea("v_${clt}_url", {isRequired:false,maxChars:300,validateOn:["blur","change"]});
						</script>
					</div>
					<div class="bgWhite" id="v_${clt}_urlLabel">
						<label for="f_${clt}_urlLabel"><wa:mls>urlLabel</wa:mls></label>
						<textarea name="f_${clt}_urlLabel" class="textfield" >${bean.catalogProductClts[clt].urlLabel}</textarea>
						<script type="text/javascript">
							var v_${clt}_urlLabel = new Spry.Widget.ValidationTextarea("v_${clt}_urlLabel", {isRequired:false,maxChars:200,validateOn:["blur","change"]});
						</script>
					</div>
					<c:if test="${bean!=null && bean.id>0 && duplicate eq null}">		
					<div class="bgGrey">
						<label for="f_${clt}_openCount"><wa:mls>openCount</wa:mls></label>
						<span><c:if test="${bean.catalogProductClts[clt].openCount==null}">0</c:if>${bean.catalogProductClts[clt].openCount}</span>
					</div>
					<div class="bgWhite">
						<label for="f_${clt}_commentCount"><wa:mls>commentCount</wa:mls></label>
						<span><c:if test="${bean.catalogProductClts[clt].commentCount==null}">0</c:if>${bean.catalogProductClts[clt].commentCount}</span>
					</div>
					
					</c:if>
					<fieldset>
						<legend><wa:mls>Product Infos</wa:mls></legend>
						<div class="bgGrey" id="v_${clt}_salesCondition">
						<label for="f_${clt}_salesCondition"><wa:mls>salesCondition</wa:mls></label>
						<textarea name="f_${clt}_salesCondition" class="textfield" >${bean.catalogProductClts[clt].salesCondition}</textarea>
						<script type="text/javascript">
							var v_${clt}_salesCondition = new Spry.Widget.ValidationTextarea("v_${clt}_salesCondition", {isRequired:false,maxChars:50,validateOn:["blur","change"]});
						</script>
						</div>
						<div class="bgWhite" id="v_${clt}_unit">
							<label for="f_${clt}_unit"><wa:mls>unit</wa:mls></label>
							<textarea name="f_${clt}_unit" class="textfield" >${bean.catalogProductClts[clt].unit}</textarea>
							<script type="text/javascript">
								var v_${clt}_unit = new Spry.Widget.ValidationTextarea("v_${clt}_unit", {isRequired:false,maxChars:300,validateOn:["blur","change"]});
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
									<wa:param name="contentType" value="CatalogProduct"/>
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
									<wa:param name="contentType" value="CatalogProduct"/>
									<wa:param name="contentId" value="${oldId}" />
								</wa:include>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
					<div id="ajaxProperties"></div>

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
	<c:if test="${bean!=null && bean.source!=null && bean.catalogProductClts[clt].sourceBody!=null}">
	var oFCKeditor4 = new FCKeditor('f_${clt}_sourceBodyNot','100%','500px');
	oFCKeditor4.BasePath = 'fckeditor/';
	oFCKeditor4.EditorPath = rootPath;
	oFCKeditor4.LocationPath = window.location.href;
	oFCKeditor4.ToolbarSet = 'Import' ;
	oFCKeditor4.ReplaceTextarea();
	</c:if>
	<c:if test="${bean!=null && bean.source!=null && bean.catalogProductClts[clt].sourceAbstract!=null}">
	var oFCKeditor5 = new FCKeditor('f_${clt}_sourceAbstractNot','100%','500px');
	oFCKeditor5.BasePath = 'fckeditor/';
	oFCKeditor5.EditorPath = rootPath;
	oFCKeditor5.LocationPath = window.location.href;
	oFCKeditor5.ToolbarSet = 'Import' ;
	oFCKeditor5.ReplaceTextarea(); 
	</c:if>
	<c:if test="${bean!=null && bean.source!=null && bean.catalogProductClts[clt].sourceInfo!=null}">
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
		url : '${context}/${site}/ajax/properties.do?type=article&realType=CatalogProduct',
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
