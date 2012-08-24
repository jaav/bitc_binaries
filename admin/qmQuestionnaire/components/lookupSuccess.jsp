<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<a href="${context}/${site}/qmQuestionnaire/editItem/id/${lookup_questionnaire.qmQuestionnaireId}.do" title="<wa:mls>questionnaire</wa:mls>" target="_blank">
		${lookup_questionnaire.name}
	</a>

