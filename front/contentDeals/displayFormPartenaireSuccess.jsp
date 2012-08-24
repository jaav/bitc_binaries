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
 

<script type="text/javascript" src="${staticSite}/js/SpryValidationTextField.js"></script>
<script type="text/javascript" src="${staticSite}/js/SpryValidationConfirm.js"></script>
<script type="text/javascript" src="${staticSite}/js/SpryValidationTextarea.js"></script>
<script type="text/javascript" src="${staticSite}/js/SpryValidationCheckbox.js"></script>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationTextField.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationTextField_contact.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationConfirm.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationTextarea.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationCheckbox.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationSelect_contact.css" media="screen, projection"/>

<!-- javascripts -->
 
	  <div id="btn_back"><a href="javascript:history.back();"><wa:mls>Back</wa:mls></a></div>
	  <c:choose>
	<c:when test="${culture.language eq 'en'}">
	<fmt:setLocale value="en_US" />	
	</c:when>
	<c:otherwise>
	<fmt:setLocale value="${culture.language}" />
	</c:otherwise>
</c:choose>
<div id="content_main">
	<wa:include URI="${site}/content/introForm" />
	     
<form class="form_deals" action="<wa:url URI="${site}/${module}/saveDeals/clt/${culture}"/>" method="post" enctype="multipart/form-data" id="save_deals">
      <fieldset>
      <p class="error">${ERROR_DEALS}</p>
        <div class="clr"></div>
        
          
            <div class="clr"></div>
             
             <span id="tfv_type"   onchange="javascript:visibleSearch();">
						<label for="f_type"><wa:mls>type de Deals</wa:mls></label>
						 
							<wa:include URI="${site}/dropdown/dropList">
					            <wa:param name="class" value="com.bitc.cms.ContentDealsType" />
								<wa:param name="manager" value="com.bitc.cms.manager.ContentDealsTypeManager" />
								<wa:param name="method" value="listAll" />
								<wa:param name="choiceMsg" value="Choose"/>
								<wa:param name="identity" value="name" />
								<wa:param name="display" value="name" />
								<wa:param name="name" value="f_type" />
								<wa:param name="selectedValues" value="${waParam.f_type}" />
							</wa:include>
					
						    	
				<img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
		        <div class="selectRequiredMsg clr"><wa:mls>Veuillez faire un choix</wa:mls></div>   
		            
                </span>
                
           
              <div class="clr"></div>
      <script type="text/javascript" src="/bitc/static/ajax/js/contentDeals.js"></script>
       <div style="float:rigth;" id="search">
      		<span id="tfv_name" >
	        	<label for="f_name" ><wa:mls>Nom de lieu</wa:mls></label>
	        	<input name="f_name" id="name" type="text" maxlength="20" value="${wa:nullFree(contentDeals.name) }" onBlur="javascript:visibleSearch();" ></input> 
	        	<span id= "buttonsearch" style="float:left;  display:none;">
			        	<a href="javascript:loadListVenueFromDb( );" class="searchlistVenue" title="<wa:mls>Recherchez un lieu lié</wa:mls>"> <wa:mls>Recherchez</wa:mls>&nbsp;&nbsp;&nbsp;</a>
			    </span>   	
				        <img src="${staticSite}/img/ml/ok.png" class="validMsg" />
				         <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
			            <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
			         
        	</span>        	               	
        </div> 
         <div class="clr"></div> 
         <div id="listVenue"  style="display:none;" >
           <span id="tfv_type" >
		     <label for="f_idVenue"> <wa:mls>Choose lieu liee</wa:mls></label>
			 <select id= "idVenue"name ="f_idVenue" style="width:250px;">    </select>
		</span>  </div>      
               <div class="clr"></div> 
            
            
         <span id="tfv_price" >
        <label  for="f_price" ><wa:mls>priceTVAC</wa:mls>&nbsp;&nbsp;&euro;</label>
	        <input name="f_price" id="price" type="text" maxlength="80" value="${wa:nullFree(contentDeals.price)}"/>  
	      <img src="${staticSite}/img/ml/ok.png" class="validMsg"  style="position:relative; " />
	      <img src="${staticSite}/img/ml/erreur.png" class="errorMsg"/>
	    
                 <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        <div class="textfieldInvalidFormatMsg clr"><wa:mls>Encodage du prix incorrect !</wa:mls></div>
        </span>
       
	      <div class="clr"></div>
          <span id="tfv_url">
	        <label for="f_url"><wa:mls>website :</wa:mls></label>
	        <input name="f_url"    type="text" maxlength="50" value="${wa:nullFree(contentDeals.url) }"/>
	      <input name="f_type" type="hidden"  value="${waParam.f_typeV}"/>
	  

        </span>
        <div class="clr"></div>
        <span id="tfv_abstract">
	        <label for="f_abstract_" ><wa:mls>Résumé du deal</wa:mls></label>
	         <textarea name="f_abstract_"  id="abstract" type="text" maxlength="1000"  />${wa:nullFree(contentDeals.abstract_)}</textarea>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
           <div class="textareaRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        
	            </span>
	             <div class="clr"></div>
 <!--   -----------------       -->
 
 
                      <span id="tfv_periodVisibility"  >
                        <label for="f_periodVisibility" ><wa:mls>periode de Visibility :</wa:mls></label> 
                        <select name="f_periodVisibility" style="width:250px;" id="periodValid">
	                    <option value=""/><wa:mls>Choose</wa:mls></option>
	                      <c:forEach var="item" items="${dates}" varStatus="loop">
	                
	                	   
	                	
	              		<option value="<fmt:formatDate pattern="dd/MM/yyyy" value="${item}"/>"><fmt:formatDate pattern="MMMM/yyyy" value="${item}"/></option>
	              	</c:forEach>
	              </select>
	             	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
                       <div class="textareaRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>     
              </span>

              <div class="clr"></div> 
 <!--   -----------------       -->
             
           <span id="tfv_periodFromDate">
            <label for="f_periodFromDate"><wa:mls>Periode de validité du</wa:mls></label>
            <script>
           	$(function() {
           		$("#f_periodFromDate").datepicker({
					showOn: 'button',
					buttonImage: '${static}/front/img/ml/calendar.gif',
					buttonImageOnly: true,		
					minDate: '+0D', 
					maxDate: '+2Y',
					onSelect: function(dateText, inst) { 			 	
						var day=dateText.substr(0,2);
						var month=dateText.substr(3,2);
						var year=dateText.substr(6,4);
						var monthYear=year+"-"+month;
						 $("#tfv_periodFromDate .errorMsg").hide();
				    	 $("#tfv_periodFromDate .validMsg").show();
				    	 $("#idFromDate").hide();
							}
							})
					  	  });
			</script>
           	<input name="f_periodFromDate" type="text" id="f_periodFromDate"  class="datepicker" <c:choose>
           	<c:when test="${contentDeals.periodFromDate==null}">value="<fmt:formatDate pattern="dd/mm/yyyy" value="${f_periodFromDate}"/>"
           	</c:when><c:otherwise>value="<fmt:formatDate pattern="dd/mm/yyyy" value="${contentDeals.periodFromDate}"/>"</c:otherwise></c:choose>
           		 /> 
             <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
              
             <div   class="textfieldRequiredMsg clr" id="idFromDate"><wa:mls>Ce champ est obligatoire</wa:mls></div>
            </span> 
           <div class="clr"></div>
            <span id="tfv_periodToDate">
           	<label for="f_periodToDate"><wa:mls>Au</wa:mls></label>
            <script>
           	$(function() {
					  		$("#f_periodToDate").datepicker({
							showOn: 'button',
							buttonImage: '${static}/front/img/ml/calendar.gif',
							buttonImageOnly: true,		
							minDate: '+0D', 
							maxDate: '+2Y',
							onSelect: function(dateText, inst) { 			 	
								var day=dateText.substr(0,2);
								var month=dateText.substr(3,2);
								var year=dateText.substr(6,4);
								var monthYear=year+"-"+month;
								 $("#tfv_periodToDate .errorMsg").hide();
						    	 $("#tfv_periodToDate .validMsg").show();
						    	 $("#idToDate").hide();
							  
							}
							})
					  	  });
			</script>
           		<input name="f_periodToDate" type="text" id="f_periodToDate"  class="datepicker" <c:choose>
           	<c:when test="${contentDeals.periodToDate==null}">value="<fmt:formatDate pattern="dd/mm/yyyy" value="${f_periodToDate}"/>"
           	</c:when><c:otherwise>value="<fmt:formatDate pattern="dd/mm/yyyy" value="${contentDeals.periodToDate}"/>"</c:otherwise></c:choose>
            /> 
               <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
                  <div class="textfieldRequiredMsg clr" id="idToDate"><wa:mls>Ce champ est obligatoire</wa:mls></div>
      
  
     </span>
        <div class="clr"></div>
        
               <span id="tfv_minParticipants">
        <label  for="f_minParticipants"><wa:mls>Nre de participants de</wa:mls></label>
	        <input name="f_minParticipants" type="text" maxlength="80" value="${wa:nullFree(contentDeals.minParticipants) }"/>
	       
        
        </span>
       <div class="clr"></div>
             <span id="tfv_maxParticipants">
        <label  for="f_maxnParticipants"><wa:mls>A</wa:mls></label>
	        <input name="f_maxParticipants" type="text" maxlength="80" value="${wa:nullFree(contentDeals.maxParticipants)}"/>
	 
        
        </span>
 
       <div class="clr"></div>
       <span id="tfv_body">
	        <label for="f_body"><wa:mls>Description</wa:mls></label>
	        <textarea name="f_body"   id="body" type="text" maxlength="1000"/>${wa:nullFree(contentDeals.body)}</textarea>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
                <div class="textareaRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
	     </span>
	      <div class="clr"></div>
	       <span id="tfv_author">   
       <label  for="f_author"><wa:mls>personne de contact</wa:mls></label>
	        <input name="f_author" id="author"type="text" maxlength="80" value="${wa:nullFree(contentDeals.author)}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
                 <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
       
        </span>
           <div class="clr"></div> 
         <span id="tfv_phone">   
       <label  for="f_phone"><wa:mls>phone</wa:mls></label>
	        <input name="f_phone" id="phone" type="text" maxlength="80" value="${wa:nullFree(contentDeals.phone)}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
                 <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
                   <div class="textfieldInvalidFormatMsg clr"><wa:mls>Encodage du phone incorrect  !</wa:mls></div>
       
        </span>
       <div class="clr"></div>
       
        <span id="tfv_email">
        <label  for="f_email"><wa:mls>E-mail*</wa:mls></label>
	        <input name="f_email" id="email" type="text" maxlength="80"  value="${wa:nullFree(contentDeals.email)}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
                 <div class="textfieldRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
        <div class="textfieldInvalidFormatMsg clr"><wa:mls>Le format de votre adresse n'est pas valide !</wa:mls></div>
        </span>
       <div class="clr"></div>
            <span id="tfv_emailConf">
        <label  for="f_emailConf"><wa:mls>Confirmer Le-mail</wa:mls></label>
	      <input name="f_emailConf" id= "Cemail" type="text" maxlength="80" value="${wa:nullFree(contentDeals.email)}"/>
	        <img src="${staticSite}/img/ml/ok.png" class="validMsg" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
           <div class="confirmRequiredMsg clr"><wa:mls>Ce champ est obligatoire</wa:mls></div>
           <div class="confirmInvalidMsg clr"><wa:mls>L'adresse n'est pas valide !</wa:mls></div> 
           </span>
        
   
     
       <div class="clr"></div>   
	      <span id="tfv_smallImage">   
       <label for="f_smallImage"><wa:mls>upload logo</wa:mls></label>
	   <input name="f_smallImage" type="file" value="" /> 
	     </span> 
	  <div class="clr"></div>   
	   <span id="tfv_bigImage">   
       <label for="f_bigImage"><wa:mls>upload picture</wa:mls></label>
	   <input name="f_bigImage" type="file" value=""/> 
	     </span> 
	  <div class="clr"></div>  
	   <br/>
               <span >
     

	    </span>
	     <div class="clr"></div>  
	     <span id="check_valid">
	      	<input type="checkbox"   id="valid" name="f_valid" id="valid" class="checkbox" /> 
	        <label for="f_valid"><a href="<wa:url URI="${site}/contentDeals/displayConditionsVentes/clt/${culture}"/>"  target="admin"><wa:mls>J’ai lu les conditions de ventes et j'accepte</wa:mls></a></label>
	      	  <div class="clr"></div>  
	      	<img src="${staticSite}/img/ml/ok.png" class="validMsg"/> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" />
              <div class="checkboxRequiredMsg clr"><wa:mls>cocher la case</wa:mls></div>
	    </span> 
	    <div class="clr"></div>
         <wa:include URI="front/boxes/captcha" />

         <div class="clr"></div>
         
          <div id="tv_type"style="display:none;" class="errorDeals"><wa:mls>!type de Lieu</wa:mls></div>
           <div id="tv_name" style="display:none;" class="errorDeals"><wa:mls>!name de Lieu</wa:mls></div>
          <div id="tv_price" style="display:none;" class="errorDeals"><wa:mls>!price de Lieu</wa:mls></div>
          <div id="tv_abstract" style="display:none;" class="errorDeals"><wa:mls>!resume de Lieu</wa:mls></div>
          <div id="tv_periodValid" style="display:none;" class="errorDeals"><wa:mls>!peridvalidite de Lieu</wa:mls></div>
          <div id="tv_fromDate" style="display:none;" class="errorDeals"><wa:mls>!fromdate de Lieu</wa:mls></div>
          <div id="tv_toDate" style="display:none;" class="errorDeals"><wa:mls>!todate de Lieu</wa:mls></div>
          <div id="tv_body" style="display:none;" class="errorDeals"><wa:mls>!body de Lieu</wa:mls></div>
          <div id="tv_contact" style="display:none;" class="errorDeals"><wa:mls>!contact de Lieu</wa:mls></div>
          <div id="tv_phone" style="display:none;" class="errorDeals"><wa:mls>!phone de Lieu</wa:mls></div>
          <div id="tv_email" style="display:none;" class="errorDeals"><wa:mls>!email de Lieu</wa:mls></div>
          <div id="tv_Cemail" style="display:none;" class="errorDeals"><wa:mls>!ConfEmail de Lieu</wa:mls></div>
          <div id="tv_valid" style="display:none;" class="errorDeals"><wa:mls>!CazeValidation de Lieu</wa:mls></div>
          <div id="tv_captcha" style="display:none;" class="errorDeals"><wa:mls>!Captcha de Lieu</wa:mls></div>
          
          
        <input type="submit" value="<wa:mls>Envoyer</wa:mls>" id="form_send" />
        <div class="clr"></div>
        <p><wa:mls>* Champs obligatoires à compléter</wa:mls></p>
        <p class="remark"><wa:mls>« All data of a personal nature passed on to Brussels International is recorded in the files of Brussels International - or those of third parties (professionals) acting on its behalf - for the purposes of managing marketing communication mailings. Further information may be obtained from the 'Commission pour la protection de la vie privée' (Commission for the Protection of Privacy) (Rue de la Régence 63, 1000 Brussels). Every individual has the right to access his/her personal data. Brussels International, 2-4 rue Royale, 1000 Brussels, owns and manages the file. »</wa:mls></p>
        <div class="clr"></div>
       </fieldset>
    </form>
  </div>
   <script type="text/javascript">
   $('#save_deals').submit(function() {

      controleJS();
	       }); 
 
var spryAuthor = new Spry.Widget.ValidationTextField("tfv_author","none", {isRequired:true,validateOn:["blur","change"]}); 
var spryBody = new Spry.Widget.ValidationTextarea("tfv_body", {isRequired:true,minChars:1, maxChars:1000, validateOn:["blur","change"]}); 
var spryPrice = new Spry.Widget.ValidationTextField("tfv_price", "real", {isRequired:true,validateOn:["blur","change"]});
var spryType = new Spry.Widget.ValidationSelect("tfv_type", {isRequired:true, validateOn:["blur, change"]});
var spryName = new Spry.Widget.ValidationTextField("tfv_name", "none", {isRequired:true,validateOn:["blur","change"]});
var spryNameS = new Spry.Widget.ValidationSelect("tfv_periodVisibility", {isRequired:true,validateOn:["blur","change"]});
var spryAbstract = new Spry.Widget.ValidationTextarea("tfv_abstract",  {isRequired:true,minChars:1, maxChars:1000, validateOn:["blur","change"]});
var spryPhone = new Spry.Widget.ValidationTextField("tfv_phone", "phone", {isRequired:true,validateOn:["blur","change"]});
var spryPeriodFromDate = new Spry.Widget.ValidationTextField("tfv_periodFromDate","none", {validateOn:['change']});
var spryPeriodToDate = new Spry.Widget.ValidationTextField("tfv_periodToDate","none", {validateOn:['change']});
var spryEmail = new Spry.Widget.ValidationTextField("tfv_email", "email", {isRequired:true,validateOn:["blur","change"]});
var spryEmailConf = new Spry.Widget.ValidationConfirm("tfv_emailConf", "tfv_email", {validateOn: ["blur","change"]});
var spryValid = new Spry.Widget.ValidationCheckbox("check_valid", {isRequired:true,validateOn:["blur", "change"]});

 
</script>
 
  <!--contentMain:end-->
