

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="wa" uri="WanabeTags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="mainContent">
	<!-- TOOLBOX -->
	<div id="toolBox">
	<div class="content" id="actions"><a href="javascript:void(0);"
		id="back_btn"><wa:mls>Back to List</wa:mls></a> 
		<c:if test="${legend != null}">
		<a href="" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
		</c:if>
	<div class="clr"></div>
	</div>
	</div>
	
	<h2><wa:mls>contentRoom</wa:mls>&nbsp;-&nbsp;
		<c:if test="${bean==null || bean.roomId<=0}"><wa:mls>(Add)</wa:mls></c:if>
		<c:if test="${bean!=null && bean.roomId>0}"><wa:mls>(Edit)</wa:mls></c:if>
	</h2>
	<div id="list">
		<div id="mask">
			<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
				<fieldset>
					<legend>&nbsp;</legend>
					<div class="bgWhite">
						<label for="f_name" style="align=center;"><wa:mls>Venue Name:</wa:mls>&nbsp;&nbsp;
						<c:choose><c:when test="${waParam.s_contentVenue_name!=null}">${waParam.s_contentVenue_name}</c:when><c:otherwise>${contentVenue_name}</c:otherwise></c:choose>
						</label>
				 
					</div>
					<c:if test="${bean!=null && bean.roomId>0}">
						<div class="bgGrey">
						<label for="f_roomId"><wa:mls>id</wa:mls></label>
						<span>${bean.roomId}</span></div>
						<input name="id" type="hidden" value="${bean.roomId}"/>
					</c:if>
					<input name="f_contentVenue_id" type="hidden"  
					
					<c:choose><c:when test="${waParam.s_contentVenue_id!=null}">value="${waParam.s_contentVenue_id}"</c:when><c:otherwise>value="${bean.contentVenue.id}"</c:otherwise></c:choose>
				 />
					<input name="f_contentVenue_name" type="hidden" <c:choose><c:when test="${waParam.s_contentVenue_name!=null}">value="${waParam.s_contentVenue_name}"</c:when><c:otherwise>${contentVenue_name}</c:otherwise></c:choose>/>
					<div class="bgWhite">
						<label for="f_name"><wa:mls>Name</wa:mls></label>
						<textarea name="f_name" class="textfield" >${bean.name}</textarea>
					</div>
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
					<div class="clr"></div>
				</fieldset>
				
				<fieldset>
					<legend>&nbsp;<wa:mls>Propriétés des salles</wa:mls></legend>
					<div class="bgGrey" id="v_surface">
						<label for="f_surface"><wa:mls>surface</wa:mls></label>
						<textarea name="f_surface" class="textfield" >${bean.surface}</textarea>
					</div>
					<div class="bgWhite" id="v_length">
						<label for="f_length"><wa:mls>length</wa:mls></label>
						<textarea name="f_length" class="textfield" >${bean.length}</textarea>
					</div>
					<div class="bgGrey" id="v_width">
						<label for="f_length"><wa:mls>width</wa:mls></label>
						<textarea name="f_width" class="textfield" >${bean.width}</textarea>
					</div>
					<div class="bgWhite" id="v_height">
						<label for="f_height"><wa:mls>height</wa:mls></label>
						<textarea name="f_length" class="textfield" >${bean.height}</textarea>
					</div>
					<div class="bgGrey" id="v_doorWidth">
						<label for="f_doorWidth"><wa:mls>doorWidth</wa:mls></label>
						<textarea name="f_doorWidth" class="textfield" >${bean.doorWidth}</textarea>
					</div>
					<div class="bgWhite" id="v_doorHeight">
						<label for="f_doorHeight"><wa:mls>doorHeight</wa:mls></label>
						<textarea name="f_doorHeight" class="textfield" >${bean.doorHeight}</textarea>
					</div>
					<div class="bgGrey" id="v_modular">
						<label for="f_modular"><wa:mls>modular</wa:mls></label>
						<textarea name="f_modular" class="textfield" >${bean.modular}</textarea>
					</div>
					<div class="bgWhite" id="v_theater">
						<label for="f_theater"><wa:mls>theater</wa:mls></label>
						<textarea name="f_theater" class="textfield" >${bean.theater}</textarea>
					</div>
					<div class="bgGrey" id="v_school">
						<label for="f_school"><wa:mls>school</wa:mls></label>
						<textarea name="f_school" class="textfield" >${bean.school}</textarea>
					</div>
					<div class="bgWhite" id="v_cocktail">
						<label for="f_cocktail"><wa:mls>cocktail</wa:mls></label>
						<textarea name="f_cocktail" class="textfield" >${bean.cocktail}</textarea>
					</div>
					<div class="bgGrey" id="v_banque">
						<label for="f_banque"><wa:mls>banque</wa:mls></label>
						<textarea name="f_banque" class="textfield" >${bean.banque}</textarea>
					</div>
					<div class="bgWhite" id="v_auditorium">
						<label for="f_auditorium"><wa:mls>auditorium</wa:mls></label>
						<textarea name="f_auditorium" class="textfield" >${bean.auditorium}</textarea>
					</div>
					<div class="bgGrey" id="v_fairsExposition">
						<label for="f_fairsExposition"><wa:mls>fairsExposition</wa:mls></label>
						<textarea name="f_fairsExposition" class="textfield" >${bean.fairsExposition}</textarea>
					</div>
					<div class="bgWhite" id="v_airco">
						<label for="f_airco"><wa:mls>airco</wa:mls></label>
						<textarea name="f_airco" class="textfield" >${bean.airco}</textarea>
					</div>
					<div class="bgGrey" id="v_interprateCabines">
						<label for="f_interprateCabines"><wa:mls>interprateCabines</wa:mls></label>
						<textarea name="f_interprateCabines" class="textfield" >${bean.interprateCabines}</textarea>
					</div>
					<div class="bgWhite" id="v_audioVideo">
						<label for="f_audioVideo"><wa:mls>audioVideo</wa:mls></label>
						<textarea name="f_audioVideo" class="textfield" >${bean.audioVideo}</textarea>
					</div>
					<div class="bgGrey" id="v_handicap">
						<label for="f_handicap"><wa:mls>handicap</wa:mls></label>
						<textarea name="f_handicap" class="textfield" >${bean.handicap}</textarea>
					</div>
					<div class="bgWhite" id="v_dayLight">
						<label for="f_dayLight"><wa:mls>dayLight</wa:mls></label>
						<textarea name="f_dayLight" class="textfield" >${bean.dayLight}</textarea>
					</div>
					<div class="bgGrey" id="v_kitchen">
						<label for="f_kitchen"><wa:mls>kitchen</wa:mls></label>
						<textarea name="f_kitchen" class="textfield" >${bean.kitchen}</textarea>
					</div>
					<div class="bgWhite" id="v_internet">
						<label for="f_internet"><wa:mls>internet</wa:mls></label>
						<textarea name="f_internet" class="textfield" >${bean.internet}</textarea>
					</div>
					<div class="bgGrey" id="v_publicParkingProxi">
						<label for="f_publicParkingProxi"><wa:mls>publicParkingProxi</wa:mls></label>
						<textarea name="f_publicParkingProxi" class="textfield" >${bean.publicParkingProxi}</textarea>
					</div>
					<div class="bgWhite" id="v_parkPlacePrivate">
						<label for="f_parkPlacePrivate"><wa:mls>parkPlacePrivate</wa:mls></label>
						<textarea name="f_parkPlacePrivate" class="textfield" >${bean.parkPlacePrivate}</textarea>
					</div>
					<div class="bgGrey" id="v_style">
						<label for="f_style"><wa:mls>style</wa:mls></label>
						<textarea name="f_style" class="textfield" >${bean.style}</textarea>
					</div>
				</fieldset>
				<div class="clr"></div>
				<div id="containerButton">
					<input type="button" name="cancel" id="cancel" class="cancel" value="<wa:mls>Cancel</wa:mls>"/>
					<input type="submit" name="submit" class="submit" value="<wa:mls>Enregistrer</wa:mls>"/>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
<script>
	path='${context}/${site}/${module}';
	idName='${bean.roomId}';
</script>


