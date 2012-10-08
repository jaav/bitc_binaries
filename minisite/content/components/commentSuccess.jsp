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
<script type="text/javascript" src="${static}/front/js/SpryValidationTextarea.js"></script>
<link rel="stylesheet" type="text/css" href="${static}/front/css/SpryValidationTextarea_comment.css" media="screen, projection"/>

<h3><wa:mls>Comment</wa:mls></h3>
<!-- COMMENTS LIST : start -->
    <c:if test="${empty listComment}">
        	<wa:mls>Il n'y a pas de commentaires en ce moment !</wa:mls> 
    </c:if>
	<c:forEach var="item" items="${listComment}" varStatus="loop">
	<div class="comment_box">
      <p>${loop.count}</p>
      <div class="content">
        <p><strong><span class="date"><fmt:formatDate value="${item.createdOn}" pattern="dd/MM/yyyy HH:mm"/></span></strong></p>
        <p><strong>${pseudo[loop.count - 1]} <wa:mls>a dit :</wa:mls></strong></p>
        <p>${item.message }</p>
        <a class="inappropriate" href="<wa:url URI="front/contactUs/displayForm"/>?detailUri=${detailUri}&type=abus&contenttype=${contentType}&id=${contentId}"><wa:mls>Contenu inappropri&eacute;</wa:mls></a>
        <a class="react" href="#comment">R&eacute;agir</a>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
   </c:forEach>

	<a name="comment"></a>
	<p class="error">${ERROR_SAVE_COMMENT}</p>
    <h3><wa:mls>Ajouter un commentaire</wa:mls></h3>
	<form id="f_add-comment" name="f_add-comment"  action="<wa:url URI="front/comment/addComment" />"  method="post" >
		<input type="hidden" name="f_origin" value="minisite" />
		<input type="hidden" name="f_minisiteName" value="${waParam.name}" />
		<input type="hidden" name="f_contentId" value="${contentId}" />
		<input type="hidden" name="f_contentType" value="${contentType}" />
		<textarea name="f_message" id="f_message" ></textarea>
        <div id="v_message">
            <textarea name="f_message_val" id="f_message_val" style="display:none;"></textarea>
            <div class="textareaRequiredMsg"><img src="${static}/front/img/ml/erreur.png"/><wa:mls>Ce champ est obligatoire</wa:mls> </div>
         </div>

	<span id="form_send"><a  class="form_send" href="javascript:submitForm();"><wa:mls>Envoyer</wa:mls></a></span>

	</form>
	<script type="text/javascript" src="${static}/admin/fckeditor/fckeditor.js"></script>
   <script language="javascript">
   
	    var oFCKeditor = new FCKeditor('f_message','100%','300px');
		oFCKeditor.BasePath = 'fckeditor/';
		oFCKeditor.EditorPath = '${static}/admin/';
		oFCKeditor.LocationPath = window.location.href; 
		oFCKeditor.ToolbarSet = 'Comment';
		oFCKeditor.ReplaceTextarea();
		
		var v_message = new Spry.Widget.ValidationTextarea("v_message", {isRequired:true,minChars:1});
		function submitForm(){
			var txt = FCKeditorAPI.GetInstance('f_message').GetHTML();
			if(txt == '<p>&#160;</p>')
				txt = '';
			//$('f_message_val').val(txt);
			$("textarea#f_message_val").attr("value",txt);
			var valid = v_message.validate();
			if(valid){
				$('#f_add-comment').submit();
			}
		}
	</script> 
    <!-- COMMENTS LIST : end -->