<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import = "java.sql.*"%>
<html>
<head>
<center>
<h1>Add a credit card</h1>
<hr>
<br>
</center>
</head>
<body>
<center>
<form action="credit.jsp" method="post">
<table width="1">
   <tr>
    <td colspan="2">fill in credit card information</td>
   </tr>
   <tr>
    <td >Card Number:</td>
    <td><input type="text" name="number"></td>
   </tr>
   <tr>
    <td>Process Company:</td>
    <td><input type="text" name="company"></td>
   </tr>
   <tr>
    <td>Bill Address:</td>
    <td><input type="text" name="address"></td>
   </tr>
   <tr>
    <td>Expire Date:</td>
    <td><input type="text" name="date"></td>
   </tr>
   <tr>
    <td><input type="submit" value="add"></td>
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
</center>
</body>
</html>