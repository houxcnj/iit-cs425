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
<form action="insertLaptopCommentConf.jsp" method="post">
<table width="1">
   <tr>
    <td colspan="2">Insert LapTop comment information</td>
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
    <td>brand:</td>
    <td><input type="text" name="brand"></td>
   </tr>

<tr>
    <td>category:</td>
    <td><input type="text" name="category"></td>
   </tr>


    <tr>
    <td>laptopname:</td>    
    <td><input type="text" name= "laptopname"></td>
   </tr>
   
   
  
   <tr>
    <td>reviewContent:</td>    
    <td><input type="text" name= "reviewContent"></td>
   </tr>
  <tr>
    <td>price:</td>    
    <td><input type="text" name= "price"></td>
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