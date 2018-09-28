package com.tz.web.action;

import java.io.File;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
@Controller("uploadAction")
@Scope("prototype")
public class uploadAction extends ActionSupport{

	private File upload;
	//获取文件的名称
	private String uploadFileName;
	//获取类型
	private String uploadContentType;
	
	@Override
	public String execute() throws Exception {
		System.out.println("文件名"+uploadFileName+"文件类型："+uploadContentType);
		upload.renameTo(new File("E:/ImageList/test.jpg"));
		return "upload";
	}


	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

}
