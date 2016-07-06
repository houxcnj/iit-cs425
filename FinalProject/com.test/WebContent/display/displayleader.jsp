<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<center>
<titl><h1>Display the leaders</h1></title>
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
<%
String n=null;
try{
	String sql = "SELECT name from laptopgroup where userlevel = 1";
	
   Class.forName(DBDRIVER);
   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);

   PreparedStatement pstmt2 = conn.prepareStatement(sql);
   pstmt2.executeQuery(sql);
   rs = pstmt2.executeQuery();
   while(rs.next()){
	   n = rs.getString(1);
	   out.print("<center>Leader name:"+n+"</center>");
	   out.print("<center>The group he is leading: Laptop</center>");
	   out.print("<center>The group he belongs to: Laptop  ");
	   int flag1 = 0;
	   int flag2 = 0;
	   //String sql2 = "SELECT * FROM laptopgroup where name='"+n+"'";
	   String sql3 = "SELECT * FROM restaurantgroup where name='"+n+"'";
	   //out.print(n);
	   //PreparedStatement pstmt3 = conn.prepareStatement(sql2);
	   //rs2 = pstmt3.executeQuery(sql2);
	   PreparedStatement pstmt4 = conn.prepareStatement(sql3);
	   rs3 = pstmt4.executeQuery(sql3);
	   if(rs3.next()){flag1=1;}
	   //if(rs3.next()){flag2=1;}
	   if(flag1 == 1){
		   out.print("Restaurant</center><br>");
	   }else{out.print("</center><br>");}
	   rs3.close();
	   //rs2.close();
	   pstmt4.close();
	   //pstmt3.close();
   }

   rs.close();
   pstmt2.close();
   conn.close();
   
}catch (Exception e) {
   out.println(e);
}
%>
<%
//String n=null;
try{
	String sql = "SELECT name from restaurantgroup where userlevel = 1";
	
   Class.forName(DBDRIVER);
   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);

   PreparedStatement pstmt2 = conn.prepareStatement(sql);
   pstmt2.executeQuery(sql);
   rs = pstmt2.executeQuery();
   while(rs.next()){
	   n = rs.getString(1);
	   out.print("<center>Leader name:"+n+"</center>");
	   out.print("<center>The group he is leading: Restaurant</center>");
	   out.print("<center>The group he belongs to: Restaurant  ");
	   int flag1 = 0;
	   int flag2 = 0;
	   //String sql2 = "SELECT * FROM laptopgroup where name='"+n+"'";
	   String sql3 = "SELECT * FROM laptopgroup where name='"+n+"'";
	   //out.print(n);
	   //PreparedStatement pstmt3 = conn.prepareStatement(sql2);
	   //rs2 = pstmt3.executeQuery(sql2);
	   PreparedStatement pstmt4 = conn.prepareStatement(sql3);
	   rs3 = pstmt4.executeQuery(sql3);
	   if(rs3.next()){flag1=1;}
	   //if(rs3.next()){flag2=1;}
	   if(flag1 == 1){
		   out.print("Laptop</center><br>");
	   }else{out.print("</center><br>");}
	   rs3.close();
	   //rs2.close();
	   pstmt4.close();
	   //pstmt3.close();
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