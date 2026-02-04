package kda.utils;

import java.io.File;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

public class KdaStringUtil {

	public static boolean isEmpty(Object obj) {
		if( obj == null  )
			return true;
		return "".equals(obj.toString().trim());
	}
	
	public static String nullToString(Object obj){
		if( isEmpty(obj) ) {
			return "";
		} else {
			return obj.toString();
		}
	}
	
	public static int nullToInt(Object obj, int defaultVal) {
		String temp = nullToString(obj);
		int rtn = defaultVal;
		try {
			rtn = Integer.parseInt(temp);
		} catch(NumberFormatException ne) {System.out.println(ne.toString());}
		return rtn;
	}
	
	public static Calendar getCalendar() {
        Calendar calendar = Calendar.getInstance();
        calendar.roll(Calendar.HOUR, 9); // korean time
        return calendar;
    }
	
	public static String getTodayString() {
		return getFormatString("yyyyMMdd");
	}
	
	public static String getTodayString(String del) {
		return getFormatString("yyyy" + del + "MM" + del + "dd");
	}
	
	public static String getCurrentTime() {
		return getFormatString("HH:mm:ss");
	}
	
	public static String getCurrentHour() {
		return getFormatString("HH");
	}
	
	public static String getFormatString(String pattern) {
		return getFormatString(pattern, new java.util.Date()) ;
	}
	
	public static String convDate(String dateStr) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	
			return sdf.format(sdf.parse(dateStr));
		} catch(ParseException pe) {
			//pe.printStackTrace();
			return dateStr;
		}		
	}
	
	
	public static String convDate2(String dateStr) {
		String rtn = "";
		if( dateStr.length() >= 8 ) {
			rtn = dateStr.substring(0, 4) +"." + dateStr.subSequence(4, 6) + "." + dateStr.substring(6, 8);
		}
		return rtn;
	}
	
	public static String convertTimeKo(String time) {
		time = time.replaceAll(":", "");
		if( time.length() >= 4 ) {
			time = time.substring(0, 2) + "시" + time.substring(2, 4) + "분";
		}
		return time;
	}
	
	public static String reverseTimeKo(String time) {
		time = time.replaceAll("시", "");
		time = time.replaceAll("분", "");
		if( time.length() >= 4 ) {
			time = time.substring(0, 2) + ":" + time.substring(2, 4);
		}
		return time;
	}
	
	/**
	 *  주어진 날짜유형에 맞는 날짜자료 리턴 메소드
	 * (예) String datetime = DateTime.getFormatString("yyyy-MM-dd HH:mm:ss");
	 * 
	 * @param pattern 날짜유형 문자열.
	 * @param dtDate Date.
	 * @return 날짜자료 문자열.
	 */
	public static String getFormatString(String pattern, java.util.Date dtDate) {
		java.text.SimpleDateFormat oFormatter = new java.text.SimpleDateFormat (pattern, java.util.Locale.KOREA);
		return oFormatter.format(dtDate);
	}
	
	public static String addDate(int val) throws Exception {
		Calendar calendar = getCalendar();
		return addDate(new java.util.Date(), val);
	}

	public static String getFormatDayKo(int dateInt) {
		String dateStr = Integer.toString(dateInt);
		if( dateStr.length() == 8 ) {
			return getFormatDayKo(dateStr);
		} else {
			return dateStr;
		}
	}
	
	public static String getWeekDayKo(int dateInt) {
		String dateStr = Integer.toString(dateInt);
		if( dateStr.length() == 8 ) {
			return getWeekDayKo(dateStr);
		} else {
			return "";
		}
	}
	
	public static String getWeekDayKo(String dateStr) {
		try {
			String[] weekKo = {"", "일", "월","화","수","목","금","토"};
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
			Date date = formatter.parse(dateStr);

			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			
			int weekday = calendar.get(Calendar.DAY_OF_WEEK);
			return weekKo[weekday];
		} catch(ParseException pe) {
			return "";
		}
	}
	
	public static String getFormatDayKo(String dateStr) {
		String rtn = "";
		if( dateStr.length() >= 8 ) {
			rtn = dateStr.substring(0, 4) +"년 " + dateStr.subSequence(4, 6) + "월 " + dateStr.substring(6, 8) +"일";
		}
		return rtn;
	}
	
	/**
	 * 날짜형 문자열 연산
	 *  - 하루 증가
	 * 	예) addDate("20011201",1) => "20011202"
	 * 
	 *  - 하루 감소
	 *  예) addDate("20011201",-1) => "20011130"
	 */
	public static String addDate(String dateStr, int val) throws Exception {
		int field = Calendar.DAY_OF_YEAR;
		String thisFormat = "yyyyMMdd";
		String toFormat = "yyyyMMdd";

		SimpleDateFormat formatter = new SimpleDateFormat(thisFormat);
		Date date = formatter.parse(dateStr);

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.roll(field, val);

		date = calendar.getTime();

		formatter = new SimpleDateFormat(toFormat);

		return formatter.format(date);
	}
	
	
	
	public static String addDate(Date date, int val) throws Exception {
		int field = Calendar.DAY_OF_YEAR;
		Calendar calendar = getCalendar();
		calendar.setTime(date);
		calendar.roll(field, val);
		String dateFormat = "yyyyMMdd";
		
		SimpleDateFormat formatter = new SimpleDateFormat(dateFormat);
		
		formatter = new SimpleDateFormat(dateFormat);
		return formatter.format(calendar.getTime()); 
	}
	
	public static String getCurrentDateTimeAsString() {
		Calendar cd = new GregorianCalendar(Locale.KOREA);
		return getFormalYear(cd) + getFormalMonth(cd) + getFormalDay(cd)
				+ getFormalHour(cd) + getFormalMin(cd) + getFormalSec(cd);
	}
 
	/**
     * <p>
     * 현재 밀리초를 sss 형태로 리턴
     * </p>
     * @return 밀리초(sss)
     */
    public static String getCurrentMilliSecondAsString() {
        Calendar cd = new GregorianCalendar(Locale.KOREA);
        return getFormalMSec(cd);
    }
    
	/**
	 * <p>
	 * 년도 표시를 네자리로 형식화 한다.
	 * </p>
	 * 
	 * @param cd
	 *            년도를 포함하는 <strong>Calendar</strong> 오브젝트
	 * @return 네자리로 형식화된 년도
	 */
	private static String getFormalYear(Calendar cd) {
		return lpad(Integer.toString(cd.get(Calendar.YEAR)), 4);
	}

	/**
	 * <p>
	 * 월(Month) 표시를 두자리로 형식화 한다.
	 * </p>
	 * 
	 * @param cd
	 *            월을 포함하는 <strong>Calendar</strong> 오브젝트
	 * @return 두자리로 형식화된 월
	 */
	private static String getFormalMonth(Calendar cd) {
		return lpad(Integer.toString(cd.get(Calendar.MONTH) + 1), 2);
	}

	/**
	 * <p>
	 * 일(Day) 표시를 두자리로 형식화 한다.
	 * </p>
	 * 
	 * @param cd
	 *            일자를 포함하는 <strong>Calendar</strong> 오브젝트
	 * @return 두자리로 형식화된 일
	 */
	private static String getFormalDay(Calendar cd) {
		return lpad(Integer.toString(cd.get(Calendar.DAY_OF_MONTH)), 2);
	}

	/**
	 * <p>
	 * 시간(Hour) 표시를 두자리로 형식화 한다.
	 * </p>
	 * 
	 * @param cd
	 *            시간을 포함하는 <strong>Calendar</strong> 오브젝트
	 * @return 두자리로 형식화된 시간
	 */
	private static String getFormalHour(Calendar cd) {
		return lpad(Integer.toString(cd.get(Calendar.HOUR_OF_DAY)), 2);

	}

	/**
	 * <p>
	 * 분(Minute) 표시를 두자리로 형식화 한다.
	 * </p>
	 * 
	 * @param cd
	 *            분을 포함하는 <strong>Calendar</strong> 오브젝트
	 * @return 두자리로 형식화된 분
	 */
	private static String getFormalMin(Calendar cd) {
		return lpad(Integer.toString(cd.get(Calendar.MINUTE)), 2);
	}

	/**
	 * <p>
	 * 초(sec) 표시를 두자리로 형식화 한다.
	 * </p>
	 * 
	 * @param cd
	 *            초를 포함하는 <strong>Calendar</strong> 오브젝트
	 * @return 두자리로 형식화된 초
	 */
	private static String getFormalSec(Calendar cd) {
		return lpad(Integer.toString(cd.get(Calendar.SECOND)), 2);

	}

	/**
	 * <p>
	 * 밀리초(millisec) 표시를 세자리로 형식화 한다.
	 * </p>
	 * 
	 * @param cd
	 *            밀리초를 포함하는 <strong>Calendar</strong> 오브젝트
	 * @return 세자리로 형식화된 밀리초
	 */
	private static String getFormalMSec(Calendar cd) {
		return lpad(Integer.toString(cd.get(Calendar.MILLISECOND)), 3);

	}
	
	public static String dateToStr(Date date)  {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd a h:mm");
		return df.format(date);
	}
	
	public static String lpad(Object obj, int length) {
		String target = obj.toString();
		int targetLength = target.length();
		for(int i = targetLength; i < length; i++ ) {		
			target = "0" + target;
		}
		return target;
	}

	
	public static int getYear() {
		String today = getTodayString();
		return Integer.parseInt(today.substring(0, 4));
	}
	
	public static int getMonth() {
		String today = getTodayString();
		return Integer.parseInt(today.substring(4, 6));
	}
	
	public static int getDay() {
		String today = getTodayString();
		return Integer.parseInt(today.substring(6, 8));
	}
	
	public static String getExtension(String fileName) {
		int pos = 0;
		if( ( pos = fileName.indexOf(".")) < 0 ) {
			return "";
		} else {
			return fileName.substring(pos+1, fileName.length());
		}
	}
	
	public static String getFilePath(String fullPathFile) {
		int pos = 0;
		if( ( pos = fullPathFile.lastIndexOf(File.separator)) < 0 ) {
			return "";
		} else {
			return fullPathFile.substring(0, pos);
		}
	}
	
	// 기존 String Util Conversion
	public static String notag(String str) {
		str = nullToString(str).replaceAll("<", "<X-");
		return str;
	}
	
	public static String notag2(String str ) {
		str = nullToString(str).replaceAll("&lt;", "&lT;");
		str = str.replaceAll("<X-", "&lt;");
		return str;
	}
	
	public String lifetag(String str) {
		String tagTemp = "a font center p b i u h img t div strong !-- embed";
		String[] tagU = tagTemp.toUpperCase().split(" ");
		String[] tagl = tagTemp.toLowerCase().split(" ");
		for( int i = 0 ; i < tagU.length ; i++ ) {
			str = str.replaceAll( "<X-" + tagU[i], "<" + tagl[i] ); 
			str = str.replaceAll( "<X-" + tagl[i], "<" + tagl[i] ); 
			str = str.replaceAll( "<X-/" + tagU[i], "</" + tagl[i] ); 
			str = str.replaceAll( "<X-/" + tagl[i], "</" + tagl[i] ); 

		}
		return str;
	}
	
	
	public static boolean isZipFile(String fileName) {
		String ext = getExtension(fileName);
		String compareZip = "alz,ace,alx,arc,arj,b64,bh,bhx,bin,bz2,cab,ear,enc,gz,ha,hqx,ice,iso,jar,lcd,lha,mim,pak,rar,tar,tgz,uue,war,xxe,z,zip,zoo,001";
		return compareZip.contains(ext);
	}
	
	public static String uriPage(String full) {
		int lastIndexNum = full.lastIndexOf("/");
		return full.substring(lastIndexNum+1, full.length());
	}
 }
