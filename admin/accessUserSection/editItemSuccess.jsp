

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
					<wa:mls>AccessUserSection</wa:mls>&nbsp;-&nbsp;
					<c:if test="${bean!=null && bean.id>0}"><wa:mls>(Edit)</wa:mls></c:if>
				</h2>
				<div id="list">
					<div id="mask">
						<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
							<fieldset>
								<legend>&nbsp;</legend>
								<c:choose>
								<c:when test="${bean!=null && bean.id>0}">
									<div class="bgGrey">
										<label for="f_id"><wa:mls>id</wa:mls></label>
										<input name="id" type="hidden" value="${bean.id}" />
										<span>${bean.id}</span>
									</div>
								
								<div class="bgWhite">
									<label for="f_user"><wa:mls>user</wa:mls></label> 
									 <span><wa:link URI="${site}/user/editItem/id/${bean.user.userId}"> ${bean.user.firstname}&nbsp;${bean.user.lastname}&nbsp;(${bean.user.userId})&nbsp;</wa:link></span>
									 <input name="userId" type="hidden" value="${bean.user.userId}" />
								</div>
								<div class="bgGrey">
									<label for="f_userComment"><wa:mls>userStatus</wa:mls></label>
									<span>${bean.user.status}</span>
								</div>	
								<div class="bgWhite">
									<label for="f_accessSection"><wa:mls>accessSection</wa:mls></label> 
									<span><wa:link URI="${site}/accessSection/editItem/id/${bean.accessSection.id}"> ${bean.accessSection.name}&nbsp;</wa:link></span>
									<input name="accessSectionId" type="hidden" value="${bean.accessSection.id}" />
								</div>
								
								<div class="bgGrey">
									<label for="f_userComment"><wa:mls>userComment</wa:mls></label>
									<span>${bean.userComment}</span>
								</div>	
							</c:when>
							<c:otherwise>
									<div class="bgWhite">
										<label for="f_user_userId"><wa:mls>user</wa:mls></label> 
                                     	<input name="f_user_userId" id="f_user_userId"  type="text" />
                                     	<span><a href="<wa:url URI="${site}/user/userList/openerField/f_user_userId" />" target="users">Users</a></span>
									</div>
								<div class="bgGrey">
									<label for="f_accessSection_id"><wa:mls>accessSection</wa:mls></label> 
									<wa:include URI="${site}/dropdown/dropList">
											<wa:param name="class" value="com.bitc.hdata.AccessSection" />
											<wa:param name="manager" value="com.bitc.hdata.manager.AccessSectionManager" />
											<wa:param name="method" value="listAll" />
											<wa:param name="identity" value="id" />
											<wa:param name="display" value="name" />
											<wa:param name="name" value="f_accessSection_id" />
										</wa:include>
								</div>
							</c:otherwise>
							</c:choose>
								<div class="bgWhite">
									<label for="f_adminComment"><wa:mls>adminComment</wa:mls></label>
									<textarea name="f_adminComment" class="textfield" >${bean.adminComment}</textarea>
								</div>
								<div class="bgGrey">
									<label for="f_status"><wa:mls>status</wa:mls></label>
									<c:choose>
									<c:when test="${bean!=null && bean.id>0}">
									<select name="f_status">
										<c:if test="${bean.status == 'WAIT'}">
											<option value="WAIT" <c:if test="${bean.status == 'WAIT'}">selected="selected"</c:if>>WAIT</option>
										</c:if>
										<c:if test="${bean.user.status == 1}">
										<option value="ACC" <c:if test="${bean.status == 'ACC'}">selected="selected"</c:if>>ACC</option>
										</c:if>
										<option value="REF" <c:if test="${bean.status == 'REF' && bean.user.status == 1}">selected="selected"</c:if>>REF</option>
										 
									</select>
									</c:when>
									<c:otherwise>
										<span>ACC</span>
										<input type="hidden" value="ACC" name="f_status"/>
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
				idName='${bean.id}';
			</script>

		
