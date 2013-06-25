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
    	<h1>Ressource</h1>
    	<div id="recordcontainer">
			<form name="form" action="${context}/admin/adminressources/saveItem.do" method="post">
				<input name="id" type="hidden" value="${bean.id}"/>
				<div class="part">
					<fieldset>

						<div class="label">Id</div>
						<div class="value">${bean.id}&nbsp;</div>
						<br/>

						<label for="f_ressource">Ressource</label>
						<input name="f_ressource" id="f_ressource" type="text" value="${bean.ressource}"/>
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
				