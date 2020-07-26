<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>
	Adding new Godown Details.......
</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);

//-->
</SCRIPT>
</head>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>
<body Class=SC>
<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
Statement stmt1=null;
ResultSet rs=null;
ResultSet rs1=null;

String GodownID = request.getParameter("GodownID");
session.setAttribute("GodownID",GodownID);
String Location = request.getParameter("Location");
String strCapacityinQuintals=request.getParameter("CapacityinQuintals");
int CapacityinQuintals = Integer.parseInt(strCapacityinQuintals);
String GodownManager=request.getParameter("GodownManager");
String strGSDate=request.getParameter("GSDate");
Date GSDate= Date.valueOf(strGSDate);
String IT="-";
int Os=0,Rs=0,Ts=0,Ds=0,Cs=0;
Date ModDate;




try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "Insert into GodownMaster values(\'"+GodownID+"\',\'"+Location+"\',"+CapacityinQuintals+",\'"+GodownManager+"\',\'"+GSDate+"\')";
	
	System.out.println(Query);
	int rowsAffected=stmt.executeUpdate(Query);		
	System.out.println("Rows Affected = " + rowsAffected);
	//If data is updated then an entry is added to Activity log 
	if(rowsAffected==1)
	{
		%>
			<jsp:forward page="AddEmployee1.jsp">
				<jsp:param name="EmpName" value="<%=GodownManager%>"/>
			</jsp:forward>
			
	
		<%
		
		%>
		<script>
		for(i=1;i<=10;i++) document.write("<br>");
		</script>
        
		
			<H3 align="center">Details Updated Successfully </H3>
		<BR>
		<center>
			<A href="NewGodownEntry0.jsp"> Add another </A>
		</center>
		<%
		//}
	}
}
catch(Exception e)
{
	//System.out.println("Exception"+e);
}
%>

</body>
</html>