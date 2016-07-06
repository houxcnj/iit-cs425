<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import = "java.sql.*"%>
<html>
<head>
<center>
<h1>Elimination a member from group</h1>
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
String member = request.getParameter("m");
String fl = (String)request.getParameter("fl");
int flag = Integer.parseInt(fl);
if(flag ==1){
String sql1 = "DELETE FROM laptopgroup WHERE name='"+member+"'";
String sql2 = "DELETE FROM comments WHERE madebyuser='"+member+"'";
try{
	
   Class.forName(DBDRIVER);
   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);

   PreparedStatement pstmt2 = conn.prepareStatement(sql1);
   pstmt2.executeUpdate(sql1);
   PreparedStatement pstmt3 = conn.prepareStatement(sql2);
   pstmt3.executeUpdate(sql2);

   pstmt2.close();
   pstmt3.close();
   conn.close();
   out.print("<center>The member has been eliminated from laptop group!</center>");
   %>
   <center><a href="grade.jsp">back to leader control page</center></a>
   <%
}catch (Exception e) {
   out.println(e);
}}
if(flag ==2){
	out.print(member);
	String sql3 = "DELETE FROM restaurantgroup WHERE name='"+member+"'";
	String sql4 = "DELETE FROM review WHERE madebyuser='"+member+"'";
	try{
		
		   Class.forName(DBDRIVER);
		   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);

		   PreparedStatement pstmt2 = conn.prepareStatement(sql3);
		   pstmt2.executeUpdate(sql3);
		   PreparedStatement pstmt3 = conn.prepareStatement(sql4);
		   pstmt3.executeUpdate(sql4);

		   pstmt2.close();
		   pstmt3.close();
		   conn.close();
		   out.println(member);
		   out.print("<center>The member has been eliminated from restaurant group!</center>");
%>
<center><a href="grade.jsp">back to leader control page</center></a>
<%
		}catch (Exception e) {
		   out.println(e);
		}
}
%>

</body>
</html>