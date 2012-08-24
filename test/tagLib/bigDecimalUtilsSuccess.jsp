<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>

<%@ taglib prefix="wabd" uri="BigDecimalUtilsTags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
      <head><title>bigDecimalUtilsSuccess.jsp</title></head>
      <body> 
            <table width ="100%"> 
              <tr> 
                <td width="20%"> <img alt="No Display logo" src="Images/LogoWa2.jpeg">  </td>
                <td width="30%">  <H3> bigDecimalUtilsSucess.jsp</H3></td>
              </tr>
           </table>
           
<hr>       
<p>Les  Methodes de la classe  <b> BigDecimalUtils.java : </b>: </p>
</hr>
 
<hr>
 <%-- remove trailling zeroes--%>
<b> 1 - Test Methode trim():</b>
 <p> trim(${bd3}) - ${wabd:trim(bd3)}</p>
<p> trim (${bd4}) - ${wabd:trim(bd4)}</p>
</hr>

<hr>
<%-- format a number to precision --%>
<b> 2 - Test Methode format():</b>
<p> format(${bd1},1) - ${wabd:format(bd1,1)}</p>
<p> format(${bd1},2) - ${wabd:format(bd1,2)}</p>  
<p> format(${bd1},3) - ${wabd:format(bd1,3)}</p>
<p> format(${bd1},4) - ${wabd:format(bd1,4)}</p>
<p> format(${bd1},5) - ${wabd:format(bd1,5)}</p>
<p> format(${bd1},6) - ${wabd:format(bd1,6)}</p>
<p> format(${bd1},7) - ${wabd:format(bd1,7)}</p>
<p> format(${bd1},8) - ${wabd:format(bd1,8)}</p>
</hr>

<hr>
<b> <A HREF="display.do">Retour</A></b>  

</body>
</html>

