package com.dpc.util;

import java.io.IOException;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

/** 
 * @author dingpc
 * @version 2016年3月10日
 */
public class JacksonUtil {

	public static String objectToJackson(Object object) {
		String result = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			result = mapper.writeValueAsString(object);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
//	public static void main(String[] args) {
//		System.out.println(objectToJackson(new SysFile()));
//	}
}
