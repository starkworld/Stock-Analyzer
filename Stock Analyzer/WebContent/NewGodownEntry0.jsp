<%@ page language="java"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<HTML>
<HEAD>
<LINK href="styles.css" type="text/css" rel="stylesheet">
<LINK href="js/jquery-ui.css" type="text/css" rel="stylesheet">

<TITLE>New Godown entry</TITLE>
<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
<script language="Javascript" src="Images/validate.js"></script>
<script type="text/javascript" src="./js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function check() {
		var GodownID = document.NewGodownForm.GodownID.value;
		var Location = document.NewGodownForm.Location.value;
		var CapacityinQuintals = document.NewGodownForm.CapacityinQuintals.value;
		var GodownManager = document.NewGodownForm.GodownManager.value;
		var GSDate = document.NewGodownForm.GSDate.value;

		var pattern = /^([a-zA-Z0-9\_\. ]{1,15})$/;
		var wpattern = /^([0-9]{1,2})$/;
		var ADpattern = /^([a-zA-Z0-9\_\. ]{1,20})$/;
		var Npattern = /^([a-zA-Z\_\. ]{1,15})$/;
		var Ipattern = /^([a-zA-Z\_\. ]{1,25})$/;
		var Apattern = /^([0-9]{1,10})$/;

		if (!(Apattern.test(GodownID))) {
			alert("Invalid GodownID");
			return false;
		}

		else if (!(Ipattern.test(Location))) {
			alert("Invalid Location");
			return false;
		} else if (!(Apattern.test(CapacityinQuintals))
				|| CapacityinQuintals <= 0) {
			alert("Invalid CapacityinQuintals");
			return false;
		} else if (!(Ipattern.test(GodownManager))) {
			alert("Invalid GodownManager");
			return false;
		} else if (GSDate == "") {
			alert("Godown Starting Date is manadatory");
			return false;
		}

	}
	//-->
	$(document).ready(function() {
		$("#GSDate").datepicker({
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

		if (auth == 1) {
	%><H3 align=center>
		<IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You
		are not authorized to access this page
	</H3>
	<%
		} else {
	%>

	<FORM NAME="NewGodownForm" onSubmit="return check()"
		action="NewGodownEntry.jsp">
		<CENTER>
			<!--GodownID	Location	Capacity	GodownManager GodownStartingDate-->

			<TABLE BORDER="0" CELLSPACING="2" CELLPADDING="2">
				<TR class=row_title ALIGN="center">
					<TH COLSPAN="2">New Godown entry</TH>
				</TR>
				<TR class=row_odd>
					<TD>GodownID *</TD>
					<TD><INPUT TYPE="TEXT" NAME="GodownID" SIZE="10"></TD>
				</TR>
				<TR class=row_even>
					<TD>Location *</TD>
					<TD><INPUT TYPE="TEXT" NAME="Location" SIZE="10"></TD>
				</TR>

				<TR class=row_odd>
					<TD>Capacity in Quintals *</TD>
					<TD><INPUT TYPE="TEXT" NAME="CapacityinQuintals" SIZE="20"></TD>
				</TR>

				<TR class=row_even>
					<TD>GodownManager*</TD>
					<TD><INPUT TYPE="TEXT" NAME="GodownManager" SIZE="20"></TD>
				</TR>

				<TR class=row_odd>
					<TD>GodownStartingDate*</TD>
					<td><input size=20 id="GSDate" name="GSDate" /></tD>
				<TR class=row_odd ALIGN="CENTER">
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