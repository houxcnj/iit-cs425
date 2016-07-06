<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<center>
<title><h1>Insert Laptop Comment success </h1></title>
<hr>
<br>
</center>
</head>
<body>
<%
if(session.getAttribute("title")!=null) {
   
%>
   <center><h2>Success to insert lapTop comment : <font color="Purple" size=12><%=session.getAttribute("title")%></font>
   </h2></center>
<%
}
else {
   //未登录，提示用户登录
   response.setHeader("refresh","2;URL=lapTopCommnet.jsp");
%>
    insert fail<br>
   want to jump, click here<a href="lapTopCommnet.jsp"><font color="greed">click</font></a><br>

<%
}

%>
 <a style="color:green" href="lapTopCommnet.jsp">go back to Laptop comment</a>
</body>
</html>