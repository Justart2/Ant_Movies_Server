package com.cn.ant.service.interf;

import java.util.List;

import com.cn.ant.entity.UserLikeMovie;

public interface IUserLikeMovieInterface {
	
	int doInsertLike(UserLikeMovie userLike);
	
	int doDeleteLike(UserLikeMovie userLike);
	
	UserLikeMovie queryUserLikeMovieState(UserLikeMovie userLike);
	
	int getLikeRate(int movieId);
	
	List<UserLikeMovie> queryLikeMovie(int id);
	
	int deleteLikeItemById(int id);
}
