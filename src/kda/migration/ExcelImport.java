package kda.migration;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ExcelImport {

	public static void main(String[] args) throws Exception{
		
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection conn = DriverManager.getConnection("jdbc:sqlserver://210.127.56.232:14533;databaseName=kda_ver32", "kda_ver3", "ver3!2015");

		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT 1");
		while(rs.next()) {
			System.out.println(rs.getString(1));
		}
		rs.close();
		stmt.close();
		

		conn.close();
		
		
		
		BufferedReader br = null;
		String line = "";
		String cvsSplitBy = ",";
	 
		try {
			File csvFile = new File("c:\\app\\actual_status.csv");
			
			br = new BufferedReader(new InputStreamReader(new FileInputStream(csvFile),"euc-kr"));
			br.readLine();
			int i = 1;
			while ((line = br.readLine()) != null) {
	 
			        // use comma as separator
				String[] data = line.split(cvsSplitBy);
				
				System.out.println( "[max=" + i++ + ",lic_no= " + data[0] + " , pers_name=" + data[1] + "]");
	 
			}
	 
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	 
		
        
		/*
		 

테이블 - actul_status (kda_ver32)

 

컬럼 입력 값

code_seq - max 값

yyyy - 2015(현재 년도 고정값)
		 */
		
		// File file = new File("c:\\app\\actual_status.xlsx");

		
	}
	
	
}
