<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.dao.EmpDao2"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.Date"%>
<%@ page import = "java.text.SimpleDateFormat"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Restaurant review</title>
  </head>
  
  
 <%!
String DBDRIVER = "oracle.jdbc.driver.OracleDriver";
String DBURL = "jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl";
String DBNAME = "xhou3";
String DBPASS = "walc0727";
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
ResultSet rs3 = null;
ResultSet rs4 = null;
%>
  
  <body>
      <%
        EmpDao2 ed=new EmpDao2();
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
             <td>ID</td>
             <td>restaurantName</td>
             <td>restaurantAddress</td>
             <td><a href="restaurantForum.jsp">See reviews</a></td> 
          </tr>
      <%
        Map map=null;
        for(int i=0;i<list.size();i++){
        	map=(Map)list.get(i);
       %> 
     
                 <tr>
                    <td><%=map.get("id") %></td>
                    <td><%=map.get("restaurantName") %></td>
                    <td><%=map.get("restaurantAddress") %></td>
                   <%String nameRestaurant = map.get("restaurantName").toString();  %> 
                                      
                 </tr>    
                 
      <% }
      
      
        String name = session.getAttribute("uname").toString();
        
       
        
        Class.forName(DBDRIVER);
        conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
        
          String sq = "INSERT INTO restaurantgroup (name,contribution,points,userlevel) VALUES ('" + name +"', 0 ,0 ,0)";
         String sq2 = "SELECT COUNT(name)  FROM restaurantgroup WHERE NAME  = '" + name+"'";
        
          
          PreparedStatement pstmt2 = conn.prepareStatement(sq2);
          ResultSet  rs =pstmt2.executeQuery(sq2); 
  	        rs.next();
  		   int countName = (rs.getInt("COUNT(name)"));
          
  		   if( countName == 0 )
  		   {
 	      PreparedStatement pstmt = conn.prepareStatement(sq);
 	      pstmt.executeUpdate(sq);
  		   }
      
      
      
      
      
      %>
    </table> 
         <!--  <a href="restaurantList.jsp?pageIndex=1">FirstPage</a>&nbsp;
         <a href="restaurantList.jsp?pageIndex=<%=pageIndex-1 %>">previous page</a>
         <a href="restaurantList.jsp?pageIndex=<%=pageIndex+1 %>">next page</a>
         <a href="restaurantList.jsp?pageIndex=<%=totalpages%>">last page</a>
         <br/>
         <p style="color:red">current page:<%=pageIndex%></p>
         -->
         <a style="color:green" href="insertRestaurant.jsp">Insert New Restaurant</a>
        
            <% session.setAttribute("uname", session.getAttribute("uname"));%>
            
             <br>
        <a style="color:green" href="/com.test/Login/loginsuccess.jsp">go back to main page</a>
         
  </body>
</html>
