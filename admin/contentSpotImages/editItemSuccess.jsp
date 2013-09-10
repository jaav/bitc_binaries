<%@ page
        language="java"
        contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"
        isELIgnored ="false"
        %>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="mainContent">
    <div id="toolBox">
        <div class="content" id="actions">
            <a href="javascript:void(0);" id ="back_btn"><wa:mls>Back to List</wa:mls></a>
            <c:if test="${legend != null}">
                <a href="" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
            </c:if>
            <div class="clr"></div>
        </div>
    </div>
    <h2><wa:mls>ContentSpotImages</wa:mls>&nbsp;-&nbsp;
        <c:if test="${bean==null || bean.spotImageId<=0}"><wa:mls>(Add)</wa:mls></c:if>
        <c:if test="${bean!=null && bean.spotImageId>0}"><wa:mls>(Edit)</wa:mls></c:if>
    </h2>

    <div id="list">
        <div id="mask">
            <form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
                <input name="f_spotId" type="hidden" value="${bean.contentSpot.id}"/>
                <fieldset>
                    <legend>&nbsp;</legend>
                    <div class="bgGrey">
                        <label for="f_spotId"><wa:mls>BFO Spot Id</wa:mls></label>
                        <span>${bean.contentSpot.id}</span>
                        <div></div>
                    </div>
                    <c:if test="${bean!=null && bean.spotImageId>0}">
                        <div class="bgGrey">
                            <label for="f_id"><wa:mls>valueId</wa:mls></label>
                            <span>${bean.spotImageId}</span>
                            <input name="id" type="hidden" value="${bean.spotImageId}"/>
                        </div>
                    </c:if>
                    <div class="bgWhite">
                        <label for="f_imageURL"><wa:mls>imageURL</wa:mls></label>
                            <textarea name="f_imageURL" id="f_imageURL" class="textfield smallImageForAll">${bean.imageURL}</textarea>
                            <a href="${context}/${site}/contentImage/contentImageList.do?openerField=f_imageURL" style="float: right;margin-right: 60px;" target="image" class="image_btn" title="<wa:mls>Upload an image</wa:mls>">&nbsp;</a>
                        <div class="clr"></div>
                        <script type="text/javascript">
                            var v_imageURL = new Spry.Widget.ValidationTextarea("v_imageURL", {isRequired:false,maxChars:300,validateOn:["blur","change"]});
                        </script>
                    </div>
                    <div class="bgGrey">
                        <label for="f_visible"><wa:mls>visible</wa:mls></label>
                        <input type="radio"<c:if test="${bean.visible ==  null || bean.visible=='0'}"> checked="checked"</c:if> value="0" name="f_visible"/><wa:mls>visible_0</wa:mls>
                        <input type="radio"<c:if test="${bean.visible=='1'}"> checked="checked"</c:if> value="1" name="f_visible"/><wa:mls>visible_1</wa:mls>
                    </div>
                </fieldset>
                <div class="clr"></div>
                <div id="errorMessage">
                    <c:if test="${waParam.msgError != null}">
                        <img src="${static}/${site}/img/stop.png" alt="<wa:mls>Error</wa:mls>" />
                        <wa:mls>${waParam.msgError}</wa:mls>
                    </c:if>
                </div>
                <div id="containerButton">
                    <input type="button" name="cancel" id="cancel" class="cancel" value="<wa:mls>Cancel</wa:mls>"/>
                    <input type="submit" name="submit" class="submit" value="<wa:mls>Enregistrer</wa:mls>"/>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
<script type="text/javascript" src="${static}/${site}/fckeditor/fckeditor.js"></script>
<script>
    path='${context}/${site}/${module}';
    idName='${bean.spotImageId}';
</script>
<script type="text/javascript">
    var TP1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script>
<!--tool boxes:end-->
