package com.cn.ant.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cn.ant.utils.CloudInfSMSUtils;

@Controller
@RequestMapping("/other")
public class OtherController {
	@RequestMapping("/phone_check.do")
	public void getPhoneCode(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String phone = request.getParameter("phone_num");
		String result = CloudInfSMSUtils.sendSmsCode(phone);
		System.out.println(result);
		JSONObject jsonObject = new JSONObject(result);
		String s="";
		if(jsonObject.getInt("result")==0){
			//request.setAttribute("succeed", "发送验证码成功！请稍等~~");
			s="发送验证码成功！请稍等~~";
		}else{
			//request.setAttribute("error", "发送验证码失败！请稍后重试！");
			s="发送验证码失败！请稍后重试！";
		}
		response.setContentType("text/xml");
		response.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		out.write("<messages>");
		out.write("<message>");
		out.write(s);
		out.write("</message>");
		out.write("</messages>");
		out.flush();
		out.close();
	}
}
