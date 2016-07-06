/*
 * Xiaocheng Hou
 * A20309864
 * CS425 Spring 2015
 */

import java.sql.*;

import oracle.jdbc.pool.OracleDataSource;

public class Hw2Question7 {

	public static void main(String[] args) throws SQLException{
		
		// set the url and connect to our oracle database
		String jdbcURL="jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl";
		String user="xhou3";
		String pw="walc0727";

		Connection con;
		OracleDataSource ds=new OracleDataSource();
		ds.setURL(jdbcURL);
		con=ds.getConnection(user,pw);
		
		// update a new attribute to table instructor
		PreparedStatement execStat1 = con.prepareStatement("ALTER TABLE INSTRUCTOR ADD LastClassTaught CHAR(200)");
		
		execStat1.executeUpdate();
		/* test
		PreparedStatement execStat4 = con.prepareStatement("UPDATE INSTRUCTOR SET LastClassTaught = ? WHERE id = ?");
		execStat4.setString(1, "math");
		execStat4.setInt(2, 1);
		execStat4.executeUpdate();
		*/
		
		// get the new table and no data in lastclasstaught
		PreparedStatement execStat2 = con.prepareStatement("SELECT * FROM INSTRUCTOR");
		
		ResultSet instructors = execStat2.executeQuery();
		
		
		String title = "", season = "";
		
		// two loops to find the latest class each teacher taught
		while (instructors.next()) {
			int id = instructors.getInt(1);
			PreparedStatement execStat3 = con.prepareStatement("SELECT title, Instructor, season, year FROM Class c WHERE c.instructor = ? ORDER BY year DESC");
			
			execStat3.setInt(1, id);
			
			ResultSet titles = execStat3.executeQuery();
			
			int year = 0, maxYear = 0, s = 0, sMax = 0;
			String lastClass ="";
			
			while (titles.next()) {
				year = titles.getInt(4);
				title = titles.getString(1);
				season = titles.getString(3);
				//convert the season as string to int
				if (season.equalsIgnoreCase("SPRING    ")) //the original attribute has 10 char, so we have to use the same length for comparing
					s = 1;
				else if (season.equalsIgnoreCase("SUMMER    "))
					s = 2;
				else if (season.equalsIgnoreCase("FALL      "))
					s = 3;
				else
					s = 4;
				// find the latest one class or classes
				if (maxYear == year) {
					if (sMax < s) {
						sMax = s;
						lastClass = title;
					}
					else if (sMax == s)
						lastClass = lastClass +", "+ title;
					else {}
				}
				else if (maxYear < year) {
					maxYear = year;
					lastClass = title;
				}
				else {}
			}
			
			//after we find the last class, insert it to the instructor table.
			PreparedStatement execStat4 = con.prepareStatement("UPDATE INSTRUCTOR SET LastClassTaught = ? WHERE id = ?");
			execStat4.setString(1, lastClass);
			execStat4.setInt(2, id);
			execStat4.executeUpdate();
			
		}
		
		con.close();//to close the connection

	}

}
