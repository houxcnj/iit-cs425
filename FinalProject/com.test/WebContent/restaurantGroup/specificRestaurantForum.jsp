<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.dao.EmpDao3"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Restaurant review</title>
  </head>
  <body>
      <%
        EmpDao3 ed=new EmpDao3();
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
        
       String name =  session.getAttribute("restaurantName").toString();
     
      // List list= ed.getAllempByPage(pageSize,pageIndex ,name);  //返回特定页数的数据
        List list= ed.getAllempByPage(pageSize, name);
       
       
       %>
      <!-- 循环显示员工的数据 -->
       <table border="1">
          <tr>
             <td>title</td>
             <td>madeByUser</td>
             <td>createDate</td>
             <td>restaurantName</td>
             
             
          </tr>
      <%
        Map map=null;
        for(int i=0;i<list.size();i++){
        	map=(Map)list.get(i);
       %> 
       <%
          String nameTest  =  map.get("restaurantName").toString(); 
          System.out.print(nameTest);
       if (nameTest.equals(name) )
       {
       
       %>
       
       
                 <tr>
                    <td><%=map.get("title") %></td>
                    <td><%=map.get("madeByUser") %></td>
                    <td><%=map.get("createDate")%></td>
                    <td><%=map.get("restaurantName")%></td>
                 </tr>
          <%} %> 
          
         
          
                
                 
      <% }%>
      <!--  
    </table> 
         <a href="specificRestaurantForum.jsp?pageIndex=1">FirstPage</a>&nbsp;
         <a href="specificRestaurantForum.jsp?pageIndex=<%=pageIndex-1 %>">previous page</a>
         <a href="specificRestaurantForum.jsp?pageIndex=<%=pageIndex+1 %>">next page</a>
         <a href="specificRestaurantForum.jsp?pageIndex=<%=totalpages%>">last page</a>
         <br/>
         <p style="color:red">current page:<%=pageIndex%></p>
         
        -->
         
        
                
  </body>
</html>
