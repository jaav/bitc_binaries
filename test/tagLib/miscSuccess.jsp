<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>

<%@ taglib prefix="wamisc" uri="MiscTags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
 <head><title>miscSuccess.jsp</title></head>
  <body> 
    <table width ="100%"> 
      <tr> 
       <td width="20%"> <img alt="No Display logo" src="Images/LogoWa2.jpeg">  </td>
       <td width="30%">  <H3>miscSucess.jsp</H3></td>
      </tr>
 </table>
 
<hr>       
<p> La Methode de la classe  <b> Misc.java</b> : </p>

<hr>
<%-- clean a special caracter --%>
<b> 1- Test Methode cleanFromSpecialChar():  </b> 
<p> cleanFromSpecialChar(${testMi1})   ==>  ${wamisc:cleanFromSpecialChar(testMi1)}</p>
<p> cleanFromSpecialChar(${testMi2})   ==>  ${wamisc:cleanFromSpecialChar(testMi2)}</p>
<p> cleanFromSpecialChar(${testMi3}) (où ? = OE)   ==> ${wamisc:cleanFromSpecialChar(testMi3)}</p>
<p> cleanFromSpecialChar(${testMi4}) (où ? = oe)    ==> ${wamisc:cleanFromSpecialChar(testMi4)}</p>

</hr>

<hr>
<b> <A HREF="display.do">Retour</A></b>  
                   
 </body>
</html>