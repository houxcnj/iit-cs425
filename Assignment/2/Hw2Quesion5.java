/*
 * Xiaocheng Hou
 * A20309864
 * CS425 Spring 2015
 */

import java.sql.*;
import java.io.*;
import java.util.*;
import oracle.jdbc.pool.OracleDataSource;


public class Hw2Quesion5 {
	
	
	static String address, phone; //declare variables that we want to output

	public static void main(String[] args) throws SQLException, IOException {
		
		// set the url and connect to our oracle database
		String jdbcURL="jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl";
		String user="xhou3";
		String pw="walc0727";

		Connection con;
		OracleDataSource ds=new OracleDataSource();
		ds.setURL(jdbcURL);
		con=ds.getConnection(user,pw);
		
		//ask user for first name or last name or id number
		
		//ask user to choose input id number or first and last name
		int choose;
		System.out.println("1.Input member ID");
		System.out.println("2.Input first name and last name");
		Scanner input = new Scanner(System.in);
		choose = input.nextInt();
		
		//if the user choose 1, do this
		if(choose==1){
		int chooseID;
		System.out.println("please input the member's ID:");
		
		chooseID=input.nextInt(); //get the member id
		
		// sql statement to choose family_id when the id is the number of user input
		PreparedStatement execStat = con.prepareStatement(
				"SELECT Family_ID FROM RecCenterMember WHERE id=?");
		
		execStat.setInt(1, chooseID);
		ResultSet result1 = execStat.executeQuery();
		
		// tell whether there is a result or not 
		boolean sen1=result1.next();
		if(!sen1){
			System.out.println("The person is not in database");
			}
		if(sen1) {
			
			int id = result1.getInt(1);
			
			PreparedStatement execStat1_2 = con.prepareStatement(
					"SELECT address,phone FROM FamilyPackage WHERE id=?");
			execStat1_2.setInt(1, id);
			ResultSet result1_2 = execStat1_2.executeQuery();
			
			//input the address and phone information when the member found without contact information
			boolean sen2=result1_2.next();
			if(!sen2){
				System.out.println("The contact information is not exist in database");
				System.out.println("Please insert the contact information");
				System.out.println("address:");
				String addInfo;
				BufferedReader strina=new BufferedReader(new InputStreamReader(System.in));
				addInfo=strina.readLine();
				System.out.println("phone(xxx-xxx-xxxx):");
				String phoneInfo;
				BufferedReader strinb=new BufferedReader(new InputStreamReader(System.in));
				phoneInfo=strinb.readLine();
				
				PreparedStatement statb = con.prepareStatement("INSERT INTO FamilyPackage VALUES (6, ? , ?)");
				statb.setString(1, addInfo);
				statb.setString(2, phoneInfo);
				statb.executeUpdate();
				System.out.println("The information has been inserted!");
			}
			if(sen2){
			address = result1_2.getString(1);
			phone=result1_2.getString(2);
			System.out.println(address +" " + phone);}
			}
		
		}
		
		// the same form as 1 above
		if(choose==2){
			String firsname;
			System.out.println("please input the First name:");
			BufferedReader strin3=new BufferedReader(new InputStreamReader(System.in));
			firsname=strin3.readLine();
			String lstname;
			System.out.println("please input the Last name:");
			BufferedReader strin4=new BufferedReader(new InputStreamReader(System.in));
			lstname=strin4.readLine();
			Statement stat2=con.createStatement();
			
			String query="SELECT Family_ID FROM RecCenterMember WHERE F_NAME='"+firsname+"' AND L_NAME='"+lstname+"'";
			ResultSet result2 = stat2.executeQuery(query);
			boolean sen3=result2.next();
			
			if(!sen3){System.out.println("The data is not in database");}
			if(sen3){
				int id=result2.getInt(1);
				PreparedStatement execStat2_2 = con.prepareStatement(
						"SELECT address,phone FROM FamilyPackage WHERE id=?");
				execStat2_2.setInt(1, id);
				ResultSet result2_2 = execStat2_2.executeQuery();
				boolean sen4;
				sen4=result2_2.next();
				
				//input the address and phone information when the member found without contact information
				if(!sen4){
					System.out.println("The contact information is not in database");
					System.out.println("Please insert the contact information");
					System.out.println("address:");
					String addInfo;
					BufferedReader strina=new BufferedReader(new InputStreamReader(System.in));
					addInfo=strina.readLine();
					System.out.println("phone:");
					String phoneInfo;
					BufferedReader strinb=new BufferedReader(new InputStreamReader(System.in));
					phoneInfo=strinb.readLine();
					
					PreparedStatement statb = con.prepareStatement("INSERT INTO FamilyPackage VALUES (6, ? , ?)");
					statb.setString(1, addInfo);
					statb.setString(2, phoneInfo);
					statb.executeUpdate();
					
					System.out.println("The information has been inserted!");
				}
				if(sen4){
					address = result2_2.getString(1);
					phone=result2_2.getString(2);
				}
				
				boolean sen5;
				sen5=result2.next();
				if(sen5){System.out.println("There are several people with same name");}
				if(!sen5){System.out.println(address +" " + phone);}
			}
		}
		con.close();//to close the connection

	}

}
