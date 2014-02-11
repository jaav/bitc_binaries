<%@ page 
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
isELIgnored ="false"
%>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<div id="record">
    	<h1>Profile</h1>
    	<div id="recordcontainer">
			<form name="form" action="${context}/admin/adminusersprofiles/saveItem.do" method="post">
				<input name="id" type="hidden" value="${bean.id}"/>
				<input name="userid" type="hidden" value="${bean.adminuserid != null ? bean.adminuserid : waParam.userid}"/>
				<div class="part">
					<fieldset>

						<div class="label">Id</div>
						<div class="value">${bean.id}&nbsp;</div>
						<br/>
						
						<label for="f_adminuserid">Userid</label>
						<input name="f_adminuserid" id="f_adminuserid" type="text" value="${bean.adminuserid != null ? bean.adminuserid : waParam.userid}"/>
						<br/>	

						<label for="f_profile">Profile</label>
						<input name="f_profile" id="f_profile" type="text" value="${bean.profile}"/>
						<br/>																												

					</fieldset>
				</div>
			</form>
		    <div class="blackbtncontainer">
			    <div class="blackbtnleft"></div>
			    <div class="blackbtn"><a href="javascript:document.form.submit()">Save</a></div>
			    <div class="blackbtnright"></div>
			    <div class="clearBoth"/>
			</div>
		</div>
	</div>
				