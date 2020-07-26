<%@ page language="java"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%
	String EmpName = request.getParameter("EmpName");
%>
<HTML>
<HEAD>
<LINK href="styles.css" type="text/css" rel="stylesheet">
<LINK href="js/jquery-ui.css" type="text/css" rel="stylesheet">

<TITLE>Add Employee</TITLE>
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
		$("#JoiningDate").datepicker({
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



	<FORM NAME="AddEmpForm" onSubmit="return check()"
		action="AddEmployee11.jsp">
		<CENTER>

			<TABLE BORDER="0" CELLSPACING="2" CELLPADDING="2">
				<TR class=row_title ALIGN="center">
					<TH COLSPAN="2">Add new Employee</TH>
				</TR>



				<TR class=row_odd>
					<TD>EMPName *</TD>
					<TD><INPUT TYPE="TEXT" NAME="EmpName" SIZE="15"
						value="<%=EmpName%>" readonly></TD>
				</TR>


				<TR class=row_even>
					<TD>CurrentLocation*</TD>
					<TD><INPUT TYPE="TEXT" NAME="CurrentLocation" SIZE="30">
				</TR>

				<TR class=row_odd>
					<TD>JoiningDate*</TD>
					<TD nowrap><input size=20 readonly id="JoiningDate"
						name="JoiningDate"></TD>
				<TR class=row_even>
					<TD>Role*</TD>
					<TD><select name="Role">
							<option value="">-----</option>
							<option value="Godown Manager">Godown Manager</option>

					</select></TD>

				</TR>
				<TR class=row_odd>
					<TD>Remarks</TD>
					<TD><INPUT TYPE="TEXT" NAME="Remarks" SIZE="30"></TD>
				</TR>
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