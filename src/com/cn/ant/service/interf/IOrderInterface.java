package com.cn.ant.service.interf;

import java.util.List;

import com.cn.ant.entity.Order;

public interface IOrderInterface {
	
	public int insertOrder(Order o);
	public List<Order> getUserOrder(int userId);
	public List<Order> getOrderByMovieShowId(int movieShowId);
	public int deleteOrderById(String id);
}
