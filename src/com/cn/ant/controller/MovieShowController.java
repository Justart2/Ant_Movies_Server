package com.cn.ant.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cn.ant.entity.Movie;
import com.cn.ant.entity.MovieCity;
import com.cn.ant.entity.MovieShow;
import com.cn.ant.service.interf.IMovieCityInterface;
import com.cn.ant.service.interf.IMovieShowInterface;
import com.cn.ant.service.interf.IMoviesInterface;
import com.cn.ant.utils.DateUtils;
import com.google.gson.Gson;

@Controller
@RequestMapping("/movieshow")
public class MovieShowController {
	@Resource
	IMovieShowInterface movieShowInterf;
	@Resource
	IMovieCityInterface movieCityInterf;
	@Resource
	IMoviesInterface movieInterf;

	/**
	 * 加载电影的排期
	 * */
	@RequestMapping("/a-movie-show.do")
	public String loadAMovieShow(HttpServletRequest request) {
		/* 通过电影的id查询该电影的排期 */
		String movieId = request.getParameter("movie_id");
		/* 获取城市 */
		String cityId = request.getSession().getAttribute("city_id").toString();
		List<MovieShow> list = movieShowInterf.getAMovieShowInfo(Integer
				.parseInt(movieId));
		request.setAttribute("a_movie_show", list);
		System.out.println(list.size());
		return "a_movie_schedule";
	}

	/**
	 * 加载排期列表
	 * */
	@RequestMapping("/movie-show.do")
	public String loadMovieShow(HttpServletRequest request) {
		/* 获取城市 */
		String cityId = request.getSession().getAttribute("city_id").toString();
		/* 通过城市查询影城的列表 */
		List<MovieCity> movieCityList = movieCityInterf
				.getMovieCityByCity(cityId);
		System.out.println(movieCityList.size());
		request.setAttribute("moviecity_list", movieCityList);
		/* 查询正在热映电影的列表 */
		List<Movie> movieList = movieInterf.getShowingMoviesInfo(DateUtils
				.getCurrentDate());
		request.setAttribute("movie_list", movieList);
		System.out.println(movieList.size());

		/* 通过查询一个影城所有电影的排期 */
		List<MovieShow> aCityMovieShow = movieShowInterf.getACityMovieShowName(
				cityId, DateUtils.getCurrentDate(),
				DateUtils.getTommrrowDate(), movieCityList.get(0).getcName());
		request.setAttribute("a_city_moviec_show", aCityMovieShow);
		System.out.println(aCityMovieShow.size());

		return "movie_schedule";
	}

	/**
	 * 加载某城市各大影城所有电影的排期
	 * */
	@RequestMapping("/all-movie-show.do")
	public String loadAllMovieShow(HttpServletRequest request) {
		String array = request.getParameter("array");
		//System.out.println(array);
		request.setAttribute("array", array);
		/* 通过城市查询影城的列表 */
		String time1 = request.getParameter("time1");
		String time2 = request.getParameter("time2");
		String movieCityId = request.getParameter("movie_city_id");
		String movieId = request.getParameter("movie_id");
		String cityName = request.getSession().getAttribute("city_id").toString();
		// int i = Integer.parseInt(request.getParameter("movie_city_num"));
		/* 通过城市时间查询影城的列表 */
		if(time1 == null || time1.equals("")){
			time1 = DateUtils.getCurrentDate();
		}
		if(time2 == null || time2.equals("")){
			time2 = DateUtils.getTommrrowDate();
		}
		//System.out.println(time1+time2);
		List<MovieShow> movieCityList = movieShowInterf.getMovieCityName(
				cityName, time1, time2);
		request.setAttribute("moviecity_list", movieCityList);
		//System.out.println(movieCityList.size());
		
		if(movieCityId == null || movieCityId.equals("")){
			if(movieCityList.size() > 0){
				movieCityId = movieCityList.get(0).getMoviehall().getMovieCity().getcId() + "";
			}
			
		}
		//System.out.println(movieCityId);
		/* 通过时间、影城查询电影的列表 */
		List<MovieShow> movieList = movieShowInterf.getMovieShowName(cityName,
				time1, time2, movieCityId);
		request.setAttribute("movie_list", movieList);
		System.out.println(movieList.size());
		if(movieId == null || movieId.equals("")){
			if(movieList.size() > 0){
				movieId = movieList.get(0).getMovie().getmId() + "";
			}
		}
		/* 通过查询一个影城一个电影的排期 */
		List<MovieShow> aCityAMovieShow = movieShowInterf
				.getACityAMovieShow(cityName, time1, time2, movieCityId,
						movieId);
		request.setAttribute("a_city_a_movie_show", aCityAMovieShow);
		System.out.println(aCityAMovieShow.size());
		/* 通过查询一个影城所有电影的排期 */
		/*List<MovieShow> aCityMovieShow = movieShowInterf.getACityMovieShowName(
				cityName, time1, time2, movieCityName);
		request.setAttribute("a_city_moviec_show", aCityMovieShow);
		System.out.println(aCityMovieShow.size());*/

		
		return "movie_schedule";
	}
	@RequestMapping("/a-movie-show-android.do")
	public void aMovieShowAndroid(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		/* 通过城市查询影城的列表 */
		String time1 = DateUtils.getCurrentDate();
		String time2 = DateUtils.getTommrrowDate();
		String movieCityId = request.getParameter("movie_city_id");
		String city = request.getParameter("city_name");
		String movieId = request.getParameter("movie_id");
		System.out.println(movieCityId+" "+city+" "+movieId);
		List<MovieShow> list = movieShowInterf.getACityAMovieShow(city, time1, time2, movieCityId, movieId);
		System.out.println(list.size());
		Gson gson=new Gson();
		String result=gson.toJson(list);
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
		out.close();
	}
}
