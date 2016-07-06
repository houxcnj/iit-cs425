<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import = "java.sql.*"%>
<html>
<head>
<title>pay with bank account</title>
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
String pay,name=null;
int bank_b,fee,newBalance=0;
boolean flag = false; 
%>

<%
pay = (String)session.getAttribute("pay");
fee = Integer.parseInt(pay);
name = (String)session.getAttribute("uname");
String sql1 = "SELECT balance from bankinfo where name='"+name+"'";

try {
   Class.forName(DBDRIVER);
   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
   pstmt = conn.prepareStatement(sql1); 
   rs = pstmt.executeQuery();
   if(rs.next()) {
    bank_b = rs.getInt(1);
    if(bank_b>=fee){
    	newBalance = bank_b-fee;
%>
<center><h2><font color="red" size=4>Congratulations! Your transaction has been processed successfully!</font>
   </h2></center>
<%
		out.print("Now the balance of web account is:"+ Integer.toString(newBalance));
		flag = true;
    }
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

<%
//String name = (String)session.getAttribute("uname");
//connect to database
if(flag = true){
String sql = "UPDATE bankinfo SET balance="+newBalance+" WHERE name='"+name+"'";
try {
   Class.forName(DBDRIVER);
   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);

   PreparedStatement pstmt2 = conn.prepareStatement(sql);
   pstmt2.executeUpdate(sql);

   pstmt2.close();
   conn.close();

}catch (Exception e) {
   out.println(e);
}
%>
<center><a href="/com.test/Login/loginsuccess.jsp">back to main page</center></a>
<%
}else{
%>
<center><a href="payment.jsp">back to payment page</center></a>
<%}
%>
</body>
</html>