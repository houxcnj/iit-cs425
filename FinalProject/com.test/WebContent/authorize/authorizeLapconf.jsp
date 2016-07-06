<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import = "java.sql.*"%>
<html>
<head>
<center>
<titl><h1>JDBC+JSP discussion forum</h1></title>
<hr>
<br>
</center>
</head>
<body>
<%--
using jdbc to connect to oracle database
--%>
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
//receive parameter
String name = request.getParameter("id");
String action = request.getParameter("action");
int count = 0;
%>

<%
Class.forName(DBDRIVER);
conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
//connect to database
String sql = "SELECT userLevel from LaptopGroup where name=?";

PreparedStatement execStat1 = conn.prepareStatement("SELECT count(name) from Laptopgroup where userLevel = 1");
ResultSet result = execStat1.executeQuery();
while(result.next()) {
count = result.getInt(1);
}

if (count <= 2) {

try {
  
   pstmt = conn.prepareStatement(sql); 
   pstmt.setString(1,name);
   rs = pstmt.executeQuery();
   
   if(rs.next()) {
    if (action.equals("upgrade") && rs.getInt(1) == 0 && count <2) {
    	
    	PreparedStatement execStat = conn.prepareStatement("UPDATE LaptopGroup SET userLevel = 1 WHERE name = ? ");
		execStat.setString(1, name);
		execStat.executeUpdate();
		execStat.close();
		
    }
    else if (action.equals("degrade") && rs.getInt(1) == 1) {
    	PreparedStatement execStat = conn.prepareStatement("UPDATE LaptopGroup SET userLevel = 0 WHERE name = ? ");
		execStat.setString(1, name);
		execStat.executeUpdate();
		execStat.close();
    }
   } else {
    request.setAttribute("err","Please check username and his level!");
   %> 
    <jsp:forward page="authorizeLap.jsp"/>
    <% 
   }

   rs.close();
   pstmt.close();
   conn.close();

}catch (Exception e) {
   out.println(e);
}
%>
<jsp:forward page="chooseAuGroup.jsp" />
<%
}
else {
	request.setAttribute("err","The group already has two leaders!");
%>

<jsp:forward page="authorizeLap.jsp"/>
<%
}
%>

</body>
</html>

