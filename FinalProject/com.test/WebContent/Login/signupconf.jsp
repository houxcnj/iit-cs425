<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.Date"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<html>
<head>
<center>
<titl><h1>sign up form</h1></title>
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
boolean flag = false;
//receive parameter
String name = request.getParameter("id");
String password = request.getParameter("password");
String email = request.getParameter("email");
%>
<%
//connect to database
SimpleDateFormat df = new SimpleDateFormat("yy-MM-dd");
String snk = df.format(new Date());
String sql = "SELECT name from login where name=?";
String sql2 = "INSERT INTO login VALUES ('"+name+"','"+password+"')";
String sql3 = "INSERT INTO membership VALUES ('"+name+"', '"+email+"',TO_DATE('"+snk+"','YY-MM-DD'),0,0,0,0)";
String sql4 = "INSERT INTO webaccount VALUES ('"+name+"',0)";
try {
   Class.forName(DBDRIVER);
   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
   /*
   pstmt = conn.prepareStatement(sql); 
   pstmt.setString(1,name);
   //pstmt.setString(2,password);
   rs = pstmt.executeQuery();
   if(rs.next()) {
    //out.println(rs.getString("name"));
     flag = true;
     
     request.setAttribute("err","username already exists!");
   } else {
	 session.setAttribute("uname",rs.getString("name"));
   }*/
   //if(!flag){
	   PreparedStatement pstmt2 = conn.prepareStatement(sql2);
	   pstmt2.executeUpdate(sql2);
	  // pstmt2.setString(1,name);
	  // pstmt2.setString(2,password);
	   PreparedStatement pstmt3 = conn.prepareStatement(sql3);
	   pstmt3.executeUpdate(sql3);
	   session.setAttribute("uname",name);
	   PreparedStatement pstmt4 = conn.prepareStatement(sql4);
	   pstmt4.executeUpdate(sql4);
   //}
   //rs.close();
   //pstmt.close();
   pstmt2.close();
   pstmt3.close();
   pstmt4.close();
   conn.close();

}catch (Exception e) {
   out.println(e);
}
%>
<jsp:forward page="loginsuccess.jsp" />
</body>
</html>