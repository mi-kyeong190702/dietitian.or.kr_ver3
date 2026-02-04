package kda.utils;

import javax.servlet.http.HttpSession;

public class KdaSessionUtil {

	public String checkAdmin(HttpSession session) {
		
		System.out.println("CHeck");
		return "test";
	}
}
