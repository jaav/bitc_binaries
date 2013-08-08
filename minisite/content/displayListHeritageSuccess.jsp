<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="wa" uri="WanabeTags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="btn_back" style="margin-bottom: 15px;">
	<a href="javascript:history.back();"><wa:mls>Back</wa:mls></a>
</div>
<!--btnback:end-->
<div class="clear"></div>
<div id="content_main">
	<wa:include URI="front/content/introList" />

    <wa:include URI="minisite/content/findHeritage" >
        <wa:param name="group" value="${group}"/>
    </wa:include>
	<wa:include URI="minisite/content/listHeritage">
		<wa:param name="pageSize" value="${5}" />
	</wa:include>
</div>