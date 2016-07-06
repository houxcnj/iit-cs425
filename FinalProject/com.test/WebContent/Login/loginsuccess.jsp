<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<center>
<titl><h1>JDBC+JSP discussion forum</h1></title>
<hr>
<br>
</center>
</head>
<body>
<%
if(session.getAttribute("uname")!=null) {
   //user log in successfully
%>
   <center><h2>welcome<font color="red" size=12><%=session.getAttribute("uname")%></font>log in system
   </h2></center>
<%
}
else {
   //haven't logged in
   response.setHeader("refresh","2;URL=login.jsp");
%>
   You haven't log in, jump to login page after 2 seconds<br>
   if not jump<a href="login.jsp"><font color="greed">click</font></a>here to login£¡<br>

<%
}

%>

<br>
<center><a href="/com.test/personalinfo/personInfo.jsp">personal information</center></a>
<center><a href="/com.test/group/group.jsp">Interest group</center>
<%!
String DBDRIVER = "oracle.jdbc.driver.OracleDriver";
String DBURL = "jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl";
String DBNAME = "xhou3";
String DBPASS = "walc0727";
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
int level_flag = 0;

//int group_l = 0;
%>
<%
String name = (String)session.getAttribute("uname");
String sql1 = "SELECT userlevel from membership where name='"+name+"'";
try {
	   Class.forName(DBDRIVER);
	   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
	   pstmt = conn.prepareStatement(sql1); 
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
		if(rs.getInt(1)==2){
%>
<center><a href="/com.test/authorize/chooseAuGroup.jsp">authorize leader</center></a>
<%
		}
	   } else {
	    request.setAttribute("err","username or password wrong!");
	   }

	   rs.close();
	   pstmt.close();
	   conn.close();

	}catch (Exception e) {
	   out.println(e);
	}
%>
<%

String sql2 = "SELECT userlevel from laptopgroup where name='"+name+"'";
String sql3 = "SELECT userlevel from restaurantgroup where name='"+name+"'";
session.setAttribute("group_l","0");
session.setAttribute("group_r","0");
try {
	   Class.forName(DBDRIVER);
	   conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
	   pstmt = conn.prepareStatement(sql2); 
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
		if(rs.getInt(1)==1){
		level_flag = 1;
		session.setAttribute("group_l", "1");
		}
	   } 
	   pstmt = conn.prepareStatement(sql3); 
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
		if(rs.getInt(1)==1){
		level_flag = 1;
		session.setAttribute("group_r", "1");
		}
	   } 

	   rs.close();
	   pstmt.close();
	   conn.close();
	   if(level_flag ==1){
%>
<center><a href="/com.test/leadercontrol/grade.jsp"> leader control panel</center></a>
<% 
	   }
	   }

	catch (Exception e) {
	   out.println(e);
	}

%>
<br><br><br>
<center><a href="/com.test/display/displayleader.jsp"> display the leaders</center></a>
<center><a href="/com.test/ranking/rankingLap.jsp"> display the laptop ranking</center></a>
<center><a href="/com.test/ranking/rankingRest.jsp"> display the restaurant ranking</center></a>
<center><a href="/com.test/display/displayusers.jsp"> display the users who do not have finantial information in some group</center></a>
</body>
</html>