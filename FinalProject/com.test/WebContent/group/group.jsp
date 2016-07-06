<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<br><br><br><br><br><br>
 <a style="color:green" href="/com.test/restaurantGroup/restaurantList.jsp">Go to restaurant group </a> 
 <br><br><br><br><br><br>
 <a style="color:green" href="/com.test/lapTopGroup/lapTopCommnet.jsp">Go to LapTop group </a>  
 
   <% session.setAttribute("uname", session.getAttribute("uname"));%>


</body>
</html>