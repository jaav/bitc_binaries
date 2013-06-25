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
    	<h1>User</h1>
    	<div id="recordcontainer">
			<form name="form" action="${context}/admin/adminusers/saveItem.do" method="post">
				<input name="id" type="hidden" value="${bean.userid}"/>
				<div class="part">
					<fieldset>

						<div class="label">Id</div>
						<div class="value">${bean.userid}&nbsp;</div>
						<br/>

						<label for="f_login">Login</label>
						<input name="f_login" id="f_login" type="text" value="${bean.login}"/>
						<br/>

						<label for="f_password">Password</label>
						<input name="f_password" id="f_password" type="text" value="${bean.password}"/>
						<br/>
						
						<label for="f_email">Email</label>
						<input name="f_email" id="f_email" type="text" value="${bean.email}"/>
						<br/>
						
						<label for="f_firstname">Firstname</label>
						<input name="f_firstname" id="f_firstname" type="text" value="${bean.firstname}"/>
						<br/>
						
						<label for="f_lastname">Lastname</label>
						<input name="f_lastname" id="f_lastname" type="text" value="${bean.lastname}"/>
						<br/>	
						
						<label for="f_greeting">Greeting</label>
						<input name="f_greeting" id="f_greeting" type="text" value="${bean.greeting}"/>
						<br/>	
						
						<label for="f_languageid">Languageid</label>
						<input name="f_languageid" id="f_languageid" type="text" value="${bean.languageid}"/>
						<br/>
						
						<label for="f_origin">Origin</label>
						<input name="f_origin" id="f_origin" type="text" value="${bean.origin}"/>
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
				