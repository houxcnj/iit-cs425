<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.dao.EmpDao4"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.Date"%>
<%@ page import = "java.text.SimpleDateFormat"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>lapTop comment</title>
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
        EmpDao4 ed=new EmpDao4();
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
      <% }%>
    </table> 
       <!--  <a href="lapTopCommnet.jsp?pageIndex=1">FirstPage</a>&nbsp; 
         <a href="lapTopCommnet.jsp?pageIndex=<%=pageIndex-1 %>">previous page</a>
         <a href="lapTopCommnet.jsp?pageIndex=<%=pageIndex+1 %>">next page</a>
         <a href="lapTopCommnet.jsp?pageIndex=<%=totalpages%>">last page</a>
         <br/>
         <p style="color:red">current page:<%=pageIndex%></p>  --> 
         
          <form action="lapTopCommnet.jsp" method="post">
         Brand：<input type="text" name="brand" /><br />
         <input type="submit" value=" See Specifice lapTop Brand "/>
         </form>
         
         <% 
          String brand = request.getParameter("brand"); 
      
         String name = session.getAttribute("uname").toString();
         
         Class.forName(DBDRIVER);
         conn = DriverManager.getConnection(DBURL,DBNAME,DBPASS);
         
           String sq = "INSERT INTO laptopgroup (name,contribution,points,userlevel) VALUES ('" + name +"', 0 ,0 ,0)";
          String sq2 = "SELECT COUNT(name)  FROM laptopgroup WHERE NAME  = '" + name+"'";
         
           
           PreparedStatement pstmt2 = conn.prepareStatement(sq2);
           ResultSet  rs =pstmt2.executeQuery(sq2); 
   	        rs.next();
   		   int countName = (rs.getInt("COUNT(name)"));
           
   		   if( countName == 0 )
   		   {
  	      PreparedStatement pstmt = conn.prepareStatement(sq);
  	      pstmt.executeUpdate(sq);
   		   }
         
  
         
   if(!(brand == null || "".equals(brand) ))  
   {
    response.setHeader("refresh", "2; URL = specificLaptopBrand.jsp");  // 定时跳转
    session.setAttribute("brand",brand );  // 登录成功的用户名保存在 session 中
  %>
    <h3>operation success, after 2 seconds it will jump to specific laptop comment page</h3>
    <h3>if not jump <a href="specificLaptopBrand.jsp">click here</a></h3>
  <%
   }
   
  %>
    <a style="color:green" href="inputDetailCommentID.jsp">See detail comment by input the ID</a>
    <br><br><br>
    
    
    <a style="color:green" href="insertLaptopComment.jsp">Insert New Laptop Comment</a> 
             
       <% session.setAttribute("uname", session.getAttribute("uname"));%>
       <br>
        <a style="color:green" href="/com.test/Login/loginsuccess.jsp">go back to main page</a>
          
  </body>
</html>
