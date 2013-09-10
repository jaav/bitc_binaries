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
            <a href="javascript:void(0);" id="search_btn" class="allways"><wa:mls>search</wa:mls></a>
            <c:if test="${!property.tree}">
                <a href="javascript:void(0);" id="add_btn"><wa:mls>add</wa:mls></a>
                <a href="javascript:void(0);" id="delete_btn"><wa:mls>delete</wa:mls></a>
            </c:if>
            <a href="javascript:void(0);" id="edit_btn"><wa:mls>edit</wa:mls></a>
            <c:if test="${property.tree}">
                <a href="${context}/${site}/${module}/reorderMenu.do" id="reload_btn" class="allways"><wa:mls>Reorder menu</wa:mls></a>
            </c:if>
            <c:if test="${legend != null}">
                <a href="javascript:void(0);" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
            </c:if>
            <c:if test="${cutNode !=null}">
                <a href="${context}/${site}/${module}/clearCutElement.do" id="clear_cut"  class="allways"><wa:mls>Clear cut element</wa:mls></a>
            </c:if>
        </div>
        <div id="pagingTop">
            <wa:include URI="${site}/boxes/pageNav">
                <wa:param name="orderBy" value="${waParam.orderBy}"/>
                <wa:param name="orderDir" value="${waParam.orderDir}"/>
            </wa:include>
        </div>
        <div style="clear:both"></div>
    </div>
    <!--floatLeft:start (important to toggle-slide search box)-->
    <div class="fl">
        <!--searchBox:start (hide by default)-->
        <div id="searchBox">
            <h2><wa:mls>Search Box</wa:mls></h2>
            <div id="searchclose"></div>
            <div class="content">
                <form name="searchForm" id="searchForm" action="${context}/${site}/${module}/${action}.do${filterString}">
                    <input name="s_contentSpotId" type ="hidden" value="${bean.id}"/>
                    <div>
                        <label for="s_contentImageId"><wa:mls>contentImageId</wa:mls></label>
                        <input name="s_contentImageId" type="text" <c:choose><c:when test="${waParam.s_contentImageId!=null}">value="${waParam.s_contentImageId}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
                    </div>
                    <div>
                        <label for="s_name"><wa:mls>Name</wa:mls></label>
                        <input name="s_name" type="text" <c:choose><c:when test="${waParam.s_name!=null}">value="${waParam.s_name}"</c:when><c:otherwise>value=""</c:otherwise></c:choose>/>
                    </div>
                    <input type="button" name="s_reset" id="reset_btn" value="<wa:mls>Reset</wa:mls>"  class="reset"></input>
                    <input type="submit" name="s_submit" class="submit" value="<wa:mls>Search</wa:mls>"></input>
                </form>
            </div>
        </div>
        <!--searchBox:end-->
    </div>
    <!--floatLeft:end-->
    <h2><wa:mls>Images</wa:mls></h2>
    <div id="list">
        <div id="mask">
            <table cellspacing=0 cellpadding=0>
                <tr class="header">
                    <td class="center checkbox">
                        <input type="checkbox" id="checkboxAll"/>
                    </td>
                    <td class="center contentImageId">
                        <wa:link URI="${URI}" allParams="true">
                            <wa:mls>contentImageId</wa:mls>
                            <wa:exceptParam name="page"/>
                            <wa:param name="page" value="1" />
                            <wa:exceptParam name="orderDir"/>
                            <wa:param name="orderDir" value="${orderDir}" />
                            <wa:exceptParam name="orderBy"/>
                            <wa:param name="orderBy" value="contentImageId" />
                        </wa:link>
                    </td>
                    <td class="center keywords">
                        <wa:link URI="${URI}" allParams="true">
                            <wa:mls>keywords</wa:mls>
                            <wa:exceptParam name="page"/>
                            <wa:param name="page" value="1" />
                            <wa:exceptParam name="orderDir"/>
                            <wa:param name="orderDir" value="${orderDir}" />
                            <wa:exceptParam name="orderBy"/>
                            <wa:param name="orderBy" value="keywords" />
                        </wa:link>
                    </td>
                    <td class="left name">
                        <wa:link URI="${URI}" allParams="true">
                            <wa:mls>Name</wa:mls>
                            <wa:exceptParam name="page"/>
                            <wa:param name="page" value="1" />
                            <wa:exceptParam name="orderDir"/>
                            <wa:param name="orderDir" value="${orderDir}" />
                            <wa:exceptParam name="orderBy"/>
                            <wa:param name="orderBy" value="name" />
                        </wa:link>
                    </td>
                    <td class="left url">
                        <wa:link URI="${URI}" allParams="true">
                            <wa:mls>URL</wa:mls>
                            <wa:exceptParam name="page"/>
                            <wa:param name="page" value="1" />
                            <wa:exceptParam name="orderDir"/>
                            <wa:param name="orderDir" value="${orderDir}" />
                            <wa:exceptParam name="orderBy"/>
                            <wa:param name="orderBy" value="url" />
                        </wa:link>
                    </td>
                </tr>
                <c:forEach var="item" items="${list}" varStatus="loop">
                    <tr>
                        <td class="center checkbox"><input type="checkbox" value="${item.contentImageId}"></td>
                        <td class="center contentImageId"><a href="${context}/${site}/${module}/editItem/id/${item.contentImageId}.do" title="<wa:mls>Edit id</wa:mls>">${item.contentImageId}</a></td>
                        <td class="center keywords">${item.keywords}</td>
                        <td class="left defaultTitle">${item.name}</td>
                        <td class="left url">${item.url}</td>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div style="clear:both"></div>
    </div>
    <!-- paginationBottom:start-->
    <div id="pagingBottom">
        <wa:include URI="${site}/boxes/pageNav">
            <wa:param name="orderBy" value="${waParam.orderBy}"/>
            <wa:param name="orderDir" value="${waParam.orderDir}"/>
        </wa:include>
    </div>
    <!-- paginationBottom:end-->
</div>
<!--content:end-->

<!--wrapper:end-->


<div id="fieldList">
    <div>
        <input name="contentImageId" id="c_contentImageId" type="checkbox" value="1" checked="checked"/>
        <label><wa:mls>contentImageId</wa:mls></label>
    </div>
    <div>
        <input name="name" id="c_name" type="checkbox" value="1" checked="checked"/>
        <label><wa:mls>Name</wa:mls></label>
    </div>
    <div>
        <input name="pos" id="c_pos" type="checkbox" value="1" checked="checked"/>
        <label><wa:mls>position</wa:mls></label>
    </div>
    <div>
        <input name="level" id="c_level" type="checkbox" value="1" checked="checked"/>
        <label><wa:mls>level</wa:mls></label>
    </div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
<script>
    path='${context}/${site}/${module}';
    idName='contentImageId';
    addParams='?id=${property.propertyid}'
</script>