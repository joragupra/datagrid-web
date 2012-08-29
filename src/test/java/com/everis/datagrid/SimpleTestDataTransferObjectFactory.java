package com.everis.datagrid;

public class SimpleTestDataTransferObjectFactory {
	
	public static SimpleTestDataTransferObject getDefaultSimpleTestDTO(){
		return new SimpleTestDataTransferObject();
	}
	
	public static SimpleTestDataTransferObject getParametrizedSimpleTestDTO(String valueForA, String valueForB){
		return new SimpleTestDataTransferObject(valueForA, valueForA);
	}
}
