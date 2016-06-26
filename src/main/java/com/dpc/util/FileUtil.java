package com.dpc.util;

import java.util.ArrayList;
import java.util.List;

import com.dpc.model.SysFile;

/** 
 * @author dingpc
 * @version 2016年3月14日
 */
public class FileUtil {

	public static List<SysFile> generateFile(String id, String realName, String saveName) {
		List<SysFile> list = new ArrayList<SysFile>();
		if(StringUtil.isNotEmpty(realName) && StringUtil.isNotEmpty(saveName)) {
			realName = realName.replaceAll("\\*\\*\\*\\*", "||||").replaceAll("\\*\\*", "");
			saveName = saveName.replaceAll("\\*\\*\\*\\*", "||||").replaceAll("\\*\\*", "");
			String[] realArr = realName.split("\\|\\|\\|\\|");
			String[] saveArr = saveName.split("\\|\\|\\|\\|");
			if(realArr.length == saveArr.length) {
				int length = realArr.length;
				for(int i = 0; i < length; i++) {
					SysFile file = new SysFile();
					file.setId(id);
					file.setRealName(realArr[i]);
					file.setSaveName(saveArr[i]);
					list.add(file);
				}
			}
		}
		return list;
	}
	/*
	public static void main(String[] args) {
		List<SysFile> list = generateFile("**A**", "**1**");
		for(SysFile file : list) {
			System.out.println(file.getRealName() + "--" + file.getSaveName());
		}
	}*/
}
