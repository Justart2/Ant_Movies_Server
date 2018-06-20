package com.cn.ant.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cn.ant.entity.Movie;
import com.cn.ant.entity.UserEvaluate;
import com.cn.ant.service.interf.IMoviesInterface;
import com.cn.ant.service.interf.IUserEvaluateInterface;
import com.cn.ant.utils.DateUtils;
import com.google.gson.Gson;

@Controller
@RequestMapping("/movies")
public class MoviesController {
	@Resource
	IMoviesInterface movieInterf;
	@Resource
	IUserEvaluateInterface userEvaInterf;
	/**
	 * 为主页加载电影信息
	 * */
	@RequestMapping("/all_movies.do")
	public String getIndexMoviesInfo(HttpServletRequest request)throws Exception{
		/*查询喜欢率最高的10个电影信息*/
		List<Movie> likeList = movieInterf.getMostLikeMoviesInfo(10);
		request.setAttribute("movie_like_list", likeList);
		/*查询正在上映电影信息*/
		List<Movie> showingList = movieInterf.getShowingMoviesInfo(DateUtils.getCurrentDate());
		request.setAttribute("movie_showing_list", showingList);
		/*查询即将上映电影信息*/
		List<Movie> willShowList = movieInterf.getWillShowMoviesInfo(DateUtils.getCurrentDate());
		request.setAttribute("movie_willshow_list", willShowList);
		/*跳转主页*/
		return "index";
	}
	/**
	 * 加载电影信息(评价)
	 * */
	@RequestMapping("/movie_detail.do")
	public String getAMoviesDetailInfo(HttpServletRequest request)throws Exception{
		/*查询电影详细信息*/
		int movieId = Integer.parseInt(request.getParameter("movie_id"));
		Movie movieInfo = movieInterf.getAMoviesInfo(movieId);
		//System.out.println(movieInfo.getmName());
		request.setAttribute("movie_info", movieInfo);
		
		/*查询电影的评价*/
		List<UserEvaluate> movieEva = userEvaInterf.getMovieEvaluate(movieId);
		request.setAttribute("movie_evaluate", movieEva);
		//System.out.println(movieEva.get(0).getUser().getuName());
		return "movie_detail";
	}
	
	
	/**
	 * android加载正在上映电影信息
	 * */
	@RequestMapping("/now_movies_android.do")
	public void getNowMoviesInfoForAndroid(HttpServletRequest request,HttpServletResponse response)throws Exception{		
		/*查询正在上映电影信息*/
		response.setCharacterEncoding("utf-8");
		List<Movie> showingList = movieInterf.getShowingMoviesInfo(DateUtils.getCurrentDate());
		Gson gson=new Gson();
		String result=gson.toJson(showingList);
		//System.out.println(result);
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
		out.close();
	}
	
	/**
	 * android加载即将上映电影信息
	 * */
	@RequestMapping("/will_movies_android.do")
	public void getWillMoviesInfoForAndroid(HttpServletRequest request,HttpServletResponse response)throws Exception{
		/*查询即将上映电影信息*/
		List<Movie> willShowList = movieInterf.getWillShowMoviesInfo(DateUtils.getCurrentDate());
		Gson gson=new Gson();
		String result=gson.toJson(willShowList);
		//System.out.println(result);
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
		out.close();
	}
	
	
}
