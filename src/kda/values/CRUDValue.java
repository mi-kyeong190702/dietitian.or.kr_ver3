package kda.values;

public enum CRUDValue {

	C("C"), R("R"), U("U"), D("D"), A("A");

	private String type;
	
	private CRUDValue(String type) {
		this.type = type;
	}
	
	public String getType() {
		return this.type;
	}
}
