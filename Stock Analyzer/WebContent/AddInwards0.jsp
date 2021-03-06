<%@ page language="java"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<HTML>
<HEAD>

<TITLE>Add Inward</TITLE>
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
		$("#GSDate").datepicker({
			dateFormat : 'yy-mm-dd'
		});
		$("#DateOfSupply").datepicker({
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

	<FORM NAME="AddInwardsForm" onSubmit="return check()"
		action="AddInwards.jsp">
		<CENTER>
			<!-- GodownID	NameOfSupplier	DateOfSupply	ItemName	InvoiceNo	Quantity	ReceivedBy	ReceiptNo	BillValue	BillCheckedBy -->

			<TABLE BORDER="0" CELLSPACING="2" CELLPADDING="2">
				<TR class=row_title ALIGN="center">
					<TH COLSPAN="2">AddInwards</TH>
				</TR>

				<TR class=row_even>
					<TD>GodownID *</TD>
					<TD><INPUT TYPE="TEXT" NAME="GodownID" SIZE="10" required="required"><input
						type="button" value="Show Godowns"
						onclick="fnEmpPopUp('ListGodowns.jsp',300,300)"></td>
				</TR>

				<TR class=row_odd>
					<TD>NameOfSupplier *</TD>
					<TD><INPUT TYPE="TEXT" NAME="NameOfSupplier" SIZE="10" required="required"></TD>
				</TR>

				<TR class=row_even>
					<TD>Godown Start date</TD>
					<TD><input size=20 type="text" readonly id="GSDate"
						name="GSDate"></TD>
				</TR>
				<TR class=row_even>
					<TD>DateOfSupply*</TD>
					<tD nowrap><input size=20 readonly id="DateOfSupply"
						name="DateOfSupply" required="required" /></tD>
				<TR class=row_odd>
					<TD>ItemName *</TD>
					<TD><INPUT TYPE="TEXT" NAME="ItemName" SIZE="20"></TD>
				</TR>

				<TR class=row_even>
					<TD>InvoiceNo*</TD>
					<TD><INPUT TYPE="TEXT" NAME="InvoiceNo" SIZE="20" required="required"></TD>
				</TR>

				<TR class=row_odd>
					<TD>Quantity *</TD>
					<TD><INPUT TYPE="TEXT" NAME="Quantity" SIZE="10" required="required"></TD>
				</TR>
				<TR class=row_even>
					<TD>ReceivedBy *</TD>
					<TD><INPUT TYPE="TEXT" NAME="ReceivedBy" SIZE="10" readonly></TD>
				</TR>

				<TR class=row_odd>
					<TD>ReceiptNo *</TD>
					<TD><INPUT TYPE="TEXT" NAME="ReceiptNo" SIZE="20" required="required"></TD>
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
%> 
