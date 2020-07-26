<!--
	File : Report.jsp
	Purpose : This jsp displays the home page containing link to change user's password
			
-->

<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@page import="java.sql.*,java.io.*,java.util.Random"%>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);

//-->
</SCRIPT>
<Head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
</head>
<jsp:include page="MultiLevelmenu.htm"/><br><br>
<body Class=SC>

<Title>Reports</Title>
<font face="Times New ROman" color=blue >
<center>




<!--Retreiving user id using Session-->

<% String Userid=(String)session.getAttribute("userr");%>

<h2 class=report><FONT COLOR="#330000">Welcome</FONT> <u><FONT  COLOR="#FF0000"><%=Userid%></FONT></u><FONT  COLOR="#330000"> to StockAnalyzer</FONT></h2><br>



</center>
</font>
<p align="right">

<A href="ChangePassword1.jsp">Change Password </A><BR>

<%
/* Verifying wether the user is authorised to edit emp details
	if user is authorised he can edit the details if not he can
	only view the details */
	Integer EmpAuth = (Integer)session.getAttribute("auth");
	int Auth = EmpAuth.intValue();
	System.out.println(Auth);
			/*If authorised show Download data to Excel */
		if(Auth==0){
		%>
		 
			<A href="AddUser.html">Add new user </A><BR> 
		<%
		}

%>

</p>
</body>
</html>