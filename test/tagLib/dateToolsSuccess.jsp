<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>

<%@ taglib prefix="wadt" uri="DateToolsTags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
   <head><title>dateToolsSuccess.jsp</title></head>
    <body> 
       <table width ="100%"> 
              <tr> 
                <td width="20%"> <img alt="No Display logo" src="Images/LogoWa2.jpeg">  </td>
                <td width="30%"> <H3> dateToolsSucess.jsp </H3></td>
              </tr>
       </table>
 
 <hr>     
<p> Les Methodes de la classe  <b> DateTools.java : </b></p>
 <hr>
<%--  Set of tools to manipulate dates  --%> 
<b> 1 - Test Methode parseDate():</b> 
<p> parseDate (${testDt1},'yyyy/MM/dd')  ==> ${wadt:parseDate(testDt1,'yyyy/MM/dd')}</p>
<p> parseDate (${testDt1},'yyyy/MM')     ==> ${wadt:parseDate(testDt1,'yyyy/MM')}</p>
<p> parseDate (${testDt2},'yyyy/MM/dd')  ==> ${wadt:parseDate(testDt2,'yyyy/MM/dd')}</p>
<p> parseDate :${testDt2},'yyyy/MM')     ==> ${wadt:parseDate(testDt2,'yyyy/MM')}</p>
</hr>

<hr>
<%-- Format a DB date. Ex of db date: "yyyy-MM-dd HH:mm:ss --%>  
 <b> 2 - Test Methode formatDBDate():</b> 
<p>formatDBDate("2010-12-12 12:12:12","yyyy/MM/dd") ==> ${wadt:formatDBDate("2010-12-12 12:12:12","yyyy/MM/dd")}</p>
<p>formatDBDate("2010-12-12 12:12:12","yyyy/MM")    ==> ${wadt:formatDBDate("2010-12-12 12:12:12","yyyy/MM")}</p>
 <p>formatDBDate("2010-12-12 12:12:12","MM/dd")     ==> ${wadt:formatDBDate("2010-12-12 12:12:12","MM/dd")}</p>
 </hr>

<hr>
<%-- Format a date. Ex: "dd/MM/yyyy HH:mm:ss" --%>
<b> 3- Test Methode formatDateByPattern():</b>
<p>formatDateByPattern (1970/01/01,'yyyy/MM/dd')  ==> ${wadt:formatDateByPattern(date,'yyyy/MM/dd')} </p>
<p>formatDateByPattern (1970/01/01,'yy/MM/dd')   ==> ${wadt:formatDateByPattern(date,'yy/MM/dd')} </p>
<p>formatDateByPattern (1970/01/01,'yy/MM')   ==> ${wadt:formatDateByPattern(date,'yy/MM')} </p>
<p>formatDateByPattern (1970/01/01,'MM/dd')   ==> ${wadt:formatDateByPattern(date,'MM/dd')} </p>
</hr>

<hr>
<%-- Format a date from a pattern to another one. Ex: "dd/MM/yyyy HH:mm:ss"--%>   
<b>4 - Test Methode formatDateByPatternOut():</b> 
<p>formatDateByPatternOut (${testDt1},'yyyy/MM/dd','yyyy/MM/dd') ==> ${wadt:formatDateByPatternOut(testDt1,'yyyy/MM/dd','yyyy/MM/dd')}</p>
<p>formatDateByPatternOut (${testDt1},'yyyy/MM/dd','dd/MM/yyyy') ==> ${wadt:formatDateByPatternOut(testDt1,'yyyy/MM/dd','dd/MM/yyyy')}</p>
<p>formatDateByPatternOut (${testDt2},'yyyy/MM/dd','yyyy/MM/dd') ==> ${wadt:formatDateByPatternOut(testDt2,'yyyy/MM/dd','yyyy/MM/dd')}</p>
<p>formatDateByPatternOut (${testDt2},'yyyy/MM/dd','dd/MM/yyyy') ==> ${wadt:formatDateByPatternOut(testDt2,'yyyy/MM/dd','dd/MM/yyyy')}</p>
</hr>

<hr>
<%-- Format a date. Ex: "dd/MM/yyyy HH:mm:ss"--%>   
<b>5 - Test Methode formatDateByTimesTamp():</b> :
<p>formatDateByTimesTamp (1982-07-03 16:15:30.4,"dd/MM/yyyy")==> ${wadt:formatDateByTimesTamp(ts1,"dd/MM/yyyy")}</p>   
<p>formatDateByTimesTamp (1982-07-03 16:15:30.4,"yyyy/MM/dd")==> ${wadt:formatDateByTimesTamp(ts1,"yyyy/MM/dd")}</p>   
<p>formatDateByTimesTamp  (1982-07-03 16:15:30.4,"MM/dd")==> ${wadt:formatDateByTimesTamp(ts1,"MM/dd")}</p>   
</hr>

<hr>
<%-- Format a date. Ex: "dd/MM/yyyy"--%> 
<b>6 - Test Methode formatDateByLanguage():</b> 
<p>formatDateByLanguage (${date},"EEE dd/MM/yyyy","EN")  ==>  ${wadt:formatDateByLanguage(date,"EEE dd/MM/yyyy","EN")}</p>
<p>formatDateByLanguage (${date},"EEE dd/MM/yyyy","NL")  ==>  ${wadt:formatDateByLanguage(date,"EEE dd/MM/yyyy","NL")}</p>
<p>formatDateByLanguage ${date},"EEE dd/MM/yyyy","FR")   ==>  ${wadt:formatDateByLanguage(date,"EEE dd/MM/yyyy","FR")}</p>
</hr>

<hr>
<%-- Format a date. Ex: "dd/MM/yyyy"--%> 
<b>7 - Test Methode formatDateByLanguage2():</b>

<p>formatDateByLanguage2 (${date},0,"EN")==> ${wadt:formatDateByLanguage2(date,0,"EN")}</p>
<p>formatDateByLanguage2 (${date},0,"NL")==> ${wadt:formatDateByLanguage2(date,0,"NL")}</p>
<p>formatDateByLanguage2 (${date},0,"FR")==> ${wadt:formatDateByLanguage2(date,0,"FR")}</p>
<p>formatDateByLanguage2 (${date},1,"EN")==> ${wadt:formatDateByLanguage2(date,1,"EN")}</p>
<p>formatDateByLanguage2 (${date},1,"NL")==> ${wadt:formatDateByLanguage2(date,1,"NL")}</p>
<p>formatDateByLanguage2 (${date},1,"FR") ==>${wadt:formatDateByLanguage2(date,1,"FR")}</p>
<p>formatDateByLanguage2 (${date},2,"EN")==> ${wadt:formatDateByLanguage2(date,2,"EN")}</p>
<p>formatDateByLanguage2 (${date},2,"NL")==> ${wadt:formatDateByLanguage2(date,2,"NL")}</p>
<p>formatDateByLanguage2 (${date},2,"FR")==> ${wadt:formatDateByLanguage2(date,2,"FR")}</p>

</hr>

<hr>
<b> <A HREF="display.do">Retour</A></b>  
 
 </body>
</html>
