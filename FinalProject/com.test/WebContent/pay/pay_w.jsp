<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import = "java.sql.*"%>
<html>
<head>
<title>pay with credit card</title>
</head>
<body>
<center><h2><font color="red" size=4>Congratulations! Your transaction has been processed successfully!</font>
   </h2></center>
   <%!
String DBDRIVER = "oracle.jdbc.driver.OracleDriver";
String DBURL = "jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl";
String DBNAME = "xhou3";
String DBPASS = "walc0727";
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String a,pay=null;
int b,fee,newBalance=0;
%>
<%
pay = (String)session.getAttribute("pay");
fee = Integer.parseInt(pay);
a = (String)session.getAttribute("web_balance");
b = Integer.parseInt(a);
newBalance = b - fee;
out.print("Now the balance of web account is:"+ Integer.toString(newBalance));
%>
<%
String name = (String)session.getAttribute("uname");
//connect to database
String sql = "UPDATE webaccount SET balance="+newBalance+" WHERE username='"+name+"'";



String sellerName = session.getAttribute("madeByUser").toString();
String sql7 = "SELECT BALANCE FROM WEBACCOUNT WHERE USERNAME= '" + sellerName+"'";


String sq3 = "SELECT points FROM laptopgroup WHERE NAME = '" + name+"'";
String sq4 = "SELECT NUMPOINT FROM groupinfo WHERE G_NAME = 'Laptop'" ;


try {
   Class.forName(DBDRIVER);
   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);

   PreparedStatement pstmt2 = conn.prepareStatement(sql);
   pstmt2.executeUpdate(sql);

   PreparedStatement pstmt3 = conn.prepareStatement(sq3);
   PreparedStatement pstmt4 = conn.prepareStatement(sq4);
   
    ResultSet rs3 = pstmt3.executeQuery(sq3);
    rs3.next();
    int points = (rs3.getInt("points"));
   
   ResultSet rs4 = pstmt4.executeQuery(sq4);
   
   int numpoint = 0;
   
   
   if (rs4.next())
   {
	 
	   numpoint = (rs4.getInt("numpoint"));
	 }
   
   int newPoint = numpoint + points;
  
   String sq5 = "UPDATE laptopgroup SET points  = " + newPoint + " WHERE NAME = '" +  name+"'";
   PreparedStatement pstmt5 = conn.prepareStatement(sq5);
   pstmt5.executeUpdate(sq5);
   
   
   
   PreparedStatement pstmt7 = conn.prepareStatement(sql7);
   
   ResultSet rs7 = pstmt7.executeQuery(sql7);
   rs7.next();
   int balanceOfSeller = (rs7.getInt("balance"));
   int newBalanceOfSeller = balanceOfSeller + fee;
   System.out.print("xxxxxxxxxxxxxxxxxxxxxxxx");
   System.out.print(sellerName);
   String sql8 = "UPDATE webaccount SET balance="+newBalanceOfSeller+" WHERE username='"+sellerName+"'";
   PreparedStatement pstmt8 = conn.prepareStatement(sql8);
   pstmt8.executeUpdate(sql8);
   
   pstmt2.close();
   conn.close();

}catch (Exception e) {
   out.println(e);
}
%>

<center><a href="/com.test/Login/loginsuccess.jsp">back to main page</center></a>
</body>
</html>