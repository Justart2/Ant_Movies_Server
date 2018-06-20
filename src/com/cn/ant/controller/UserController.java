package com.cn.ant.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.cn.ant.entity.UserEvaluate;
import com.cn.ant.service.interf.IUserEvaluateInterface;
import com.cn.ant.service.interf.IUserInterface;
import com.cn.ant.utils.DateUtils;
import com.cn.ant.utils.FileHelper;
import com.google.gson.Gson;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	IUserInterface userInterf;
	@Resource
	IUserEvaluateInterface userEvalInterf;

	/**
	 * 用户登录
	 * */
	@RequestMapping("/login.do")
	public void login(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		request.setCharacterEncoding("UTF-8");
		String userCoe = request.getParameter("user_code");
		String userPsw = request.getParameter("user_psw");
		User u = new User();
		u.setuMail(userCoe);
		u.setuPhone(userCoe);
		u.setuPsw(userPsw);
		User user = userInterf.login(u);
		if (user != null) {
			request.getSession().setAttribute("user_info", user);
		}
		request.getRequestDispatcher("/movies/all_movies.do").forward(request,
				response);
	}

	/**
	 * 用户注册
	 * */
	@RequestMapping("/register.do")
	public void register(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		// String userName = request.getParameter("user_nake");
		String userPsw = request.getParameter("user_password");
		String userSex = new String(request.getParameter("user_sex").getBytes(
				"iso-8859-1"), "UTF-8");
		String userEmail = request.getParameter("user_email");
		String userPhone = request.getParameter("user_phone");
		// System.out.println(userCode+userPsw);
		String userName = new String(request.getParameter("user_nake")
				.getBytes("iso-8859-1"), "utf-8");

		User u = new User();
		u.setuName(userName);
		u.setuPhone(userPhone);
		u.setuRank("普通用户");
		u.setuScore(0);
		u.setuPsw(userPsw);
		if (userSex.equals("先生")) {
			u.setuSex(1);
		} else {
			u.setuSex(0);
		}
		u.setuMail(userEmail);
		userInterf.register(u);
		request.getRequestDispatcher("/movies/all_movies.do").forward(request,
				response);
	}

	/**
	 * 用户退出登录
	 * */
	@RequestMapping("/login-out.do")
	public void loginOut(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.getSession().removeAttribute("user_info");
		request.getRequestDispatcher("/movies/all_movies.do").forward(request,
				response);
	}

	/**
	 * 用户选择城市
	 * */
	@RequestMapping("/chose-city.do")
	public void choseCity(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String cityName = new String(request.getParameter("city_id").getBytes(
				"iso-8859-1"), "utf-8");
		System.out.println(cityName);
		request.getSession().setAttribute("city_id", cityName);
		request.getRequestDispatcher("/movies/all_movies.do").forward(request,
				response);
	}

	/**
	 * 用户评价电影
	 * */
	@RequestMapping("/evaluate.do")
	public void evaluateMovie(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("user_id");
		String movieId = request.getParameter("movie_id");
		String content = new String(request.getParameter("evaluate_content")
				.getBytes("iso-8859-1"), "utf-8");
		request.setAttribute("movie_id", movieId);
		Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(DateUtils
				.getCurrentDateTime());
		System.out.println(date);
		UserEvaluate userEva = new UserEvaluate();
		userEva.setmId(Integer.parseInt(movieId));
		userEva.setuId(Integer.parseInt(userId));
		userEva.seteInfo(content);
		userEva.seteTime(date);
		userEvalInterf.addMovieEvaluate(userEva);
		request.getRequestDispatcher("/movies/movie_detail.do").forward(
				request, response);
	}

	/**
	 * android端用户登录
	 * */
	@RequestMapping("/android_login.do")
	public void androidLogin(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		String userCoe = request.getParameter("user_code");
		String userPsw = request.getParameter("user_psw");
		User u = new User();
		u.setuMail(userCoe);
		u.setuPhone(userCoe);
		u.setuPsw(userPsw);
		User user = userInterf.login(u);
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (user != null) {
			Gson gson = new Gson();
			String s = gson.toJson(user);
			System.out.println(s);
			out.print(s);
			out.flush();
		} else {
			out.print("error");
			out.flush();
		}
		out.close();

	}
	
	/**
	 * android端用户通过手机验证登录
	 * */
	@RequestMapping("/android_login_by_phone.do")
	public void androidLoginByPhone(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		String userCoe = request.getParameter("user_code");
		User u = new User();
		u.setuPhone(userCoe);
		User user = userInterf.loginByPhone(u);
		if(user==null){
			u.setuName("Ant"+userCoe);
			u.setuPsw("000000");//设置初始密码
			userInterf.register(u);
			user = userInterf.loginByPhone(u);
		}
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (user != null) {
			Gson gson = new Gson();
			String s = gson.toJson(user);
			out.print(s);
			out.flush();
		} else {
			out.print("error");
			out.flush();
		}
		out.close();

	}
	/**
	 * android端用户通过手机验证注册
	 * */
	@RequestMapping("/android_check_phone.do")
	public void androidCheckPhone(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		String userCoe = request.getParameter("user_code");
		User u = new User();
		u.setuPhone(userCoe);
		User user = userInterf.loginByPhone(u);
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (user != null) {
			out.print("false");
			out.flush();
		} else {
			out.print("true");
			out.flush();
		}
		out.close();

	}
	
	
	
		/**
		 * android端用户通过手机验证登录
		 * */
		@RequestMapping("/android_register_user.do")
		public void androidRegisterUser(HttpServletRequest request,
				HttpServletResponse response) throws Exception {

			request.setCharacterEncoding("UTF-8");
			String userCoe = request.getParameter("user_code");
			String userPsw = request.getParameter("user_psw");
		
			User u = new User();
			u.setuPhone(userCoe);
			u.setuPsw(userPsw);
			u.setuName("Ant"+userCoe);
			int result = userInterf.register(u);
				
			response.setHeader("Content-type", "text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			if (result == 1) {
				out.print("succeed");
				out.flush();
			} else {
				out.print("error");
				out.flush();
			}
			out.close();

		}

	/**
	 * android端修改用户信息
	 * */
	@RequestMapping("/android_change_user_info.do")
	public void androidChangeUserInfo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String userName = request.getParameter("user_name");
		String userPhone = request.getParameter("user_phone");
		String userEmail = request.getParameter("user_email");
		String userId = request.getParameter("user_id");
		User u = new User();
		u.setuId(Integer.parseInt(userId));
		u.setuName(userName);
		u.setuPhone(userPhone);
		u.setuMail(userEmail);
		userInterf.modifyUserMsg(u);
	}
	
	/**
	 * android修改用户头像
	 * */
	@RequestMapping("/modifyUserPhoto.do")
	private void modifyPhoto(@RequestParam("user_img")MultipartFile myfile,HttpServletRequest request,HttpServletResponse response) throws Exception{
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
	    int result = userInterf.updatePhoto(map);
	    PrintWriter out = response.getWriter();
		if (result > 0) {
			out.print(newFileName);
			out.flush();
		} else {
			out.print("error");
			out.flush();
		}
		out.close();
	}
	/**
	 * android第三方登录
	 * */
	@RequestMapping("/android_third_login.do")
	private void thridLogin(@RequestParam("user_img")MultipartFile myfile,HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		//imgFile
		String user_name=URLDecoder.decode(request.getParameter("user_name"), "utf-8");
		System.out.println(user_name);
		String user_third_part = request.getParameter("user_third_part");
		String pic_path=request.getServletContext().getInitParameter("pic_path");
		
		//查询用户是否第一次使用第三方登录
		User user = new User();
		user.setuThirdPart(user_third_part);
		User result = userInterf.loginByThirdPart(user);
		if(result==null){
			//图片名称的编码方式
		    String newFileName=FileHelper.generateFileName(myfile.getOriginalFilename());
		    //String newFileName=UUID.randomUUID()+myfile.getOriginalFilename().substring(myfile.getOriginalFilename().lastIndexOf("."));  
		    //下面这个方法可以实现文件上传到服务器 
		    //不懂的话可以查下spring   API
		    FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(pic_path, newFileName)); 
		    
		    user.setuName(user_name);
		    user.setuPicture(newFileName);
		    userInterf.register(user);
		    result = userInterf.loginByThirdPart(user);
		}
		
	    PrintWriter out = response.getWriter();
		if (result != null) {
			Gson gson = new Gson();
			String s = gson.toJson(result);
			out.print(s);
			out.flush();
		} else {
			out.print("error");
			out.flush();
		}
		out.close();
	}
	/**
	 * 修改用户密码
	 * */
	@RequestMapping("/modify_psw.do")
	private void modifyUserPasw(HttpServletRequest request,HttpServletResponse response){
		String id=request.getParameter("user_id");
		String newPasw=request.getParameter("user_new_psw");
		//System.out.println(newPasw);
		HashMap<String,String> map=new HashMap<String, String>();
		map.put("uPsw", newPasw);
		map.put("uId", id);
		int res=userInterf.updateUsetPasw(map);
		try {
			PrintWriter out = response.getWriter();
			if(res>0){
				out.print("succeed");
				out.flush();
			}else{
				out.print("error");
				out.flush();
			}
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	

}
