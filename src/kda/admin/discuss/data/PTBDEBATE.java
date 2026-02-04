package kda.admin.discuss.data;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data public class PTBDEBATE extends KdaAbstractDto{
	
	private int bateIndex;
	private String bateSubject;
	public int getBateIndex() {
		return bateIndex;
	}
	public void setBateIndex(int bateIndex) {
		this.bateIndex = bateIndex;
	}
	public String getBateSubject() {
		return bateSubject;
	}
	public void setBateSubject(String bateSubject) {
		this.bateSubject = bateSubject;
	}
	public String getBateDate() {
		return bateDate;
	}
	public void setBateDate(String bateDate) {
		this.bateDate = bateDate;
	}
	private String bateDate;

}
