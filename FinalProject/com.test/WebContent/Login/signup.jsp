<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import = "java.util.Date"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<html>
<head>
<center>
<titl><h1>sign up form</h1></title>
<hr></center>
</head>
<body>
<form action="signupconf.jsp" method="post">
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
    <td>email:</td>
    <td><input type="text" name="email"></td>
   </tr>
   <tr>
    <td>date:</td>
    <td><%
    SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
    out.print(sdf.format(new Date()));
    %></td>
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
</body>
</html>