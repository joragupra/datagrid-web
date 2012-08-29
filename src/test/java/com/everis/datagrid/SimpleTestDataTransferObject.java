package com.everis.datagrid;

public class SimpleTestDataTransferObject {
	
	private String fieldA;
	
	private String fieldB;
	
	public static final String DEFAULT_FIELD_A_VALUE = "valueA";
	
	public static final String DEFAULT_FIELD_B_VALUE = "valueB";
	
	public SimpleTestDataTransferObject(){
		this(DEFAULT_FIELD_A_VALUE, DEFAULT_FIELD_B_VALUE);
	}
	
	public SimpleTestDataTransferObject(String fieldA, String fieldB){
		this.fieldA = fieldA;
		this.fieldB = fieldB;
	}

	public String getFieldA() {
		return fieldA;
	}

	public void setFieldA(String fieldA) {
		this.fieldA = fieldA;
	}

	public String getFieldB() {
		return fieldB;
	}

	public void setFieldB(String fieldB) {
		this.fieldB = fieldB;
	}
	
	public String toJson(){
		StringBuffer sb = new StringBuffer("{");
		sb.append("\"fieldA\":");
		sb.append("\"");
		sb.append(this.fieldA);
		sb.append("\",\"fieldB\":");
		sb.append(this.fieldB);
		sb.append("\"}");
		return sb.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((fieldA == null) ? 0 : fieldA.hashCode());
		result = prime * result + ((fieldB == null) ? 0 : fieldB.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SimpleTestDataTransferObject other = (SimpleTestDataTransferObject) obj;
		if (fieldA == null) {
			if (other.fieldA != null)
				return false;
		} else if (!fieldA.equals(other.fieldA))
			return false;
		if (fieldB == null) {
			if (other.fieldB != null)
				return false;
		} else if (!fieldB.equals(other.fieldB))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "SimpleTestDataTransferObject [fieldA=" + fieldA + ", fieldB="
				+ fieldB + "]";
	}
}
