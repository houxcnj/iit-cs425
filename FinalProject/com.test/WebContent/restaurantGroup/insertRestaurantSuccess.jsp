<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<center>
<title><h1>Insert Restaurant success </h1></title>
<hr>
<br>
</center>
</head>
<body>
<%
if(session.getAttribute("restaurantName")!=null) {
   //user log in successfully
%>
   <center><h2>Success to insert restaurant: <font color="Purple" size=12><%=session.getAttribute("restaurantName")%></font>
   </h2></center>
<%
}
else {
   //未登录，提示用户登录
   response.setHeader("refresh","1;URL=restaurantList.jsp");
%>
    insert fail<br>
   want to jump, click here<a href="restaurantList.jsp"><font color="greed">click</font></a><br>

<%
}

%>
 <a style="color:green" href="restaurantList.jsp">go back to RestaurantList</a>
</body>
</html>