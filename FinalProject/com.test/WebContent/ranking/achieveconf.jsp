<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.Date"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<html>
<head>
<center>
<titl><h1>achievement form</h1></title>
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
PreparedStatement pstmt1 = null;
PreparedStatement pstmt2 = null;
%>
<%
//receive parameter
String min = request.getParameter("minpoint");
String title = request.getParameter("title");
String action = request.getParameter("action");
%>
<%
//connect to database
int min1 = Integer.parseInt(min);

String sql = "INSERT INTO achievement VALUES ("+min1+",'"+title+"')";
String sql1 = "Delete from achievement where minpoints = "+min1;
String sql2 = "Delete from achievement where minpoints = "+min1+ "or title = '"+title+"'";
try {
   Class.forName(DBDRIVER);
   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
   
  if (action.equals("add")) {
	   pstmt = conn.prepareStatement(sql);
	   pstmt.executeUpdate(sql);
	   pstmt.close();
	   }
  else if (action.equals("delete")) {
	   pstmt1 = conn.prepareStatement(sql1);
	   pstmt1.executeUpdate(sql1);
	   pstmt1.close();
  } else {
	   pstmt2 = conn.prepareStatement(sql2);
	   pstmt2.executeUpdate(sql2);
	   pstmt2 = conn.prepareStatement(sql);
	   pstmt2.executeUpdate(sql);
	   pstmt2.close();
  } 
	
   rs.close();
   
   conn.close();

}catch (Exception e) {
   out.println(e);
}
%>
<jsp:forward page="achievementsetting.jsp" />
</body>
</html>