
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

					<!--TOOLBOX: buttons to interact with displayed lines -->
					<div id="toolBox">
						<div class="content" id="actions">
							<c:if test="${legend != null}">
								<a href="javascript:void(0);" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
							</c:if>
						</div>
						<div id="pagingTop">
							<!-- Nav component TOP -->
							<wa:include URI="${site}/boxes/pageNav">
								<wa:param name="orderBy" value="${waParam.orderBy}"/>
								<wa:param name="orderDir" value="${waParam.orderDir}"/>
							</wa:include>
						</div>
						<div style="clear:both"></div>
					</div>
     		<h2><wa:mls>Professional list</wa:mls></h2>
					<div id="list">
						<div id="mask">
							<table cellspacing=0 cellpadding=0>

								<!-- HEADERS -->
								<tr class="header">
									<td class="left firstname">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>Firstname</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="firstname" />
										</wa:link>			
									</td>
									<td class="left lastname">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>Lastname</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="lastname" />
										</wa:link>			
									</td>
									<td class="left email">
										<wa:link URI="${URI}" allParams="true">
											<wa:mls>Email</wa:mls>
											<wa:exceptParam name="page"/>
											<wa:param name="page" value="1" />
											<wa:exceptParam name="orderDir"/>
											<wa:param name="orderDir" value="${orderDir}" />
											<wa:exceptParam name="orderBy"/>
											<wa:param name="orderBy" value="email" />
										</wa:link>			
									</td>
                                </tr>

								<!-- LINES -->
								<c:forEach var="item" items="${list}" varStatus="loop">
									<tr class="line${((loop.count+1)%2)+1}">
										<td class="left firstname">${item.firstname}</td>
										<td class="left lastname">${item.lastname}</td>
										<td class="left email">${item.email}</td>
									</tr>
								</c:forEach>

							</table>
						</div>
						<div style="clear:both"></div>
					</div>

					<!-- Nav component DOWN -->
					<div id="pagingBottom">
						<wa:include URI="${site}/boxes/pageNav">
							<wa:param name="orderBy" value="${waParam.orderBy}"/>
							<wa:param name="orderDir" value="${waParam.orderDir}"/>
						</wa:include>
					</div>

				</div>

				<!--COLUMN WICH CAN BE HIDED -->
				<div id="fieldList">
			</div>
				

				<script type="text/javascript" src="${static}/${site}/js/actionsList.js"></script>
				<script>
					path='${context}/${site}/${module}';
					idName='id';
				</script>
<script type="text/javascript">
<!--
function changeStatus(status){
	var checks = $$('#mask input[type="checkbox"]');
	var id = "";
	var count = 0;
	for(i=0;i<checks.length;i++ ){
		if(checks[i].checked){
			if(count > 0)
				id += ',';
			id += checks[i].value;
			count++;
		}
	}
	var cfrm=confirm('Do you want to '+status+' this elements : '+id);
	if (cfrm==true){
		location.href=path+'/changeStatusItems/status/'+status+'/items/'+id+'.do';
	}
}
function admin_accept(){
	changeStatus('1');
}
function admin_refuse(){
	changeStatus('2');
}

btn = $('accept_btn');
if(btn!=null){
	btn.addClass('atLeastOne');
	btn.href="#";
	btn.addEvent('click',admin_accept)
}
btn = $('refuse_btn');
if(btn!=null){
	btn.addClass('atLeastOne');
	btn.href="#";
	btn.addEvent('click',admin_refuse)
}
//-->
</script>

		
