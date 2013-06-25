<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="box_login">
	<c:choose>
		<c:when test="${user.loginStatus eq 'NOT LOGGED'}">
	  		<div id="login">
	  			<a href="<wa:url URI="${site}/user/displaySubscribe"></wa:url>" class="subscribe"><wa:mls>Register</wa:mls></a>
      			<a href="<wa:url URI="${site}/user/displayLogin"></wa:url>" class="login"><wa:mls>Login</wa:mls></a>
	      	</div>
	      	<fb:login-button perms="email,user_birthday,publish_stream" onlogin="log_user()"></fb:login-button>
	     	<div class="clr"></div>
	   	</c:when>
	   	<c:otherwise>
	   	 	<div id="login">
	   	 		<a href="<wa:url URI="${site}/user/displayModify"></wa:url>" class="subscribe"><wa:mls>Modify</wa:mls></a>
      			<a id="logOutButton" href="javascript:log_out_user()" class="logout"><wa:mls>Logout</wa:mls></a>
	   	 	</div>
	   	 	<p style="margin-bottom:25px;"><br /></p>
	   	</c:otherwise>
	   	</c:choose>   
	
</div>
<script type="text/javascript"> 

function log_user() {
	//alert("begin log_user");
	window.location = "${context}/${site}/user/doFacebookLogin.do" ;
}

/*function log_out_user() {
	FB.logout(function(response) {
        console.log(response.status);
		window.location = '<wa:url URI="${site}/user/doLogout"></wa:url>' ;
    });

}*/

function log_out_user(response) {
    //if we dont have a session (which means the user has been logged out, redirect the user)
    if (!response.session) {
        window.location = '<wa:url URI="${site}/user/doLogout"></wa:url>';
        return;
    }

    //if we do have a non-null response.session, call FB.logout(),
    //the JS method will log the user out of Facebook and remove any authorization cookies
    FB.logout(handleSessionResponse);
}


</script>

   
