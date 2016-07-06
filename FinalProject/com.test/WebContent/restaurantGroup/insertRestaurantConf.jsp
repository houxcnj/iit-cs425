<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.Date"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<html>
<head>
<center>
<title><h1>Insert restaurantName Form</h1></title>
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
//ResultSet rs = null;
%>
<%
boolean flag = false;
String restaurantName = request.getParameter("restaurantName");
String restaurantAddress = request.getParameter("restaurantAddress");

String sql3 = "SELECT COUNT(ID)  FROM Restaurant" ;
%>
<%
//connect to database
//String sql = "INSERT INTO Restaurant VALUES ('"+restaurantName+"','"+restaurantAddress+"')";
//String sql = "INSERT INTO Restaurant VALUES ("+idd+",'"+restaurantName+"','"+restaurantAddress+"')";

   Class.forName(DBDRIVER);
   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
	  // PreparedStatement pstmt = conn.prepareStatement(sql);
	//   pstmt.executeUpdate(sql);
	   session.setAttribute("restaurantName",restaurantName);
	   
	   
	   PreparedStatement pstmt3 = conn.prepareStatement(sql3);
	   ResultSet rs3 =pstmt3.executeQuery(sql3); 
	   rs3.next();
	   int idd = 0;
	   idd = (rs3.getInt("COUNT(ID)")+1);
	   System.out.print("xxxxxxxxxxxxxxxxx");
	   System.out.print(idd);
		  
		  
	   // String sq4 = "INSERT INTO COMMENTS VALUES ("+idd+",'"+title+"','"+rate+"','"+madeByUser+"','"+brand+"','"+category+"','"+laptopName+"',TO_DATE('"+snk+"','YY-MM-DD'),'"+reviewContent+"',"+price+")";
		//  String sql = "INSERT INTO Restaurant VALUES ("+idd+",'"+restaurantName+"','"+restaurantAddress+"')";
	   String sql = "INSERT INTO Restaurant VALUES ("+idd+",'"+restaurantName+"','"+restaurantAddress+"')";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		   pstmt.executeUpdate(sql);	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
   pstmt.close();
   conn.close();


%>
<jsp:forward page="insertRestaurantSuccess.jsp" />
</body>
</html>