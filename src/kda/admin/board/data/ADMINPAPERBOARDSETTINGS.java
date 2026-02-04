package kda.admin.board.data;

import org.springframework.stereotype.Component;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Component
@Getter
@Setter
@Data
public class ADMINPAPERBOARDSETTINGS extends KdaAbstractDto{

	private int bs_idx =0;
	private int bs_code =0;
	private String bs_name ="";
	private String bs_admin ="";
	private String bs_tableName ="";
	private String bs_tableNameComments ="";
	private int bs_Comments;
	private int bs_pds;
	private int bs_Category;
	private String bs_CategoryType ="";
	private int bs_ViewLevel;
	private int bs_WriteLevel;
	private int bs_ListLevel;
	private int bs_sTagLevel;
	private int bs_cTagLevel;
	private int bs_SubMenuIndex;
	private String bs_TopHtml ="";
	private String bs_bottomHtml ="";
	private String bs_topadd ="";
	private String bs_toplink ="";
	private int bs_toptype;
	
	
	
}
