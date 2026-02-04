package kda.utils;

public class KdaSecUtil {

	/**
	 * 파일 디렉토리 변조 체크 
	 * 
	 * @param path
	 * @return
	 */
	public static String checkPath(String path) {
		path = path.replaceAll("../", "");
		return path;
	}
}
