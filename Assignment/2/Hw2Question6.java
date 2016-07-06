/*
 * Xiaocheng Hou
 * A20309864
 * CS425 Spring 2015
 */


import java.sql.*;

import oracle.jdbc.pool.OracleDataSource;

import java.util.*;

public class Hw2Question6 {

	static int agemin,agemax;
	static int cost, age;
	static double discount, impact;
	
	public static void main(String[] args) throws SQLException{
		
		// user friendly interface
		System.out.println("Please input a minimum age you want to give discount.");
		Scanner input = new Scanner(System.in);
		agemin = input.nextInt();
		System.out.println("Please input a maxmium age you want to give discount(input 0 if you don't want to set the maximum age)");
		agemax = input.nextInt();
		System.out.println("Please input a discount (0-100% off) for this group.");
		discount = input.nextDouble();
		
		impact = 0; //declare variable to store the total money reduced

		// set the url and connect to our oracle database
		String jdbcURL="jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl";
		String user="xhou3";
		String pw="walc0727";

		Connection con;
		OracleDataSource ds=new OracleDataSource();
		ds.setURL(jdbcURL);
		con=ds.getConnection(user,pw);
		/* test
		PreparedStatement execStat = con.prepareStatement(
				"SLELCT cost SELECT cost, dob FROM Enrollment e, RecCenterMember r WHERE e.Member_ID=r.ID");*/
		// the sql statment output a table that has two attributes-age and cost.
		PreparedStatement execStat = con.prepareStatement(
				"SELECT trunc(months_between(sysdate,dob)/12) AS age, cost  FROM (Select dob,id from RECCENTERMEMBER) H, Enrollment e WHERE e.Member_ID = H.ID");
		
		ResultSet people = execStat.executeQuery();
		
		// iterate the result and calculate the total money reduced.
		while(people.next()) {
			
			age = people.getInt(1);
			cost = people.getInt(2);
			if (agemax==0 && agemin!=0) {
				if (age>agemin)
					impact += cost*discount/100;
			}
			else {
				if (age>agemin && age<agemax)
					impact += cost*discount/100;
			}
			
		}
		
		
		System.out.println("The total reducing of revenue is $" + impact +".");
		
		con.close();//to close the connection

	}

}




