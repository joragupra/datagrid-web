package com.everis.datagrid;

import java.util.Collection;

public class JsonUtil {
	
	public static String toJson(Collection<SimpleTestDataTransferObject> dtos){
		StringBuffer sb = new StringBuffer("[");
		for(SimpleTestDataTransferObject dto : dtos) {
			if(!"[".equals(sb.toString())){
				sb.append(",");
			}
			sb.append(dto.toJson());
		}
		sb.append("]");
		return sb.toString();
	}
}
