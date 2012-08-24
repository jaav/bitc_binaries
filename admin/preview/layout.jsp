<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>GALERIA INNO</title>
	<script type="text/javascript" src="${context}/static/front/js/mootools.js"></script>
	<script type="text/javascript" src="${context}/static/front/js/multibox.js"></script>
	<script type="text/javascript" src="${context}/static/front/js/overlay.js"></script>
	<script type="text/javascript" src="${context}/static/front/js/moo_plug.js"></script>
	<script type="text/javascript" src="${context}/static/front/js/accordeon.js"></script>
	<script type="text/javascript" src="${context}/static/front/js/SpryValidationCheckbox.js"></script>
	<script type="text/javascript" src="${context}/static/front/js/SpryValidationRadio.js"></script>
	<script type="text/javascript" src="${context}/static/front/js/SpryValidationTextField.js"></script>
	<script type="text/javascript" src="${context}/static/front/js/SpryValidationSelect.js"></script>
	<link rel="stylesheet" type="text/css" href="${context}/static/front/css/style_sale.css"/>
	<link rel="stylesheet" type="text/css" href="${context}/static/front/css/content_sale.css"/>
	<link rel="stylesheet" type="text/css" href="${context}/static/front/css/multibox.css"/>
	<link rel="stylesheet" type="text/css" href="${context}/static/front/css/SpryValidationCheckbox.css"/>
	<link rel="stylesheet" type="text/css" href="${context}/static/front/css/SpryValidationRadio.css"/>
	<link rel="stylesheet" type="text/css" href="${context}/static/front/css/SpryValidationTextarea.css"/>
	<link rel="stylesheet" type="text/css" href="${context}/static/front/css/SpryValidationTextField.css"/>

</head>
<body>
<div>
  <!--branding =  logo + titre -->
  
    <!--content-->
  <div id="content">
	<jsp:include page="/${template}" />
  </div>
  <!--site info ours du site (pied de page)-->
  
</div>
</body>
</html>

    