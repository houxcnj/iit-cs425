<%@page contentType="text/html;charset=gb2312"%>
<%@page import="java.sql.*"%>
<!-- >%@page import="oracle.jdbc.pool.OracleDataSource"%-->

<HTML>
<BODY>


<hr align="center" width="55%" color="#991111" size="5"/>

<%
Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

Class.forName("oracle.jdbc.driver.OracleDriver");

request.setCharacterEncoding("GBK");


    String url="jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl";
    conn=DriverManager.getConnection(url,"ywang307","YCsBUo3...uK3Y");
    stmt=conn.prepareStatement("select * from CLASS");
    
rs=stmt.executeQuery();

while(rs.next()){
out.print("<TR><TD>"+rs.getString(2)+"</TD>");
}





rs.close();
stmt.close();
conn.close();
%>




</BODY></HTML>
