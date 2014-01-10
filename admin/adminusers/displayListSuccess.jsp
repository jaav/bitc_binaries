<%@ page 
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
isELIgnored ="false"
%>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

		<c:if test="${list!=null}">

			<wa:include URI="admin/tools/searchBox" />
			<wa:include URI="admin/tools/pageNav"/>
			<div class="clearBoth"></div>
		    <table class="table" cellspacing=0 cellpadding=0>
				<tr class="header">
					<td class="cellheader">Id</td>
					<td class="cellheader">Login</td>
					<td class="cellheader">Email</td>
					<td class="cellheader">Firstname</td>
					<td class="cellheader">Lastname</td>
					<td class="cellheader">View</td>
					<td class="cellheader">Profiles</td>
				</tr>
				<c:forEach var="item" items="${list}" varStatus="loop">
					<tr class="line${((loop.count+1)%2)+1}">
						<td class="cell">${item.userid}</td>
						<td class="cell">${item.login}</td>
						<td class="cell">${item.email}</td>
						<td class="cell">${item.firstname}</td>
						<td class="cell">${item.lastname}</td>
						<td class="cell">
							<wa:link URI="admin/adminusers/editItem/id/${item.userid}" allParams="true" backURL="true">
								<img src="${static}/admin/images/browse.gif" alt="view" />
							</wa:link>
						</td>
						<td class="cell">
							<wa:link URI="admin/adminusersprofiles/displayList/userid/${item.userid}" allParams="true" backURL="true">
								<img src="${static}/admin/images/browse.gif" alt="view" />
							</wa:link>
						</td>							
					</tr>
				</c:forEach>
			</table>
		    <div class="pagesContainer floatLeft">
			    <div class="blackbtncontainer">
				    <div class="blackbtnleft"></div>
				    <div class="blackbtn">
				    	<wa:link URI="admin/adminusers/newItem">
				    	New item
				    	</wa:link>
				    </div>
				    <div class="blackbtnright"></div>
				</div>
			</div>
			<wa:include URI="admin/tools/pageNav"/>
			<div class="clearBoth"></div>
				
		</c:if>
		
		<c:if test="${list==null}">
			<div class="pagesContainer">No item</div>
		</c:if>