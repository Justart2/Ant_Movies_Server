package com.cn.ant.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.ant.dao.MovieCityMapper;
import com.cn.ant.entity.MovieCity;
import com.cn.ant.service.interf.IMovieCityInterface;
@Service
public class MovieCityImpl implements IMovieCityInterface{
	@Resource
	MovieCityMapper movieCityMapper;
	@Override
	public List<MovieCity> getMovieCityByCity(String city) {
		List<MovieCity> list = movieCityMapper.selectByCityName(city);
		return list;
	}

}
