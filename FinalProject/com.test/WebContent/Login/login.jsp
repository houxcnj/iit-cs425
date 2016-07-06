<%@ page contentType="text/html;charset=gb2312"%>
<html>
<head>
<center>
<titl><h1>discussion forum</h1></title>
<hr>
<br>

<form action="loginconf.jsp" method="post">
<table width="1">
   <tr>
    <td colspan="2">user login</td>
   </tr>
   <tr>
    <td >username:</td>
    <td><input type="text" name="id"></td>
   </tr>
   <tr>
    <td>password:</td>
    <td><input type="password" name="password"></td>
   </tr>
   <tr>
    <td><input type="submit" value="sign in"></td>
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
</head>
<body>
<center><a href="signup.jsp">sign up</center></a>
</body>
</html>