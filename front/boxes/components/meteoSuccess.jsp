<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  <!-- component meteo:start -->
    <div id="meteo"> <ilayer>
      <iframe src="http://www.meteobelgium.be/service/${culture.language}/code/index.php?code=1000&type=ville&choix=1"
    allowtransparency="true" align="center" frameborder="0"
    scrolling="no" > </iframe>
      </ilayer> </div>
    <!-- component meteo:end -->