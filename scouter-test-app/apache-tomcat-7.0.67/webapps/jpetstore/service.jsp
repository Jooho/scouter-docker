<%@ page session="true" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.naming.*" %>
<html>
<body>
<%!
    public Connection getConnection() throws Exception {
//	DataSource datasource = (DataSource) new InitialContext().lookup("java:/comp/env/jdbc/hsql");
//	return datasource.getConnection();
        //String url = "jdbc:hsqldb:file:" + System.getProperty("user.home") + "/jpetTestdb/data";
        //System.out.println("jdbc url = " + url);
        return DriverManager.getConnection("jdbc:hsqldb:mydatabase", "SA", "");
    }

    Random rand = new Random();
%>

<%
    {
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
    }
    if (rand.nextInt(100) == 1) {
        Thread.sleep(rand.nextInt(15000));
    } else if (rand.nextInt(10) == 1) {
        Thread.sleep(rand.nextInt(7000));
    } else if (rand.nextInt(5) == 1) {
        Thread.sleep(rand.nextInt(3000));
    } else if (rand.nextInt(10) == 1) {
        Thread.sleep(rand.nextInt(1000));
    }
%>

</body>
</html>
