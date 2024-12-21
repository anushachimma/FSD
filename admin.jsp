<%@ page import ="java.sql.*" %>
<%
	String email=request.getParameter("t1");
	String pwd=request.getParameter("t2");
	
%>
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
	String qry="insert into admin values(?,?)";
	PreparedStatement pstmt=con.prepareStatement(qry);
	pstmt.setString(1,email);
	pstmt.setString(2,pwd);
	int res=pstmt.executeUpdate();
	out.println(res+"<font color=green >Register completed");
	
	
}
catch(Exception e) {
out.print(e);
}
%>
