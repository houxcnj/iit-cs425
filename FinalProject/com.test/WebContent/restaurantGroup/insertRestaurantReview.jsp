<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import = "java.util.Date"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<html>
<head>
<center>
<title><h1>Insert Restaurant Review form</h1></title>
<hr></center>
</head>
<body>
<form action="insertRestaurantReviewConf.jsp" method="post">
<table width="1">
   <tr>
    <td colspan="2">Insert Restaurant Review information</td>
   </tr>
   <tr>
    <td >title:</td>
    <td><input type="text" name="title"></td>
   </tr>
   <tr>
    <td>rate:</td>
    <td><input type="text" name="rate"></td>
   </tr>

    <tr>
    <td>restaurantName:</td>    
    <td><input type="text" name= "restaurantName"></td>
   </tr>
   <tr>
    <td>reviewContent:</td>    
    <td><input type="text" name= "reviewContent"></td>
   </tr>
 
   <tr>
    <td><input type="submit" value="submit"></td>
    <td><input type="reset" value="reset"></td>
   </tr>
</table>
</form>
<%
   if(request.getAttribute("err")!=null)
   {
%>
    <h4><font color="red"><%=request.getAttribute("err")%></font></h4>
<%
   }
%>
       <% session.setAttribute("uname", session.getAttribute("uname"));%>

</body>
</html>