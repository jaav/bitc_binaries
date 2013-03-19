<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Visitbrussels</title>
</head>
<body style=" margin:0; padding:0; background-color:#fff;" <c:if test="${origin == 'print'}"> onload="window.print();setImgMap()" </c:if>>
<script type="text/javascript" src="${static}/front/js/jquery-1.4.2.min.js"></script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="600" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td width="600">&nbsp;</td>
        </tr>
        <tr>
          <td width="600" height="115"><img src="${staticSite}/img/ml/visu_top_print.jpg" class="top_print" width="600" height="115" style="display:block;"/></td>
        </tr>
        <c:if test="${origin == 'share'}">
        <tr>
        	<td>
        		 <div class="btn">
					<a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share" addthis:url="${config['URL']}${context}/front/other/print/id/${cryptUserId}.do" addthis:title="${item.mainTitle}" addthis:description=""><img src="${staticSite}/img/ml/btn_share.gif" alt="<wa:mls>Share</wa:mls>"/></a>
         		 </div>
        	</td>
        </tr>
        </c:if>
        <c:if test="${origin == 'print'}">
	        
	        <tr>
	             <td>
	             <br/><div id ="imgGlobal">
	           	</div>
	             </td>
	            </tr>
	        <tr>
        </c:if>
          <td width="600"><table width="600" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="55">&nbsp;</td>
                <td width="490" align="left" style="font-family:Verdana, Geneva, sans-serif; font-size:11px; color:#6B6967; line-height:16px;">
               	  <span style=" font-family:Georgia, 'Times New Roman', Times, serif; font-size:22px; color:#6B6967; font-style:italic;"></span><br />

                  	<!-- partie à duppliquer : start -->
                  	<c:choose>
			        	<c:when test="${empty list}">
			        		<wa:mls>Aucun favori sélectionné</wa:mls>
			        	</c:when>
			        	<c:otherwise>
			   <c:forEach var="item" items="${list}" varStatus="loop">
			        <table width="490" border="0" cellspacing="0" cellpadding="0">
                      
                      <tr>
                        <td height="7" style="background-color:#EDE8D2"></td>
                      </tr>
                      <tr>
                        <td height="18"></td>
                      </tr>
                      
                      <c:if test="${item.group ne 'WALK'}">
                      <c:if test="${ not empty item.latitude and item.latitude != 0.0 and not empty item.longitude and item.longitude != 0.0 }">
                      <tr>
                       <td>
                     	<img src="http://maps.google.com/maps/api/staticmap?center=${item.latitude},${item.longitude}&size=600x300&maptype=roadmap&markers=color:blue|label:${loop.count}|${item.latitude},${item.longitude}&sensor=false&zoom=15" style="display:block" border="0" alt="${item.urlLabel}" /><br/>
                       </td>
                      </tr>
                      </c:if>
                      </c:if>
                      <tr>
                        <td style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:23px; color:#6B6967; text-transform:uppercase;">${item.mainTitle}</td>
                      </tr>
                      <tr>
                        <td height="5"></td>
                      </tr>
                      <tr>
                        <td style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:13px; color:#958E88;"><fmt:formatDate pattern="dd/MM/yyyy" value="${item.periodFromDate}"/> - <fmt:formatDate pattern="dd/MM/yyyy" value="${item.periodToDate}"/></td>
                      </tr>
                      <tr>
                        <td height="18"></td>
                      </tr>
                      <tr>
                        <td>
                        <c:if test="${not empty item.bigImage}" >
				        		<img src="${item.bigImage}" style="display:block" border="0" alt="${item.urlLabel}" />
		        			
	        			</c:if>
	        			</td>
                      </tr>
                      <tr>
                        <td height="10"></td>
                      </tr>
                      <tr>
                        <td style="font-family:Verdana, Geneva, sans-serif; font-size:11px; color:#6B6967; line-height:16px;">
                        	${item.mainBody} 
                        <br />
                        <br />
                        <table width="490" border="0" cellspacing="0" cellpadding="0" style="background-color:#F2EEE9">
                          <tr>
                            <td width="10" height="10" style="border-left:1px solid #C6C4C1; border-top:1px solid #C6C4C1"></td>
                            <td width="210" style="border-top:1px solid #C6C4C1"></td>
                            <td width="10" style="border-right:1px solid #C6C4C1; border-top:1px solid #C6C4C1"></td>
                            <td width="26" style="background-color:#FFF"></td>
                            <td width="10" style="border-left:1px solid #C6C4C1; border-top:1px solid #C6C4C1"></td>
                            <td width="210" style="border-top:1px solid #C6C4C1"></td>
                            <td width="10" style="border-right:1px solid #C6C4C1; border-top:1px solid #C6C4C1"></td>
                          </tr>
                          <c:if test="${item.group ne 'WALK'}">
                          <tr>
                            <td style="border-left:1px solid #C6C4C1">&nbsp;</td>
                            <td width="210" valign="top" style="font-family:Verdana, Geneva, sans-serif; font-size:10px; color:#6A6561; line-height:16px;">
								<span style="font-size:14px; font-weight:bold"><wa:mls>Practical informations</wa:mls></span>
								<br />
								<br />
								
							<c:if test="${not empty item.address}">
					        	<p> ${item.address} </p>
					      		<p>
					      			<c:if test="${not empty item.zipcode && item.zipcode > 0}">
					      				${item.zipcode}
					      			</c:if>
					      			 <c:if test="${not empty item.city}">
					      			 	${item.city}
					      			 </c:if>
					      		</p><br />
					        </c:if>
					      
					       <p>
					       	<c:if test="${not empty item.phone}">
					       		<strong><wa:mls>Tel :</wa:mls></strong> ${item.phone}<br />
					       	</c:if>
					       	<c:if test="${not empty item.mobile}">
					       		<strong><wa:mls>Mobile :</wa:mls></strong> ${item.mobile}<br />
					       	</c:if>
					       	<c:if test="${not empty item.fax}">
					       		<strong><wa:mls>Fax :</wa:mls></strong> ${item.fax}<br />
					       	</c:if>
					       	<c:if test="${not empty item.email}">
				          		<strong><wa:mls>Email :</wa:mls></strong> <br />
				          		<span class="cutEmail"><a href="mailto:${item.email}">${item.email}</a></span><br />
					        </c:if>
					        <c:if test="${not empty item.URLWebsite}">
				          		<strong><wa:mls>Website :</wa:mls></strong> <br />
				          		<span class="cutEmail"><a href="${item.URLWebsite}">${item.URLWebsite}</a></span><br />
					        </c:if>
					       </p>
					        <c:if test="${contentTypes[item.group] eq 'ContentEvent'}">
					        	<p>
					        		<c:if test="${not empty item.price}">
					        			<strong><wa:mls>Price :</wa:mls></strong> ${item.price}<br />
					        		</c:if>
					        		<c:if test="${not empty item.numParticipation}">
					        			<strong><wa:mls>Number of Participation :</wa:mls></strong> ${item.numParticipation}<br />
					        		</c:if>
					        	</p><br />
					        </c:if>
					        <c:if test="${contentTypes[item.group] eq 'ContentRestaurant'}">
					        	<p>
					        		<c:if test="${not empty item.price}">
					        			<strong><wa:mls>Price :</wa:mls></strong> ${item.price}<br />
					        		</c:if>
					        	</p><br />
					        </c:if>
					         </td>
                            <td style="border-right:1px solid #C6C4C1">&nbsp;</td>
                            <td style="background-color:#FFF">&nbsp;</td>
                            <td style="border-left:1px solid #C6C4C1">&nbsp;</td>
                            <td width="210" valign="top" style="font-family:Verdana, Geneva, sans-serif; font-size:10px; color:#6A6561; line-height:16px;"><span style="font-size:14px; font-weight:bold"><wa:mls>Other informations</wa:mls></span> <br />
                            	<br />
                            	${item.mainInfo} 
                             </td>
                            <td style="border-right:1px solid #C6C4C1">&nbsp;</td>
                          </tr>
                          </c:if>
                          <tr>
                            <td height="10" style="border-left:1px solid #C6C4C1; border-bottom:1px solid #C6C4C1;"></td>
                            <td style="border-bottom:1px solid #C6C4C1;"></td>
                            <td style="border-right:1px solid #C6C4C1; border-bottom:1px solid #C6C4C1;"></td>
                            <td style="background-color:#FFF"></td>
                            <td style="border-left:1px solid #C6C4C1; border-bottom:1px solid #C6C4C1;"></td>
                            <td style="border-bottom:1px solid #C6C4C1;"></td>
                            <td style="border-right:1px solid #C6C4C1; border-bottom:1px solid #C6C4C1;"></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td height="25">&nbsp;</td>
                      </tr>
                      <tr>
                        <td>
                        <c:choose>
                        	<c:when test="${item.group eq 'HOTEL'}">
                        		<a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" title="${item.mainTitle}">${URLDetail}<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/></a>
                        	</c:when>
                        	<c:otherwise>
                        		<a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" title="${item.mainTitle}">${URLDetail}<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/></a>
                        	</c:otherwise>
                        </c:choose>
                       </td>
                      </tr>
                      <tr>
                        <td height="25">&nbsp;</td>
                      </tr>
                    </table>
                    <!-- partie à duppliquer : end -->
                    <div style="page-break-after : always;"></div>
                    </c:forEach>
			       </c:otherwise>
			      </c:choose>
                   
                </td>
                <td width="55">&nbsp;</td>
              </tr>
              <tr>
           <td width="55">&nbsp;</td>
           <td width="490" height="50" align="right" valign="middle" style="font-family:Verdana, Geneva, sans-serif; font-size:12px; color:#101619; font-style:italic;"> <img src="${context}/static/front/img/ml/logo_visitbrussels.jpg" width="150" height="20" hspace="5"/></td>
           <td width="55">&nbsp;</td>
        </tr>
            </table>
            </td>
        </tr>
        <tr>
          <td width="600" height="1" style="background-color:#cdcdcd;"></td>
        </tr>
        <tr>
          <td width="600" height="30" align="center" style="background-color:#323232; font-family:Verdana, Geneva, sans-serif; font-size:11px; color:#958E88; line-height:16px;">© ${currentYear} - VISITBRUSSELS - All rights reserved - <a href="/bitc/front/content/displayDetail/group/CONTENT/id/14372.do">Privacy Policy</a></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<script language='javascript'>

function setImgMap()
{
	var markers = '';
	var i=1;
	var ht = '<img  src="http://maps.google.com/maps/api/staticmap?size=600x300&maptype=roadmap';
	 <c:forEach var="item" items="${list}" varStatus="loop">
	 <c:if test="${item.group ne 'WALK'}">
		 <c:if test="${ not empty item.latitude and item.latitude != 0.0 and not empty item.longitude and item.longitude != 0.0 }">
		 markers+='&markers=color:blue|label:'+i+'|'.concat('${item.latitude}').concat(',').concat('${item.longitude}');
		 i++;
		 </c:if>
		 </c:if>
    </c:forEach>
    ht = ht.concat(markers);
    ht+='&sensor=false" style="display:block" border="0" width="600"  alt="" /><br/>';
    var d="#"+"imgGlobal";
    $(d).html(ht);
}
</script>
</body>


</html>