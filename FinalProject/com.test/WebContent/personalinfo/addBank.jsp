<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import = "java.sql.*"%>
<html>
<head>
<center>
<h1>Add a bank account</h1>
<hr>
<br>
</center>
</head>
<body>
<center>
<form action="bank.jsp" method="post">
<table width="1">
   <tr>
    <td colspan="2">fill in bank account information</td>
   </tr>
   <tr>
    <td >Routing Number:</td>
    <td><input type="text" name="r_number"></td>
   </tr>
   <tr>
    <td>Account Number:</td>
    <td><input type="text" name="a_number"></td>
   </tr>
   <tr>
    <td>bank:</td>
    <td><input type="text" name="bank"></td>
   </tr>
   <tr>
    <td>balance:</td>
    <td><input type="text" name="balance"></td>
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