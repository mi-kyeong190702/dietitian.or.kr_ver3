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

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getCheck1() {
		return check1;
	}

	public void setCheck1(String check1) {
		this.check1 = check1;
	}

	public String getCheck2() {
		return check2;
	}

	public void setCheck2(String check2) {
		this.check2 = check2;
	}

	public String getCheck3() {
		return check3;
	}

	public void setCheck3(String check3) {
		this.check3 = check3;
	}

	public String getCheck4() {
		return check4;
	}

	public void setCheck4(String check4) {
		this.check4 = check4;
	}

	public String getCheck5() {
		return check5;
	}

	public void setCheck5(String check5) {
		this.check5 = check5;
	}

	public String[] getAryWord() {
		return aryWord;
	}

	public void setAryWord(String[] aryWord) {
		this.aryWord = aryWord;
	}

}
