

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
					<wa:mls>NltUserType</wa:mls>&nbsp;-&nbsp;
					<c:if test="${bean!=null && bean.id>0}"><wa:mls>(Edit)</wa:mls></c:if>
				</h2>
				<div id="list">
					<div id="mask">
						<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
							<fieldset>
								<legend>&nbsp;</legend>
								<c:choose>
								<c:when test="${bean!=null && bean.id>0}">
									<div class="bgWhite">
										<label for="f_id"><wa:mls>id</wa:mls></label>
										<input name="id" type="hidden" value="${bean.id}" />
										<span>${bean.id}</span>
									</div>
								
								<div class="bgGrey">
									<label for="f_user"><wa:mls>user</wa:mls></label> 
									 <span><wa:link URI="${site}/user/editItem/id/${bean.user.userId}"> ${bean.user.firstname}&nbsp;${bean.user.lastname}&nbsp;(${bean.user.userId})&nbsp;</wa:link></span>
								</div>
								<div class="bgWhite">
									<label for="f_nltType"><wa:mls>nltType</wa:mls></label> 
									<span><wa:link URI="${site}/nltType/editItem/id/${bean.nltType.id}"> ${bean.nltType.name}&nbsp;</wa:link></span>
								</div>
								<div class="bgGrey">
									<label for="f_value"><wa:mls>value</wa:mls></label>
									<input type="radio" value="1" name="f_value" <c:if test="${bean.value == 1 }">checked="checked"</c:if> /><wa:mls>True</wa:mls>
									<input type="radio" value="0" name="f_value" <c:if test="${bean.value != 1 }">checked="checked"</c:if> /><wa:mls>False</wa:mls>  
								</div>
									<div class="bgWhite">
									<label for="f_optinOn"><wa:mls>Optin on</wa:mls></label>
									<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.optinOn}"/></span>
								</div>
								<div class="bgGrey">
									<label for="f_optoutOn"><wa:mls>Optout on</wa:mls></label>
									<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.optoutOn}"/></span>
								</div>
							</c:when> 
							<c:otherwise>
									<div class="bgWhite">
										<label for="f_user_userId"><wa:mls>user</wa:mls></label> 
                                     	<input name="f_user_userId" id="f_user_userId"  type="text" />
                                     	<span><a href="<wa:url URI="${site}/user/userList/openerField/f_user_userId" />" target="users">Users</a></span>
									</div>
								<div class="bgGrey">
									<label for="f_nltType_id"><wa:mls>nltType</wa:mls></label> 
									<wa:include URI="${site}/dropdown/dropList">
											<wa:param name="class" value="com.bitc.hdata.NltType" />
											<wa:param name="manager" value="com.bitc.hdata.manager.NltTypeManager" />
											<wa:param name="method" value="listAll" />
											<wa:param name="identity" value="id" />
											<wa:param name="display" value="name" />
											<wa:param name="name" value="f_nltType_id" />
										</wa:include>
								</div>
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
				idName='${bean.id}';
			</script>

		
