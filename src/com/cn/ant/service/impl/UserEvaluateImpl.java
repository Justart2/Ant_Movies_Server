package com.cn.ant.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.ant.dao.UserEvaluateMapper;
import com.cn.ant.dao.UserMapper;
import com.cn.ant.entity.UserEvaluate;
import com.cn.ant.service.interf.IUserEvaluateInterface;
@Service
public class UserEvaluateImpl implements IUserEvaluateInterface{
	
	@Resource
	UserEvaluateMapper userEvaMapper;
	@Resource
	UserMapper userMapper;
	
	/**
	 * 获取某个电影的评价
	 * */
	@Override
	public List<UserEvaluate> getMovieEvaluate(int movieId) {
		List<UserEvaluate> userEva = userEvaMapper.selectByMovieId(movieId);
		return userEva;
	}
	/**
	 * 获取某用户对电影的评价
	 * */
	@Override
	public List<UserEvaluate> getUserEvaluate(int userId) {
		List<UserEvaluate> userEva = userEvaMapper.selectByUserId(userId);
		return userEva;
	}
	/**
	 * 添加某用户对电影的评价
	 * */
	@Override
	public int addMovieEvaluate(UserEvaluate userEva) {
		int result = userEvaMapper.insert(userEva);
		return result;
	}
	/**
	 * 删除某用户对电影的评价
	 * */
	@Override
	public int deleteUserEvaluate(int id) {
		int result = userEvaMapper.deleteByPrimaryKey(id);
		return result;
	}

}
