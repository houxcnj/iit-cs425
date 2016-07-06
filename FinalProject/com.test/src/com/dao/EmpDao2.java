package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmpDao2 {
    private Connection conn=null;
    private PreparedStatement psmt=null;
    private ResultSet rs=null;
    /**
     * 获得数据库连接
     */
    private void openConn(){
		//首先定义下连接数据的URL、用户名、密码
		String url="jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl";
		String user="xhou3";
		String password="walc0727";
		 try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
	    	conn=DriverManager.getConnection(url,user,password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }
   
    /**
     *  获取第几页的数据
     */
    public List getAllempByPage(int pageSize,int pageIndex){
          List list =new ArrayList();
         // String sql="select * from (select rownum as r,t.* from " +
          		              //     "(select Restaurant.* from Restaurant ) t where  rownum<="+(pageSize*pageIndex)
          		                   //   +") where r>"+pageSize*(pageIndex-1);
          String sql = "SELECT * FROM Restaurant ORDER BY ID DESC";
           try {
			  psmt=conn.prepareStatement(sql);
			  rs=psmt.executeQuery();
			  while(rs.next()){
				  Map map=new HashMap();
				  map.put("id", rs.getString("id"));
				  map.put("restaurantName", rs.getString("restaurantName"));
				  map.put("restaurantAddress",rs.getString("restaurantAddress"));
				  list.add(map);
			  }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
    }
    /**
     *  获取员工的总数
     * 
     */
    public int countEmp(){
    	int count=0;
    	String sql="select count(*) from Restaurant";
    	openConn();
    	try {
			psmt=conn.prepareStatement(sql);
			rs=psmt.executeQuery();
			while(rs.next()){
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
    }
    /**
     *  根据每页显示的数量,得到总页数
     */  
    public int getTotalPage(int pageSize)
    {
    	int totalPage=countEmp();
    	return (totalPage%pageSize==0)?(totalPage/pageSize):(totalPage/pageSize+1);
    }
    
    
}
