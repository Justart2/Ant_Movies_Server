package com.cn.ant.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cn.ant.entity.MovieCity;
import com.cn.ant.service.interf.IMovieCityInterface;
import com.google.gson.Gson;
@Controller
@RequestMapping("moviecity")
public class MovieCityController {
	@Resource
	IMovieCityInterface iMovieCityInterf;
	/**
	 * android加载即将上映电影信息
	 * */
	@RequestMapping("/movie_city_android.do")
	public void getWillMoviesInfoForAndroid(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String city = request.getParameter("city_name");
		System.out.println(city);
		List<MovieCity> list = iMovieCityInterf.getMovieCityByCity(city);
		Gson gson=new Gson();
		String result=gson.toJson(list);
		//System.out.println(result);
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
		out.close();
	}
}
