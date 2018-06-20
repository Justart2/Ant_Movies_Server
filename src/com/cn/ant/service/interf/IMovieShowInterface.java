package com.cn.ant.service.interf;

import java.util.List;

import com.cn.ant.entity.MovieShow;

public interface IMovieShowInterface {

	public MovieShow getAMovieShowById(int id);
	
	public List<MovieShow> getAMovieShowInfo(int id);
	
	public List<MovieShow> getMovieCityName(String city,String nowtime,String Secondtime);
	
	public List<MovieShow> getMovieShowName(String city,String nowtime,String Secondtime,String cname);
	
	public List<MovieShow> getACityMovieShowName(String city,String nowtime,String Secondtime,String cname);
	
	public List<MovieShow> getACityAMovieShow(String city,String nowtime,String Secondtime,String cname,String mname);
}
