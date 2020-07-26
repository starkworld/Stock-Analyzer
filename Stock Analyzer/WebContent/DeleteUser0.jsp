<%@ page language="java"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<!--HTML Code to prompt condition value from end user-->

<HEAD>

<LINK href="styles.css" type="text/css" rel="stylesheet">


<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
</HEAD>
<jsp:include page="MultiLevelmenu.htm" /><br>
<br>
<br>

<BODY class=SC>
	<%
		Integer IAuth = (Integer) session.getAttribute("auth");
		int auth = IAuth.intValue();
		System.out.println("===Authentication==" + auth);

		if (auth > 0) {
	%><H3 align=center>
		<IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You
		are not authorized to access this page
	</H3>
	<%
		} else {
	%>


	<h2 align=center>DeleteUser</h2>
	<FORM Name='DelForm' METHOD=POST ACTION="DeleteUser.jsp">
		<TABLE align=center>
			<TR class=row_title ALIGN="center">
				<TH COLSPAN="2">DeleteUser</TH>
			</TR>

			<TR class="row_even">
				<Td><B>UserID</B></Td>
				<td><input type="text" name="UserID" size=10 /><input
					type="button" value="List Users"
					onclick="fnEmpPopUp('ListUsers0.jsp',300,300)"></td>
			<TR class="row_even">
				<TD align=center><INPUT TYPE="submit" id='SUB' Value="Delete"></TD>
				<TD align=center><INPUT id='RES' TYPE="RESET" /></TD>
		</TABLE>
	</FORM>
</BODY>
<%
	}
%>


