<!--
	File : ModifyDetails.jsp
	Purpose : This jsp is used to modify the user details by Authorised Users
-->
<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>
Modifying Employee Details.......
</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);

//-->
</SCRIPT>
</head>
<body Class=SC>
<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String EMPName,CurrentLocation,Role;
String Remarks;
Date JoiningDate;
String strRole=request.getParameter("Role");
String strRemarks=request.getParameter("Remarks");
EMPName=request.getParameter("EMPName");

String strRemarksBKUP2 = (String)session.getAttribute("RemarksBKUP2");
try
{
	strRemarks+=";"+strRemarksBKUP2;
	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "Update EmpMaster set Remarks=\'"+strRemarks+"\',Role=\'"+strRole+"\' where EMPName=\'"+EMPName+"\'";
	System.out.println(Query);
	int rowsAffected=stmt.executeUpdate(Query);		
	System.out.println("Rows Affected = " + rowsAffected);
	//If data is updated then an entry is added to Activity log 
	if(rowsAffected==1)
	{
		String AdminUser=(String)session.getAttribute("userr");
		Timestamp DateModified = new Timestamp(System.currentTimeMillis());
		String ModDate = DateModified.toString();
		String InsQuery="Insert into ActivityTracker values(\'"+AdminUser+"\',\'"+EMPName+"\',\'"+ModDate+"\')";
		System.out.println(InsQuery);
		int LogEntry=stmt.executeUpdate(InsQuery);
		%>
			<script>
				for(i=1;i<=10;i++) document.write("<br>");
			</script>
				<H3 align="center">Details Updated Successfully </H3>
			<BR>
			<center>
			 <INPUT TYPE="button" value="Close" onclick='window.close();window.opener.location.reload();'></center>
			</center>
		<%
	}
}
catch(Exception e)
{
	System.out.println("Exception"+e);
}
%>

</body>
</html>