package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class TblKDAColumn //?????? ì»¬ë?? ê²?????
{
	private int idx;   //??ë²?
	private String imagename;   //?´ë?¸ì?
	private String kda_title;   //??ëª?
	private String kda_column;   //ì»¬ë??
	private String kda_special;   //ì£¼ì???´ì??
	private String kda_nd;   //KDA ND
	private String kda_we;   //KDA WE
	private String kda_news;   //KDA?´ì??
	private String kda_board;   //KADê²?????
	private String kda_picture;   //KDAê²??¬ë¦¬
	private String regidate;   //ë§?ì§?ë§? ?????? - datetime
	private String tagchecked;   //???¬ì²´??
	private String title_contents;   //??ëª©ì»¨??ì¸?
}