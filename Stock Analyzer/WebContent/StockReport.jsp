
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
String ItemName="";
int OpeningStock=0,noRows=0;
int ReceivedStock=0,Total=0,DeliveredStock=0,ClosingStock=0;
Date StockOnDate;
String orderby="ItemName";

String strStartDate = request.getParameter("Start");
String strEndDate =  request.getParameter("End");
String GodownID=request.getParameter("GodownID");

System.out.println(strStartDate);
System.out.println(strEndDate);

%>
<body class="SC">
<FORM METHOD=POST ACTION="" NAME="NewDeliveryForm">
<center>

<P align=right><a class=title onclick="javascipt:window.print()" onmouseover="this.style.cursor='hand'" ><img src="Images/printer1.jpg" width="37" height="38" border=0 alt=""></a></P>
<h2 align=center> StockStatement of Godown <%=GodownID%></h2>
<BR><BR>
<table width="40%" align=center>

<%


try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	
	String Query ="Select InwardsMaster.ItemName,InwardsMaster.Quantity as OpeningStock,((InwardsMaster.Quantity)+DeliveryMaster.Quantity) as Total,DeliveryMaster.Quantity as DeliveredStock,(((InwardsMaster.Quantity)+DeliveryMaster.Quantity)-DeliveryMaster.Quantity) as ClosingStock From InwardsMaster,DeliveryMaster where InwardsMaster.GodownID =DeliveryMaster.GodownID and   InwardsMaster.DateOfSupply between (\'"+strStartDate+"\') and (\'"+strEndDate+"\') and InwardsMaster.GodownID=\'"+GodownID+"\'"; ;
    
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
			<TD class=row_title>OpeningStock</TD>
			<TD class=row_title>TotalStock</TD>
			<TD class=row_title>DeliveredStock</TD>
			<TD class=row_title>ClosingStock</TD>
			
		
		</TR>
	<%
	while(rs.next())
	{
		noRows++;	
		ItemName=rs.getString(1);
		System.out.println(ItemName);
		OpeningStock=rs.getInt(2);
		System.out.println(ReceivedStock);
		Total=rs.getInt(3);
		System.out.println(Total);
		DeliveredStock=rs.getInt(4);
		System.out.println(DeliveredStock);
		ClosingStock=rs.getInt(5);
		System.out.println(ClosingStock);
		
		%>
		<TR class=<%=(noRows%2==0)? "row_even" : "row_odd" %> >
			<TD ><%=ItemName%></TD>
			<TD ><%=OpeningStock%></TD>
			<TD ><%=Total%></TD>
			<TD ><%=DeliveredStock%></TD>
			<TD ><%=ClosingStock%></TD>

		</TR>
		<%
	}

	if(noRows==0){
		%>
			<tr><th  colspan=6>No Stock between these dates</th></tr>
		<%	
	}
		
}
/* If user provides invalid password or username*/
else
{%>
	<tr><th colspan=6>No Stock between these dates</th></tr>
<%}%>
</table>
<BR><BR>
<center><A class=title HREF="StockReport.html"> &lt;&lt; BACK </A></center>
</FORM>
</BODY>
</HTML>