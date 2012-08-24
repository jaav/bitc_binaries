<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<fieldset>
	<legend align="top">Property - ${propertyName}</legend>
	<c:if test="${type=='FREE'}">
		<label>FREE Value</label>
		<textarea name="${propertyNameWithoutSpaces}" class="textfield" >${freeValue}</textarea>
	</c:if>
	<c:if test="${type!='FREE'}">
		<c:if test="${type=='DB'}">
			<wa:include URI="admin/dropdown/${dropListType}">
				<wa:param name="class" value="${className}" />
				<wa:param name="manager" value="${manager}" />
				<wa:param name="identity" value="${identity}" />
				<wa:param name="display" value="${identity}" />
				<wa:param name="display2" value="${display}" />
				<wa:param name="method" value="${method}" />
				<wa:param name="propertyName" value="${propertyName}" />
				<wa:param name="contentType" value="${contentType}"/>
				<wa:param name="contentId" value="${contentId}" />
				<wa:param name="name" value="s_property_link_${propertyNameWithoutSpaces}" />
				<wa:param name="parentValue" value="${parentValue}" />
				<wa:param name="translated" value="${translated}" />
				<wa:param name="readonly" value="${readonly}" />
				<wa:param name="type" value="${type}" />
			</wa:include>
		</c:if>
		<c:if test="${type!='DB'}">
			<wa:include URI="admin/dropdown/${dropListType}">
				<wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue" />
				<wa:param name="manager" value="com.wanabe.cms.manager.ContentPropertyValueManager" />
				<wa:param name="identity" value="valueId" />
				<wa:param name="display" value="name" />
				
				<wa:param name="method" value="listByPropertyName" />
				<wa:param name="propertyName" value="${propertyName}" />
				<wa:param name="contentType" value="${contentType}"/>
				<wa:param name="contentId" value="${contentId}" />
				<wa:param name="name" value="s_property_link_${propertyNameWithoutSpaces}" />
				<wa:param name="parentValue" value="${parentValue}" />
				<wa:param name="translated" value="${translated}" />
				<wa:param name="readonly" value="${readonly}" />
				<wa:param name="type" value="${type}" />
		</wa:include>
		</c:if>
		
		<c:if test="${type=='OPEN'}">
		<span>
			<a href="${context}/${site}/contentPropertyValue/contentPropertyValueList.do?s_contentProperty_propertyid=${propertyid}&s_submit=filtre'" title="<wa:mls>List of values</wa:mls>"  target="_blank"><img src="${static}/${site}/img/ico_list.png"/></a>
		</span>
		</c:if>
	</c:if>
</fieldset>