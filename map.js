<script type="text/x-tmpl" id="tmpl_search_services_item">
	<li class="search-services-item">
		<input type="checkbox" id="f_<%=externalId%>" <% if (checked) {%> checked="checked" <%}%> />
		<label for="f_<%=externalId%>"><%=name%></label>
	</li>
</script>

<script type="text/x-tmpl" id="tmpl_shop_info">
<strong><%=name%></strong><br/>
<%=address%><br/>
<%=zipcode%>, <%=city%><br/>
<br/>
<strong><%=open%></strong><br/>
<strong>Station Code: </strong><%=externalId%><br/>
<strong>Tel: </strong><%=tel%><br/>
<%=services.join('<br/>')%><br/>
<a href="javascript:void(0)" data-id="<%=id%>" class="directions-link">Routebeschrijving</a>
</script>