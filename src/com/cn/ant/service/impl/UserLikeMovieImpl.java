package com.cn.ant.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.ant.dao.UserLikeMovieMapper;
import com.cn.ant.entity.UserLikeMovie;
import com.cn.ant.service.interf.IUserLikeMovieInterface;
@Service
public class UserLikeMovieImpl implements IUserLikeMovieInterface{
	@Resource
	UserLikeMovieMapper userLikeMapper;
	@Override
	public int doInsertLike(UserLikeMovie userLike) {
		int result = userLikeMapper.insert(userLike);
		return result;
	}
	@Override
	public UserLikeMovie queryUserLikeMovieState(UserLikeMovie userLike) {
		UserLikeMovie userLikeMovie = userLikeMapper.selectByUserIdAndMovieId(userLike);
		return userLikeMovie;
	}
	@Override
	public int doDeleteLike(UserLikeMovie userLike) {
		int result = userLikeMapper.deleteByUserIdAndMovieId(userLike);
		return result;
	}
	@Override
	public int getLikeRate(int movieId) {
		double allState = userLikeMapper.selectMovieAllLike(movieId);
		double likeState = userLikeMapper.selectMovieOnlyLike(movieId);
		int result = (int)(likeState/allState*100);
		return result;
	}
	@Override
	public List<UserLikeMovie> queryLikeMovie(int id) {
		List<UserLikeMovie> list = userLikeMapper.selectByUserId(id);
		return list;
	}
	@Override
	public int deleteLikeItemById(int id) {
		int result = userLikeMapper.deleteByPrimaryKey(id);
		return result;
	}
	
	

}
