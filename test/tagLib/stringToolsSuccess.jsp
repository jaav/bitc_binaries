<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>

<%-- TagLib --%>
<%@ taglib prefix="wast" uri="StringToolsTags" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  
<html>
 <head><title>stringToolsSuccess.jsp</title></head>
   <body> 
         <table width ="100%"> 
              <tr> 
                 <td width="20%"> <img alt="No Display logo" src="Images/LogoWa2.jpeg">  </td>
                 <td width="30%"> <H3>stringToolsSucess.jsp</H3></td>
               </tr>
           </table>
 
 <hr>
 <p> Les Methodes de la classe <b>StringTools java</b> :</p>
 
<hr>
 <%--Replace patterns with text in a buffer--%>           
<b>1 - Test Methode replace():</b> 
<p> replace (${testSt1}, 'a','z') -  ${wast:replace('a','z', "audaxis")}</p>
<p> replace (${testSt2}, 'a','o') -  ${wast:replace('a','o', "wanabe")}</p>
<p> replace (${testSt3}, 't','z') -  ${wast:replace('t','z', "tunis")}</p>
</hr>

<hr>
<%-- return str truncated at right --%>
<b> 2 - Test Methode truncR():</b> 
<p>truncR (${testSt2},1) -  ${wast:truncR(testSt2, 1)}</p>
<p>truncR (${testSt2},2) -  ${wast:truncR(testSt2, 2)}</p>
<p>truncR (${testSt2},3) -  ${wast:truncR(testSt2, 3)}</p>
<p>truncR (${testSt2},4) -  ${wast:truncR(testSt2, 4)}</p>
<p>truncR (${testSt2},5) -  ${wast:truncR(testSt2, 5)}</p>
<p>truncR (${testSt2},6) -  ${wast:truncR(testSt2, 6)}</p>
</hr>

<hr>
<%-- return str as Perl chop --%>
<b> 3 - Test Methode chop():</b> 
<p>chop (${testSt1}) -  ${wast:chop(testSt1)}</p>
<p>chop (${testSt2}) -  ${wast:chop(testSt2)}</p>
<p>chop (${testSt3}) -  ${wast:chop(testSt3)}</p>
</hr>

<hr>
<%-- return str chop num car at the end of the string--%>
<b> 4 - Test Methode chop2():</b> 
<p>chop2 (${testSt1},1) -  ${wast:chop2(testSt1,1)}</p>
<p>chop2 (${testSt1},2) -  ${wast:chop2(testSt1,2)}</p>
<p>chop2 (${testSt1},3) -  ${wast:chop2(testSt1,3)}</p>
<p>chop2 (${testSt1},4) -  ${wast:chop2(testSt1,4)}</p>
<p>chop2 (${testSt1},5) -  ${wast:chop2(testSt1,5)}</p>
<p>chop2 (${testSt1},6) -  ${wast:chop2(testSt1,6)}</p>
</hr>

<hr>
<%-- return an empty string if str is null, else return str.--%>
<b> 5 - Test Methode NullFree ():</b> 
<p>nullFree  (${testSt0}) ==>  ${wast:nullFree(testSt0)}</p>
<p>nullFree  (${testSt1}) ==> ${wast:nullFree(testSt1)}</p>
<p>nullFree  (${testSt2}) ==> ${wast:nullFree(testSt2)}</p>
</hr>

<hr>
<%-- return return repl if str is null, else return str.--%>
<b> 6 - Test Methode NullFree2():</b>

<p>nullFree2  (${testSt0},"test")    ==> ${wast:nullFree2(testSt0,"test")}</p>
<p>nullFree2  (${testSt1},"default") ==> ${wast:nullFree2(testSt1,"default")}</p>
<p>nullFree2  (${testSt2},"default") ==> ${wast:nullFree2(testSt2,"default")}</p>
<p>nullFree2  (${testSt3},"default") ==> ${wast:nullFree2(testSt3,"default")}</p>
</hr>

<hr>
<%-- return str left padded with character c--%>
<b> 7 - Test Methode PadL():</b>
<p>PadL(${testSt1},1,a) -  ${wast:padL(testSt1,1,'a')}</p> 
<p>PadL(${testSt1},10,a) -  ${wast:padL(testSt1,10,'a')}</p>
<p>PadL(${testSt1},100,a) -  ${wast:padL(testSt1,100,'a')}</p>
</hr>

<hr>
<%--return str right padded with character--%> 
<b> 8 - Test Methode PadR():</b>
<p>PadR(${testSt1},1,a) -  ${wast:padR(testSt1,1,'a')}</p> 
<p>PadR(${testSt1},10,a) -  ${wast:padR(testSt1,10,'a')}</p>
<p>PadR(${testSt1},100,a) -  ${wast:padR(testSt1,100,'a')}</p>
</hr>

<hr>
<%-- return return the number of occurence of the strSearched string in the string str --%>
<b> 9 - Test Methode getNumOccurString():</b> 
<p>getNumOccurString (${testSt2},'abc') -  ${wast:getNumOccurString(testSt2,"abc")}</p>
<p>getNumOccurString (${testSt2},'wan') -  ${wast:getNumOccurString(testSt2,"wan")}</p>
<p>getNumOccurString (${testSt2},'a') -    ${wast:getNumOccurString(testSt2,"a")}</p>
<p>getNumOccurString (${testSt5},'j') -    ${wast:getNumOccurString(testSt5,"j")}</p>
</hr>

<hr>
<%-- return str uppercase the first char of str --%>
<b> 10 - Test Methode upFirstChar():</b> 
<p>upFirstChar (${testSt1}) -  ${wast:upFirstChar(testSt1)}</p>
<p>upFirstChar (${testSt2}) -  ${wast:upFirstChar(testSt2)}</p>
<p>upFirstChar (${testSt3}) -  ${wast:upFirstChar(testSt3)}</p>
</hr>

<hr>
<%--  Turns a String into an array of Strings, by using StringTokenizerto split it up at whitespace. --%>
<b> 11 - Test Methode splitStr():</b>
<p>splitStr (${split0}) ==>  [${wast:splitStr(split0)[0]}${wast:splitStr(split0)[1]}${wast:splitStr(split0)[2]}]</p>
<p>splitStr (${split1}) ==> [${wast:splitStr(split1)[0]}${wast:splitStr(split1)[1]}${wast:splitStr(split1)[2]}]</p>
</hr>

<hr>
<%-- Turns a String into an array of Strings, by splitting it at the specified character.  This does not use StringTokenizer,
     and therefore can handle empty fields.--%> 
<b> 12 - Test Methode splitStrByCharDelim():</b> 
<p>splitStrByCharDelim ('${split3}', '.') ==>  [${wast:splitStrByCharDelim(split3,'.')[0]}${wast:splitStrByCharDelim(split3,'.')[1]}${wast:splitStrByCharDelim(split3,'.')[2]}]</p>
<p>splitStrByCharDelim ('${split4}', ',') ==> [${wast:splitStrByCharDelim(split4,',')[0]}${wast:splitStrByCharDelim(split4,',')[1]}${wast:splitStrByCharDelim(split4,',')[2]}]</p>
<p>splitStrByCharDelim ('${split2}', '/') ==> [${wast:splitStrByCharDelim(split2,'/')[0]}${wast:splitStrByCharDelim(split2,'/')[1]}${wast:splitStrByCharDelim(split2,'/')[2]}]</p>
</hr>

<hr>
<%-- Turns a String into an array of Strings, by splitting it at the specified character.  This does not use StringTokenizer,
      and therefore can handle empty fields.--%>
<b> 13 - Test Methode splitStrByStringDelim():</b>
<p>splitStrByStringDelim ('${split3}', ".") ==>  [${wast:splitStrByStringDelim(split3,".")[0]}${wast:splitStrByStringDelim(split3,".")[1]}${wast:splitStrByStringDelim(split3,".")[2]}]</p>
<p>splitStrByStringDelim ('${split4}', ",") ==>  [${wast:splitStrByStringDelim(split4,",")[0]}${wast:splitStrByStringDelim(split4,",")[1]}${wast:splitStrByStringDelim(split4,",")[2]}]</p>
<p>splitStrByStringDelim  '${split2}', "/") ==>  [${wast:splitStrByStringDelim(split2,"/")[0]}${wast:splitStrByStringDelim(split2,"/")[1]}${wast:splitStrByStringDelim(split2,"/")[2]}]</p>
</hr>

<hr>
<%-- Turns a String into an array of Strings, by using StringTokenizer to split it up at whitespace.--%>
<b> 14 - Test Methode splitStrNoEmptyField():</b> 
<p>splitStrNoEmptyField  ('${split5}',"||") ==> [${wast:splitStrNoEmptyField(split5,"||")[0]}${wast:splitStrNoEmptyField(split5,"||")[1]}${wast:splitStrNoEmptyField(split5,"||")[2]}]</p>
<p>splitStrNoEmptyField  ('${split6}',"|") ==> [${wast:splitStrNoEmptyField(split6,"|")[0]}${wast:splitStrNoEmptyField(split6,"|")[1]}${wast:splitStrNoEmptyField(split6,"|")[2]}]</p>
</hr>

<hr>
<%-- Format a text and cut lines  to reach maximum number of columns per line --%>
<b> 15 - Test Methode formatText():</b>
<p>formatText (${testSt3},1) -  ${wast:formatText(testSt3,1)}</p>
<p>formatText (${testSt3},2) -  ${wast:formatText(testSt3,2)}</p>
<p>formatText (${testSt3},3) -  ${wast:formatText(testSt3,3)}</p>
<p>formatText (${testSt3},4) -  ${wast:formatText(testSt3,4)}</p>
</hr>

<hr>
<%--Format a text and cut lines  to reach maximum number of columns per line--%>
<b> 16- Test Methode formatTextMultiLine():</b>
<p>formatTextMultiLine ((${testSt0},0) -  ${wast:formatTextMultiLine(testSt0,0)}</p>
<p>formatTextMultiLine ((${testSt0},1) -  ${wast:formatTextMultiLine(testSt0,1)}</p>
<p>formatTextMultiLine (${testSt1} ,0) -  ${wast:formatTextMultiLine(testSt1,0)}</p>
<p>formatTextMultiLine (${testSt1} ,1) -  ${wast:formatTextMultiLine(testSt1,1)}</p>
<p>formatTextMultiLine (${testSt1} ,2) -  ${wast:formatTextMultiLine(testSt1,2)}</p>
<p>formatTextMultiLine (${testSt1} ,3) -  ${wast:formatTextMultiLine(testSt1,3)}</p>
</hr>

<hr>
<%--Convert string to int, if error, default to def.--%> 
<b> 17- Test Methode toInt():</b>
<p>toInt return Int("",0) -  ${wast:toInt("str",0)}</p>
<p>toInt return Int("1.0",1) -  ${wast:toInt("1.0",1)}</p>
<p>toInt return Int("2.25",5) -  ${wast:toInt("2.25",5)}</p>
<p>toInt return Int("bitc v",3) -  ${wast:toInt("bitc v",3)}</p>
</hr>

<hr>
<%--format a number with x digits after the comma --%> 
<b> 18- Test Methode formatDouble():</b>
<p>formatDouble (100.0,1) -  ${wast:formatDouble(100.0,1)}</p>
<p>formatDouble (100.0,2) -  ${wast:formatDouble(100.0,2)}</p>
<p>formatDouble (100.0,3) -  ${wast:formatDouble(100.0,3)}</p>
<p>formatDouble (100.0,4) -  ${wast:formatDouble(100.0,4)}</p>
<p>formatDouble (100.0,5) -  ${wast:formatDouble(100.0,5)}</p>
</hr>

<hr>
<%-- @return num x text. Eg, multi("bla",2) -> blabla --%>
<b> 19- Test Methode multi():</b>
<p> multi (${testSt2},*1) -  ${wast:multi(testSt2,1)}</p>
<p> multi (${testSt2},*2) -  ${wast:multi(testSt2,2)}</p>
<p> multi (${testSt2},*3) -  ${wast:multi(testSt2,3)}</p>
<p> multi (${testSt2},*4) -  ${wast:multi(testSt2,4)}</p>
<p> multi (${testSt2},*5) -  ${wast:multi(testSt2,5)}</p>
</hr>

<hr>
<%-- return the string with maximum x characters (cut it) --%>
<b> 20- Test Methode maxStr():</b>
<p> maxStr (${testSt2},0) -  ${wast:maxStr(testSt2,0)}</p>
<p> maxStr (${testSt2},1) -  ${wast:maxStr(testSt2,1)}</p>
<p> maxStr (${testSt2},2) -  ${wast:maxStr(testSt2,2)}</p>
<p> maxStr (${testSt2},3) -  ${wast:maxStr(testSt2,3)}</p>
<p> maxStr (${testSt2},4) -  ${wast:maxStr(testSt2,4)}</p>
<p> maxStr (${testSt2},5) -  ${wast:maxStr(testSt2,5)}</p>
<p> maxStr (${testSt2},6) -  ${wast:maxStr(testSt2,6)}</p>
</hr>

<hr>
<%-- Reverse the order of the characters in the string --%>
<b> 21- Test Methode reverse():</b>
<p> reverse (${testSt1}) -  ${wast:reverse(testSt1)}</p>
<p> reverse (${testSt2}) -  ${wast:reverse(testSt2)}</p>
<p> reverse (${testSt3}) -  ${wast:reverse(testSt3)}</p>
</hr>

<hr>
<%-- Convert string to int, if error, default to def--%>
<b> 22- Test Methode toDouble2 (:</b>
<p>toDouble2 ("",6.5)- ${wast:toDouble2("", 6.5)}</p>
<p>toDouble2 ("5.5", 1.0) - ${wast:toDouble2("5.5", 1.0)}</p>
<p>toDouble2 ("10.5", 10.05) - ${wast:toDouble2("10.5", 10.05)}</p>
<p>toDouble2 ("SME", 0.5)- ${wast:toDouble2("SME",0.5)}</p>
</hr>

<hr>
 <%-- Convert string to int, if error, default to def--%>
<b> 23- Test Methode toDouble3():</b>
<p>toDouble3 ("",1.25, true) -  ${wast:toDouble3("", 1.25, true)}</p>
<p>toDouble3 ("",1.25, false) -  ${wast:toDouble3("", 1.25, false)}</p>
<p>toDouble3 ("1,5",1, true) -  ${wast:toDouble3("1,5",1,true)}</p>
<p>toDouble3 ("1,5",1, false) -  ${wast:toDouble3("1,5",1,false)}</p>
<p>toDouble3 ("1000,5",1, true) -  ${wast:toDouble3("1000,5",1,true)}</p>
<p>toDouble3 ("1000,5",1, false) -  ${wast:toDouble3("1000,5",1,false)}</p>
<p>toDouble3 ("1 000,5",1,true) -  ${wast:toDouble3("1 000,5",1,true)}</p>
</hr>

<hr>
 <%--  Checks whether a string matches a given wildcard pattern--%>
<b> 24- Test Methode match():</b>
<p>match ("java","java") -  ${wast:match("java","java")}</p>
<p>match ("wanabe","wanabe") -  ${wast:match("wanabe","wanabe")}</p>
<p>match ("wanabe","audaxis") -  ${wast:match("wanabe","audaxis")}</p>
</hr>

<hr>
<%--  Sorts an array of Strings--%>
<b> 25 - Test Methode sortStringsTab():</b> 
<p>
    <c:forEach var="item" items ="${tab}"> ${item} -</c:forEach>  ==>
    <c:forEach var="item" items ="${wast:sortStringsTab(tab)}"> - ${item} </c:forEach>
</p> 
</hr>

<hr>
 <%-- Locates a String in an array of Strings--%>
<b> 26 - Test Methode indexOfString() :</b>
<p>indexOfString: ([<c:forEach var="item" items ="${tab}"> ${item} -</c:forEach>],'Jstl')  ==>
   ${wast:indexOfString(tab,'Jstl')}</p>
 <p>indexOfString: ([<c:forEach var="item" items ="${tab}"> ${item} -</c:forEach>],'Ant')  ==>
   ${wast:indexOfString(tab,'Ant')}</p>
 <p>indexOfString: ([<c:forEach var="item" items ="${tab}"> ${item} -</c:forEach>],'ant')  ==>
   ${wast:indexOfString(tab,'ant')}</p>   
<p>indexOfString: ([<c:forEach var="item" items ="${tab}"> ${item} -</c:forEach>],'Gwt')  ==>
   ${wast:indexOfString(tab,'Gwt')}</p>   
<p>indexOfString: ([<c:forEach var="item" items ="${tab}"> ${item} -</c:forEach>],'gwt')  ==>
   ${wast:indexOfString(tab,'gwt')}</p>   
<p>indexOfString: ([<c:forEach var="item" items ="${tab}"> ${item} -</c:forEach>],'Hibernate')  ==>
   ${wast:indexOfString(tab,'Hibernate')}</p>   
<p>indexOfString: ([<c:forEach var="item" items ="${tab}"> ${item} -</c:forEach>],'hibernate')  ==>
   ${wast:indexOfString(tab,'hibernate')}</p>   
</hr>

<hr>
<%-- Locates a String in an array of Strings, ignoring case--%>
<b> 27 - Test Methode indexOfStringIgnoreCase():</b>
<p>indexOfStringIgnoreCase: ([<c:forEach var="item" items ="${tab1}"> ${item}-</c:forEach>],'Jsf')  ==>
   ${wast:indexOfStringIgnoreCase(tab1,'Jsf')}</p>
<p>indexOfStringIgnoreCase: ([<c:forEach var="item" items ="${tab1}"> ${item}-</c:forEach>],'jsf')  ==>
   ${wast:indexOfStringIgnoreCase(tab1,'jsf')}</p>
<p>indexOfStringIgnoreCase: ([<c:forEach var="item" items ="${tab1}"> ${item}-</c:forEach>],'Ajax')  ==>
   ${wast:indexOfStringIgnoreCase(tab1,'Ajax')}</p>
<p>indexOfStringIgnoreCase: ([<c:forEach var="item" items ="${tab1}"> ${item}-</c:forEach>],'ajax')  ==>
   ${wast:indexOfStringIgnoreCase(tab1,'ajax')}</p>
<p>indexOfStringIgnoreCase: ([<c:forEach var="item" items ="${tab1}"> ${item}-</c:forEach>],'JavaScript')  ==>
   ${wast:indexOfStringIgnoreCase(tab1,'JavaScript')}</p>
<p>indexOfStringIgnoreCase: ([<c:forEach var="item" items ="${tab1}"> ${item}-</c:forEach>],'javaScript')  ==>
   ${wast:indexOfStringIgnoreCase(tab1,'javaScript')}</p>
<p>indexOfStringIgnoreCase: ([<c:forEach var="item" items ="${tab1}"> ${item}-</c:forEach>],'Jquery')  ==>
   ${wast:indexOfStringIgnoreCase(tab1,'Jquery')}</p>
<p>indexOfStringIgnoreCase: ([<c:forEach var="item" items ="${tab1}"> ${item}-</c:forEach>],'jquery')  ==>
   ${wast:indexOfStringIgnoreCase(tab1,'jquery')}</p>
</hr>

<hr>
 <%--  Compares two arrays of Strings for equality --%>
<b> 28 - Test Methode equalsStrings (): </b> 
<p>  Tab =  [<c:forEach var="item"  items ="${tab}">  ${item} -</c:forEach>] </p>
<p>  Tab1 = [<c:forEach var="item" items ="${tab1}">  ${item} -</c:forEach>]</p>
<p> ==> Resultat : ${wast:equalsStrings(tab,tab1)}</p>
<p>  Tab =  [<c:forEach var="item"  items ="${tab}">  ${item} -</c:forEach>] </p>
<p>  Tab = [<c:forEach var="item" items ="${tab}">  ${item} -</c:forEach>]</p>
<p> ==> Resultat : ${wast:equalsStrings(tab,tab)}</p>
</hr>

<hr>
<%-- Sorts a list of Strings. Java currently has no general sort function.  Sorting Strings is
    common enough that it's worth making a special case.  --%>
<b> 29 - Test Methode flattenStrArray ():</b>     
<p>Add a Sep '/' betwenn elements of the table [<c:forEach var="item" items ="${tab}">${item}, </c:forEach>]  ==>
   ${wast:flattenStrArray(tab,'/')}</p>
<p>Add a Sep '-' betwenn elements of the table [<c:forEach var="item" items ="${tab}">${item},</c:forEach>]  ==>
   ${wast:flattenStrArray(tab,'-')}</p>
</hr>
<hr>

<%-- Sorts a list of Strings--%>
<b> 30 - Test Methode sortStringsLis():</b>
<p> 
<c:forEach var="item" items ="${list}"> ${item} -</c:forEach>  ==>
    <c:forEach var="item" items ="${wast:sortStringsList(list)}"> - ${item} </c:forEach>
</p>
<p> 
<c:forEach var="item" items ="${list1}"> ${item} -</c:forEach>  ==>
    <c:forEach var="item" items ="${wast:sortStringsList(list1)}"> - ${item} </c:forEach>
</p>
</hr>

<hr>
<%-- Sorts a list of Strings (ignorecase)--%>
<b> 31 - Test Methode sortStringsIgnoreCase():</b>
<p>
<c:forEach var="item" items ="${list}"> ${item} -</c:forEach>  ==>
    <c:forEach var="item" items ="${wast:sortStringsIgnoreCase(list)}"> - ${item} </c:forEach>
</p>
<p>
<c:forEach var="item" items ="${list1}"> ${item} -</c:forEach>  ==>
    <c:forEach var="item" items ="${wast:sortStringsIgnoreCase(list1)}"> - ${item} </c:forEach>
</p>
</hr>

<hr>
<b> <A HREF="display.do">Retour</A></b>  

   </body>
 </html>