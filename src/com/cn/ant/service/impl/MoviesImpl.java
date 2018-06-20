package com.cn.ant.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.ant.dao.MovieMapper;
import com.cn.ant.entity.Movie;
import com.cn.ant.service.interf.IMoviesInterface;
@Service
public class MoviesImpl implements IMoviesInterface{
	@Resource
	MovieMapper movieMapper;
	/**
	 * 查询所有电影的信息
	 * */
	@Override
	public List<Movie> getAllMoviesInfo() {
		List<Movie> list = movieMapper.selectAllMovies();
		return list;
	}
	/**
	 * 查询正在上映电影的信息
	 * */
	@Override
	public List<Movie> getShowingMoviesInfo(String date) {
		
		List<Movie> list = movieMapper.selectShowingMovies(date);
		return list;
	}
	/**
	 * 查询即将上映电影的信息
	 * */
	@Override
	public List<Movie> getWillShowMoviesInfo(String date) {
		
		List<Movie> list = movieMapper.selectWillShowMovies(date);
		return list;
	}
	/**
	 * 查询喜欢率高的前count个电影的信息
	 * */
	@Override
	public List<Movie> getMostLikeMoviesInfo(int count) {
		
		List<Movie> list = movieMapper.selectLikeMovies(count);
		return list;
	}
	/**
	 * 通过主键查询一个电影的详细信息
	 * */
	@Override
	public Movie getAMoviesInfo(long mId) {
		
		Movie movie = movieMapper.selectByPrimaryKey(mId);
		return movie;
	}
	/**
	 * 通过电影id修改喜欢率
	 * */
	@Override
	public int updateMovieLikeRate(int rate,int movieId) {
		int result = movieMapper.updateRateByMovieId(rate, movieId);
		return result;
	}
	
}
