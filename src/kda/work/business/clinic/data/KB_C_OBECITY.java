package kda.work.business.clinic.data;

import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data public class KB_C_OBECITY //비만도 평가
{
	private String kname;
	private int sex;
	private String sexKo;
	private int fage = 0;
	private double fhit = 0;
	private double fwit = 0;
	private double waist = 0;
	private double heap = 0;
	private double fat = 0;
	private double bloodph = 0;
	private double bloodpl = 0;
	private double bloodsb = 0;
	private double bloodsa = 0;
	private int action = 0;
	private int body = 0;
	private int disease = 0;
	
	private int gubun;
	private int fatGubun;
	private int bloodGubun;
	
	
	private double ll_weight; // 비만도
	private double lp_weight; // 표준체중 
	private double ll_protein; //단백질권장량
	private double l_energy; // 열량권장량
	
	private double ll_whr = 0;
	private String ls_weight; // 비만도 내용
	private String lss_whr = "";
	private String ls_whr; // 허리엉덩이둘레비
	
	private String ls_fat;
	private String ls_blood;
	private String ls_bloods; // 혈당
	
	private double l_basic;

	
	public void convertForm() {
		if( this.sex == 1 ) 
			sexKo = "남자";
		else 
			sexKo = "여자";
		
		if( fage >= 20) {
			gubun = 1;
		} else if( body == 6 ) {
			gubun = 2;
		} else {
			gubun = 1;
		}
		
		if( gubun== 2 ) {
			fatGubun = 3;
		} else if( gubun == 1 ) {
			fatGubun = 1;
		} 
		
		if( gubun == 2 ) {
			bloodGubun = 3;
		} else if( gubun == 1 ) {
			bloodGubun = 1;
		} 
		
	}
	
}
