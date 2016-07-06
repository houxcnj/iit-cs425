<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.dao.EmpDao5"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Specific Laptop Brand Commnet</title>
  </head>
  <body>
      <%
        EmpDao5 ed=new EmpDao5();
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
        
        String name =  session.getAttribute("brand").toString();
     
       List list= ed.getAllempByPage(pageSize,pageIndex);  
      //  List list= ed.getAllempByPage(pageSize);
       
       
       %>
      <!-- 循环显示员工的数据 -->
       <table border="1">
          <tr>
            <td>id</td>
             <td>title</td>
             <td>rate</td>
             <td>madeByUser</td>
             <td>brand</td>
             <td>category</td>
             <td>laptopName</td>
             <td>createDate</td>
             <td>reviewContent</td>
             <td>price</td>    
           </tr>
      <%
        Map map=null;
        for(int i=0;i<list.size();i++){
        	map=(Map)list.get(i);
       %> 
       <%
          String nameTest  =  map.get("brand").toString(); 
       if (nameTest.equals(name) )
       {
       
       %>
                 <tr>
                  <td><%=map.get("id")%></td>
                    <td><%=map.get("title") %></td>
                    <td><%=map.get("rate") %></td>
                    <td><%=map.get("madeByUser")%></td>
                    <td><%=map.get("brand")%></td>
                    <td><%=map.get("category")%></td>
                    <td><%=map.get("laptopName")%></td>
                    <td><%=map.get("createDate")%></td>
                    <td><%=map.get("reviewContent")%></td>
                    <td><%=map.get("price")%></td>
                 </tr>
          <%} %> 
          
         
          
                
                 
      <% }%>
    </table> 
         <a href="specificLaptopBrand.jsp?pageIndex=1">FirstPage</a>&nbsp;
         <a href="specificLaptopBrand.jsp?pageIndex=<%=pageIndex-1 %>">previous page</a>
         <a href="specificLaptopBrand.jsp?pageIndex=<%=pageIndex+1 %>">next page</a>
         <a href="specificLaptopBrand.jsp?pageIndex=<%=totalpages%>">last page</a>
         <br/>
         <p style="color:red">current page:<%=pageIndex%></p>
         
        
         
        
                
  </body>
</html>
