<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.Date"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<html>
<head>
<center>
<title><h1>Detail  Laptop Comment </h1></title>
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
boolean flag = false;
  int id = Integer.parseInt(session.getAttribute("id").toString() );  

%>
<%
//connect to database

   Class.forName(DBDRIVER);
   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
   String sq1 = "SELECT id,title, rate, madeByUser,brand,category,laptopname, createDate, reviewContent, price FROM comments WHERE ID = "+id+" " ;
	   PreparedStatement pstmt1 = conn.prepareStatement(sq1);
	  
	   
	    rs =pstmt1.executeQuery(sq1); 
	    rs.next();
	 
	 
	 String title = rs.getString("title");
	 int rate = rs.getInt("rate");
	 String madeByUser = rs.getString("madeByUser");
	 String brand = rs.getString("brand");
	 String category = rs.getString("category");
	 String laptopname = rs.getString("laptopname");
	 String createDate = rs.getString("createDate");
	 String reviewContent = rs.getString("reviewContent");
	 String price = rs.getString("price");
	 	   
	 //  session.setAttribute("title",title);
	   
   pstmt1.close();
   
   conn.close();

%>
<h4><font color="red">Id:   <%=id%></font></h4>
<h4><font color="red">Title:   <%=title%></font></h4>
<h4><font color="red">Rate:    <%=rate%></font></h4>
<h4><font color="red">MadeByUser:   <%=madeByUser%></font></h4>
<h4><font color="red">Brand:   <%=brand%></font></h4>
<h4><font color="red">Category:   <%=category%></font></h4>
<h4><font color="red">Laptopname:   <%=laptopname%></font></h4>
<h4><font color="red">createDate:   <%=createDate%></font></h4>
<h4><font color="red">ReviewContent:   <%=reviewContent%></font></h4>
<h4><font color="red">price:   <%=price%></font></h4>

<% 
session.setAttribute("rate",rate);
session.setAttribute("id",id);
session.setAttribute("madeByUser",madeByUser);
session.setAttribute("pay",price);
%>

<%
if ( category.equals("sell") || category.equals("trade"))
{
	%>
	<a href="/com.test/pay/payment.jsp">Buy This Item</a>
	<%
}


%>

<br>
<a href="rateComment.jsp">Rate this comment</a>

</body>
</html>