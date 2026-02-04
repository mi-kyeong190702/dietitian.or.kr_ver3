package kda.page;

public class KdaPage {
	
	public static String makePage(int total_cnt, int list_size, int page_size, int cp, String pagename) {

		int total_page = (total_cnt/list_size)+1;	// 총 페이지수 = 총게시물수/한페이지당 보여줄게시물수 + 1
		if( total_cnt%list_size==0 ) { // 나눠떨어지면 -1
			total_page--;
		}
		 
		int user_group = cp/page_size;	// 페이지그룹 = 현재페이지위치/페이지사이즈
		if( cp%page_size==0 ) {	// 
			user_group--;
		}

		StringBuffer sb = new StringBuffer();
		
		if( user_group!=0 ) {
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (user_group-1)*page_size+page_size;
			sb.append(temp);
			sb.append("'>&lt;&lt;</a>");
		}
		
		for( int i = (user_group*page_size)+1; i<=(user_group*page_size)+page_size; i++ ) {
			sb.append("&nbsp;&nbsp;<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;");
			if( i==total_page ) {
				break;
			}
		}
		
		int last_group = total_page/page_size;	// 마지막 그룹 = 총 페이지수/페이지사이즈 16/5
		if( total_page%page_size==0 ) {	// 나눠떨어질땐 -1
			last_group--;
		}
		if( user_group!=last_group ) {	// 마지막그룹이 아닐때만 링크를 생성
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (user_group+1)*page_size+1;
			sb.append(temp);
			sb.append("'>&gt;&gt;</a>");
		}
		
		return sb.toString();

	}

}
