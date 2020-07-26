<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>
	Adding new Returns Details.......
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
Statement stmt1 =null;
Statement stmt2 =null;
ResultSet rs=null;

String ItemName = request.getParameter("ItemName");
String strDateOfReturn=request.getParameter("DateOfReturn");
Date DateOfReturn= Date.valueOf(strDateOfReturn);
String ReturnedToGodown = request.getParameter("GodownID");
String strQuantity=request.getParameter("Quantity");
int Quantity= Integer.parseInt(strQuantity);
String InvoiceNo = request.getParameter("InvoiceNo");
String ReturnedBy = request.getParameter("ReturnedBy");
String ReceiptNo=request.getParameter("ReceiptNo");
String Purpose=request.getParameter("Purpose");
String strBillValue=request.getParameter("BillValue");
float BillValue= Float.parseFloat(strBillValue);
String BillCheckedBy=request.getParameter("BillCheckedBy");



try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "Insert into ReturnsMaster values(\'"+ItemName+"\',\'"+DateOfReturn+"\',\'"+ReturnedToGodown+"\',"+Quantity+",\'"+InvoiceNo+"\',\'"+ReturnedBy+"\',\'"+Purpose+"\',\'"+ReceiptNo+"\',"+BillValue+",\'"+BillCheckedBy+"\')";
	
	System.out.println(Query);
	int rowsAffected=stmt.executeUpdate(Query);		
	System.out.println("Rows Affected = " + rowsAffected);
	

	if(rowsAffected>0)
	{
			stmt1 = con.createStatement();
			if(Purpose.equals("OrderCanceled")){
				String Query1 ="UPDATE InwardsMaster SET Quantity = Quantity+"+Quantity+" , BillValue = BillValue + "+BillValue+" WHERE  InvoiceNo="+InvoiceNo+" and ItemName=\'"+ItemName+"\'";

				System.out.println(Query1);
				int rowAffected=stmt1.executeUpdate(Query1);
							System.out.println("Rows Affected = " + rowAffected);

			}
			//If data is updated then an entry is added to Activity log 
			stmt2 = con.createStatement();
			String Query2 ="UPDATE DeliveryMaster SET Quantity = Quantity-"+Quantity+" , BillValue =BillValue - "+BillValue+" WHERE  InvoiceNo="+InvoiceNo+" and ItemName=\'"+ItemName+"\'";
			System.out.println(Query2);
			int rowAffect=stmt2.executeUpdate(Query2);		
			System.out.println("Rows Affected = " + rowAffect);

			
		%>
			<H3 align="center">Details Updated Successfully </H3>
		<BR>
		<center>
			<A href="NewReturns0.jsp"> Return another item </A>
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