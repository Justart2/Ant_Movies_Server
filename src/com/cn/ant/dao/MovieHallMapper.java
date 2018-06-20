package com.cn.ant.dao;

import com.cn.ant.entity.MovieHall;

public interface MovieHallMapper {
    int deleteByPrimaryKey(Integer hId);

    int insert(MovieHall record);

    int insertSelective(MovieHall record);

    MovieHall selectByPrimaryKey(Integer hId);

    int updateByPrimaryKeySelective(MovieHall record);

    int updateByPrimaryKey(MovieHall record);
    
    int updateMvoieHallSeat(MovieHall record);
}