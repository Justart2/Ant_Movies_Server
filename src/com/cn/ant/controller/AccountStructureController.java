package com.cn.ant.controller;

import java.io.File;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cn.ant.entity.User;
import com.cn.ant.service.interf.IUserInterface;
import com.cn.ant.utils.FileHelper;

@Controller
@RequestMapping("/userAccount")
public class AccountStructureController {
	
	@Resource
	private IUserInterface userInterface;
	
	@RequestMapping("/modifyUserMsg.do")
	private String modifyUserMsg(HttpServletRequest request,User user) throws Exception{
		Integer id=Integer.parseInt(request.getParameter("user_id").toString());
		String name=new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
		String email=new String(request.getParameter("email").getBytes("iso-8859-1"),"utf-8");
		Integer sex=Integer.parseInt(request.getParameter("sex"));
		Integer birthday=Integer.parseInt(request.getParameter("birthday").toString());
		user.setuId(id);
		user.setuName(name);
		user.setuSex(sex);
		user.setuAge(birthday);
		user.setuMail(email);
		this.userInterface.modifyUserMsg(user);
		return "zhanghaoshezhi";
		
	}
	@RequestMapping("/modifyPasw.do")
	private String modifyUserPasw(HttpServletRequest request){
		String id=request.getParameter("id");
		String newPasw=request.getParameter("pasw");
		HashMap<String,String> map=new HashMap<String, String>();
		map.put("uPsw", newPasw);
		map.put("uId", id);
		int res=this.userInterface.updateUsetPasw(map);
		if(res>0){
			return "zhanghaoshezhi";
		}else{
			return "";
		}
	}
	/**
	 * 修改用户头像
	 * */
	@RequestMapping("/modifyUserPhoto.do")
	private void modifyPhoto(@RequestParam("imgFile") MultipartFile myfile,HttpServletRequest request,HttpServletResponse response) throws Exception{
		//imgFile
		String user_id=request.getParameter("user_id");
		String pic_path=request.getServletContext().getInitParameter("pic_path");
	    //图片名称的编码方式
	    String newFileName=FileHelper.generateFileName(myfile.getOriginalFilename());
	    //String newFileName=UUID.randomUUID()+myfile.getOriginalFilename().substring(myfile.getOriginalFilename().lastIndexOf("."));  
	    //下面这个方法可以实现文件上传到服务器 
	    //不懂的话可以查下spring   API
	    FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(pic_path, newFileName)); 
	    HashMap<String, String> map=new HashMap<String, String>();
	    map.put("uPicture", newFileName);
	    map.put("uId", user_id);
	    this.userInterface.updatePhoto(map);
	    User user = userInterface.getUserInfo(Integer.parseInt(user_id));
	    request.getSession().setAttribute("user_info", user);
	    request.getRequestDispatcher("/foreground/zhanghaoshezhi.jsp").forward(request, response);
	}
	
}
