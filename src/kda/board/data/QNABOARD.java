package kda.board.data;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data
public class QNABOARD extends KdaAbstractDto {

	private int num;
	private int bbs_idx;
	private String bbs_user_id = "";
	private String bbs_pwd;
	private String bbs_subject;
	private String bbs_name;
	private String bbs_email;
	private String bbs_contents;
	private String bbs_date;
	private String bbs_del;
	private String bbs_pub = "1";
	private int bbs_view; 
	private String k_stature;
	private String k_weight;
	private String k_sex;
	private String k_age;
	private String k_activity;
	private String k_weightpercent; 
	private String k_sportsweek; 
	private String k_sportsminute;
	private String k_drinkweek; 
	private String k_drinkml; 
	private String k_weightmonth; 
	private String k_etc;
	private String k_replydate;
	private String k_reply;
	private String k_isreply;
	private String client_ip;
}
