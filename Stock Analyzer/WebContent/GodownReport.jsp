

<HTML>

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<head>
<LINK href="styles.css" type="text/css" rel="stylesheet">
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);

//-->
</SCRIPT>
</head>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>
<body Class=SC>
<FORM METHOD=POST ACTION="" NAME="VNewGodownForm">
<center>
<P align=right><a class=title onclick="javascipt:window.print()" onmouseover="this.style.cursor='hand'" ><img src="Images/printer1.jpg" width="37" height="38" border=0 alt="Print"></a></P>
<h3 align=Center>Godown Information</h3>
<BR><BR>
<table width="40%" align=center>
<!--Declaration of varaibles-->
<%
/*Declaration of variables*/
Connection con=null;
Statement stmt=null,stmt1=null;
ResultSet rs = null,rs1=null;

String GodownID="",Location="",GodownManager="";
int noRows=0,CapacityinQuintals=0,Quantity=0;

// Retrieving data from html page
 GodownID=request.getParameter("GodownID");


try
{
	/*Getting the connection variable from session*/
	con=(Connection)session.getAttribute("connection");
	stmt1 =  con.createStatement();
	stmt =  con.createStatement();
	String Query="Select GodownMaster.GodownID, GodownMaster.Location, GodownMaster.CapacityinQuintals, GodownMaster.GodownManager,Sum(InwardsMaster.Quantity)from GodownMaster,InwardsMaster where GodownMaster.GodownID=\'"+GodownID+"\' and GodownMaster.GodownID=InwardsMaster.GodownID group by GodownID";
	System.out.println("Qry-->"+Query);
	rs=stmt1.executeQuery(Query);

	String Query1="Select GodownMaster.GodownID, GodownMaster.Location, GodownMaster.CapacityinQuintals, GodownMaster.GodownManager from GodownMaster where GodownMaster.GodownID=\'"+GodownID+"\' ";
	System.out.println("Qry-->"+Query1);
	rs1=stmt.executeQuery(Query1);
}
catch(Exception e)
{
	System.out.println("Exception"+e);
	%>Exception --- <%=e%><%
}
if(rs!=null)
{
	System.out.println("Result set not null");
	if(rs.next())
	{

		
		GodownID = rs.getString(1);
		Location = rs.getString(2);
		CapacityinQuintals = rs.getInt(3);
		GodownManager = rs.getString(4);	
		Quantity = rs.getInt(5);
		%>
		<TR><TD class=row_title>GodownID</TD><TD class="row_even"><%=GodownID%></TD></TR>
		<TR><TD class=row_title>Location</TD><TD class="row_even"><%=Location%></TD></TR>
		<TR><TD class=row_title>CapacityinQuintals</TD><TD class="row_even"><%=CapacityinQuintals%></TD></TR>
		<TR><TD class=row_title>GodownManager</TD><TD class="row_even"><%=GodownManager%></TD></TR>
		<TR><TD class=row_title>Stock in Quintals</TD><TD class="row_even"><%=Quantity%></TD></TR>
		<%
		noRows++;
		
	}
	else{
		

if(rs1!=null)
{
	System.out.println("Result set not null");
	if(rs1.next())
	{
GodownID = rs1.getString(1);
		Location = rs1.getString(2);
		CapacityinQuintals = rs1.getInt(3);
		GodownManager = rs1.getString(4);	
		%>
		<TR><TD class=row_title>GodownID</TD><TD class="row_even"><%=GodownID%></TD></TR>
		<TR><TD class=row_title>Location</TD><TD class="row_even"><%=Location%></TD></TR>
		<TR><TD class=row_title>CapacityinQuintals</TD><TD class="row_even"><%=CapacityinQuintals%></TD></TR>
		<TR><TD class=row_title>GodownManager</TD><TD class="row_even"><%=GodownManager%></TD></TR>
		<%
		noRows++;
		
	}
	else{
		%>
			<tr><th align=Center> Godown does not exists</th></tr>
		<%	}
		}

	}
	 
		
			
}
/* If user provides invalid password or username*/
else
{%>
	<tr><th align=Center>Godown does not exists</th></tr>
<%}%>
</table>
<BR><BR>
<center><A class=title HREF="GodownReport.html"> &lt;&lt; BACK </A></center>
</FORM>
</BODY>
</HTML>



