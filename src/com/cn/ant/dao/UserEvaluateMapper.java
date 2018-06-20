package com.cn.ant.dao;

import java.util.List;

import com.cn.ant.entity.UserEvaluate;

public interface UserEvaluateMapper {
	
    int deleteByPrimaryKey(Integer eId);

    int insert(UserEvaluate record);

    int insertSelective(UserEvaluate record);

    UserEvaluate selectByPrimaryKey(Integer eId);

    int updateByPrimaryKeySelective(UserEvaluate record);

    int updateByPrimaryKey(UserEvaluate record);
    
    List<UserEvaluate> selectByMovieId(Integer id);
    
    List<UserEvaluate> selectByUserId(Integer id);
}