
<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.Date"%>
<%@ page import = "java.text.SimpleDateFormat"%>

   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rate the Review</title>
</head>
<body>

 <form action="startToRateView.jsp" method="post">
         Rate:<input type="text" name="rate" /><br />
         <input type="submit" value=" commit the review "/>
         </form>      
 <%
 
 session.setAttribute("id", session.getAttribute("id").toString());
 session.setAttribute("rate", session.getAttribute("rate").toString());
 session.setAttribute("madeByUser",session.getAttribute("madeByUser"));
 %>      



</body>
</html>