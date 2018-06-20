package com.cn.ant.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cn.ant.entity.UserLikeMovie;

public interface UserLikeMovieMapper {
    int deleteByPrimaryKey(Integer uc_id);
    
    int deleteByUserIdAndMovieId(UserLikeMovie record);

    int insert(UserLikeMovie record);

    int insertSelective(UserLikeMovie record);

    UserLikeMovie selectByPrimaryKey(Integer uc_id);
    
    UserLikeMovie selectByUserIdAndMovieId(UserLikeMovie record);

    int updateByPrimaryKeySelective(UserLikeMovie record);

    int updateByPrimaryKey(UserLikeMovie record);
    
    int selectMovieOnlyLike(@Param(value="m_id")Integer movieId);
    
    int selectMovieAllLike(@Param(value="m_id")Integer movieId);
    
    List<UserLikeMovie> selectByUserId(@Param(value="uId")Integer uId);
}