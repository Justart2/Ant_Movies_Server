package com.cn.ant.dao;

import java.util.List;

import com.cn.ant.entity.Order;

public interface OrderMapper {
    int deleteByPrimaryKey(String oId);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer oId);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
    
    List<Order> selectOrderByUser(int UserId);
    
    List<Order> selectByMovieShowId(int movieShowId);
}