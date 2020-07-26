<%@ page language="java"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HTML>
<HEAD>
<TITLE>New Delivery</TITLE>
<LINK href="styles.css" type="text/css" rel="stylesheet">
<LINK href="js/jquery-ui.css" type="text/css" rel="stylesheet">
<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
<script language="Javascript" src="Images/validate.js"></script>
<script type="text/javascript" src="./js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
	history.go(+1);
	function check() {
		var EmpName = document.AddEmpForm.EMPName.value;
		var CurrentLocation = document.AddEmpForm.CurrentLocation.value;
		var JoiningDate = document.AddEmpForm.JoiningDate.value;
		var Role = document.AddEmpForm.Role.value;
		var Remarks = document.AddEmpForm.Remarks.value;

		var pattern = /^([a-zA-Z0-9\_\. ]{1,15})$/;
		var wpattern = /^([0-9]{1,20})$/;
		var ADpattern = /^([a-zA-Z0-9\_\. ]{1,20})$/;
		var Npattern = /^([a-zA-Z\_\. ]{1,15})$/;
		var Ipattern = /^([a-zA-Z\_\. ]{1,25})$/;
		var Apattern = /^([0-9]{1,10})$/;

		if (!(Ipattern.test(EmpName))) {
			alert("Invalid Employee Name");
			return false;
		}

		else if (!(Ipattern.test(CurrentLocation))) {
			alert("Invalid Location");
			return false;
		}
		if (JoiningDate == "") {
			alert("JoiningDate is mandatory");
			return false;
		}
		if (Role == "") {
			alert("Role is mandatory");
			return false;
		}

		if (Remarks == "") {
			document.AddEmpForm.Remarks.value = "Added on " + new Date();
		}
		return true;
	}

	//-->
	$(document).ready(function() {
		$("#DateOfSupply").datepicker({
			dateFormat : 'yy-mm-dd'
		});
		$("#DateOfDelivery").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});
</SCRIPT>
</HEAD>
<jsp:include page="MultiLevelmenu.htm" /><br>
<br>
<br>
<body Class=SC>
	<%
		Integer IAuth = (Integer) session.getAttribute("auth");
		int auth = IAuth.intValue();
		System.out.println("===Authentication==" + auth);

		if (auth != 1) {
	%><H3 align=center>
		<IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You
		are not authorized to access this page
	</H3>
	<%
		} else {
	%>

	<FORM NAME="NewDeliveryForm" onSubmit="return check()"
		action="Deliveries.jsp">
		<CENTER>
			<!-- GodownID	ItemName	InvoiceNo	DateOfDelivery	DeliveredTo		Quantity	Purpose		ReceiptNo	BillValue	BillCheckedBy -->

			<TABLE BORDER="0" CELLSPACING="2" CELLPADDING="2">
				<TR class=row_title ALIGN="center">
					<TH COLSPAN="2">NewDelivery</TH>
				</TR>

				<TR class=row_even>
					<TD>GodownID *</TD>
					<TD><INPUT TYPE="TEXT" NAME="GodownID" SIZE="10" required="required"><input
						type="button" value="Show Godowns"
						onclick="document.NewDeliveryForm.ItemName.value='';document.NewDeliveryForm.InvoiceNo.value='';fnEmpPopUp('ShowGodowns.jsp',300,300)"></td>
				</TR>
				<TR class=row_odd>
					<TD>ItemName *</TD>
					<TD><INPUT TYPE="TEXT" NAME="ItemName" SIZE="10" required="required"><input
						type="button" ID='BItem' value="Show Items"
						onclick="fnPopUp('ShowItemsList.jsp',300,300)"></td>
				</TR>

				<TR class=row_odd>
					<TD>InvoiceNo *</TD>
					<TD><INPUT TYPE="TEXT" NAME="InvoiceNo" SIZE="20" readonly></TD>
				</TR>
				<TR class=row_even>
					<TD>Date Of Supply *</TD>
					<tD nowrap><input size=20 readonly id="DateOfSupply"
						name="DateOfSupply" required="required"></tD>
				</TR>

				<TR class=row_even>
					<TD>Date Of Delivery *</TD>
					<TD><input size=20 readonly id="DateOfDelivery"
						name="DateOfDelivery"></TD>

				</TR>

				<TR class=row_even>
					<TD>DeliveredTo*</TD>
					<TD><INPUT TYPE="TEXT" NAME="DeliveredTo" SIZE="20" required="required"></TD>
				</TR>

				<TR class=row_odd>
					<TD>Quantity *</TD>
					<TD><INPUT TYPE="TEXT" NAME="Quantity" SIZE="10"
						onfocus="if(document.NewDeliveryForm.ItemName.value==''||document.NewDeliveryForm.GodownID.value=='') { alert ('Please select GodownID and Item name to proceed');document.NewDeliveryForm.BItem.focus();}"
						onchange="oQ = parseInt(document.NewDeliveryForm.OQuantity.value); if(parseInt(this.value) > oQ){alert('Quantity must not exceed '+oQ);this.value='';this.focus();}"><INPUT
						TYPE="Hidden" NAME="OQuantity" SIZE="10" value="0"></TD>
				</TR>

				<TR class=row_even>
					<TD>Purpose*</TD>
					<TD><select name="Purpose">
							<option value="---">---</option>
							<option value="Service">Service</option>
							<option value="Sale">Sale</option>
					</select></TD>


				</TR>

				<TR class=row_odd>
					<TD>ReceiptNo *</TD>
					<TD><INPUT TYPE="TEXT" NAME="ReceiptNo" SIZE="20" readonly></TD>
				</TR>

				<TR class=row_even>
					<TD>BillValue*</TD>
					<TD><INPUT TYPE="TEXT" NAME="BillValue" SIZE="20" required="required"></TD>
				</TR>

				<TR class=row_odd>
					<TD>BillCheckedBy *</TD>
					<TD><INPUT TYPE="TEXT" NAME="BillCheckedBy" SIZE="20" readonly></TD>
				</TR>

				<TR class=row_even ALIGN="CENTER">
					<TD><INPUT TYPE="SUBMIT" VALUE="Add"></TD>
					<TD><INPUT TYPE="RESET" VALUE="Reset"></TD>
				</TR>

			</TABLE>
		</CENTER>
	</FORM>
</BODY>
</HTML>
<%
	}
%>