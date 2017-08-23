<%@ page session="true"%>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.naming.*" %>
<%!
public Connection getConnection() throws Exception {
	//DataSource datasource = (DataSource) new InitialContext().lookup("java:/comp/env/jdbc/hsql");
	//return datasource.getConnection();
	return DriverManager.getConnection("jdbc:hsqldb:mydatabase","sa","");
}
Random rand = new Random();
%>
<html>
<body>
<%
Thread.sleep(rand.nextInt(1000));

Connection conn = getConnection();
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from scouter");
	while (rs.next()) {
		String id = rs.getString(1);
		String name = rs.getString(2);
		out.println(id + " " + name + "<br>");
	}
	rs.close();
	stmt.close();
	conn.commit();
	conn.close();
%>	
This is e2end.jsp
</body>
</html>
