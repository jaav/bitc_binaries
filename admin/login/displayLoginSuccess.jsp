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
<h2>Login</h2>
<div id="mask">
	<form name="loginForm" id="loginForm" action="${context}/${site}/login/doLogin.do" method="post" onKeyDown="if (event.keyCode==13) {document.form.submit();}">
    	<fieldset>
          <legend><wa:mls>Login</wa:mls></legend>
          <div class="mt20">
            <label for="f_name"><wa:mls>Login</wa:mls> :</label>
            <input name="f_login" id="f_login" type="text" value="" />
            <label for="f_description"><wa:mls>Password</wa:mls> :</label>
            <input name="f_password" id="f_password" type="password" value="" />
          </div>
          <c:if test="${msg != null}">
          	<div class="errorText">${msg}</div>
          </c:if>
        </fieldset>
        <input type="submit" name="submit" class="submit" value="<wa:mls>Envoyer</wa:mls>" />
    </form>
</div> 
<script>
path='${context}/${site}/${module}';
</script>
</div>