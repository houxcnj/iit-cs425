<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<center>
<titl><h1>Display users in each group who do not have finantial information</h1></title>
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
ResultSet rs2 = null;
ResultSet rs3 = null;
%>
<center><h4><font color = "green">Laptop Group</font></h4></center>
<%
String n=null;
try{
	String sql = "SELECT name from laptopgroup";
	
   Class.forName(DBDRIVER);
   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);

   PreparedStatement pstmt2 = conn.prepareStatement(sql);
   pstmt2.executeQuery(sql);
   rs = pstmt2.executeQuery();
   while(rs.next()){
	   n = rs.getString(1);
	   int flag = 0;
	   String sql2 = "SELECT * FROM bankinfo where name='"+n+"'";
	   String sql3 = "SELECT * FROM creditinfo where cardholder='"+n+"'";
	   //out.print(n);
	   PreparedStatement pstmt3 = conn.prepareStatement(sql2);
	   rs2 = pstmt3.executeQuery(sql2);
	   PreparedStatement pstmt4 = conn.prepareStatement(sql3);
	   rs3 = pstmt4.executeQuery(sql3);
	   if(rs2.next()){flag=1;}
	   if(rs3.next()){flag=1;}
	   if(flag == 0){
		   out.print("<center>"+n+"</center>");
	   }
	   rs3.close();
	   rs2.close();
	   pstmt4.close();
	   pstmt3.close();
   }

   rs.close();
   pstmt2.close();
   conn.close();
   
}catch (Exception e) {
   out.println(e);
}
%>
<center><h4><font color = "green">Restaurant Group</font></h4></center>
<%
try{
	String sql = "SELECT name from restaurantgroup";
	
   Class.forName(DBDRIVER);
   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);

   PreparedStatement pstmt2 = conn.prepareStatement(sql);
   pstmt2.executeQuery(sql);
   rs = pstmt2.executeQuery();
   while(rs.next()){
	   n = rs.getString(1);
	   int flag = 0;
	   String sql2 = "SELECT * FROM bankinfo where name='"+n+"'";
	   String sql3 = "SELECT * FROM creditinfo where cardholder='"+n+"'";
	   //out.print(n);
	   PreparedStatement pstmt3 = conn.prepareStatement(sql2);
	   rs2 = pstmt3.executeQuery(sql2);
	   PreparedStatement pstmt4 = conn.prepareStatement(sql3);
	   rs3 = pstmt4.executeQuery(sql3);
	   if(rs2.next()){flag=1;}
	   if(rs3.next()){flag=1;}
	   if(flag == 0){
		   out.print("<center>"+n+"</center>");
	   }
	   rs3.close();
	   rs2.close();
	   pstmt4.close();
	   pstmt3.close();
   }

   rs.close();
   pstmt2.close();
   conn.close();
   
}catch (Exception e) {
   out.println(e);
}
%>
</body>
</html>