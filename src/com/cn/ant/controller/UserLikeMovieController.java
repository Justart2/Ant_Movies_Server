package com.cn.ant.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cn.ant.entity.UserLikeMovie;
import com.cn.ant.service.impl.MoviesImpl;
import com.cn.ant.service.impl.UserImpl;
import com.cn.ant.service.impl.UserLikeMovieImpl;
import com.google.gson.Gson;

@Controller
@RequestMapping("/like")
public class UserLikeMovieController {
	@Resource
	UserLikeMovieImpl userLikeMovieImpl;
	@Resource
	MoviesImpl movieImpl;
	/**
	 * 用户喜欢某个电影
	 * */
	@RequestMapping("/insert_like.do")
	public void userLikeMovie(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String flag = "";
		
		String uId = request.getParameter("user_id");
		String mId = request.getParameter("movie_id");
		String ucState = request.getParameter("movie_like_state");
		UserLikeMovie userLike = new UserLikeMovie();
		userLike.setuId(Integer.parseInt(uId));
		userLike.setmId(Integer.parseInt(mId));
		int result = 0;
		if(ucState.equals("like")){
			userLike.setUcState(1);
			result = userLikeMovieImpl.doInsertLike(userLike);
			flag = "like";
			
		}else if(ucState.equals("dislike")){
			userLike.setUcState(-1);
			result = userLikeMovieImpl.doInsertLike(userLike);
			flag = "dislike";
		}else if(ucState.equals("delete")){
			result = userLikeMovieImpl.doDeleteLike(userLike);
			flag = "delete";
		}else{
			System.out.println("system error!");
			return;
		}
		int rate = userLikeMovieImpl.getLikeRate(Integer.parseInt(mId));
		movieImpl.updateMovieLikeRate(rate, Integer.parseInt(mId));
		PrintWriter out = response.getWriter();
		
		if(result==1){
			out.print(flag+"#"+rate);
			out.flush();
		}else{
			out.print("error");
			out.flush();
		}
		out.close();
	}
	
	/**
	 * 查询用户喜欢某个电影状态
	 * */
	@RequestMapping("/like_state.do")
	public void userLikeMovieState(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String uId = request.getParameter("user_id");
		String mId = request.getParameter("movie_id");
		UserLikeMovie userLike = new UserLikeMovie();
		userLike.setuId(Integer.parseInt(uId));
		userLike.setmId(Integer.parseInt(mId));
		UserLikeMovie result = userLikeMovieImpl.queryUserLikeMovieState(userLike);
		PrintWriter out = response.getWriter();
		
		if(result!=null){
			out.print(result.getUcState());
			out.flush();
		}else{
			out.print("null");
			out.flush();
		}
		out.close();
	}
	/**
	 * 查询用户喜欢某个电影状态
	 * */
	@RequestMapping("/query_like_movie.do")
	public void userLikeMovieList(HttpServletRequest request,HttpServletResponse response)throws Exception{
		request.setCharacterEncoding("UTF-8");
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		String uId = request.getParameter("user_id");
		List<UserLikeMovie> list = userLikeMovieImpl.queryLikeMovie(Integer.parseInt(uId));
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String result = gson.toJson(list);
		out.print(result);
		out.flush();
		out.close();
	}
	/**
	 * 删除用户喜欢某个电影状态
	 * */
	@RequestMapping("/delete_like_movie.do")
	public void deleteUserLikeMovie(HttpServletRequest request,HttpServletResponse response)throws Exception{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String ucId = request.getParameter("uc_id");
		String mId = request.getParameter("movie_id");
		int result = userLikeMovieImpl.deleteLikeItemById(Integer.parseInt(ucId));
		//修改电影喜欢率
		int rate = userLikeMovieImpl.getLikeRate(Integer.parseInt(mId));
		movieImpl.updateMovieLikeRate(rate, Integer.parseInt(mId));
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
