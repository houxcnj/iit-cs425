<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import = "java.sql.*"%>
<html>
<head>
<center>
<h1>Transfer Money to Web Account</h1>
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
String value1 = request.getParameter("value");
int value = Integer.parseInt(value1);
String web_balance1 = (String)session.getAttribute("web_balance");
int web_balance = Integer.parseInt(web_balance1);
int newBalance = web_balance + value;
String cc1 = (String)session.getAttribute("cc");
int cc = Integer.parseInt(cc1);
%>
<%
if(cc == 0){
String name = (String)session.getAttribute("uname");
//connect to database
String sql = "UPDATE webaccount SET balance="+newBalance+" WHERE username='"+name+"'";
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
out.print("<center>The tranfer has been processed successfully!</center>");
}
%>
<%
if(cc == 1){
	String bb1 = (String)session.getAttribute("b_balance");
	int bb = Integer.parseInt(bb1);
	String name = (String)session.getAttribute("uname");
	if(bb>=value){
		int newBalance2 = bb-value;
		String sql = "UPDATE webaccount SET balance="+newBalance+" WHERE username='"+name+"'";
		String sql2 = "UPDATE bankinfo SET balance="+newBalance2+" WHERE name='"+name+"'";
		try {
			   Class.forName(DBDRIVER);
			   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
			   PreparedStatement pstmt2 = conn.prepareStatement(sql);
			   pstmt2.executeUpdate(sql);

			   PreparedStatement pstmt3 = conn.prepareStatement(sql2);
			   pstmt3.executeUpdate(sql2);

			   pstmt2.close();
			   conn.close();

			}catch (Exception e) {
			   out.println(e);
			}
		out.print("<center>The tranfer has been processed successfully!</center>");
	}
}
%>
<center><a href="personInfo.jsp">back to personal information page</center></a>
</body>
</html>