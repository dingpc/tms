package com.dpc.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dpc.model.SysFile;
import com.dpc.util.JacksonUtil;

/** 
 * @author dingpc
 * @version 2016年3月4日
 */
@Controller
@RequestMapping("/sysfile")
public class SysFileController {
	private static Logger log = Logger.getLogger(SysFileController.class);
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)  
    @ResponseBody  
    public Object upload(HttpServletRequest request, HttpServletResponse response){  
		
        String responseStr = "";  
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;    
  
        Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();    
        // 文件保存路径  
        String ctxPath = request.getSession().getServletContext().getRealPath("/") + File.separator + "uploadFiles" + File.separator;   
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");  
//        String ymd = sdf.format(new Date());  
//        ctxPath += File.separator + ymd + File.separator;  
        // 创建文件夹  
        File file = new File(ctxPath);    
        if (!file.exists()) {    
            file.mkdirs();    
        }    
        log.debug("ctxPath:" + ctxPath);
        SysFile sysFile = new SysFile();
        for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
            MultipartFile mf = entity.getValue();
//            SysFile sysFile = new SysFile();
            String realName = mf.getOriginalFilename();
            String fileType = realName.substring(realName.lastIndexOf(".") + 1).toLowerCase();
            String saveName = UUID.randomUUID() + "." +fileType;
            long fileSize = mf.getSize();
            sysFile.setRealName(realName);
            sysFile.setSaveName(saveName);
            sysFile.setFileType(fileType);
            sysFile.setSavePath("uploadFiles");
            sysFile.setFileSize(fileSize);
            
            log.debug("saveName:" + realName);
//            log.debug("fileSize:" + fileSize);
            File uploadFile = new File(ctxPath + saveName);
            try {
                FileCopyUtils.copy(mf.getBytes(), uploadFile);  
                responseStr = JacksonUtil.objectToJackson(sysFile); 
//                responseStr = saveName; 
            } catch (IOException e) {  
                responseStr = "FAILURE";
                e.printStackTrace();  
                return "FAILURE";
            }    
        } 
        log.debug("responseStr:" + responseStr);
        return sysFile;  
    }  
}
