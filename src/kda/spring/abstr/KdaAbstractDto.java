package kda.spring.abstr;

import kda.values.CRUDValue;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class KdaAbstractDto {

	private CRUDValue crud;

	public CRUDValue getCrud() {
		return crud;
	}

	public void setCrud(CRUDValue crud) {
		this.crud = crud;
	}

}
