package com.cn.ant.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cn.ant.entity.UserEvaluate;
import com.cn.ant.service.interf.IUserEvaluateInterface;
import com.cn.ant.utils.DateUtils;
import com.google.gson.Gson;
@Controller
@RequestMapping("/evaluate")
public class UserEvaluateController {
	
	@Resource
	IUserEvaluateInterface userEvalInterf;
	/**
	 * 用户评价电影
	 * */
	@RequestMapping("/android_insert_evaluate.do")
	public void evaluateMovie(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("user_id");
		String movieId = request.getParameter("movie_id");
		/*String content = new String(request.getParameter("evaluate_info")
				.getBytes("iso-8859-1"), "utf-8");*/
		String content = request.getParameter("evaluate_info");
		Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(DateUtils
				.getCurrentDateTime());
		UserEvaluate userEva = new UserEvaluate();
		userEva.setmId(Integer.parseInt(movieId));
		userEva.setuId(Integer.parseInt(userId));
		userEva.seteInfo(content);
		userEva.seteTime(date);
		userEvalInterf.addMovieEvaluate(userEva);
		
	}
	
	/**
	 * android查询所有用户评价
	 * */
	@RequestMapping("/android_query_evaluate.do")
	public void queryEvaluateMovie(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String movieId = request.getParameter("movie_id");
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		List<UserEvaluate> list = userEvalInterf.getMovieEvaluate(Integer.parseInt(movieId));
		Gson gson = new Gson();
		String result = gson.toJson(list);
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
		out.close();
	}
	/**
	 * android查询一个用户所有评价
	 * */
	@RequestMapping("/user_query_evaluate.do")
	public void queryEvaluateUser(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("user_id");
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		List<UserEvaluate> list = userEvalInterf.getUserEvaluate(Integer.parseInt(userId));
		Gson gson = new Gson();
		String result = gson.toJson(list);
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
		out.close();
	}
	
	/**
	 * android删除用户评价
	 * */
	@RequestMapping("/user_evaluate_delete.do")
	public void deleteEvaluateUser(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String id = request.getParameter("evaluate_id");
		int result = userEvalInterf.deleteUserEvaluate(Integer.parseInt(id));
		PrintWriter out = response.getWriter();
		if(result==1){
			out.print("succeed");
			out.flush();
		}else{
			out.print("error");
			out.flush();
		}
		
		out.close();
	}
}
