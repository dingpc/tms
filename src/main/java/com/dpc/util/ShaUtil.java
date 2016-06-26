package com.dpc.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @author dingpc
 * @version 2016年2月27日
 */
public class ShaUtil {

	public static String shaEncode(String inStr) {
		MessageDigest sha = null;
		try {
			sha = MessageDigest.getInstance("SHA");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
		StringBuffer hexValue = new StringBuffer();
		byte[] byteArray = null;
		try {
			byteArray = inStr.getBytes("UTF-8");
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
		byte[] md5Bytes = sha.digest(byteArray);
		for (int i = 0; i < md5Bytes.length; i++) {
			int val = ((int) md5Bytes[i]) & 0xff;
			if (val < 16) {
				hexValue.append("0");
			}
			hexValue.append(Integer.toHexString(val));
		}
		return hexValue.toString();
	}

	public static void main(String[] args) {
//		String str = new String("123456");
//        System.out.println("原始：" + str);
//        System.out.println("SHA后：" + shaEncode(str));
//        System.out.println("SHA后：" + UUID.randomUUID());
		System.out.println(9/10);
	}

}
