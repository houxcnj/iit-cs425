<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import = "java.sql.*"%>
<html>
<head>
<center>
<titl><h1>JDBC+JSP discussion forum achievement settings</h1></title>
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
Class.forName(DBDRIVER);
conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
//connect to database
String sql = "SELECT * from achievement order by minPoints Desc";

pstmt = conn.prepareStatement(sql); 
rs = pstmt.executeQuery();

while(rs.next()) {
	   out.println("<center><br>" + rs.getInt(1) + "\t" + rs.getString(2) + "<br/></center>");
} 

rs.close();
pstmt.close();
conn.close();
%>

<form action="achieveconf.jsp" method="post">
<table width="1">
   <tr>
    <td colspan="2">setting titles</td>
   </tr>
   <tr>
    <td >minimum points:</td>
    <td><input type="text" name="minpoint"></td>
   </tr>
   <tr>
    <td>title:</td>
    <td><input type="text" name="title"></td>
   </tr>
   <tr>
   	<td><input type="submit" name="action" value="add"></td>
    <td><input type="submit" name="action" value="delete"></td>
    <td><input type="submit" name="action" value="modify"></td>
    <td><input type="reset" value="reset"></td>
   </tr>
</table>
</form>
<%
   if(request.getAttribute("err")!=null)
   {
%>
    <h4><font color="red"><%=request.getAttribute("err")%></font></h4>
<%
   }
%>
</body>
</html>

