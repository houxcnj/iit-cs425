
<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.Date"%>
<%@ page import = "java.text.SimpleDateFormat"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



 <%  
          int id = Integer.parseInt(session.getAttribute("id").toString());
          int inputRate = Integer.parseInt(request.getParameter("rate"));  
          int oldRate =Integer.parseInt(session.getAttribute("rate").toString());
          int newRate =  (oldRate + inputRate)/2 ;
          String sql = " UPDATE REVIEW SET RATE = "+ newRate +"  WHERE ID =  "+ id +"" ;
          
          String DBDRIVER = "oracle.jdbc.driver.OracleDriver";
          String DBURL = "jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl";
          String DBNAME = "xhou3";
          String DBPASS = "walc0727";
          Connection conn = null;
          Class.forName(DBDRIVER);
          conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
       	  PreparedStatement pstmt1 = conn.prepareStatement(sql);
       	  pstmt1.executeUpdate(sql);
       	  
       	  
       	  
       	 String sql2 = "SELECT ratethreshold FROM  groupinfo WHERE G_NAME = 'Restaurant'" ;
       	 PreparedStatement pstmt2 = conn.prepareStatement(sql2);
       	 ResultSet rs2 = pstmt2.executeQuery(sql2);
 	     rs2.next();
 	     int ratethreshold = (rs2.getInt("ratethreshold"));
 	     
 	     String madeByUser = session.getAttribute("madeByUser").toString();
 	     String sql3 = "SELECT points FROM restaurantgroup WHERE NAME = '" + madeByUser+"'";
 	     PreparedStatement pstmt3 = conn.prepareStatement(sql3);
      	 ResultSet rs3 = pstmt3.executeQuery(sql3);
	     rs3.next();
	     int oldPoints = (rs3.getInt("points"));
	     int newPoints = oldPoints -1;
	     
	     String sql4  = " UPDATE restaurantgroup SET points = "+ newPoints +"  WHERE NAME = '" + madeByUser+"'";
 	     
 	     
 	     
 	     if( newRate <ratethreshold )
 	     {
 	    	  PreparedStatement pstmt4 = conn.prepareStatement(sql4);
 	       	  pstmt4.executeUpdate(sql4);
 	       	 
 	     }
       	  
       	  
       	  
       	  
         %>

<jsp:forward page="restaurantForum.jsp" />
</body>
</html>