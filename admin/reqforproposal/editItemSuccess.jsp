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
					<wa:mls>Reqforproposal</wa:mls>&nbsp;-&nbsp;
					<c:if test="${bean!=null && bean.reqid>0}"><wa:mls>(Edit)</wa:mls></c:if>
				</h2>
				<div id="list">
					<div id="mask">
						<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
							<fieldset>
								<legend>&nbsp;</legend>
								<c:choose>
								<c:when test="${bean!=null && bean.reqid>0}">
									<div class="bgGrey">
										<label for="f_reqid"><wa:mls>reqid</wa:mls></label>
										<input name="id" type="hidden" value="${bean.reqid}" />
										<span>${bean.reqid}</span>
									</div>
									<div class="bgWhite">
										<label for="f_status_req"><wa:mls>status</wa:mls></label>
										<c:choose>
										<c:when test="${bean!=null && bean.reqid>0}">
											<select name="f_status_req">
												<option value="0" <c:if test="${bean.status == '0'}">selected="selected"</c:if>>WAIT</option>
												<option value="1" <c:if test="${bean.status == '1'}">selected="selected"</c:if>>ACC</option>
												<option value="2" <c:if test="${bean.status == '2'}">selected="selected"</c:if>>REF</option> 
											</select>
										</c:when>
										<c:otherwise>
											<span>ACC</span>
											<input type="hidden" value="1" name="f_status_req"/>
										</c:otherwise>
										</c:choose>
									</div>
										<div class="bgGrey"> 
										<label for="f_type"><wa:mls>Type</wa:mls></label>
										<c:choose>
											<c:when test="${bean.type eq 'WITHPRO'}">
												<wa:mls>WITHPRO</wa:mls>
											</c:when>
											<c:otherwise>
												<wa:mls>ALONE</wa:mls>
											</c:otherwise>
										</c:choose>
										
															
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
										<textarea name="f_firstname" class="textfield" >${bean.firstname}</textarea>
									</div>
									<div class="bgWhite">
										<label for="f_lastname"><wa:mls>Lastname</wa:mls></label>
										<textarea name="f_lastname" class="textfield" >${bean.lastname}</textarea>
									</div>
									<div class="bgGrey">
										<label for="f_greetings"><wa:mls>Greeting</wa:mls></label> 
										<select name="f_greetings">
											<option value="M" <c:if test="${bean.greetings=='M'}">selected="selected"</c:if>><wa:mls>M</wa:mls></option>
											<option value="Mme" <c:if test="${bean.greetings=='Mme'}">selected="selected"</c:if>><wa:mls>Mme</wa:mls></option>
											<option value="Mlle" <c:if test="${bean.greetings=='Mlle'}">selected="selected"</c:if>><wa:mls>Mlle</wa:mls></option>
										</select>
				    				</div>
				    				
				    				<div class="bgWhite">
										<label for="f_lg"><wa:mls> Langue</wa:mls></label>
										<wa:include URI="admin/dropdown/dropListCulture">
											<wa:param name="excludeBE" value="1" />
											<wa:param name="name" value="f_lg" />
											<wa:param name="choiceMsg" value="Choose the culture" />
											<wa:param name="selectedValues" value="${fn:toLowerCase(bean.lg)}" />
										</wa:include>
									</div>
									<div class="bgGrey">
										<label for="f_address"><wa:mls>Address</wa:mls></label>
										<textarea name="f_address" class="textfield" >${bean.address}</textarea>
									</div>
									<div class="bgWhite">
										<label for="f_zip"><wa:mls>Zipcode</wa:mls></label>
										<textarea name="f_zip" class="textfield" >${bean.zip}</textarea>
									</div>
									<div class="bgGrey">
										<label for="f_city"><wa:mls>City</wa:mls></label>
										<textarea name="f_city" class="textfield" >${bean.city}</textarea>
									</div>
									<div class="bgWhite">
										<label for="f_country"><wa:mls>Country</wa:mls></label>
										<textarea name="f_country" class="textfield" >${bean.country}</textarea>
									</div>
									<div class="bgGrey">
										<label for="f_state"><wa:mls>State</wa:mls></label>
										<textarea name="f_state" class="textfield" >${bean.state}</textarea>
									</div>
									<div class="bgWhite">
										<label for="f_phone"><wa:mls>Phone</wa:mls></label>
										<textarea name="f_phone" class="textfield" >${bean.phone}</textarea>
									</div>
									<div class="bgGrey">
										<label for="f_email"><wa:mls>Email</wa:mls></label>
										<textarea name="f_email" class="textfield" >${bean.email}</textarea>
									</div>
									<div class="bgWhite">
										<label for="f_company"><wa:mls>Company</wa:mls></label>
										<textarea name="f_company" class="textfield" >${bean.company}</textarea>
									</div>
									<div class="bgGrey">
										<label for="f_url"><wa:mls>URL</wa:mls></label>
										<textarea name="f_url" class="textfield" >${bean.url}</textarea>
									</div>
									<div class="bgWhite">
										<label for="f_position"><wa:mls>Position</wa:mls></label>
										<textarea name="f_position" class="textfield" >${bean.position}</textarea>
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
									
							
								</fieldset>
                                <div class="fieldset_clr"></div>
								<fieldset>
									<legend align="top"><wa:mls>Meeting</wa:mls></legend>
									<div class="bgWhite">
										<label for="f_meetingName"><wa:mls>Meeting Name</wa:mls></label>
										<textarea name="f_meetingName" class="textfield" >${bean.meetingName}</textarea>
									</div>
									<div class="bgGrey">
										<label for="f_meetingType"><wa:mls>Meeting Type</wa:mls></label>
										<select name="f_meetingType" id="f_meetingType">
	         <option value=""><wa:mls>Choisissez</wa:mls></option>
	         <option value="conf" <c:if test="${bean.meetingType == 'conf'}">selected="selected"</c:if>><wa:mls>Conference-Meeting</wa:mls></option>
	         <option value="exhib" <c:if test="${bean.meetingType == 'exhib'}">selected="selected"</c:if>><wa:mls>Exhibition</wa:mls></option>
	         <option value="incent" <c:if test="${bean.meetingType == 'incent'}">selected="selected"</c:if>><wa:mls>Incentive travel</wa:mls></option>
	         <option value="inter" <c:if test="${bean.meetingType == 'inter'}">selected="selected"</c:if>><wa:mls>International convention</wa:mls></option>
	         <option value="product" <c:if test="${bean.meetingType == 'product'}">selected="selected"</c:if>><wa:mls>Product launch</wa:mls></option>
	         <option value="staff" <c:if test="${bean.meetingType == 'staff'}">selected="selected"</c:if>><wa:mls>Staff meeting - Special Event</wa:mls></option>
	         <option value="travel" <c:if test="${bean.meetingType == 'travel'}">selected="selected"</c:if>><wa:mls>Business-Travel</wa:mls></option>
	          <option value="convCongr" <c:if test="${bean.meetingType == 'convCongr'}">selected="selected"</c:if>><wa:mls>Convention/Congress</wa:mls></option>
	         <option value="corpMeet" <c:if test="${bean.meetingType == 'corpMeet'}">selected="selected"</c:if>><wa:mls>Corporate Meeting</wa:mls></option>

	         <option value="other" <c:if test="${bean.meetingType == 'other'}">selected="selected"</c:if>><wa:mls>Other</wa:mls></option>
	       </select>     
										
									</div>
								
									<div class="bgGrey">
										<label for="f_prefArrivaldate"><wa:mls>Date d'arrivée</wa:mls></label>
										<textarea name="f_prefArrivaldate" class="textfield" ><c:choose><c:when test="${not empty bean.prefArrivaldate}">${bean.prefArrivaldate}</c:when><c:otherwise>${bean.dinerDate}</c:otherwise></c:choose></textarea>
									</div>
									<div class="bgWhite">
										<label for="f_prefDepartdate"><wa:mls>Date de retour</wa:mls></label>
										<textarea name="f_prefDepartdate" class="textfield" >${bean.prefDepartdate}</textarea>
									</div>
									<div class="bgGrey">
										<label for="f_altArrivaldate"><wa:mls>Autre Date d'arrivée</wa:mls></label>
										<textarea name="f_altArrivaldate" class="textfield" >${bean.altArrivaldate}</textarea>
									</div>
									<div class="bgWhite">
										<label for="f_altDepartdate"><wa:mls>Autre date de retour</wa:mls></label>
										<textarea name="f_altDepartdate" class="textfield" >${bean.altDepartdate}</textarea>
									</div>
									<div class="bgGrey">
										<label for="f_flexDate"><wa:mls>Dates Flexible:</wa:mls></label>
										<input type="radio" value="0" name="f_flexDate" <c:if test="${bean.flexDate==false}">checked="checked"</c:if>/><wa:mls>No</wa:mls>
										<input type="radio" value="1" name="f_flexDate" <c:if test="${bean.flexDate==true}">checked="checked"</c:if>/><wa:mls>Yes</wa:mls>
									</div>
									<div class="bgWhite">
										<label for="f_largestAttendance"><wa:mls>Nombre de personne(s)</wa:mls></label>
										<textarea name="f_largestAttendance" class="textfield" ><c:choose><c:when test="${not empty bean.largestAttendance}">${bean.largestAttendance}</c:when><c:otherwise>${bean.largestRoom}</c:otherwise></c:choose></textarea>
									</div>
									<div class="bgGrey">
										<label for="f_numAccPersons"><wa:mls>Nombre de personne(s) accompagnante(s)</wa:mls></label>
										<textarea name="f_numAccPersons" class="textfield" >${bean.numAccPersons}</textarea>
									</div>
									<div class="bgWhite">
										<label for=f_budget><wa:mls>Approximate budget per person per day </wa:mls></label>
										<textarea name="f_budget" class="textfield" >${bean.budget}</textarea>
									</div>
									<div class="bgGrey">
										<label for="f_venueType"><wa:mls>Venue Type</wa:mls></label>
										 <select name="f_venueType" id="f_venueType">
	         <option value=""><wa:mls>Choisissez</wa:mls></option>
	         <option value="CONF_CENT" <c:if test="${bean.venueType == 'CONF_CENT'}">selected="selected"</c:if>><wa:mls>Conference centre</wa:mls></option>
	         <option value="HOTEL" <c:if test="${bean.venueType == 'HOTEL'}">selected="selected"</c:if>><wa:mls>Hotel Meeting and Conference Facility</wa:mls></option>
	         <option value="HALL_THEAT" <c:if test="${bean.venueType == 'HALL_THEAT'}">selected="selected"</c:if>><wa:mls>Exhibition hall/Theatre</wa:mls></option>
	         <option value="AUDITORIUM" <c:if test="${bean.venueType == 'AUDITORIUM'}">selected="selected"</c:if>><wa:mls>Auditorium</wa:mls></option>
	         <option value="MUSEUM" <c:if test="${bean.venueType == 'MUSEUM'}">selected="selected"</c:if>><wa:mls>Museum</wa:mls></option>
	         <option value="HIS_HOUSES_AND_STES" <c:if test="${bean.venueType == 'HIS_HOUSES_AND_STES'}">selected="selected"</c:if>><wa:mls>Historic Houses and sites</wa:mls></option>
	         <option value="CULT_CENTER" <c:if test="${bean.venueType == 'CULT_CENTER'}">selected="selected"</c:if>><wa:mls>Cultural centers</wa:mls></option>
	         <option value="CHURCH" <c:if test="${bean.venueType == 'CHURCH'}">selected="selected"</c:if>><wa:mls>Churches</wa:mls></option>
	         <option value="SPORT_CENTER" <c:if test="${bean.venueType == 'SPORT_CENTER'}">selected="selected"</c:if>><wa:mls>Sports Centers</wa:mls></option>
	         <option value="CASTLE" <c:if test="${bean.venueType == 'CASTLE'}">selected="selected"</c:if>><wa:mls>Castles</wa:mls></option>
	         <option value="OTHER" <c:if test="${bean.venueType == 'OTHER'}">selected="selected"</c:if>><wa:mls>Other</wa:mls></option>
	       </select>     
									</div>
									<div class="bgWhite">
										<label for="f_venueTypeother"><wa:mls>Other Venue Type</wa:mls></label>
										<textarea name="f_venueTypeother" class="textfield" >${bean.venueTypeother}</textarea>
									</div>
									<div class="bgGrey">
										<label for="f_numRooms"><wa:mls>Nombre de salles de réunion </wa:mls></label>
										<textarea name="f_numRooms" class="textfield" >${bean.numRooms}</textarea>
									</div>
									
									<div class="bgWhite">
										<label for="f_exhibSpace"><wa:mls>Exhib Space:</wa:mls> (m²)</label>
										<textarea name="f_exhibSpace" class="textfield" >${bean.exhibSpace}</textarea>
									</div>
									<div class="bgGrey">
										<label for="f_numBreakrooms"><wa:mls>Nombre de salles pour les sous-commissions :</wa:mls></label>
										<textarea name="f_numBreakrooms" class="textfield" >${bean.numBreakrooms}</textarea>
									</div>

									<div class="bgWhite">
										<label for="f_catering"><wa:mls>Catering:</wa:mls></label>
										<input type="radio" value="0" name="f_catering" <c:if test="${bean.catering== false}">checked="checked"</c:if>/><wa:mls>No</wa:mls>
										<input type="radio" value="1" name="f_catering" <c:if test="${bean.catering== true}">checked="checked"</c:if>/><wa:mls>Yes</wa:mls>
									</div>
									<div class="bgGrey">
										<label for="f_translation"><wa:mls>Translation</wa:mls></label>
										<input type="radio" value="0" name="f_translation" <c:if test="${bean.translation== false}">checked="checked"</c:if>/><wa:mls>No</wa:mls>
										<input type="radio" value="1" name="f_translation" <c:if test="${bean.translation== true}">checked="checked"</c:if>/><wa:mls>Yes</wa:mls>
									</div>									
									</fieldset>
									
                                <div class="fieldset_clr"></div>
								<fieldset>
									<legend align="top"><wa:mls>Hotel</wa:mls></legend>
									<div class="bgWhite">
										<label for="f_hotelLocation"><wa:mls>Hotel location</wa:mls></label>
										<select name="f_hotelLocation" id="f_chotelLocation">
		         <option value=""><wa:mls>Choisissez</wa:mls></option>
		         <option value="BXL" <c:if test="${bean.hotelLocation == 'BXL'}">selected="selected"</c:if>><wa:mls>Bruxelles/Brussel</wa:mls></option>
		         <option value="CINQ" <c:if test="${bean.hotelLocation == 'CINQ'}">selected="selected"</c:if>><wa:mls>EEC district</wa:mls></option>
		         <option value="LOUISE" <c:if test="${bean.hotelLocation == 'LOUISE'}">selected="selected"</c:if>><wa:mls>Quartier Louise/Louiza wijk</wa:mls></option>
		         <option value="HEYSEL" <c:if test="${bean.hotelLocation == 'HEYSEL'}">selected="selected"</c:if>><wa:mls>Heysel/Heizel</wa:mls></option>
		         <option value="GAREMIDI" <c:if test="${bean.hotelLocation == 'GAREMIDI'}">selected="selected"</c:if>><wa:mls>Gare de Bruxelles Midi/Wijk station Brussel-Zuid</wa:mls></option>
		         <option value="AIRPORT" <c:if test="${bean.hotelLocation == 'AIRPORT'}">selected="selected"</c:if>><wa:mls>Airport</wa:mls></option>    
		         <option value="BRABANT" <c:if test="${bean.hotelLocation == 'BRABANT'}">selected="selected"</c:if>><wa:mls>Brabant</wa:mls></option>
		       </select>     
									</div>
									<div class="bgGrey">
										<label for="f_hotelNumrooms"><wa:mls>Nombre de chambres requises</wa:mls></label>
										<textarea name="f_hotelNumrooms" class="textfield" >${bean.hotelNumrooms}</textarea>
									</div>
									<div class="bgWhite">
										<label for="f_hotelStars"><wa:mls>Catégorie de votre Hotel</wa:mls></label>
										<input type="checkbox"<c:if test="${fn:contains(bean.hotelStars,'1')}"> checked="checked"</c:if> value="1" name="f_hotelStars"/><wa:mls>1*</wa:mls>
			 							<input type="checkbox"<c:if test="${fn:contains(bean.hotelStars,'2')}"> checked="checked"</c:if> value="2" name="f_hotelStars"/><wa:mls>2*</wa:mls>
										<input type="checkbox"<c:if test="${fn:contains(bean.hotelStars,'3')}"> checked="checked"</c:if> value="3" name="f_hotelStars"/><wa:mls>3*</wa:mls>
										<input type="checkbox"<c:if test="${fn:contains(bean.hotelStars,'4')}"> checked="checked"</c:if> value="4" name="f_hotelStars"/><wa:mls>4*</wa:mls>
										<input type="checkbox"<c:if test="${fn:contains(bean.hotelStars,'5')}"> checked="checked"</c:if> value="5" name="f_hotelStars"/><wa:mls>5*</wa:mls>
									</div>
									<div class="bgGrey"> 
										<label for="f_status"><wa:mls>Hotel with meeting rooms</wa:mls></label>
										<input type="radio" value="0" name="f_hotelWithMeetingrooms" <c:if test="${bean.hotelWithMeetingrooms==0}">checked="checked"</c:if>/><wa:mls>No</wa:mls>
										<input type="radio" value="1" name="f_hotelWithMeetingrooms" <c:if test="${bean.hotelWithMeetingrooms==1}">checked="checked"</c:if>/><wa:mls>Yes</wa:mls>
									</div>
									<div class="bgWhite">
										<label for="f_overnightStay"><wa:mls>With overnight stay:</wa:mls></label>
										<input type="radio" value="0" name="f_overnightStay" <c:if test="${bean.overnightStay==false}">checked="checked"</c:if>/><wa:mls>No</wa:mls>
										<input type="radio" value="1" name="f_overnightStay" <c:if test="${bean.overnightStay==true}">checked="checked"</c:if>/><wa:mls>Yes</wa:mls>
									</div>
								</fieldset>
                                <div class="fieldset_clr"></div>
								<fieldset>
									<legend align="top"><wa:mls>Venue</wa:mls></legend>
									
									<div class="bgWhite">
										<label for="f_specialvenue"><wa:mls>Special Venue</wa:mls></label>
										<input type="radio" value="0" name="f_specialvenue" <c:if test="${bean.specialvenue==0}">checked="checked"</c:if>/><wa:mls>No</wa:mls>
										<input type="radio" value="1" name="f_specialvenue" <c:if test="${bean.specialvenue==1}">checked="checked"</c:if>/><wa:mls>Yes</wa:mls>
									</div>
									
									<div class="bgWhite">
										<label for="f_venueConfig"><wa:mls>Venue Config</wa:mls></label>
										<textarea name="f_venueConfig" class="textfield" >${bean.venueConfig}</textarea>
									</div>
									<div class="bgGrey">
										<label for="f_venueLocation"><wa:mls>Venue Location</wa:mls></label>
										<textarea name="f_venueLocation" class="textfield" >${bean.venueLocation}</textarea>
									</div>
									
								</fieldset>
                                <div class="fieldset_clr"></div>
								<fieldset>
									<legend align="top"><wa:mls>Restaurant</wa:mls></legend>
									<div class="bgWhite">
										<label for="f_dinner"><wa:mls>Dinner</wa:mls></label>
										<input type="radio" value="0" name="f_dinner" <c:if test="${bean.dinner== 0}">checked="checked"</c:if>/><wa:mls>No</wa:mls>
										<input type="radio" value="1" name="f_dinner" <c:if test="${bean.dinner== 1}">checked="checked"</c:if>/><wa:mls>Yes</wa:mls>
									</div>
									<div class="bgGrey">
										<label for="f_dinerDate"><wa:mls>Diner Date</wa:mls></label>
										<textarea name="f_dinerDate" class="textfield" >${bean.dinerDate}</textarea>
									</div>
									<div class="bgWhite">
										<label for="f_dinerLargestAtt"><wa:mls>Diner Largest Att.</wa:mls></label>
										<textarea name="f_dinerLargestAtt" class="textfield" >${bean.dinerLargestAtt}</textarea>
									</div>
								</fieldset>
                                <div class="fieldset_clr"></div>
                                <fieldset>
									<legend align="top"><wa:mls>Programme</wa:mls></legend>
									<div class="bgWhite">
										<label for="f_dayexcursion"><wa:mls>Jour(s) d'excursion</wa:mls></label>
										<textarea name="f_dayexcursion" class="textfield" >${bean.dayexcursion}</textarea>
									</div>
									
									
									<div class="bgWhite">
										<label for="f_cocktail"><wa:mls>Cocktail:</wa:mls></label>
										<input type="radio" value="0" name="f_cocktail" <c:if test="${bean.cocktail==0}">checked="checked"</c:if>/><wa:mls>No</wa:mls>
										<input type="radio" value="1" name="f_cocktail" <c:if test="${bean.cocktail==1}">checked="checked"</c:if>/><wa:mls>Yes</wa:mls>
									</div>
									
									
									<div class="bgGrey">
										<label for="f_citytour"><wa:mls>Tour de ville</wa:mls></label>
										<input type="radio" value="0" name="f_citytour" <c:if test="${bean.citytour==0}">checked="checked"</c:if>/><wa:mls>No</wa:mls>
										<input type="radio" value="1" name="f_citytour" <c:if test="${bean.citytour==1}">checked="checked"</c:if>/><wa:mls>Yes</wa:mls>
									</div>
									
									<div class="bgWhite">
										<label for="f_organisationType"><wa:mls>Organisation Type</wa:mls></label>
										<textarea name="f_organisationType" class="textfield" >${bean.organisationType}</textarea>
									</div>
									<div class="bgWhite">
										<label for="f_transport"><wa:mls>Transport</wa:mls></label>
										<input type="radio" value="0" name="f_transport" <c:if test="${bean.transport==0}">checked="checked"</c:if>/><wa:mls>No</wa:mls>
										<input type="radio" value="1" name="f_transport" <c:if test="${bean.transport==1}">checked="checked"</c:if>/><wa:mls>Yes</wa:mls>
									</div>
									<div class="bgGrey">
										<label for="f_wanthelpfrom"><wa:mls>Want Help From</wa:mls></label>
										<textarea name="f_wanthelpfrom" class="textfield" >${bean.wanthelpfrom}</textarea>
									</div>
									<div class="bgWhite">
										<label for="f_infos"><wa:mls>Informations</wa:mls></label>
										<textarea name="f_infos" class="textfield" >${bean.infos}</textarea>
									</div>
									<div class="bgGrey">
										<label for="f_socialProgram"><wa:mls>Social Program:</wa:mls></label>
										<input type="radio" value="0" name="f_socialProgram" <c:if test="${bean.socialProgram==false}">checked="checked"</c:if>/><wa:mls>No</wa:mls>
										<input type="radio" value="1" name="f_socialProgram" <c:if test="${bean.socialProgram==true}">checked="checked"</c:if>/><wa:mls>Yes</wa:mls>
									</div>
								</fieldset>
								    <div class="fieldset_clr"></div>
                                <c:choose>
                                <c:when test="${bean.type eq 'WITHPRO'}">
	                                <fieldset>
										<legend align="top"><wa:mls>Pro Planner</wa:mls></legend>
										<div class="bgWhite">
											<wa:include URI="${site}/reqforproposal/proPlannerList">
												<wa:param name="reqid" value="${bean.reqid}"/>
											</wa:include>
										</div>
										<div class="fieldset_clr"></div>
									</fieldset>
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
									<fieldset>
									<legend align="top"><wa:mls>Meeting Planner</wa:mls></legend>
									<div class="bgWhite">
										<wa:include URI="${site}/reqforproposal/meetingPlannerList">
											<wa:param name="reqid" value="${bean.reqid}"/>
										</wa:include>
									</div>
								</fieldset>
								</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
							
							</c:otherwise>
							</c:choose>
							
								
								<div id="containerButton">
									<input type="button" name="cancel" id="cancel" class="cancel" value="<wa:mls>Cancel</wa:mls>"/>
									<input type="submit" name="submit" class="submit" value="<wa:mls>Enregistrer</wa:mls>"/>
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