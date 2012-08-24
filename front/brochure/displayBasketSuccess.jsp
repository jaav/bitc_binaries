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
<link rel="stylesheet" type="text/css" href="${static}/front/css/nyroModal.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/jquery.ui.datepicker.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/jquery.ui.theme.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/SpryValidationSelect.css" media="screen, projection"/>


<script type="text/javascript" src="${static}/front/js/jquery.nyroModal-1.6.2.min.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.core.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.widget.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.datepicker-${culture.language}.js"></script>
<script type="text/javascript" src="${static}/front/js/SpryValidationSelect.js"></script>


<script type="text/javascript">


function formRecalculate(){
	var errorFlag=false;
	//
	$("#submitType").attr("value","recalculate");
	//
	for(i=1; i<=${fn:length(listProduct)}; i++){
		
		eval("var sprySelect" +i+ " = new Spry.Widget.ValidationSelect(\"spry_language_product_"+i+"\")" );
			
		if(!eval("sprySelect" +i+ ".validate()" )){
			errorFlag=true;
		}
	}
	//
	if(!errorFlag){
		$("#basketForm").submit();
	}

}

function formNext(){
	var errorFlag=false;
	//
	$("#submitType").attr("value","next");
	//
	for(i=1; i<=${fn:length(listProduct)}; i++){
		
		eval("var sprySelect" +i+ " = new Spry.Widget.ValidationSelect(\"spry_language_product_"+i+"\")" );
			
		if(!eval("sprySelect" +i+ ".validate()" )){
			errorFlag=true;
		}
	}
	//
	if(!errorFlag){
		$("#basketForm").submit();
	}
}




/*CALCULATOR*/		
$(document).ready(function(){
						   
	$(".operator_add, .operator_minus").click( function() {
										
		var valueNum = $(this).parent().parent().children("input").val();	
		
		if($(this).hasClass("operator_add")){
			valueNum ++
		}
		if($(this).hasClass("operator_minus")){
			valueNum --
		}

		if(valueNum < 0){
			valueNum=0;
		}else if(  valueNum > 999){
			valueNum=999;	
		}
		
		$(this).parent().parent().children("input").val(valueNum)
		return false;
	} );	
	//AVOID NEGATIVE VALUE
	$('input').blur(function() {
		var valueNum = $(this).val();
		if(valueNum < 0){
			valueNum=0;
		}else if(  valueNum > 999){
			valueNum=999;	
		}
		$(this).val(valueNum)
	});
	
})
</script>

  <!--contentMain:start-->
  <div id="content_main">
    <h1 class="line_pink"><wa:mls>ACHETER EN LIGNE</wa:mls></h1>
    <!--nav_eshop:start-->

    <ul id="nav_eshop">
      <li class="select"><b>1. <wa:mls>Mon panier</wa:mls></b></li>
      <li><b>2. <wa:mls>Coordonnées</wa:mls></b></li>
      <li><b>3. <wa:mls>Récapitulatif</wa:mls></b></li>
      <li><b>4. <wa:mls>Confirmation</wa:mls></b></li>
    </ul>
    <!--nav_eshop:end-->
    <br clear="all" />
    <div class="clr"></div>
    <hr class="dashed" />
    
    <form id="basketForm" action="${context}/${site}/${module}/fillPrices.do" method="get">
    
    <input id="submitType" name="submitType" type="hidden" value="none" />
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="basket">
      <tr>
        <td><h4 class="no_margin"><wa:mls>Articles dans votre panier</wa:mls></h4></td>
        <td >&nbsp;</td>
        <td ><h4 class="no_margin"><wa:mls>Langue</wa:mls></h4></td>
        <td>&nbsp;</td>
        <td ><h4 class="no_margin"><wa:mls>Prix</wa:mls></h4></td>
        <td>&nbsp;</td>
        <td ><h4 class="no_margin"><wa:mls>Quantité</wa:mls></h4></td>
        <td >&nbsp;</td>
        <td >&nbsp;</td>
      </tr>
	  
      <%-- ${item.key.value*item.value}--%>
      <c:forEach var="item" items="${listProduct}" varStatus="loop">
	      <c:if test="${loop.count>1}">
	      <hr / class="m17">
	      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="basket">
	      </c:if>
	      <tr>
	        <td  class="article">${item.mainTitle}
	        </td>
	        <td class="space">&nbsp;</td>
	        
	        <td class="date">
	        <span id="spry_language_product_${loop.count}">
				<select id="language_product_${item.id}" name="language_product_${item.id}">
	            	<option><wa:mls>Choisissez</wa:mls></option>
	           		<c:forEach var="language" items="${item.listLinkPropertyValueLanguage}">
						<option value="${language.valueName}" <c:if test="${item.language == language.valueName}"> selected="selected" </c:if>>${language.valueName}</option>
        			</c:forEach>
	          	</select>
	         <div class="clr"></div>
	         <div class="selectRequiredMsg clr" style="margin-left: 0; width: auto; color: #fa869b;"><wa:mls>Veuillez faire un choix</wa:mls></div>
	         </span>
	    
	        </td>
	       
	        <td  class="space">&nbsp;</td>
	        <!-- sizeof list prices ${fn:length(item.catalogPrices)} -->
	        <c:forEach var="price" items="${item.catalogPrices}" varStatus="loopPrices">
	        	<c:if test="${price.isActive}">
			        <c:if test="${loopPrices.count != 1}">
				        <tr>
					        <td>&nbsp;</td>
					        <td>&nbsp;</td>
					        <td>&nbsp;</td>
					        <td>&nbsp;</td>
			        </c:if>
			        <td class="price">${price.mainTitle}<br />
				        		<strong>${price.value} &euro;</strong>  
			        </td>         
			        <td  class="space">&nbsp;</td>
			        <td class="quantity"><div class="float_left"> 
			        	<a href="javascript:void(0)" class="operator_add"  alt="+"><img src="${static}/front/img/ml/addition.jpg" alt="+"/></a><br />
			            <a href="javascript:void(0)" class="operator_minus" alt="-"><img src="${static}/front/img/ml/minus.gif" alt="-"/></a> </div>
			          <input name="quantity_product_${item.id}_price_${price.id}" type="text" id="quantity_product_${item.id}_price_${price.id}" value="${price.quantity}" size="4" class="float_right"/></td>
			        <td class="space">&nbsp;</td>
			        <td class="dustbin"><a href="${context}/${site}/${module}/deleteProduct/productId/${item.id}.do"><img src="${static}/front/img/ml/visu_dustbin.jpg" alt="delete"/></a></td>
		        </tr>
		        </c:if>
	        </c:forEach>
	        <c:if test="${loop.count < fn:length(listProduct)}">
	        </table>
	        </c:if>
      </c:forEach>

      
    </table>
    </form>
    <c:if test="${errorEshop != null}">
    	<div class="error_eshop"><wa:mls>${errorEshop}</wa:mls></div>
    </c:if>
    <div class="clr"></div>
    <div class="box_total">    
	 	<a href="javascript:formRecalculate();" class="btn_update">Recalculer</a>
	 	<a href="${context}/${site}/${module}/emptyBasket.do" class="btn_update">Vider le panier</a>    

	 	<div class="group">
		    <span><wa:mls>TOTAL ARTICLES TTC</wa:mls> : ${total} &euro;</span> 
		</div>
		<div class="clr"></div>	    
    </div>
    <a href="javascript:history.back()" class="btn_previous_eshop float_left"><wa:mls>Précédent</wa:mls></a> <a href="javascript:formNext();" class="btn_next_eshop float_right"><wa:mls>Suivant</wa:mls></a>
    <div class="clr"></div>
  </div>
  <!--contentMain:end-->
  