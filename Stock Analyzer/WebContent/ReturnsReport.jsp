
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);


//-->
</SCRIPT>
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>

<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;
String ItemName="",Purpose="",ReturnedToGodown="",InvoiceNo="";
int Quantity=0,noRows=0;
int BillValue=0;
Date DateOfReturn;
String orderby="ItemName";

String strStartDate = request.getParameter("Start");
String strEndDate =  request.getParameter("End");
String GodownID=request.getParameter("GodownID");

System.out.println(strStartDate);
System.out.println(strEndDate);

%>
<body class="SC">
<FORM METHOD=POST ACTION="" NAME="NewReturnsForm">
<center>

<P align=right><a class=title onclick="javascipt:window.print()" onmouseover="this.style.cursor='hand'" ><img src="Images/printer1.jpg" width="37" height="38" border=0 alt=""></a></P>
<h2 align=center> Returns List of Godown <%=GodownID%></h2>
<BR><BR>
<table width="40%" align=center>
<%

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "Select ItemName,Quantity,Purpose,BillValue from ReturnsMaster  where (DateOfReturn between (\'"+strStartDate+"\') and (\'"+strEndDate+"\')) and ReturnedToGodown=\'"+GodownID+"\'"; 
        //String Query = "Select ItemName,Quantity,BillValue from InwardsMaster  where (DateOfSupply between (\'"+strStartDate+"\') and (\'"+strEndDate+"\')";
	System.out.println("--1--"+Query);
	rs = stmt.executeQuery(Query);
}
catch(Exception e)
{
	//System.out.println("Exception"+e);
	%><%=e%><%
}


if(rs!=null)
{
	System.out.println("Result set not null");
	%>
		<TR class=row_title>
			<TD class=row_title>ItemName</TD>
			<TD class=row_title>Quantity</TD>
			<TD class=row_title>Purpose</TD>
			<TD class=row_title>BillValue</TD>
		</TR>
	<%
	while(rs.next())
	{
		noRows++;	
		ItemName=rs.getString(1);
		System.out.println(ItemName);
		Quantity=rs.getInt(2);
		System.out.println(Quantity);
		Purpose=rs.getString(3);
		System.out.println(Purpose);
		BillValue=rs.getInt(4);
		System.out.println(BillValue);
		%>
		<TR class=<%=(noRows%2==0)? "row_even" : "row_odd" %> >
			<TD ><%=ItemName%></TD>
			<TD ><%=Quantity%></TD>
			<TD ><%=Purpose%></TD>
			<TD ><%=BillValue%></TD>
		</TR>
		<%
	}

	if(noRows==0){
		%>
			<tr><th align=center>No Returns between these dates</th></tr>
		<%	
	}
		
}
/* If user provides invalid password or username*/
else
{%>
	<tr><th align=center>No Returns between these dates</th></tr>
<%}%>
</table>
<BR><BR>
<center><A class=title HREF="ReturnsReport.html"> &lt;&lt; BACK </A></center>
</FORM>
</BODY>
</HTML>