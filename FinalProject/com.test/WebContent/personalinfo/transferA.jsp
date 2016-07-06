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
<%
String c = (String)request.getParameter("ty");
int cc = Integer.parseInt(c);
out.print(cc);
session.setAttribute("cc", Integer.toString(cc));
%>
<form action="transfer.jsp" method="post">
<table width="1">
   <tr>
    <td colspan="2">fill in the value you want to transfer:</td>
   </tr>
   <tr>
    <td>value:</td>
    <td><input type="text" name="value"></td>
   </tr>
   <tr>
    <td><input type="submit" value="transfer"></td>
    <td><input type="reset" value="reset"></td>
   </tr>
</table>
</form>
</body>
</html>