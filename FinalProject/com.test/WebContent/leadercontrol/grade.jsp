<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import = "java.sql.*"%>
<html>
<head>
<center>
<h1>parameter configuration</h1>
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
String group_ll=(String)session.getAttribute("group_l");
int group_l = Integer.parseInt(group_ll);
String group_rr=(String)session.getAttribute("group_r");
int group_r = Integer.parseInt(group_rr);
if(group_l ==1){
%>
<center><h4><font color = "red", size = 4>laptop group:</font></h4></center>
<form action="grade_action1.jsp" method="post">
<table width="1">
   <tr>
    <td colspan="2">Set the value of numPoint:</td>
   </tr>
   <tr>
    <td>value:</td>
    <td><input type="text" name="value1"></td>
   </tr>
   <tr>
    <td><input type="submit" value="change"></td>
   </tr>
</table>
</form>
<br>
<form action="set_threshold1.jsp" method="post">
<table width="1">
   <tr>
    <td colspan="2">Set the value of rating threshold:</td>
   </tr>
   <tr>
    <td>value:</td>
    <td><input type="text" name="value2"></td>
   </tr>
   <tr>
    <td><input type="submit" value="change"></td>
   </tr>
</table>
</form>
<br>
<center><h4>Eliminate member:(click to eliminate)</font></h4></center>
<%
int ratethreshold=0;
int count=0;
String member=null;
String sql1 = "SELECT ratethreshold from groupinfo where g_name = 'Laptop'";

Class.forName(DBDRIVER);
conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);

PreparedStatement pstmt2 = conn.prepareStatement(sql1);
pstmt2.executeUpdate(sql1);
rs = pstmt2.executeQuery();
if(rs.next()){
	ratethreshold = rs.getInt(1);
}
String sql2 = "SELECT COUNT(*),madebyuser from comments where rate < "+ratethreshold+" GROUP BY madebyuser";
PreparedStatement pstmt = conn.prepareStatement(sql2);
pstmt.executeUpdate(sql2);
rs = pstmt.executeQuery();
while(rs.next()){
	count = rs.getInt(1);
	member = rs.getString(2);
	if(count>=3){
%>
<center><a href="elimination.jsp?m=<%=member%>&fl=1"><%=member%></a></center>
<%
	}
}
rs.close();
pstmt.close(); pstmt2.close();
conn.close();
}
if(group_r ==1){
	%>
	<center><h4><font color = "red", size = 4>restaurant group:</font></h4></center>
	<form action="grade_action2.jsp" method="post">
	<table width="1">
	   <tr>
	    <td colspan="2">Set the value of numPoint:</td>
	   </tr>
	   <tr>
	    <td>value:</td>
	    <td><input type="text" name="value3"></td>
	   </tr>
	   <tr>
	    <td><input type="submit" value="change"></td>
	   </tr>
	</table>
	</form>
	<br>
	<form action="set_threshold2.jsp" method="post">
	<table width="1">
	   <tr>
	    <td colspan="2">Set the value of rating threshold:</td>
	   </tr>
	   <tr>
	    <td>value:</td>
	    <td><input type="text" name="value4"></td>
	   </tr>
	   <tr>
	    <td><input type="submit" value="change"></td>
	   </tr>
	</table>
	</form>
	<br>
<center><h4>Eliminate member:(click to eliminate)</font></h4></center>
	<%
	int ratethreshold=0;
	int count=0;
	String member=null;
	String sql1 = "SELECT ratethreshold from groupinfo where g_name = 'Restaurant'";

	Class.forName(DBDRIVER);
	conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);

	PreparedStatement pstmt2 = conn.prepareStatement(sql1);
	pstmt2.executeUpdate(sql1);
	rs = pstmt2.executeQuery();
	if(rs.next()){
		ratethreshold = rs.getInt(1);
	}
	String sql2 = "SELECT COUNT(*),madebyuser from review where rate < "+ratethreshold+" GROUP BY madebyuser";
	PreparedStatement pstmt = conn.prepareStatement(sql2);
	pstmt.executeUpdate(sql2);
	rs = pstmt.executeQuery();
	while(rs.next()){
		count = rs.getInt(1);
		member = rs.getString(2);
		if(count>=3){
	%>
	<center><a href="elimination.jsp?m=<%=member%>&fl=2"><%=member%></a></center>
	<%
		}
	}
	rs.close();
	pstmt.close(); pstmt2.close();
	conn.close();
	}
	%>
	<br><br>
	<center><a href="/com.test/ranking/achievementsetting.jsp">ranking information</center></a>
	<br>
<center><a href="/com.test/Login/loginsuccess.jsp">back to main page</center></a>
</body>
</html>