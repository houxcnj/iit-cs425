<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import = "java.sql.*"%>
<html>
<head>
<center>
<titl><h1>JDBC+JSP discussion forum Laptop Group Ranking</h1></title>
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
PreparedStatement pstmt1 = null;
ResultSet rs1 = null;

%>

<center> <p> The ranking of the laptop group</p> </center>

<%
int count = 4;
int points[] = new int[5];
String name[] = new String[5];
%>

<%
Class.forName(DBDRIVER);
conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
//connect to database
String sql = "SELECT name, points from LaptopGroup order by points desc";
String sql1 = "Select * from achievement order by minpoints asc";
String title = null;

try {
  
   pstmt = conn.prepareStatement(sql); 
   rs = pstmt.executeQuery();
  
   
   while(rs.next()) {
	   if (count >= 0) {
     	name[count] = rs.getString(1);
     	points[count] = rs.getInt(2);
     	count--;
	   }
	   
	   pstmt1 = conn.prepareStatement(sql1); 
	   rs1 = pstmt1.executeQuery();
	 
	   while (rs1.next()) {
		   if (rs.getInt(2) > rs1.getInt(1))
		   		 title = rs1.getString(2); 
	   }
	   out.println("<center><br>" + rs.getString(1) + "\t" + rs.getInt(2) + "\t" + title + "<br/></center>");
     	
     rs1.close();
     pstmt1.close();
   } 
   
   rs.close();
   pstmt.close();
   conn.close();
   
   %> <center><p> The Top 5 members in laptop Group!! </p></center> <%
   count++;
  
   
  while (count<5) {
	   out.println("<center><br>" + name[count] + "\t" + points[count] + "<br/></center>" );
	   count++;
   }

}catch (Exception e) {
   out.println(e);
}


%>


</body>
</html>

