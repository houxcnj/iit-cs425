<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import = "java.sql.*"%>
<html>
<head>
<center>
<h1>parameter configuration</h1>
<hr>
<br>
</center>
</head>
<body>
<%!
String DBDRIVER = "oracle.jdbc.driver.OracleDriver";
String DBURL = "jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl";
String DBNAME = "xhou3";
String DBPASS = "walc0727";
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
%>
<%
String value = request.getParameter("value2");
int snk = Integer.parseInt(value);
try{
	String sql = "UPDATE groupinfo SET ratethreshold="+snk+" WHERE g_name='Laptop'";
   Class.forName(DBDRIVER);
   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);

   PreparedStatement pstmt2 = conn.prepareStatement(sql);
   pstmt2.executeUpdate(sql);

   pstmt2.close();
   conn.close();
   out.print("<center>The modification been processed successfully!</center>");
}catch (Exception e) {
   out.println(e);
}
%>
<center><a href="grade.jsp">back to leader control page</center></a>
</body>
</html>