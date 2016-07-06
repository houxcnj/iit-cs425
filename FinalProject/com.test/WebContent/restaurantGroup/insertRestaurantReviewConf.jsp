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
ResultSet rs = null;
ResultSet rs3 = null;
ResultSet rs4 = null;
%>
<%
boolean flag = false;
//receive parameter
int id = 0;
String title = request.getParameter("title");
String rate = request.getParameter("rate");
String madeByUser =session.getAttribute("uname").toString();
String restaurantName = request.getParameter("restaurantName");
String reviewContent = request.getParameter("reviewContent");

%>
<%
//connect to database
String sq1 = "SELECT COUNT(ID)  FROM REVIEW" ;


   Class.forName(DBDRIVER);
   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
	   PreparedStatement pstmt1 = conn.prepareStatement(sq1);
	  
	   
	    rs =pstmt1.executeQuery(sq1); 
	    SimpleDateFormat df = new SimpleDateFormat("yy-MM-dd");
	    String snk = df.format(new Date());
	    rs.next();
		   int idd = (rs.getInt("COUNT(ID)")+1);
		  
		   	 
		   String sq2 = "INSERT INTO Review VALUES ("+idd+",'"+title+"','"+rate+"','"+madeByUser+"','"+restaurantName+"',TO_DATE('"+snk+"','YY-MM-DD'),'"+reviewContent+"')";
		   PreparedStatement pstmt2 = conn.prepareStatement(sq2);
		   pstmt2.executeUpdate(sq2);
	   
		 
		   
		   String name = session.getAttribute("uname").toString();
		   String sq3 = "SELECT points FROM restaurantgroup WHERE NAME = '" + name+"'";
		   String sq4 = "SELECT NUMPOINT FROM groupinfo WHERE G_NAME = 'Restaurant'" ;
		   
		   PreparedStatement pstmt3 = conn.prepareStatement(sq3);
		   PreparedStatement pstmt4 = conn.prepareStatement(sq4);
		   
		   int points = 0;
		   rs3 = pstmt3.executeQuery(sq3);
		  if( rs3.next())
		  {
		    points = (rs3.getInt("points"));
		  }
		   
		   rs4 = pstmt4.executeQuery(sq4);
		   
		   int numpoint = 0; 
		   
		   if (rs4.next())
		   {
			 
			   numpoint = (rs4.getInt("numpoint"));
			 }
		   
		   int newPoint = numpoint + points;
		  
		   String sq5 = "UPDATE restaurantgroup SET points  = " + newPoint + " WHERE NAME = '" +  name+"'";
		   PreparedStatement pstmt5 = conn.prepareStatement(sq5);
		   pstmt5.executeUpdate(sq5);
	   
	   
	   
	   session.setAttribute("title",title);
	   
   pstmt1.close();
   pstmt2.close();
   
   conn.close();



%>
<jsp:forward page="insertRestaurantReviewSuccess.jsp" />
</body>
</html>