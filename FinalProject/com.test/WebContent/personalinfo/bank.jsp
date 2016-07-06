<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.Date"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<html>
<head>
<center>
<h1>Add a bank account</h1>
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
String r_number = request.getParameter("r_number");
String a_number = request.getParameter("a_number");
String bank = request.getParameter("bank");
String balance = request.getParameter("balance");
String name = (String)session.getAttribute("uname");
%>
<%
//connect to database
String sql = "INSERT INTO bankinfo VALUES ('"+name+"', '"+r_number+"','"+a_number+"','"+bank+"','"+balance+"')";
try {
   Class.forName(DBDRIVER);
   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);

   PreparedStatement pstmt2 = conn.prepareStatement(sql);
   pstmt2.executeUpdate(sql);

   rs.close();
   pstmt.close();
   conn.close();

}catch (Exception e) {
   out.println(e);
}
%>

<jsp:forward page="personInfo.jsp" />
</body>
</html>