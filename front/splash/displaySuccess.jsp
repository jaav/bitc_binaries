<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="splash_content_bg">
<div id="splash_content"> <img src="${staticSite}/img/ml/branding_splash.png"/>
  <!-- boxlg:start -->
  <div class="clr"></div>
  <div style="margin: 0 auto; width: 850px;">
	  <div class="box_lg"> <a href="<wa:url URI="front/home/display/section/visiteur"><wa:param name="clt"  value="BE_fr"/><wa:param name="cmid" value="616" /></wa:url>" title="FRANCAIS" class="btn_lg">FRANCAIS</a>
	    <p>
	    	<wa:include URI="front/splash/introList">
	    	<wa:param name="clt" value="BE_fr"/>
	    	</wa:include>
	    </p>
	    <wa:include URI="front/splash/navMenu" >
			<wa:param name="clt" value="BE_fr"/>
		</wa:include>
	  </div>
	  <!-- boxlg:end -->
	  <!-- boxlg:start -->
	  <div class="box_lg"> <a href="<wa:url URI="front/home/display/section/visiteur"><wa:param name="clt"  value="BE_nl"/><wa:param name="cmid" value="616" /></wa:url>" title="NEDERLANDS" class="btn_lg">NEDERLANDS</a>
	    <p>
	    	<wa:include URI="front/splash/introList">
	    	<wa:param name="clt" value="BE_nl"/>
	    	</wa:include>
	    </p>
	    <wa:include URI="front/splash/navMenu" >
			<wa:param name="clt" value="BE_nl"/>
		</wa:include>
	  </div>
	  
	  <!-- boxlg:end -->
	  <!-- boxlg:start -->
	  <div class="box_lg"> <a href="<wa:url URI="front/home/display/section/visiteur"><wa:param name="clt"  value="BE_en"/><wa:param name="cmid" value="616" /></wa:url>" title="ENGLISH" class="btn_lg">ENGLISH</a>
	    <p>
	    <wa:include URI="front/splash/introList">
	    	<wa:param name="clt" value="BE_en"/>
	    	</wa:include>
	    </p>
	    <wa:include URI="front/splash/navMenu" >
			<wa:param name="clt" value="BE_en"/>
		</wa:include>
	  </div>
</div>
  <!-- boxlg:end -->
  <div class="clr"></div>
</div>
</div>
