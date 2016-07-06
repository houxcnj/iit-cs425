<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import = "java.sql.*"%>
<html>
<head>
<center>
<h1>Make a payment</h1>
<hr>
<br>
</center>
</head>
<body>





<font color="green",size=4>The amount you need to pay:<%=session.getAttribute("pay") %></font>
<br><br>
<%!
String DBDRIVER = "oracle.jdbc.driver.OracleDriver";
String DBURL = "jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl";
String DBNAME = "xhou3";
String DBPASS = "walc0727";
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String name = null;
int web_balance = 0;
boolean flag = true;
String pay = null;
int fee = 0;
%>
<%
name = (String)session.getAttribute("uname");
String sql1 = "SELECT balance from webaccount where username='"+name+"'";

try {
   Class.forName(DBDRIVER);
   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
   pstmt = conn.prepareStatement(sql1); 
   rs = pstmt.executeQuery();
   if(rs.next()) {
    web_balance = rs.getInt(1);
    session.setAttribute("web_balance", Integer.toString(web_balance));
   } else {
    request.setAttribute("err","records not exist!");
   }

   rs.close();
   pstmt.close();
   conn.close();

}catch (Exception e) {
   out.println(e);
}
%>
<font color="green",size=4>The balance of your web account:<%out.print(web_balance); %></font>
<%
pay = (String)session.getAttribute("pay");
fee = Integer.parseInt(pay);
if(fee > web_balance){
	out.println("  balance is not enough!");
}
else{
%>
<center><a href="pay_w.jsp">pay with web account</center> </a>
<%}
%><br><hr><br>
Pay with credit card:<br>
<%
name = (String)session.getAttribute("uname");
String sql2 = "SELECT cardnumber from creditinfo where cardholder='"+name+"'";

try {
   Class.forName(DBDRIVER);
   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
   pstmt = conn.prepareStatement(sql2); 
   rs = pstmt.executeQuery();
   while(rs.next()) {
%>
<center><a href="pay_c.jsp"><%out.print(rs.getInt(1)); %></center><br></a>
<%
   } 

   rs.close();
   pstmt.close();
   conn.close();

}catch (Exception e) {
   out.println(e);
}
%>
<hr><br>
<center><a href="pay_b.jsp">pay with bank account</a></center> 
<%session.setAttribute("madeByUser",session.getAttribute("madeByUser")); %>
</body>
</html>