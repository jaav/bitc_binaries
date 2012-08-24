<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>

<%@ taglib prefix="watc" uri="TxtHtmlCleanerTags" %>

<html>
 <head><title>TxtHtmlCleanerSuccess.jsp</title></head>
   <body> 
          <table width ="100%"> 
              <tr> 
                 <td width="20%"> <img alt="No Display logo" src="Images/LogoWa2.jpeg">  </td>
                 <td width="30%"> <H3>txtHtmlCleanerSucess.jsp</H3></td>
               </tr>
           </table>
               
<hr>         
<p> Les Methodes de la classe  <b> TxtHtmlCleaner.java :</b> </p>
 <hr> 
<%--Encodes by converting each character to its equivalent HTML entit --%>
<b> 1- Test Methode encodeToHTMLEntity():</b>
<p>encodeToHTMLEntity (${"étoile"}) ==> ${watc:encodeToHTMLEntity(testTc0)}</p> 
<p>encodeToHTMLEntity (${"OÙ"}) ==> ${watc:encodeToHTMLEntity(testTc1)}</p>
<p>encodeToHTMLEntity (${"À Demain"}) ==> ${watc:encodeToHTMLEntity(testTc2)}</p>
 (Voir source pour voir un résultat parlant)
 </hr>
 
<hr>
<%-- Converts a character into its entity equivalent. If no entity--%>
<b> 2- Test Methode getNumericEntity():</b> 
<p>getNumericEntity (${(c1)}) ==>${watc: getNumericEntity(c1)}</p>
<p>getNumericEntity (${(c2)},"\u00A1") ==> ${watc: getNumericEntity(c2)}</p>
<p>getNumericEntity (${(c3)},"\u00A2")  ==> ${watc: getNumericEntity(c3)}</p>
<p>getNumericEntity (${(c4)},"\u00A3") ==>${watc: getNumericEntity(c4)}</p>
<p>getNumericEntity (${(c5)},"\u00A4") ==> ${watc: getNumericEntity(c5)}</p>
<p>getNumericEntity (${(c6)},"\u00A5")  ==> ${watc: getNumericEntity(c6)}</p>
(Voir source pour voir un résultat parlant)
</hr>
 
 <hr>         
<%--Convert html to text by deleting tags and replacing entities with characters--%>
<b> 3- Test Methode html2txt(): </b> 
 <p>html2txt (<html><Body> wanabe Tunis 2010 </boody></html>)==> ${watc:html2txt(testTcHtml1)}</p>
 <p>html2txt (<html><Body> created by SME </boody></html>)   ==> ${watc:html2txt(testTcHtml2)}</p>
(Voir source pour voir un résultat parlant)
</hr>
 
 <hr>         
<%--Convert html to text by deleting tags and replacing entities with characters--%>
<b> 4- Test Methode html2content(): </b> 
<p>html2content {"<html><Body> wanabe Tunis 2010 </boody></html>"} ==> ${watc:html2content(testTcHtml1)}</p>
<p>html2content {"<html><Body>  created by SME </boody></html>"} ==> ${watc:html2content(testTcHtml2)}</p>
(Voir source pour voir un résultat parlant)
</hr>
 
<hr>          
<%-- clean and replace accentuated character--%>
<b> 5- Test Methode replaceAccentChar(): </b>
 <p> Test  ==> ${watc:replaceAccentChar(testTc0)}</p>
 <p> Test  ==> ${watc:replaceAccentChar(testTc1)}</p>
 <p> Test  ==> ${watc:replaceAccentChar(testTc2)}</p>
 <p> Test  ==> ${watc:replaceAccentChar(testTc3)}</p>
</hr>
  
<hr>
 <%-- Converts a character into its entity equivalent. If no entity--%>
<b> 6- Test Methode getEntity():</b> 
<p>getEntity (${(c5)},"\u00A4") ==> ${watc: getEntity(c5)}</p>
<p>getEntity (${(c6)},"\u00A5")  ==> ${watc: getEntity(c6)}</p>
(Voir source pour voir un résultat parlant)
</hr>

<hr>
<%--  Cleans text sent by flash movies and removes html entities.--%>
<b> 7- Test Methode  flashXMLCleaner():</b>
<p> flashXMLCleaner ("A&amp;amp;B")-  ${watc:flashXMLCleaner("A&amp;B")}</p>
<p> flashXMLCleaner ("2&amp;lt;3") -  ${watc:flashXMLCleaner(" 2&lt;3")}</p>
<p> flashXMLCleaner ("3&amp;gt;2") -   ${watc:flashXMLCleaner("3&gt;2")}</p> 
</hr>
 
<hr>
<%-- --%>
<b> 8- Test Methode XMLtoFlash(():</b>
<p> XMLtoFlash ("A&B")-  ${watc:XMLtoFlash("A&B")}</p>
<p> XMLtoFlash ("2<3")-  ${watc:XMLtoFlash("2<3")}</p>
<p> XMLtoFlash ("3>2")-  ${watc:XMLtoFlash("3>2")}</p>
(Voir source pour voir un résultat parlant)
</hr>

<hr>
<p> <b> <A HREF="display.do">Retour</A></b> </p> 
        
 </body>
</html>

