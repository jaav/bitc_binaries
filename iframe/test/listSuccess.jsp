<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<html>
	<head></head>
	<body>
		<iframe height="${calList.height}" width="${calList.width}" src="/bitc/iframe/calendar/list.do?code=${waParam.vb_code}&lg=${culture.language}&date=${waParam.vb_date}&categ=${waParam.vb_categ}"></iframe>
	</body>
</html>

