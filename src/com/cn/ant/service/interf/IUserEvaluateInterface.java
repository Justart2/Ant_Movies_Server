package com.cn.ant.service.interf;

import java.util.List;

import com.cn.ant.entity.User;
import com.cn.ant.entity.UserEvaluate;

public interface IUserEvaluateInterface {

	public List<UserEvaluate> getMovieEvaluate(int movieId);
	
	public List<UserEvaluate> getUserEvaluate(int userId);
	
	public int addMovieEvaluate(UserEvaluate userEva);
	
	public int deleteUserEvaluate(int id);
}
