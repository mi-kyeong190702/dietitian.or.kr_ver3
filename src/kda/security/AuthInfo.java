package kda.security;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;

import kda.WorkData;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class AuthInfo {
	
	private Log log = LogFactory.getLog(AuthInfo.class);
	
	private static AuthInfo obj = null;
	private static long lastModifyTime 	= 0;

	private static String fileName = WorkData.PROPERTIES + "authinfo.properties";

	/* -----------------------------------------------------------------------------------------
		getClauseInfo : PrivateInfo Static Object를 생성, 리턴하는 함수	
	----------------------------------------------------------------------------------------- */

	public static AuthInfo getAuthInfo () {
		if ( obj == null ) {
			obj = new AuthInfo ();
		}
		else {
			File file = new File ( fileName );
			if ( lastModifyTime != file.lastModified() ) {
				obj.readData ();
			}
		}
		return obj;
	}

	/* -----------------------------------------------------------------------------------------
		ClauseInfo : Contructor
	----------------------------------------------------------------------------------------- */

	private HashMap infos;
	public AuthInfo () 
	{
		infos = new HashMap ();
		readData ();
	}

	public void readData () {
		
		BufferedReader br = null;

		try {
			
			File file = new File ( fileName );
			br = new BufferedReader ( new FileReader ( file ) );

			infos.clear ();

			String line = null;
			while ( (line = br.readLine()) != null ) {
				line = line.trim();
				infos.put ( line , "Y" );
			}
			
			lastModifyTime = file.lastModified ();
		} catch (FileNotFoundException fe) {
			log.info("Exception : " + fe.toString());
		}
		catch ( Exception e  ) 
		{
			//e.printStackTrace ();
			log.info("Exception : " + e.toString());
		}finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}		
	}

	public String getInfo(String key)
	{
		return (String) infos.get ( key );
	}
}