<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<script type="text/javascript">
	window.parent.OnUploadCompleted(${errorCode},"${image.url}","${image.name}", "") ;
</script>
