<%@ page import="java.sql.*"%>
<%!
String p;
String m;
%>
<%
	String pwd=request.getParameter("pd");
	String email=request.getParameter("docmail");
%>

<%
try{

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
String qry="select * from doctor";
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery(qry);
%>

<%
while(rs.next())
{
	p=rs.getString("pswd");
	m=rs.getString("email");
	if(m.equals(email) && p.equals(pwd)){
%>
<a href="doc1.html"><h3>login successful</h3></a>
<%
	break;
}
	else{
%>
<h3>login failed!!</h3>
<a href="index.html"><h3>login failed!!</h3></a>
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
