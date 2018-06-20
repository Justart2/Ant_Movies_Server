package com.cn.ant.service.interf;

import java.util.List;

import com.cn.ant.entity.MovieCity;

public interface IMovieCityInterface {
	public List<MovieCity> getMovieCityByCity(String city);
}
