			<%@ page
			language="java"
			contentType="text/html; charset=UTF-8"
			pageEncoding="UTF-8"
			isELIgnored ="false"
			%>
			<%@ taglib prefix="wa" uri="WanabeTags" %>
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
			<div id="mainContent">

				<!-- TOOLBOX -->
				<div id="toolBox">
					<div class="content" id="actions">
						<a href="javascript:void(0);" id ="back_btn"><wa:mls>Back to List</wa:mls></a>
						<c:if test="${legend != null}">
							<a href="" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
						</c:if>
						<div class="clr"></div>
					</div>
				</div>

				<h2>
					<wa:mls>Reqforproposal For Professionnal</wa:mls>&nbsp;-&nbsp;
					<c:if test="${bean!=null && bean.reqid>0}"><wa:mls>(Edit)</wa:mls></c:if>
				</h2>
				<div id="list">
					<div id="mask">
						<form  id="detailForm">
							<fieldset>
								<legend>&nbsp;</legend>
								<c:choose>
								<c:when test="${bean!=null && bean.reqid>0}">
									<div class="bgGrey">
										<label for="f_reqid"><wa:mls>reqid</wa:mls></label>
										<input name="id" type="hidden" value="${bean.reqid}" />
										<span>${bean.reqid}</span>
									</div>
								
								<fieldset>
									<legend align="top"><wa:mls>User informations</wa:mls></legend>
									<div class="bgWhite">
										<label for="f_userId"><wa:mls>User ID</wa:mls></label>
										<span>${bean.userId}</span>
										<input name="f_userId" type="hidden" value="${bean.userId}"/>
									</div>
									<div class="bgGrey">
										<label for="f_firstname"><wa:mls>Firstname</wa:mls></label>
										<span>${bean.firstname}</span>
									</div>
									<div class="bgWhite">
										<label for="f_lastname"><wa:mls>Lastname</wa:mls></label>
										<span>${bean.lastname}</span>
									</div>
									<div class="bgGrey">
										<label for="f_greetings"><wa:mls>Greeting</wa:mls></label> 
										<select name="f_greetings">
											<c:if test="${bean.greetings=='M'}"><option value="M" selected="selected"><wa:mls>M</wa:mls></option></c:if>
											<c:if test="${bean.greetings=='Mme'}"><option value="Mme" selected="selected"><wa:mls>Mme</wa:mls></option></c:if>
											<c:if test="${bean.greetings=='Mlle'}"><option value="Mlle" selected="selected"><wa:mls>Mlle</wa:mls></option></c:if>
										</select>
				    				</div>
				    				
				    				<div class="bgWhite">
											<label for="f_lg"><wa:mls> Langue</wa:mls></label>
											<span>${bean.lg }</span>
										</div>
									<div class="bgGrey">
										<label for="f_address"><wa:mls>Address</wa:mls></label>
											<span>${bean.address}</span>
									</div>
									<div class="bgWhite">
										<label for="f_zip"><wa:mls>Zipcode</wa:mls></label>
										<span>${bean.zip}</span>
									</div>
									<div class="bgGrey">
										<label for="f_city"><wa:mls>City</wa:mls></label>
										<span>${bean.city}</span>
									</div>
									<div class="bgWhite">
										<label for="f_country"><wa:mls>Country</wa:mls></label>
										<span>${bean.country}</span>
									</div>
									<div class="bgGrey">
										<label for="f_state"><wa:mls>State</wa:mls></label>
										<span>${bean.state}</span>
									</div>
									<div class="bgWhite">
										<label for="f_phone"><wa:mls>Phone</wa:mls></label>
										<span>${bean.phone}</span>
									</div>
									<div class="bgGrey">
										<label for="f_email"><wa:mls>Email</wa:mls></label>
										<span>${bean.email}</span>
									</div>
									<div class="bgWhite">
										<label for="f_company"><wa:mls>Company</wa:mls></label>
										<span>${bean.company}</span>
									</div>
									<div class="bgGrey">
										<label for="f_url"><wa:mls>URL</wa:mls></label>
										<span>${bean.url}</span>
									</div>
								</fieldset>
                                <div class="fieldset_clr"></div>
								<fieldset>
									<legend align="top"><wa:mls>Other informations</wa:mls></legend>
									<div class="bgWhite">
										<label for="f_createdOn"><wa:mls>Created on</wa:mls></label>
										<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.createdOn}"/></span>
									</div>
									<div class="bgGrey">
										<label for="f_modifiedOn"><wa:mls>Last modified on</wa:mls></label>
										<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.modifiedOn}"/></span>
									</div>
									<div class="bgWhite">
										<label for="f_country"><wa:mls>Origin</wa:mls></label>
										</span>${bean.origin}</span>
									</div>
								</fieldset>
                                <div class="fieldset_clr"></div>
								<fieldset>
									<legend align="top"><wa:mls>Meeting</wa:mls></legend>
									<div class="bgWhite">
										<label for="f_meetingName"><wa:mls>Meeting Name</wa:mls></label>
										<span>${bean.meetingName}</span>
									</div>
									<div class="bgGrey">
										<label for="f_meetingType"><wa:mls>Meeting Type</wa:mls></label>
										<span>${bean.meetingType}</span>
									</div>
									<div class="bgGrey">
										<label for="f_prefArrivaldate"><wa:mls>Date d'arrivée</wa:mls></label>
										<span>${bean.prefArrivaldate}</span>
									</div>
									<div class="bgWhite">
										<label for="f_prefDepartdate"><wa:mls>Date de retour</wa:mls></label>
										<span>${bean.prefDepartdate}</span>
									</div>
									<div class="bgGrey">
										<label for="f_altArrivaldate"><wa:mls>Autre Date d'arrivée</wa:mls></label>
										<span>${bean.altArrivaldate}</span>
									</div>
									<div class="bgWhite">
										<label for="f_altDepartdate"><wa:mls>Autre date de retour</wa:mls></label>
										<span>${bean.altDepartdate}</span>
									</div>
									<div class="bgGrey">
										<label for="f_citytour"><wa:mls>Tour de ville</wa:mls></label>
										<c:if test="${bean.citytour==0}"><input type="radio" value="0" name="f_citytour" checked="checked"/><wa:mls>No</wa:mls></c:if>
										<c:if test="${bean.citytour==1}"><input type="radio" value="1" name="f_citytour" checked="checked"/><wa:mls>Yes</wa:mls></c:if>
									</div>
									<div class="bgWhite">
										<label for="f_dayexcursion"><wa:mls>Jour(s) d'excursion</wa:mls></label>
										<span>${bean.dayexcursion}</span>
									</div>
									<div class="bgGrey">
										<label for="f_industry"><wa:mls>Industry</wa:mls></label>
										<span>${bean.industry}</span>
									</div>
									<div class="bgWhite">
										<label for="f_infos"><wa:mls>Informations</wa:mls></label>
										</span>${bean.infos}<span>
									</div>
									<div class="bgGrey">
										<label for="f_largestAttendance"><wa:mls>Largest Attendance</wa:mls></label>
										<span>${bean.largestAttendance}</span>
									</div>
									<div class="bgWhite">
										<label for="f_numAccPersons"><wa:mls>Nombre de personne(s) accompagnante(s)</wa:mls></label>
										<span>${bean.numAccPersons}</span>
									</div>
									<div class="bgGrey">
										<label for="f_organisationType"><wa:mls>Organisation Type</wa:mls></label>
										<span>${bean.organisationType}</span>
									</div>
									<div class="bgWhite">
										<label for="f_transport"><wa:mls>Transport</wa:mls></label>
										<c:if test="${bean.transport==0}"><input type="radio" value="0" name="f_transport" checked="checked"/><wa:mls>No</wa:mls></c:if>
										<c:if test="${bean.transport==1}"><input type="radio" value="1" name="f_transport" checked="checked"/><wa:mls>Yes</wa:mls></c:if>
									</div>
									<div class="bgGrey">
										<label for="f_wanthelpfrom"><wa:mls>Want Help From</wa:mls></label>
										<span>${bean.wanthelpfrom}</span>
									</div>
								</fieldset>
                                <div class="fieldset_clr"></div>
								<fieldset>
									<legend align="top"><wa:mls>Hotel</wa:mls></legend>
									<div class="bgWhite">
										<label for="f_hotelLocation"><wa:mls>Hotel location</wa:mls></label>
										<span>${bean.hotelLocation}</span>
									</div>
									<div class="bgGrey">
										<label for="f_hotelNumrooms"><wa:mls>Nombre de chambres requises</wa:mls></label>
										<span>${bean.hotelNumrooms}</span>
									</div>
									<div class="bgWhite">
										<label for="f_hotelStars"><wa:mls>Catégorie de votre Hotel (séparées par des point-virgules)</wa:mls></label>
										<span>${bean.hotelStars}</span>
									</div>
									<div class="bgGrey"> 
										<label for="f_status"><wa:mls>Hotel with meeting rooms</wa:mls></label>
										<c:if test="${bean.hotelWithMeetingrooms==0}"><input type="radio" value="0" name="f_hotelWithMeetingrooms" checked="checked"/><wa:mls>No</wa:mls></c:if>
										<c:if test="${bean.hotelWithMeetingrooms==1}"><input type="radio" value="1" name="f_hotelWithMeetingrooms" checked="checked"/><wa:mls>Yes</wa:mls></c:if>
									</div>
								</fieldset>
                                <div class="fieldset_clr"></div>
								<fieldset>
									<legend align="top"><wa:mls>Venue</wa:mls></legend>
									<div class="bgWhite">
										<label for="f_catering"><wa:mls>Catering:</wa:mls></label>
										<c:if test="${bean.catering== false}"><input type="radio" value="0" name="f_catering" checked="checked"/><wa:mls>No</wa:mls></c:if>
										<c:if test="${bean.catering== true}"><input type="radio" value="1" name="f_catering" checked="checked"/><wa:mls>Yes</wa:mls></c:if>
									</div>
									<div class="bgGrey">
										<label for="f_cocktail"><wa:mls>Cocktail:</wa:mls></label>
										<c:if test="${bean.cocktail==0}"><input type="radio" value="0" name="f_cocktail" checked="checked"/><wa:mls>No</wa:mls></c:if>
										<c:if test="${bean.cocktail==1}"><input type="radio" value="1" name="f_cocktail" checked="checked"/><wa:mls>Yes</wa:mls></c:if>
									</div>
									<div class="bgWhite">
										<label for="f_exhibSpace"><wa:mls>Exhib Space:</wa:mls></label>
										<span>${bean.exhibSpace}</span>
									</div>
									<div class="bgGrey">
										<label for="f_exhibSpaceUnit"><wa:mls>Exhib Space Unit</wa:mls></label>
										<span>${bean.exhibSpaceUnit}</span>
									</div>
									<div class="bgWhite">
										<label for="f_numBreakrooms"><wa:mls>Number of Breakrooms</wa:mls></label>
										<span>${bean.numBreakrooms}</span>
									</div>
									<div class="bgGrey">
										<label for="f_numRooms"><wa:mls>Nombre de chambres</wa:mls></label>
										<span>${bean.numRooms}</span>
									</div>
									<div class="bgWhite">
										<label for="f_specialvenue"><wa:mls>Special Venue</wa:mls></label>
										<c:if test="${bean.specialvenue==0}"><input type="radio" value="0" name="f_specialvenue" checked="checked"/><wa:mls>No</wa:mls></c:if>
										<c:if test="${bean.specialvenue==1}"><input type="radio" value="1" name="f_specialvenue" checked="checked"/><wa:mls>Yes</wa:mls></c:if>
									</div>
									<div class="bgGrey">
										<label for="f_translation"><wa:mls>Translation</wa:mls></label>
										<c:if test="${bean.translation== false}"><input type="radio" value="0" name="f_translation" checked="checked"/><wa:mls>No</wa:mls></c:if>
										<c:if test="${bean.translation== true}"><input type="radio" value="1" name="f_translation" checked="checked"/><wa:mls>Yes</wa:mls></c:if>
									</div>
									<div class="bgWhite">
										<label for="f_venueConfig"><wa:mls>Venue Config</wa:mls></label>
										<span>${bean.venueConfig}</span>
									</div>
									<div class="bgGrey">
										<label for="f_venueLocation"><wa:mls>Venue Location</wa:mls></label>
										<span>${bean.venueLocation}</span>
									</div>
									<div class="bgWhite">
										<label for="f_venueType"><wa:mls>Venue Type</wa:mls></label>
										<span>${bean.venueType}</span>
									</div>
									<div class="bgGrey">
										<label for="f_venueTypeother"><wa:mls>Other Venue Type</wa:mls></label>
										<span>${bean.venueTypeother}</span>
									</div>
								</fieldset>
                                <div class="fieldset_clr"></div>
								<fieldset>
									<legend align="top"><wa:mls>Restaurant</wa:mls></legend>
									<div class="bgWhite">
										<label for="f_dinner"><wa:mls>Dinner</wa:mls></label>
										<span>${bean.dinner}</span>
									</div>
									<div class="bgGrey">
										<label for="f_dinerDate"><wa:mls>Diner Date</wa:mls></label>
										<span>${bean.dinerDate}</span>
									</div>
									<div class="bgWhite">
										<label for="f_dinerLargestAtt"><wa:mls>Diner Largest Att.</wa:mls></label>
										<span>${bean.dinerLargestAtt}</span>
									</div>
								</fieldset>
                                <div class="fieldset_clr"></div>
                               	<fieldset>
										<legend align="top"><wa:mls>Services</wa:mls></legend>
										<div class="bgWhite">
										<span>
											<wa:include URI="${site}/reqforproposal/services">
												<wa:param name="reqid" value="${bean.reqid}"/>
											</wa:include>
										</span>
										</div>
									</fieldset>
	                                <div class="fieldset_clr"></div>
								</c:when>
							<c:otherwise>
							
							</c:otherwise>
							</c:choose>
								<div id="containerButton">
									<input type="button" name="cancel" id="cancel" class="cancel" value="<wa:mls>Cancel</wa:mls>"/>
								</div>
							</fieldset>
							
						</form>
					</div>
				</div>

			</div>

			<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
			<script>
				path='${context}/${site}/${module}';
				idName='${bean.reqid}';
			</script>