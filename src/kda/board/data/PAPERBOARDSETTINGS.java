package kda.board.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class PAPERBOARDSETTINGS
{	
	private int 	bs_code = 0; //	코드
	private String 	bs_name 			= ""; //	게시판 이름
	private String 	bs_admin 			= ""; //	생성자
	private String 	bs_tableName 		= ""; //	Table Name
	private String 	bs_tableNameComments= ""; //	Comments
	private int 	bs_Comments;	 //	의견쓰기 표출 유무
	private int 	bs_pds; //	자료
	private int 	bs_Category; //	카테고리사용
	private String 	bs_CategoryType 	= ""; //	카테고리분류
	private int 	bs_ViewLevel; //	글보기 권한
	private int 	bs_WriteLevel; //	글쓰기 권한
	private int 	bs_ListLevel; //	목록보기권한
	private int 	bs_sTagLevel; //	제목에 테그권한
	private int 	bs_cTagLevel; //	내용에 테그권한
	private int 	bs_SubMenuIndex; //	서브 메뉴 인덱스
	private String 	bs_TopHtml 			= ""; //	TopHtml
	private String 	bs_bottomHtml		= ""; //	bottomHtml
	private String 	bs_topadd 			= ""; //	TopNav
	private String 	bs_toplink 			= ""; //	TopLink
	private int		bs_toptype; //	toptype
}