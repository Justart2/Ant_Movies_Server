package com.cn.ant.service.interf;

import java.util.List;

import com.cn.ant.entity.Movie;

public interface IMoviesInterface {
	public List<Movie> getAllMoviesInfo();
	
	public List<Movie> getShowingMoviesInfo(String date);
	
	public List<Movie> getWillShowMoviesInfo(String date);
	
	public List<Movie> getMostLikeMoviesInfo(int count);
	
	public Movie getAMoviesInfo(long mId);
	
	public int updateMovieLikeRate(int rate,int movieId);
}
