<!--
	File : EditDetails.jsp
	Purpose : This jsp is modify the details of Employes by Authorised users.Only Authorised 
			  Users can Edit or Modify the details.

-->
<HTML>

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<TITLE></TITLE>

<Script language="JavaScript">
var i;

var remarksFlag=false;
var roleFlag=false;

/* Functions to set Flags if any of the details get modified */
function setRemarksFlag()
{
	remarksFlag=true;
}

function setRoleFlag()
{
	roleFlag=true;
}

/*Checking wether any fields get modified or not.*/
function Check(){
//  modification in condition
if(remarksFlag==true)
	{
	  if(remarksFlag==false){
		window.alert("Remarks Field is mandatory...while modifying details");
		return false;
	  }
	  else
		return true;
	}
	else{
		window.alert("Not Modified any Fields...Press Cancel to exit");
		return false;
	}
if(roleFlag==true)
	{
	  if(roleFlag==false){
	window.alert("Role Field is mandatory...while modifying details");
		return false;
	  }
	  else
		return true;
	}
	else{
		window.alert("Not Modified any Fields...Press Cancel to exit");
		return false;
	}
		
}

</script>
</HEAD>
<body class= SC>
<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String filedata="";
String filestr="";
File file=null;
FileWriter fr=null;
Random rand = new Random(100000l);

String EMPName,CurrentLocation,Role;
String Remarks;
Date JoiningDate;
EMPName=request.getParameter("EMPName");

try
{

	/*Getting the connection variable from session*/
	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();


	String Query = "SELECT * from EmpMaster where EMPName=\'"+EMPName+"\'";


	//System.out.println(Query);
	rs = stmt.executeQuery(Query);
		
}
catch(Exception e)
{
	//System.out.println("Exception"+e);
}

if(rs!=null)
{
	/*Getting the values from the database*/

	while(rs.next())
	{
	  //System.out.println("----------");
	  EMPName=rs.getString(1);
	  CurrentLocation=rs.getString(2);
	  JoiningDate=rs.getDate(3);
	  Role=rs.getString(4);
	  Remarks=rs.getString(5);
	  	String RemarksBKUP = Remarks;
	if(Remarks==null) Remarks="";
	if(Remarks.equals("null")) Remarks="";
	  session.setAttribute("RemarksBKUP2",RemarksBKUP);
%>

<!-- If data in any fields get modified then control goes to modifydetails.jsp -->

<FORM action="ModifyDetails.jsp" method="post" name="ModForm" 
onSubmit='return Check()'>
	<H3 CLASS=Top> <%=EMPName%></H3>
<TABLE>
	<TR class=row_odd><TD>EMPName</TD><TD><%if(EMPName==null)EMPName="-";%><%=EMPName%></TD>			
	<TR class=row_odd><TD>CurrentLocation</TD><TD><%if(CurrentLocation==null)CurrentLocation="-";%><%=CurrentLocation%></TD>
  	<TR class=row_even><TD>JoiningDate</TD><TD><%=JoiningDate%></TD>
	<TR class=row_odd>
		<TD>Role</TD>
		<TD><INPUT name=Role type= text width="50" value="" onchange="setRoleFlag()">(Enter new Role)
			<TEXTAREA  WIDTH = "25" onchange='this.value="<%=Role%>"'> <%=Role%> </TEXTAREA>(Previous Role)
		</TD>
	</TR>
	<TR class=row_even>
		<TD>Remarks</TD>
		<TD><INPUT name=Remarks type= text width="50" value="" onchange="setRemarksFlag()">(Enter new Remarks)
		<!--	<INPUT name=Remarks1 type= text width="30" value="<%=Remarks%>" DISABLED>  -->
			<TEXTAREA  WIDTH = "25" onchange='this.value="<%=Remarks%>"'> <%=Remarks%> </TEXTAREA>(Existing Remarks)
		</TD>
	</TR>
	<TR class=row_odd>
	<td>
		<input type="Submit" value="Modify" id="sid" >
	</td>
	<td>
		<input type="Button" value="Cancel" onclick='window.close()' >
	</td>
	</tr>

</TABLE>
		<INPUT name=EMPName type=hidden width="30" value="<%=EMPName%>">
		<INPUT name=CurrentLocation type=hidden width="30" value="<%=CurrentLocation%>">

</FORM></P>

<%
	}
	rs.close();
}
else
{
	/*To write to the server if the resultset is null*/
	//System.out.println("Result set is null\n");

}

%>
</BODY>
</HTML>
