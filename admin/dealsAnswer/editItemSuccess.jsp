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
          <h2><wa:mls>answerDeals</wa:mls>&nbsp;-&nbsp;
	          <c:if test="${bean==null || bean.id<=0}"><wa:mls>(Add)</wa:mls></c:if>
	         <c:if test="${bean!=null && bean.id>0}"><wa:mls>(Edit)</wa:mls></c:if>
         </h2>
				<div id="list">
					<div id="mask">
						<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
							<fieldset>
								<legend>&nbsp;</legend>
					 
								<c:if test="${bean!=null && bean.id>0  }">
					<div class="bgGrey">
						<label for="f_id"><wa:mls>id</wa:mls></label>
						<span>${bean.id}</span>
						<input name="id" type="hidden" value="${bean.id}"/>
					</div>
					 
				      </c:if>
				      	<div class="bgWhite" id="v_dealsId">
									<label for="f_contentDeals_id"><wa:mls>dealsId</wa:mls></label>
									<textarea name="f_contentDeals_id" class="textfield" >${bean.contentDeals.id}</textarea>
									<div class="textareaRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
	            		             <script type="text/javascript">
							           var v_contentDeals_id = new Spry.Widget.ValidationTextarea("v_contentDeals_id", {minChars:1, maxChars:100,validateOn:["blur","change"]});
						             </script> 
								</div>
								
								
								<div class="bgGrey"id="v_organisme">
									<label for="f_organisme"><wa:mls>organisme</wa:mls></label>
									<textarea name="f_organisme" class="textfield" >${bean.organisme}</textarea>
									<div class="textareaRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
	            		             <script type="text/javascript">
							           var v_organisme = new Spry.Widget.ValidationTextarea("v_organisme", {minChars:1, maxChars:100,validateOn:["blur","change"]});
						             </script> 
								</div>
								<div class="bgWhite"id="v_lastname">
									<label for="f_lastname"><wa:mls>lastName</wa:mls></label>
									<textarea name="f_lastname" class="textfield" >${bean.lastname}</textarea>
									<div class="textareaRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
	            		             <script type="text/javascript">
							           var v_lastname = new Spry.Widget.ValidationTextarea("v_lastname", {minChars:1, maxChars:100,validateOn:["blur","change"]});
						             </script> 
									
								</div>
								<div class="bgGrey" id="v_firstname">
									<label for="f_firstname"><wa:mls>firstName</wa:mls></label>
									<textarea name="f_firstname" class="textfield" >${bean.firstname}</textarea>
									<div class="textareaRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
	            		             <script type="text/javascript">
							           var v_firstname = new Spry.Widget.ValidationTextarea("v_firstname", {minChars:1, maxChars:100,validateOn:["blur","change"]});
						             </script> 
								</div>
								<div class="bgWhite" id="v_phone">
									<label for="f_phone"><wa:mls>phone</wa:mls></label>
									<textarea name="f_phone" class="textfield" >${bean.phone}</textarea>
									<div class="textareaRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
	            		             <script type="text/javascript">
							           var v_phone = new Spry.Widget.ValidationTextarea("v_phone", {minChars:1, maxChars:20,validateOn:["blur","change"]});
						             </script> 
								</div>
								<div class="bgGrey" id="v_email">
									<label for="f_email"><wa:mls>email</wa:mls></label>
									<textarea name="f_email" class="textfield" >${bean.email}</textarea>
									<div class="textareaRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
	            		             <script type="text/javascript">
							           var v_email = new Spry.Widget.ValidationTextarea("v_email", {minChars:1, maxChars:100,validateOn:["blur","change"]});
						             </script> 
								</div>
								 <div class="bgWhite" id="v_info">
									<label for="f_info"><wa:mls>info</wa:mls></label>
									<textarea name="f_info" class="textfield" >${bean.info}</textarea>
								 
								</div>
									<div class="bgGrey"id="v_numParticipant">
									<label for="f_numParticipant"><wa:mls>numParticipant</wa:mls></label>
									<textarea name="f_numParticipant" class="textfield" >${bean.numParticipant}</textarea>
									<div class="textareaRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
	            		             <script type="text/javascript">
							           var v_numParticipant = new Spry.Widget.ValidationTextarea("v_numParticipant", {minChars:1, maxChars:100,validateOn:["blur","change"]});
						             </script> 
								</div>
								<div class="bgWhite"id="v_status">
									<label for="f_status"><wa:mls>status</wa:mls></label>
									 
										 <c:if test="${bean!=null && bean.id>0  }">
										<span>${bean.status}</span>
										 
									     </c:if>
									 
										 <c:if test="${bean==null || bean.id==0  }">
										<span>WAIT</span>
										 
									     </c:if>
									 
								</div>
								<div class="bgGrey"id="v_stay">
									<label for="f_stay" class="label_radio"><wa:mls>Stay :</wa:mls></label>
                                         
                                         
                                             <input name="f_stay" type="radio" value="true" class="radio" <c:if test="${bean.stay == 'true'}">checked="checked"</c:if> />
                                                <wa:mls>oui</wa:mls> 
                                              <input name="f_stay" type="radio" value="false" class="radio"  <c:if test="${bean.stay == 'false'}">checked="checked"</c:if> />
                                              <wa:mls>nom</wa:mls> 
                                          
								               </div> 
								<div class="bgWhite"id="v_optin">
									<label for="f_optin" class="label_radio"><wa:mls>Optin :</wa:mls></label>
                                         
                                         
                                             <input name="f_optin" type="radio" value="true" class="radio" <c:if test="${bean.optin == 'true'}">checked="checked"</c:if> />
                                                <wa:mls>oui</wa:mls> 
                                              <input name="f_optin" type="radio" value="false" class="radio"  <c:if test="${bean.optin == 'false'}">checked="checked"</c:if> />
                                              <wa:mls>nom</wa:mls> 
                                          
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
				idName='${bean.id}';
			</script>

		
