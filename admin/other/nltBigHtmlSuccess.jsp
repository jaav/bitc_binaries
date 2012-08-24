<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false" 
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="wabd" uri="BigDecimalUtilsTags" %>
<%@ taglib prefix="wast" uri="StringToolsTags" %>
<fmt:setLocale value="be_FR" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Visitbrussels</title>
</head>
<body style=" margin:0; padding:0; background-color:#fff;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="600" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td width="600">&nbsp;</td>
        </tr>
        <tr>
          <td width="600" height="115"><img src="${config['URL']}/bitc/mail/img/ml/top_city.jpg" width="600" height="115" style="display:block;"/></td>
        </tr>
        <tr>
          <td width="600"><table width="600" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>&nbsp;</td>
                <td height="45">&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td width="55">&nbsp;</td>
                <td width="490" align="left" style="font-family:Verdana, Geneva, sans-serif; font-size:11px; color:#6B6967; line-height:16px;"><span style=" font-family:Georgia, 'Times New Roman', Times, serif; font-size:22px; color:#6B6967; font-style:italic;"><wa:mls>Bonjour</wa:mls> &FIRSTNAME;,</span><br />
                  <br />
                  <br />
                  <c:forEach var="item" items="${list}" varStatus="loop">
                  <!-- partie à duppliquer : start -->
                  
                  <table width="490" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="7" style="background-color:#EDE8D2"></td>
                    </tr>
                    <tr>
                      <td height="18"></td>
                    </tr>
                    <tr>
                      <td style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:23px; color:#6B6967; text-transform:uppercase;"><a href="${config['URL']}/bitc/front/content/displayDetail/group/${item.group}/id/${item.id}/lg/${culture.language}.do" target="_blank" >${item.mainContentArticleCltFirst.title }</a></td>
                    </tr>
                    <tr>
                      <td height="5"></td>
                    </tr>
                    <tr>
                      <td style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:13px; color:#958E88;">
		                      <c:if test="${not empty item.periodFromDate}">
								<h3>
									<c:choose>
										<c:when test="${item.periodFromHour eq '00'}">
										<%
											System.out.println("periodFromhour = 00 ");
										%>
											<fmt:formatDate pattern="dd/MM/yyyy" value="${item.periodFromDate}"/>
										</c:when>
										<c:otherwise>
											<fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${item.periodFromDate}"/>
										</c:otherwise>
									</c:choose>
									 - 
									 <c:choose>
										<c:when test="${item.periodToHour eq '00'}">
											<fmt:formatDate pattern="dd/MM/yyyy" value="${item.periodToDate}"/>
										</c:when>
										<c:otherwise>
											<fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${item.periodToDate}"/>
										</c:otherwise>
									</c:choose>
								</h3>	 
							</c:if>
					</td>
                    </tr>
                    <tr>
                      <td height="18"></td>
                    </tr>
                    <tr>
                     <c:if test="${not empty item.mainContentArticleCltFirst.bigImage}">
                      <td><a href="${config['URL']}/bitc/front/content/displayDetail/group/${item.group}/id/${item.id}/lg/${culture.language}.do" target="_blank" ><img src="${config['URL']}${item.mainContentArticleCltFirst.bigImage}" width="490" height="160" style="display:block" border="0" /></a></td>
                      </c:if>
                    </tr>
                    <tr>
                      <td height="10"></td>
                    </tr>
                    <tr>
                      <td style="font-family:Verdana, Geneva, sans-serif; font-size:11px; color:#6B6967; line-height:16px;">
                       ${item.mainContentArticleCltFirst.abstract_} <br />
                        <br />
                        <span style="font-size:13px; font-weight:bold"> </span> <br />
                        <br />
                        ${item.mainContentArticleCltFirst.body } <br />
                        <br />
                        
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td align="left" valign="top">
                            
                            <!-- INFOS PRATIQUES : START -->
                            <c:if test="${mapContentType[item.id] ne 'ContentArticle'}">
                            <table border="0" cellpadding="0" cellspacing="0">
                              <tr>
                                <td align="left" valign="top"><table border="0" cellspacing="0" cellpadding="0" style="background-color:#F2EEE9;">
                                  <tr>
                                    <td width="10" height="10" style="border-left:1px solid #C6C4C1; border-top:1px solid #C6C4C1;"></td>
                                    <td height="10" style="border-top:1px solid #C6C4C1;"></td>
                                    <td width="10" height="10" style="border-right:1px solid #C6C4C1; border-top:1px solid #C6C4C1;"></td>
                                  </tr>
                                  
                                  <tr>
                                    <td width="10" style="border-left:1px solid #C6C4C1;">&nbsp;</td>
                                    <td width="210" align="left" valign="top" style="font-family:Verdana, Geneva, sans-serif; font-size:10px; color:#6A6561; line-height:16px;"><span style="font-size:14px; font-weight:bold"><wa:mls>Practical informations</wa:mls></span> <br />
                                      <br /><c:if test="${not empty item.address}">
		        								<p> ${item.address} </p>
		      									<p>
		      									<c:if test="${not empty item.zipcode && item.zipcode > 0}">
		      										${item.zipcode}
		      									</c:if>
		      			 						<c:if test="${not empty item.city}">
		      			 							${item.city}
		      			 						</c:if>
	      									</p>
	        							</c:if>
                                      <c:if test="${not empty item.phone}">
							       		 <p><strong><wa:mls>Tel :</wa:mls></strong> ${item.phone}</p>
							       	  </c:if><br />
                                      <c:if test="${not empty item.mobile}">
							       		 <p><strong><wa:mls>Mobile :</wa:mls></strong> ${item.mobile}</p>
							       	</c:if>
							       	<c:if test="${not empty item.fax}">
							       		 <p><strong><wa:mls>Fax :</wa:mls></strong> ${item.fax}</p>
							       	</c:if>
							       	<c:if test="${not empty item.email}">
						          		 <p><strong><wa:mls>Email :</wa:mls></strong> <br />
						          		<a href="mailto:${item.email}"><span class="cutEmail">${item.email}</span></a></p>
							        </c:if>
							        <c:if test="${not empty item.website}">
						          		 <p><strong><wa:mls>Website :</wa:mls></strong> <br />
						          		<a href="${item.website}" target="_blank"><span class="cutEmail">${item.website}</span></a></p>
							        </c:if>
							       	<c:if test="${item.group == 'BnB' && not empty item.price}">
							            <p><strong><wa:mls>Starting at</wa:mls></strong> : ${wabd:format(wast:toDouble2(item.price,0.0),0)} &euro;<wa:mls>/night</wa:mls> <br /></p>
							        </c:if>
							        <c:if test="${mapContentType[item.id] eq 'ContentEvent'}">
							        	<p>
							        		<c:if test="${not empty item.price}">
							        			<strong><wa:mls>Price :</wa:mls></strong> ${item.price}<br />
							        		</c:if>
							        		<c:if test="${not empty item.numParticipation && item.numParticipation > 0}">
							        			<strong><wa:mls>Number of Participation :</wa:mls></strong> ${item.numParticipation}<br />
							        		</c:if>
							        	</p>
							        </c:if>
                                    <td width="10" style="border-right:1px solid #C6C4C1;">&nbsp;</td>
                                  </tr>
                                  
                                  <tr>
                                    <td width="10" height="10" style="border-left:1px solid #C6C4C1; border-bottom:1px solid #C6C4C1;"></td>
                                    <td height="10" style="border-bottom:1px solid #C6C4C1;"></td>
                                    <td width="10" height="10" style="border-right:1px solid #C6C4C1; border-bottom:1px solid #C6C4C1;"></td>
                                  </tr>
                                </table></td>
                                <td width="13" align="left" valign="top">&nbsp;</td>
                              </tr>
                            </table>
                            </c:if>
                            <!-- INFOS PRATIQUES : END -->
                            
                            </td>
                            <td align="left" valign="top">
                            
                            <!-- INFOS PRATIQUES : START -->
                            <c:if test="${not empty item.mainContentArticleCltFirst.info}">
                            <table border="0" cellpadding="0" cellspacing="0">
                              <tr>
                                <td align="left" valign="top"><table border="0" cellspacing="0" cellpadding="0" style="background-color:#F2EEE9;">
                                  <tr>
                                    <td width="10" height="10" style="border-left:1px solid #C6C4C1; border-top:1px solid #C6C4C1;"></td>
                                    <td height="10" style="border-top:1px solid #C6C4C1;"></td>
                                    <td width="10" height="10" style="border-right:1px solid #C6C4C1; border-top:1px solid #C6C4C1;"></td>
                                  </tr>
                                  <tr>
                                    <td width="10" style="border-left:1px solid #C6C4C1;">&nbsp;</td>
                                    <td width="210" align="left" valign="top" style="font-family:Verdana, Geneva, sans-serif; font-size:10px; color:#6A6561; line-height:16px;"><span style="font-size:14px; font-weight:bold"><wa:mls>Other informations</wa:mls></span> <br />
                                      <br />
	                                     
										      ${item.mainContentArticleCltFirst.info}	
									
										
                                     </td>
                                    <td width="10" style="border-right:1px solid #C6C4C1;">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td width="10" height="10" style="border-left:1px solid #C6C4C1; border-bottom:1px solid #C6C4C1;"></td>
                                    <td height="10" style="border-bottom:1px solid #C6C4C1;"></td>
                                    <td width="10" height="10" style="border-right:1px solid #C6C4C1; border-bottom:1px solid #C6C4C1;"></td>
                                  </tr>
                                </table></td>
                                <td width="13" align="left" valign="top">&nbsp;</td>
                              </tr>
                            </table> 
                             </c:if>
                            <!-- INFOS PRATIQUES : END -->
                            
                            </td>
                          </tr>
                        </table>

                        </td>
                    </tr>
                    <tr>
                      <td height="25">&nbsp;</td>
                    </tr>
                    <tr>
                      <td><a href="${config['URL']}/bitc/front/content/displayDetail/group/${item.group}/id/${item.id}/lg/${culture.language}.do" target="_blank"><img src="${config['URL']}/bitc/mail/img/${culture.language}/btn_info.gif" width="104" height="20" alt="more info" border="0"/></a></td>
                    </tr>
                    <tr>
                      <td height="25">&nbsp;</td>
                    </tr>
                  </table>
                  
                  <!-- partie à duppliquer : end --> 
                  </c:forEach>
                  
                  
                  </td>
                <td width="55">&nbsp;</td>
              </tr>
             <tr>
                		<td width="55">&nbsp;</td>
                		<td width="490" height="50" align="right" valign="middle" style="font-family:Verdana, Geneva, sans-serif; font-size:12px; color:#101619; font-style:italic;"> <img src="http://wanabe-eu.bitc.s3.amazonaws.com/img/logo_visitbrussels.jpg" width="150" height="20" hspace="5"/></td>
                		<td width="55">&nbsp;</td>
              		</tr>
            </table></td>
        </tr>
        <tr>
          <td width="600" height="1" style="background-color:#cdcdcd;"></td>
        </tr>
        <tr>
          <td width="600" height="30" align="center" style="background-color:#323232; font-family:Verdana, Geneva, sans-serif; font-size:11px; color:#958E88; line-height:16px;">© visitbrussels.be</td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
