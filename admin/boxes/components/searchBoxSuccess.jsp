<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>

	<div class="pagesContainer floatLeft">
		<form name="searchForm" action="${context}/${URI}.do">
			<span>
				<input name="search" type="text" />
		    </span>
		    <span class="blackbtncontainer">
			    <span class="blackbtnleft"></span>
			    <span class="blackbtn"><a href="javascript:document.searchForm.submit();">Search</a></span>
			    <span class="blackbtnright"></span>
			</span>
		</form>
	</div>
