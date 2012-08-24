<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="{staticSite}/front/js/jquery-1.4.2.min.js"></script>
  <script type="text/javascript">
    // Cette partie est nécessaire pour pouvoir utiliser les fonctions de fck à l'intérieur de notre popup 
    var oEditor = window.parent.InnerDialogLoaded();
    var FCKConfig = oEditor.FCKConfig;
    var dialog = window.parent;
    document.write('<script src="' + FCKConfig.BasePath + 'dialog/common/fck_dialog_common.js" type="text/javascript"><\/script>');
    dialog.SetOkButton(true); // Par défaut, seul le bouton annuler est affiché, on rajoute le bouton ok	
  
    // Puis on surdéfinit une fonction Ok qui est appelé par fck quand on appuye sur le bouton ... ok
    function Ok()
    {
    	<c:if test="${not empty filename && empty msgError}">
    		oEditor.FCK.InsertHtml( '<div class="wa_player" rel="${filename}"></div>' );
    		
    	</c:if>
    	return true;
    }
</script>
</head>
<body>
	<div>${msgError}</div>
	<div id="add-fileToUpload">		
		<form action="${context}/admin/fckEditor/uploadVideo.do" method="post" enctype="multipart/form-data">
			<label for="fileToUpload"><wa:mls>File (max. %1 Mo): <wa:param name="1" value="toto"/></wa:mls></label>
			<input type="file" id="fileToUpload" name="fileToUpload"  width="300"/>	
			<input type="submit" value="<wa:mls>upload</wa:mls>" />	
		</form>			
	</div>
	<div><wa:mls>Result :</wa:mls> ${filename}</div>
</body>
</html>
