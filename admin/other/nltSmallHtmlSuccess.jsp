<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false" 
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="be_FR" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Visitbrussels</title>
</head>
<body style="margin: 0; padding: 0; background-color: #fff;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
		<table width="600" border="0" align="center" cellpadding="0"
			cellspacing="0" bgcolor="#FFFFFF">
			<tr>
				<td width="600">&nbsp;</td>
			</tr>
			<tr>
				<td width="600" height="115"><img
					src="${config['URL']}/bitc/mail/img/ml/top_city.jpg"
					width="600" height="115" style="display: block;" /></td>
			</tr>
			<tr>
				<td width="600">
				<table width="600" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>&nbsp;</td>
						<td height="45">&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td width="55">&nbsp;</td>
						<td width="490" align="left"
							style="font-family: Verdana, Geneva, sans-serif; font-size: 11px; color: #6B6967; line-height: 16px;">
						<span
							style="font-family: Georgia, 'Times New Roman', Times, serif; font-size: 22px; color: #6B6967; font-style: italic;"><wa:mls>Bonjour</wa:mls>
						&FIRSTNAME;,</span><br />
						<br />
						<br />
						<table width="490" border="0" cellspacing="0" cellpadding="0">
							<c:forEach var="item" items="${list}" varStatus="loop">
								<!-- small left -->
								<c:if test="${loop.count mod 2 == 1}">
									<td width="238" height="179" valign="top">
									<table width="238" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="238" height="7" style="background-color: #EDE8D2"></td>
											<!-- ligne beige -->
	
										</tr>
										<tr>
											<td valign="middle"
												style="font-family: Georgia, 'Times New Roman', Times, serif; font-size: 16px; color: #6B6967; text-transform: uppercase; padding: 6px 0 6px 0"> <a href="${config['URL']}/bitc/front/content/displayDetail/group/${item.group}/id/${item.id}/lg/${culture.language}.do" target="_blank" >${item.mainContentArticleCltFirst.title}</a></td>
										</tr>
										<c:if test="${not empty item.mainContentArticleCltFirst.smallImage}">
										<tr>
											<td width="238" height="116"><a href="${config['URL']}/bitc/front/content/displayDetail/group/${item.group}/id/${item.id}/lg/${culture.language}.do" target="_blank" ><img
												src="${config['URL']}/${item.mainContentArticleCltFirst.smallImage}"
												width="238" height="116" alt="visu" border="0"
												style="display: block" /></a></td>
										</tr>
										</c:if>
										<tr>
											<td height="20">&nbsp;</td>
										</tr>
										<tr>
											<td valign="top"
												style="font-family: Verdana, Geneva, sans-serif; font-size: 11px; color: #6B6967; line-height: 16px;">
												 ${item.mainContentArticleCltFirst.abstract_}
											</td>
										</tr>
	
										<tr>
											<td height="10"></td>
										</tr>
										<tr>
											<td><a href="${config['URL']}/bitc/front/content/displayDetail/group/${item.group}/id/${item.id}/lg/${culture.language}.do" target="_blank"><img
												src="${config['URL']}/bitc/mail/img/${culture.language}/btn_info.gif"
												width="104" height="20" alt="More info" border="0" /></a></td>
										</tr>
										<tr>
											<td height="30"></td>
										</tr>
									</table>
									</td>
								</c:if>
								<!-- end small left -->
								
								<!-- begin small right -->
								<c:if test="${loop.count mod 2 == 0}">
									<td width="14" valign="top">&nbsp;</td>
									<td width="238" valign="top">
									<table width="238" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="238" height="7" style="background-color: #FFDCF5"></td>
										</tr>
										<tr>
											<td valign="middle"
												style="font-family: Georgia, 'Times New Roman', Times, serif; font-size: 16px; color: #6B6967; text-transform: uppercase; padding: 6px 0 6px 0"><a href="${config['URL']}/bitc/front/content/displayDetail/group/${item.group}/id/${item.id}/lg/${culture.language}.do" target="_blank" >${item.mainContentArticleCltFirst.title}</a></td>
										</tr>
										<c:if test="${not empty item.mainContentArticleCltFirst.smallImage}">
										<tr>
											<td width="238" height="116"><a href="${config['URL']}/bitc/front/content/displayDetail/group/${item.group}/id/${item.id}/lg/${culture.language}.do" target="_blank" ><img
												src="${config['URL']}/${item.mainContentArticleCltFirst.smallImage}"
												width="238" height="116" alt="visu" border="0"
												style="display: block" /></a></td>
										</tr>
										</c:if>
										<tr>
											<td height="16"></td>
										</tr>
										<tr>
											<td valign="top"
												style="font-family: Verdana, Geneva, sans-serif; font-size: 11px; color: #6B6967; line-height: 16px;">
												 ${item.mainContentArticleCltFirst.abstract_}
											</td>
										</tr>
										<tr>
											<td height="10"></td>
										</tr>
										<tr>
											<td><a href="${config['URL']}/bitc/front/content/displayDetail/group/${item.group}/id/${item.id}/lg/${culture.language}.do" target="_blank"><img
												src="${config['URL']}/bitc/mail/img/${culture.language}/btn_info.gif"
												width="104" height="20" alt="More info" border="0" /></a></td>
										</tr>
										<tr>
											<td height="30"></td>
										</tr>
									</table>
									</td>
								</c:if>
								<!-- begin small right -->
							<c:if test="${loop.count mod 2 == 0}">
							</tr>
							</c:if>
							
							 <!-- end line -->
							 </c:forEach>
							 					 
							
						</table>
						<!-- partie à duppliquer : end --></td>
						<td width="55">&nbsp;</td>
					</tr>
					<tr>
                		<td width="55">&nbsp;</td>
                		<td width="490" height="50" align="right" valign="middle" style="font-family:Verdana, Geneva, sans-serif; font-size:12px; color:#101619; font-style:italic;"> <img src="http://wanabe-eu.bitc.s3.amazonaws.com/img/logo_visitbrussels.jpg" width="150" height="20" hspace="5"/></td>
                		<td width="55">&nbsp;</td>
              		</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td width="600" height="1" style="background-color: #cdcdcd;"></td>
			</tr>
			<tr>
				<td width="600" height="30" align="center"
					style="background-color: #323232; font-family: Verdana, Geneva, sans-serif; font-size: 11px; color: #958E88; line-height: 16px;">© visitbrussels.be</td>
			</tr>
		</table>


		</td>
	</tr>
</table>
</body>
</html>


<%--


	<c:forEach var="nltContent" items="${list}" varStatus="loop">
	
		titre : ${nltContent.title} <br />
		
		<c:if test="${type eq 'html'}">
			<c:if test="${nltContent.smallVersion==true}">
			listHtml : ${nltContent.listHtml} <br />
			</c:if>
			<c:if test="${nltContent.smallVersion==false}">
			detailHtml : ${nltContent.detailHtml} <br />
			</c:if>
		</c:if>
		
		<c:if test="${type eq 'text'}">
			<c:if test="${nltContent.smallVersion==true}">
			listText: ${nltContent.listText} <br />
			</c:if>
			<c:if test="${nltContent.smallVersion==false}">
			DetailText : ${nltContent.detailText} <br />
			</c:if>	
		</c:if>
		
		image : ${nltContent.image} <br />
		url : ${nltContent.url} <br />
		<hr />
	</c:forEach>
 --%>