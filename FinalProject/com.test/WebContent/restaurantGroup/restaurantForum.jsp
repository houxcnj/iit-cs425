<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.dao.EmpDao"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Restaurant review</title>
  </head>
  <body>
      <%
        EmpDao ed=new EmpDao();
        int pageSize=10;//每页显示的记录
        int totalpages=ed.getTotalPage(pageSize); //最大页数
        String currentPage=request.getParameter("pageIndex"); //获得当前的页数，即第几页
        if(currentPage==null){
        	currentPage="1";
        }
        int pageIndex=Integer.parseInt(currentPage);
        //添加逻辑判断，防止页数异常
        if(pageIndex<1){
        	pageIndex=1;
        }else if(pageIndex>totalpages){
        	pageIndex=totalpages;
        }
       List list= ed.getAllempByPage(pageSize,pageIndex);  //返回特定页数的数据
      %>
      <!-- 循环显示员工的数据 -->
       <table border="1">
          <tr>
             <td>id</td>
             <td>title</td>
             <td>madeByUser</td>
             <td>createDate</td>
             <td>restaurantName</td>
             <td>rate</td>
             
             
             
             
             
          </tr>
      <%
        Map map=null;
        for(int i=0;i<list.size();i++){
        	map=(Map)list.get(i);
       %> 
                 <tr>
                    <td><%=map.get("id")%></td>
                    <td><%=map.get("title") %></td>
                    <td><%=map.get("madeByUser") %></td>
                    <td><%=map.get("createDate")%></td>
                    <td><%=map.get("restaurantName")%></td>
                     <td><%=map.get("rate")%></td>
                    
                 </tr>
      <% }%>
    </table> 
         <a href="restaurantForum.jsp?pageIndex=1">FirstPage</a>&nbsp;
         <a href="restaurantForum.jsp?pageIndex=<%=pageIndex-1 %>">previous page</a>
         <a href="restaurantForum.jsp?pageIndex=<%=pageIndex+1 %>">next page</a>
         <a href="restaurantForum.jsp?pageIndex=<%=totalpages%>">last page</a>
         <br/>
         <p style="color:red">current page:<%=pageIndex%></p>
         
          <form action="restaurantForum.jsp" method="post">
         Restaurant：<input type="text" name="restaurantName" /><br />
         <input type="submit" value=" See Specifice RestaurantReview "/>
         </form>
         
         <% 
          String restaurantName = request.getParameter("restaurantName"); 
         
   if(!(restaurantName == null || "".equals(restaurantName) ))  
   {
    response.setHeader("refresh", "2; URL = specificRestaurantForum.jsp");  // 定时跳转
    session.setAttribute("restaurantName",restaurantName );  // 登录成功的用户名保存在 session 中
  %>
    <h3>operation success, after 2 seconds it will jump to specific restaurant review page</h3>
    <h3>if not jump <a href="specificRestaurantForum.jsp">click here</a></h3>
  <%
   }
   
  %>
    <a style="color:green" href="inputDetailReviewID.jsp">See review by input the ID</a>
    <br><br><br>
    <a style="color:green" href="insertRestaurantReview.jsp">Insert New RestaurantReview</a> 
             
       <% session.setAttribute("uname", session.getAttribute("uname"));%>
           <br>
        <a style="color:green" href="/com.test/Login/loginsuccess.jsp">go back to main page</a>
  </body>
</html>
