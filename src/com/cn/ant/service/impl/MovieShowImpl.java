package com.cn.ant.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.ant.dao.MovieShowMapper;
import com.cn.ant.entity.MovieShow;
import com.cn.ant.service.interf.IMovieShowInterface;

@Service
public class MovieShowImpl implements IMovieShowInterface{
	@Resource
	MovieShowMapper movieShowMapper;
	/**
	 * 获取某一电影上映信息
	 * */
	@Override
	public List<MovieShow> getAMovieShowInfo(int id) {
		List<MovieShow> list  = movieShowMapper.selectByMovieId(id);
		return list;
	}
	/**
	 * 获取正在上映电影列表
	 * */
	@Override
	public List<MovieShow> getMovieShowName(String city,String nowtime,String secondtime,String name) {
		List<MovieShow> list = movieShowMapper.selectShowingMovieName(city,nowtime,secondtime,name);
		return list;
	}
	/**
	 * 获取电影上映影城列表
	 * */
	@Override
	public List<MovieShow> getMovieCityName(String city,String nowtime,String secondtime) {
		List<MovieShow> list = movieShowMapper.selectShowingMovieCityName(city,nowtime,secondtime);
		return list;
	}
	/**
	 * 获取某一影城多有电影上映列信息
	 * */
	@Override
	public List<MovieShow> getACityMovieShowName(String city, String nowtime,
			String secondtime, String name) {
		List<MovieShow> list = movieShowMapper.selectACityShowingMovieName(city,nowtime,secondtime,name);
		return list;
	}
	/**
	 * 传一条电影上映信息供用户选座
	 * */
	@Override
	public MovieShow getAMovieShowById(int id) {
		MovieShow movieShow = movieShowMapper.selectByPrimaryKey(id);
		return movieShow;
	}
	/**
	 * 获取某一影城某一电影上映信息
	 * */
	@Override
	public List<MovieShow> getACityAMovieShow(String city, String nowtime,
			String secondtime, String cname, String mname) {
		List<MovieShow> movieShow = movieShowMapper.selectACityAMovieShow(city, nowtime, secondtime, cname, mname);
		return movieShow;
	}

}
