package com.cn.ant.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cn.ant.entity.Movie;

public interface MovieMapper {
    int deleteByPrimaryKey(Integer mId);

    int insert(Movie record);

    int insertSelective(Movie record);

    Movie selectByPrimaryKey(Long mId);

    int updateByPrimaryKeySelective(Movie record);

    int updateByPrimaryKey(Movie record);
    
    List<Movie> selectAllMovies();
    
    List<Movie> selectShowingMovies(String date);
    
    List<Movie> selectWillShowMovies(String date);
    
    List<Movie> selectLikeMovies(int count);
    
    int updateRateByMovieId(@Param(value="rate")Integer rate,@Param(value="mId")Integer mId);
}