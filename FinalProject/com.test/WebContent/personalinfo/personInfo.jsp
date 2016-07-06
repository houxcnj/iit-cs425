<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import = "java.sql.*"%>
<html>
<head>
<center>
<h1>Personal Information</h1>
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
String email = null;
Date date = null;
int points = 0;
int contribution = 0;
int rank = 0;
int userlevel = 0;
String name = null;
int cardnumber = 0;
String company = null;
String address = null;
Date e_date = null;
int routing_n = 0;
int account_n = 0;
String bank = null;
int b_balance = 0;
int web_balance = 0;
%>
<%
//connect to database
name = (String)session.getAttribute("uname");
String sql1 = "SELECT * from membership where name='"+name+"'";
String sql4 = "SELECT balance from webaccount where username='"+name+"'";
try {
   Class.forName(DBDRIVER);
   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
   pstmt = conn.prepareStatement(sql1); 
   rs = pstmt.executeQuery();
   if(rs.next()) {
    email = rs.getString(2);
    date = rs.getDate(3);
   } else {
    request.setAttribute("err","records not exist!");
   }
   pstmt = conn.prepareStatement(sql4);
   rs = pstmt.executeQuery();
   if(rs.next()){
	web_balance = rs.getInt(1);
	session.setAttribute("web_balance", Integer.toString(web_balance));
   }
   rs.close();
   pstmt.close();
   conn.close();

}catch (Exception e) {
   out.println(e);
}
%>

<br>
<center>
<table width="1">
   <tr>
    <td >username:</td>
    <td><%=session.getAttribute("uname")%></td>
   </tr>
   <tr>
    <td>email:</td>
    <td><%out.print(email); %></td>
   </tr>
   <tr>
    <td>date:</td>
    <td><%
    out.print(date);
    %></td>
   </tr>
   <tr>
    <td>web account balance:</td>
    <td><%out.print(web_balance); %></td>
   </tr>
</table>
</center>
<center><h4><font color = "red", size = 4>laptop group :</font></h4></center>
<%
String sql5 = "SELECT * from laptopgroup where name='"+name+"'";
try {
	   Class.forName(DBDRIVER);
	   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
	   pstmt = conn.prepareStatement(sql5); 
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
	    //out.print("<center>contribution:"+rs.getInt(2)+"</center>");
	    out.print("<center>points:"+rs.getInt(3)+"</center>");
	    if(rs.getInt(4)==1){
	    out.print("<center>level:leader</center>");}
	    else{
	    out.print("<center>level:member</center>");}}
	    else{out.print("<center>Not a member of laptop group!</center>");}
	   rs.close();
	   pstmt.close();
	   conn.close();

	}catch (Exception e) {
	   out.println(e);
	}
%>
<center><h4><font color = "red", size = 4>restaurant group :</font></h4></center>
<%
String sql6 = "SELECT * from restaurantgroup where name='"+name+"'";
try {
	   Class.forName(DBDRIVER);
	   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
	   pstmt = conn.prepareStatement(sql6); 
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
	    //out.print("<center>contribution:"+rs.getInt(2)+"</center>");
	    out.print("<center>points:"+rs.getInt(3)+"</center>");
	    if(rs.getInt(4)==1){
	    out.print("<center>level:leader</center>");}
	    else{
	    out.print("<center>level:member</center>");}}
	    else{out.print("<center>Not a member of restaurant group!</center>");}
	   rs.close();
	   pstmt.close();
	   conn.close();

	}catch (Exception e) {
	   out.println(e);
	}
%>

<br>
<center><h4><font color = "red", size = 4>Credit card information:</font></h4></center>
<%

String sql2 = "SELECT * from creditinfo where cardholder='"+name+"'";
try {
	   Class.forName(DBDRIVER);
	   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
	   pstmt = conn.prepareStatement(sql2); 
	   rs = pstmt.executeQuery();
	   while(rs.next()) {
	    cardnumber = rs.getInt(2);
	    company = rs.getString(3);
	    address = rs.getString(4);
	    e_date = rs.getDate(5);
	    out.print("<center>Card number:"+cardnumber+"</center>");
	    out.print("<center>Process company:"+company+"</center>");
	    out.print("<center>Bill address:"+address+"</center>");
	    out.print("<center>Expire Date:"+e_date+"</center>");
%>
<center><a href="transferA.jsp?ty=0&cn=<%=cardnumber%>">Transfer money to web account</center></a>
<% 
		out.print("<br><br>");
	   } 

	   rs.close();
	   pstmt.close();
	   conn.close();

	}catch (Exception e) {
	   out.println(e);
	}
%>
<%
   if(request.getAttribute("err")!=null)
   {
%>
    <h4><font color="red"><%=request.getAttribute("err")%></font></h4>
<%
   }
%>
<center><a href="addCredit.jsp">Add a credit card</center></a>
<br>
<center><h4><font color = "red", size = 4>Bank account information:</font></h4></center>
<%

String sql3 = "SELECT * from bankinfo where name='"+name+"'";
try {
	   Class.forName(DBDRIVER);
	   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
	   pstmt = conn.prepareStatement(sql3); 
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
	    routing_n = rs.getInt(2);
	    account_n = rs.getInt(3);
	    bank = rs.getString(4);
	    b_balance = rs.getInt(5);
	    out.print("<center>routing number:"+routing_n+"</center>");
	    out.print("<center>account number:"+account_n+"</center>");
	    out.print("<center>bank:"+bank+"</center>");
	    out.print("<center>balance:"+b_balance+"</center>");
	    session.setAttribute("b_balance",Integer.toString(b_balance));
%>
<center><a href="transferA.jsp?ty=1">Transfer money to web account</center></a>
<%
	    out.print("<br><br>");
	   } 
	   else{
%>
<center><a href="addBank.jsp">Add a bank account</center></a>
<%
	   }

	   rs.close();
	   pstmt.close();
	   conn.close();

	}catch (Exception e) {
	   out.println(e);
	}
%>
<br><br>
<center><a href="/com.test/Login/loginsuccess.jsp">go back to main menu</center></a>
</body>
</html>
