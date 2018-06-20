package com.cn.ant.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.ant.dao.MovieHallMapper;
import com.cn.ant.entity.MovieHall;
import com.cn.ant.service.interf.IMovieHallInterface;
@Service
public class MovieHallImpl implements IMovieHallInterface{
	@Resource
	MovieHallMapper movieHallMapper;
	@Override
	public int changeSeat(MovieHall movieHall) {
		int result = movieHallMapper.updateMvoieHallSeat(movieHall);
		return result;
	}

}
