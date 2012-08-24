<%@ page 
language="java"
contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ page import="java.util.*,com.activeidea.utils.ws.*"%>
	<%Date date = new java.util.Date();
session.setAttribute("dateSys", date);%>



<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<title><wa:mls>Administration - BITC</wa:mls></title>
<!-- stylesheets-->
<link href="${static}/${site}/css/main.css" rel="stylesheet" type="text/css" media="screen" />
<link href="${static}/${site}/css/datepicker.css" rel="stylesheet" type="text/css" media="screen" />
<link href="${static}/${site}/css/print.css" rel="stylesheet" type="text/css" media="print" />
<link href="${static}/${site}/css/SpryValidationTextarea.css" rel="stylesheet" type="text/css" media="screen" />
<link href="${static}/${site}/css/SpryValidationSelect.css" rel="stylesheet" type="text/css" media="screen" />
<link href="${static}/${site}/css/SpryValidationTextField.css" rel="stylesheet" type="text/css" media="screen" />
<link href="${static}/${site}/css/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
<!-- javascripts -->
<script type="text/javascript" src="${static}/${site}/js/mootools.js"></script>
<script type="text/javascript" src="${static}/${site}/js/datepicker.js"></script>
<script type="text/javascript" src="${static}/${site}/js/menu.js"></script>	
<script type="text/javascript" src="${static}/${site}/js/ajaxDropdown.js"></script>
<script type="text/javascript" src="${static}/${site}/js/waFunctions.js"></script>
<script type="text/javascript" src="${static}/${site}/js/initialize.js"></script>
<script type="text/javascript" src="${static}/${site}/js/actionsEditCms.js"></script>
<script type="text/javascript" src="${static}/${site}/js/SpryValidationTextarea.js"></script>
<script type="text/javascript" src="${static}/${site}/js/SpryValidationTextField.js"></script>
<script type="text/javascript" src="${static}/${site}/js/SpryValidationSelect.js"></script>


<script src="${static}/${site}/js/SpryTabbedPanels.js" type="text/javascript"></script>
<script language='javascript'>
	var context = '${context}'; 
</script>
</head>
<body id="body"> 
<!--flying helpbox:start-->
<div id="help">
	<div class="header">
		<h3><wa:mls>Help</wa:mls></h3>
        <div id="helpclose"></div>
	</div>
	<div class="content">
		${help}
	</div>
</div>
<!--flying helpbox:end-->
<!--wrapper:start-->
<div id="wrapper">
<!--header:start-->
	<div id="header">
    	<div id="pageTitle"><wa:mls><span class="blueText">BITC</span> Administrator</wa:mls></div>
    	<div id="logoCustomer">
    		 <!-- 
    		<a href="#" target="_blank"><img src="${static}/${site}/img/logo_brico.gif"   alt="Logo Brico Local Site" /></a>
    		 -->
    	</div>
    	<ul id="headerTools">
    		<c:if test="${help != null}">
        		<li id="helpBtnTop"><a href="#" id="helpBtn"><wa:mls>Help</wa:mls></a></li>
        	</c:if>      	
 ${ac_user_admin}
  Size: <%=AppMain.getInstance().getProperties().size()%>
         	
        	<c:if test="${ac_user_admin != null}">
				<li><a href="${context}/${site}/acxUser/editItem/id/${ac_user_admin.userid}.do" title="<wa:mls>Edit profile</wa:mls>">${ac_user_admin.firstname}&nbsp;${ac_user_admin.lastname}</a></li>
        		<li id="logoutBtnTop"><a href="${context}/${site}/login/doLogout.do">Logout</a></li>
        	</c:if>	
        </ul>
	</div>
<!--header:end-->
<!--navigation:start-->
<wa:include URI="${site}/boxes/menu"/>
<!--navigation:end-->
<!--mainContent:start-->
		<c:if test="${template!=null}">
			<jsp:include page="/${template}" />
		</c:if>
<!--mainContent:end-->
</div>
<!--wrapper:end-->


<!--legend:start-->
<div id="legend">
	<div class="header">
		<h3><wa:mls>Legend</wa:mls></h3>
		<div id="legendclose"></div>
	</div>
	<div class="content">
		${legend}
	</div>
</div>
<!--legend:end-->

<c:if test="${ac_user_admin != null}">
	<script language='javascript'>
		window.setTimeout(wa_areYouConnected,1500000); // 25 minutes
	</script>
</c:if>

<!--nav:end-->
</body>

</html>
