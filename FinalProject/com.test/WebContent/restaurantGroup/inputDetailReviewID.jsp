<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>see detail review </title>
</head>
<body>





 <form action="inputDetailReviewID.jsp" method="post">
         ID: <input type="text" name="id" /><br />
         <input type="submit" value=" See Detail RestaurantReview "/>
         </form>
         
         <% 
          String id = request.getParameter("id"); 
         session.setAttribute("id",id ); 
         
   if(!(id == null || "".equals(id) ))  
   {
    response.setHeader("refresh", "2; URL = DetailReviewPage.jsp");  // 定时跳转
    session.setAttribute("id",id );  // 登录成功的用户名保存在 session 中
  %>
    <h3>operation success, after 2 seconds it will jump to detail restaurant review page</h3>
    <h3>if not jump <a href="DetailReviewPage.jsp">click here</a></h3>
  <%
   }
   
  %>
</body>
</html>