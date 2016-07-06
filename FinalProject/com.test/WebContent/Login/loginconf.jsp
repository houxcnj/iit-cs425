<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import = "java.sql.*"%>
<html>
<head>
<center>
<titl><h1>discussion forum</h1></title>
<hr>
<br>
</center>
</head>
<body>
<%--
using jdbc to connect to oracle database
--%>
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
%>

<%
//connect to database
String sql = "SELECT name from login where name=? and password=?";

try {
   Class.forName(DBDRIVER);
   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
   pstmt = conn.prepareStatement(sql); 
   pstmt.setString(1,name);
   pstmt.setString(2,password);
   rs = pstmt.executeQuery();
   if(rs.next()) {
    out.println(rs.getString("name"));
     flag = true;
     session.setAttribute("uname",rs.getString("name"));
   } else {
    request.setAttribute("err","username or password wrong!");
   }

   rs.close();
   pstmt.close();
   conn.close();

}catch (Exception e) {
   out.println(e);
}
%>


   <%
//jump
if(flag) {
   //if user log in successfully, jump to welcome page
   //otherwise prompt login failure
%>

<jsp:forward page="loginsuccess.jsp" />

<%

}
else {  
%>

<jsp:forward page="login.jsp"/>
<%
}
%>

</body>
</html>

