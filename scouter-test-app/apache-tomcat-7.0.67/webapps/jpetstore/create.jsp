<%@ page session="true"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>

<html>
<body>
<%!
public Connection getConnection() throws Exception {
	//DataSource datasource = (DataSource) new InitialContext().lookup("java:/comp/env/jdbc/hsql");
    return DriverManager.getConnection("jdbc:hsqldb:mydatabase","SA","");
	//return datasource.getConnection();
}

public void make(String table)throws Exception {

Connection conn = getConnection();
	Statement stmt = conn.createStatement();
	try{ 
	stmt.executeUpdate("drop table "+table); } catch(Exception e){}
    stmt.executeUpdate("CREATE TABLE "+table+" ( id varchar(40) ,name varchar(40) )");
    for(int  i = 0 ; i<10000; i++){
       stmt.executeUpdate("insert into "+table+"(id,name) values('id"+i+"','name"+i+"')" );
    }
    stmt.close();
    conn.close();
}
%>
<%

   make("scouter");
   make("master");
   make("dept");
   make("emp");
	
%>	
create ok
</body>
</html>
