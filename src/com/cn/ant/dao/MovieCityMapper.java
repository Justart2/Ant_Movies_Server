package com.cn.ant.dao;

import java.util.List;

import com.cn.ant.entity.MovieCity;

public interface MovieCityMapper {
    int deleteByPrimaryKey(Integer cId);

    int insert(MovieCity record);

    int insertSelective(MovieCity record);

    MovieCity selectByPrimaryKey(Integer cId);

    int updateByPrimaryKeySelective(MovieCity record);

    int updateByPrimaryKey(MovieCity record);
    
    List<MovieCity> selectByCityName(String city);
}