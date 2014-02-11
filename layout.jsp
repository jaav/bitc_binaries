<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>
<HEAD>
<%@ page 
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
isELIgnored ="false"
%>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="theme/Master.css" rel="stylesheet" type="text/css">
<TITLE>${layout.title}</TITLE>
</HEAD>
<BODY>
	<TABLE width="100%">
		<TR bgcolor="5555AA">
			<TD colspan="2" height="100" align="center" valign="middle">Header</TD>
		</TR>
		<TR>
			<TD width="120" height="300" align="center" valign="middle" bgcolor="5555AA">Navigation</TD>
			<TD align="center"><jsp:include page="/${template}" /></TD>
		<TR bgcolor="5555AA">
			<TD colspan="2" height="70" align="center" valign="middle">Footer</TD>
		</TR>
	</TABLE>
</BODY>
</HTML>
