<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>
	Adding new Deliveries Details.......
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

String GodownID = request.getParameter("GodownID");
String ItemName = request.getParameter("ItemName");
String InvoiceNo = request.getParameter("InvoiceNo");
String strDateOfDelivery=request.getParameter("DateOfDelivery");
Date DateOfDelivery= Date.valueOf(strDateOfDelivery);
String DeliveredTo = request.getParameter("DeliveredTo");

String strQuantity=request.getParameter("Quantity");
int Quantity = Integer.parseInt(strQuantity);
String Purpose=request.getParameter("Purpose");
String ReceiptNo=request.getParameter("ReceiptNo");
String strBillValue=request.getParameter("BillValue");
float BillValue= Float.parseFloat(strBillValue);
String BillCheckedBy=request.getParameter("BillCheckedBy");



try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "Insert into DeliveryMaster values(\'"+GodownID+"\',\'"+ItemName+"\',\'"+InvoiceNo+"\',\'"+DateOfDelivery+"\',\'"+DeliveredTo+"\',"+Quantity+",\'"+Purpose+"\',\'"+ReceiptNo+"\',"+BillValue+",\'"+BillCheckedBy+"\')";
	
	System.out.println(Query);
	int rowsAffected=stmt.executeUpdate(Query);		
	System.out.println("Rows Affected = " + rowsAffected);
        
	stmt1 = con.createStatement();
		if(Purpose.equals("Sale")){
				String Query1 ="UPDATE InwardsMaster SET Quantity = Quantity-"+Quantity+" , BillValue = BillValue - "+BillValue+" WHERE  InvoiceNo="+InvoiceNo+" and ItemName=\'"+ItemName+"\'";

				System.out.println(Query1);
				int rowAffected=stmt1.executeUpdate(Query1);
							System.out.println("Rows Affected = " + rowAffected);

			}
	//If data is updated then an entry is added to Activity log 
	if(rowsAffected==1)
	{
		%>
			<H3 align="center">Details Updated Successfully </H3>
		<BR>
		<center>
			<A href="Deliveries0.jsp"> Deliver another Item </A>
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