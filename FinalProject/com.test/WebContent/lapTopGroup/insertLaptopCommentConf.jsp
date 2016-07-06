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
String brand = request.getParameter("brand");
String category = request.getParameter("category");
String laptopName = request.getParameter("laptopName");
String reviewContent = request.getParameter("reviewContent");
int price = Integer.parseInt(request.getParameter("price"));

%>
<%
//connect to database
String sq1 = "SELECT COUNT(ID)  FROM COMMENTS" ;
String name = session.getAttribute("uname").toString();
String sq3 = "SELECT points FROM laptopgroup WHERE NAME = '" + name+"'";
String sq4 = "SELECT NUMPOINT FROM groupinfo WHERE G_NAME = 'Laptop'" ;

  

   Class.forName(DBDRIVER);
   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
	   PreparedStatement pstmt1 = conn.prepareStatement(sq1);
	   PreparedStatement pstmt3 = conn.prepareStatement(sq3);
	   PreparedStatement pstmt4 = conn.prepareStatement(sq4);
	   
	   rs3 = pstmt3.executeQuery(sq3);
	   rs3.next();
	   int points = (rs3.getInt("points"));
	   
	   rs4 = pstmt4.executeQuery(sq4);
	 //  rs4.next();
	   int numpoint = 0;
	   
	   
	   if (rs4.next())
	   {
		 
		   numpoint = (rs4.getInt("numpoint"));
		 }
	   
	   int newPoint = numpoint + points;
	  
	   String sq5 = "UPDATE laptopgroup SET points  = " + newPoint + " WHERE NAME = '" +  name+"'";
	   PreparedStatement pstmt5 = conn.prepareStatement(sq5);
	   pstmt5.executeUpdate(sq5);
   
	   
	   
	   
	    rs =pstmt1.executeQuery(sq1); 
	    SimpleDateFormat df = new SimpleDateFormat("yy-MM-dd");
	    String snk = df.format(new Date());
	    rs.next();
		   int idd = (rs.getInt("COUNT(ID)")+1);
		  
		   	 
		   String sq2 = "INSERT INTO COMMENTS VALUES ("+idd+",'"+title+"','"+rate+"','"+madeByUser+"','"+brand+"','"+category+"','"+laptopName+"',TO_DATE('"+snk+"','YY-MM-DD'),'"+reviewContent+"',"+price+")";
		   PreparedStatement pstmt2 = conn.prepareStatement(sq2);
		   pstmt2.executeUpdate(sq2);
	   
		 //Retrieve by column name rev1 = rs.getFloat("impact");
	   
	   
	   
	   session.setAttribute("title",title);
	   
   pstmt1.close();
   pstmt2.close();
   
   conn.close();



%>
<jsp:forward page="insertlapTopCommentSuccess.jsp" />
</body>
</html>