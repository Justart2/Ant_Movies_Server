package com.cn.ant.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cn.ant.entity.MovieShow;

public interface MovieShowMapper {
    int deleteByPrimaryKey(Integer sId);

    int insert(MovieShow record);

    int insertSelective(MovieShow record);

    MovieShow selectByPrimaryKey(Integer sId);

    int updateByPrimaryKeySelective(MovieShow record);

    int updateByPrimaryKey(MovieShow record);
    
    
    List<MovieShow> selectByMovieId(Integer id);
    
    List<MovieShow> selectACityAMovieShow(@Param("ccity")String city,@Param("ntime")String nowtime,@Param("stime")String secondtime,@Param("cname")String cname,@Param("mname")String mname);
    
    List<MovieShow> selectShowingMovieName(@Param("ccity")String city,@Param("ntime")String nowtime,@Param("stime")String secondtime,@Param("cname")String name);
    
    List<MovieShow> selectShowingMovieCityName(@Param("ccity")String city,@Param("ntime")String nowtime,@Param("stime")String secondtime);

    List<MovieShow> selectACityShowingMovieName(@Param("ccity")String city,@Param("ntime")String nowtime,@Param("stime")String secondtime,@Param("cname")String name);
}