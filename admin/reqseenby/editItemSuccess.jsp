

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
										<input name="reqid" type="hidden" value="${bean.reqid}" />
										<span>${bean.reqid}</span>
									</div>
								
								<fieldset>
									<legend align="top"><wa:mls>User informations</wa:mls></legend>
									<div class="bgGrey">
										<label for="f_firstname"><wa:mls>Firstname</wa:mls></label>
										<textarea name="f_firstname" class="textfield" >${bean.firstname}</textarea>
									</div>
									<div class="bgWhite">
										<label for="f_lastname"><wa:mls>Lastname</wa:mls></label>
										<textarea name="f_lastname" class="textfield" >${bean.lastname}</textarea>
									</div>
									<div class="bgGrey">
										<label for="f_phone"><wa:mls>Phone</wa:mls></label>
										<textarea name="f_phone" class="textfield" >${bean.phone}</textarea>
									</div>
									<div class="bgWhite">
										<label for="f_zipcode"><wa:mls>Zipcode</wa:mls></label>
										<textarea name="f_zipcode" class="textfield" >${bean.zip}</textarea>
									</div>
									<div class="bgGrey">
										<label for="f_city"><wa:mls>City</wa:mls></label>
										<textarea name="f_city" class="textfield" >${bean.city}</textarea>
									</div>
									<div class="bgWhite">
										<label for="f_country"><wa:mls>Country</wa:mls></label>
										<textarea name="f_country" class="textfield" >${bean.country}</textarea>
									</div>
								</fieldset>
							</c:when>
							<c:otherwise>
							
							</c:otherwise>
							</c:choose>
								<div class="bgGrey">
									<label for="f_status"><wa:mls>status</wa:mls></label>
									<c:choose>
									<c:when test="${bean!=null && bean.reqid>0}">
									<select name="f_status">
										<c:if test="${bean.status == '0'}">
											<option value="1" <c:if test="${bean.status == '0'}">selected="selected"</c:if>>ACC</option>
										</c:if>
										<c:if test="${bean.status == 2}">
										<option value="1" <c:if test="${bean.status == '1'}">selected="selected"</c:if>>ACC</option>
										</c:if>
										<option value="2" <c:if test="${bean.status == '2'}">selected="selected"</c:if>>REF</option>
										 
									</select>
									</c:when>
									<c:otherwise>
										<span>ACC</span>
										<input type="hidden" value="1" name="f_status"/>
									</c:otherwise>
									</c:choose>
								</div>
								
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

		
