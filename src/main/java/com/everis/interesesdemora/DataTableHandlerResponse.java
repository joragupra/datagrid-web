package com.everis.interesesdemora;

public class DataTableHandlerResponse {
	
	private int code;
	
	private String message;
	
	public static final int SUCCESSFUL_PROCESSING_CODE = 0;
	
	public static final String SUCCESSFUL_PROCESSING_MESSAGE = "Data processed successfully";
	
	public DataTableHandlerResponse(){
		this(SUCCESSFUL_PROCESSING_CODE, SUCCESSFUL_PROCESSING_MESSAGE);
	}
	
	public DataTableHandlerResponse(int code, String message){
		this.code = code;
		this.message = message;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "DataTableHandlerResponse [code=" + code + ", message="
				+ message + "]";
	}
}
