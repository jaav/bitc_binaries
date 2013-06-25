<%@ page 
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
isELIgnored ="false"
%>

	<div class="pagesContainer floatLeft">
		<form name="searchForm" action="${context}/${URI}.do">
			<div style="float:left;">
				<input name="search" type="text" />
		    </div>
		    <div style="float:left;" class="blackbtncontainer">
			    <span class="blackbtnleft"></span>
			    <span class="blackbtn"><a href="javascript:document.searchForm.submit();">Search</a></span>
			    <span class="blackbtnright"></span>
			</div>
		</form>
	</div>