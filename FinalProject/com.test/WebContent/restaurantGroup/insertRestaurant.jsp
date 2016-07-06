<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import = "java.util.Date"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<html>
<head>
<center>
<title><h1>Insert Restaurant form</h1></title>
<hr></center>
</head>
<body>
<form action="insertRestaurantConf.jsp" method="post">
<table width="1">
   <tr>
    <td colspan="2">Insert Restaurant information</td>
   </tr>
   <tr>
    <td >restaurantName:</td>
    <td><input type="text" name="restaurantName"></td>
   </tr>
   <tr>
    <td>restaurantAddress:</td>
    <td><input type="text" name="restaurantAddress"></td>
   </tr>
   <tr>
    <td>date:</td>
    <td><%
    SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
    out.print(sdf.format(new Date()));
    %></td>
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
</body>
</html>