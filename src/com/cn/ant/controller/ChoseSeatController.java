package com.cn.ant.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cn.ant.entity.MovieShow;
import com.cn.ant.service.interf.IMovieShowInterface;
@Controller
@RequestMapping("/userdo")
public class ChoseSeatController {
	@Resource
	IMovieShowInterface movieShowInterf;
	/**
	 * 用户选座
	 * */
	@RequestMapping("/chose_seat.do")
	public String choseSeat(HttpServletRequest request){
		String movieShowId = request.getParameter("movie_show_id");
		MovieShow movieShow = movieShowInterf.getAMovieShowById(Integer.parseInt(movieShowId));
		request.getSession().setAttribute("movie_show_for_seat", movieShow);
		
		return "movies_select_set";
	}
}
