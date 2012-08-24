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


<div id="content_main">
    <wa:include URI="${site}/content/introForm" />
    
   <form class="form" action="<wa:url URI="${site}/${module}/sendRfpWithPro"/>" method="post">
     <fieldset>
      
        <div class="clr"></div>
        
       <span id="tfv_meetingType" class="radioValidState">
       <label for="f_meetingName"><wa:mls>Liste des services: </wa:mls></label>
       
       <div class="box_input_radio">
	       <c:forEach var="list" items="${list}" varStatus="loop">
	           <input type="checkbox" class="radio" name="liste_select" id="${list.serviceid }" value="${list.serviceid }"/>
		       <span class="radioTxt">${wa:nullFree(list.label)}</span>
		       <div class="clr"></div>
		   </c:forEach>  
	   </div>
       </span>
	    <div class="clr"></div>
	    <input type="button" value="<wa:mls>Envoyer</wa:mls>" id="form_send" onclick="getCheckedAndReload()"/>
     </fieldset>
     <div class="clr"></div>
     <p class="remark"><wa:mls>« All data of a personal nature passed on to Brussels International is recorded in the files of Brussels International - or those of third parties (professionals) acting on its behalf - for the purposes of managing marketing communication mailings. Further information may be obtained from the 'Commission pour la protection de la vie privée' (Commission for the Protection of Privacy) (Rue de la Régence 63, 1000 Brussels). Every individual has the right to access his/her personal data. Brussels International, 2-4 rue Royale, 1000 Brussels, owns and manages the file. »</wa:mls></p>
    </form>
  </div>
<script type="text/javascript">
function getCheckedAndReload(){
	var id = "";
	var count = 0;
	var path='${context}/${site}/${module}';
	var valeurs = [];
	$('input:checked[name=liste_select]').each(function() {
		if(count > 0)
			id += ',';
		 id += $(this).val();
		 count++;
		 //valeurs.push($(this).val());
	});
location.href=path+'/sendRfpWithPro/items/'+id+'.do';
}


</script>
  <!--contentMain:end-->
