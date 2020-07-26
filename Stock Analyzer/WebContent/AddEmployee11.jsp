<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>
	Adding new Employee Details.......
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
ResultSet rs=null;
String EmpName = request.getParameter("EmpName");
String CurrentLocation=request.getParameter("CurrentLocation");
String JoiningDate=request.getParameter("JoiningDate");
//Date JoiningDate= Date.valueOf(strJoiningDate);
String Role=request.getParameter("Role");
String Remarks=request.getParameter("Remarks");
String GodownID = (String)session.getAttribute("GodownID");
try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String SelQ = "Select EMPName from EmpMaster where EMPName= \'"+EmpName+"\'";
	//System.out.println(SelQ);
	rs=stmt.executeQuery(SelQ);
if(!(rs.next())){

	String Query = "Insert into EmpMaster values(\'"+EmpName+"\',\'"+CurrentLocation+"\',\'"+JoiningDate+"\',\'"+Role+"\',\'"+Remarks+"\',\'"+GodownID+"\')";
	
	//System.out.println(Query);
	int rowsAffected=stmt.executeUpdate(Query);		
	//System.out.println("Rows Affected = " + rowsAffected);
	//If data is updated then an entry is added to Activity log 
	if(rowsAffected==1)
	{
    String AdminUser=(String)session.getAttribute("userr");
	//System.out.println(AdminUser);
	//System.out.println(EMPName);
	Timestamp DateModified = new Timestamp(System.currentTimeMillis());
	String ModDate = DateModified.toString();
	//System.out.println(DateModified.toString());
	String InsQuery="Insert into ActivityTracker(AdminUser,EmpModified,DateModified) values(\'"+AdminUser+"\',\'"+EmpName+"\',\'"+ModDate+"\')";
	//System.out.println(InsQuery);
	int LogEntry=stmt.executeUpdate(InsQuery);

	
	
	%>
	
	<script>
		for(i=1;i<=10;i++) document.write("<br>");
	</script>
		<H3 align="center">Details Updated Successfully </H3>
	<BR>
	<center>
		<A href="NewGodownEntry0.jsp">Add another </A>
	</center>
	<BR>
	<center>
		<A href="Report.jsp"> Back </A>
	</center>
	<%}
	}
else{
%>
	<H3 align="center">Sorry Employee already exists in the databases</H3>
	<%}	
}
catch(Exception e)
{
	//System.out.println("Exception"+e);
}
%>

</body>
</html>