<%@ page import="java.sql.*"%>
<%!
String p;
String m;
%>
<%
	String pwd=request.getParameter("t2");
	String email=request.getParameter("t1");
%>

<%
try{

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
String qry="select * from admin";
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery(qry);
%>

<%
while(rs.next())
{
	p=rs.getString("pwd");
	m=rs.getString("email");
	if(m.equals(email) && p.equals(pwd)){
%>
<a href="admsearch.html"><h3 align="center">login successful</h3></a>
<%
	break;
}
	else{
%>
<h3>login failed!!</h3>
<a href="Home..html"><h3 align="center">login failed!!</h3></a>
<%
break;
}
}
}
catch(Exception e)
{
out.println(e);
}
%>
