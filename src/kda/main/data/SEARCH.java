package kda.main.data;

import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data 
public class SEARCH {

	private int curPage = 1;
	private String search = "1";
	private String keyword = "";
	private String check1 = "";	// 이름
	private String check2 = "on";	// 제목
	private String check3 = "";	// 내용
	private String check4 = "1";	// 공백
	private String check5 = "";	// 기간
	
	private String[] aryWord = null;

}
