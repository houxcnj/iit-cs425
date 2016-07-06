<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<center>
<titl><h1>JDBC+JSP discussion forum Authorization</h1></title>
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
//connect to database
String sql = "SELECT * from laptopgroup";

try {
   Class.forName(DBDRIVER);
   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
   pstmt = conn.prepareStatement(sql); 
   rs = pstmt.executeQuery();
   while(rs.next()){
	   out.print("<TR><TD>"+rs.getString(1) +" " +rs.getInt(3)+" " + rs.getInt(4)+" "+"<br/></TD>");
	   }

   rs.close();
   pstmt.close();
   conn.close();

}catch (Exception e) {
   out.println(e);
}
%>

<form action="authorizeLapconf.jsp" method="post">
<table width="1">
   <tr>
    <td colspan="2">Authorize leader</td>
   </tr>
   <tr>
    <td >username:</td>
    <td><input type="text" name="id"></td>
   </tr>
   <tr>
    <td><input type="submit" name="action" value="upgrade"></td>
    <td><input type="submit" name="action" value="degrade"></td>
   </tr>
</table>
</form>

</body>
</html>