<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>
	Adding new Inwards Details.......
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
String GodownID = request.getParameter("GodownID");
String NameOfSupplier = request.getParameter("NameOfSupplier");
String strDateOfSupply=request.getParameter("DateOfSupply");
Date DateOfSupply= Date.valueOf(strDateOfSupply);
String ItemName = request.getParameter("ItemName");
String InvoiceNo = request.getParameter("InvoiceNo");
String strQuantity = request.getParameter("Quantity");
int Quantity=Integer.parseInt(strQuantity);
String ReceivedBy=request.getParameter("ReceivedBy");
String ReceiptNo=request.getParameter("ReceiptNo");
String strBillValue=request.getParameter("BillValue");
float BillValue= Float.parseFloat(strBillValue);
String BillCheckedBy=request.getParameter("BillCheckedBy");


try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	
	
	String Query = "Insert into InwardsMaster values(\'"+GodownID+"\',\'"+NameOfSupplier+"\',\'"+DateOfSupply+"\',\'"+ItemName+"\',\'"+InvoiceNo+"\',"+Quantity+",\'"+ReceivedBy+"\',\'"+ReceiptNo+"\',"+BillValue+",\'"+BillCheckedBy+"\')";
	
	System.out.println(Query);
	int rowsAffected=stmt.executeUpdate(Query);		
	System.out.println("Rows Affected = " + rowsAffected);
	//If data is updated then an entry is added to Activity log 
	if(rowsAffected==1)
	{
		
		%>
			<H3 align="center">Details Updated Successfully </H3>
		<BR>
		<center>
			<A href="AddInwards0.jsp"> Add another </A>
		</center>
		<%
	}
}
catch(Exception e)
{
	//System.out.println("Exception"+e);
}
%>

</body>
</html>