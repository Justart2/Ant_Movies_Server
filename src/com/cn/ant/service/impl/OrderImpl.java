package com.cn.ant.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.ant.dao.OrderMapper;
import com.cn.ant.entity.Order;
import com.cn.ant.service.interf.IOrderInterface;
@Service
public class OrderImpl implements IOrderInterface{
	@Resource
	OrderMapper orderMapper;
	/**
	 * 选座后生成订单
	 * */
	@Override
	public int insertOrder(Order o) {
		int result = orderMapper.insert(o);
		return result;
	}
	@Override
	public List<Order> getUserOrder(int userId) {
		List<Order> list = orderMapper.selectOrderByUser(userId);
		return list;
	}
	@Override
	public List<Order> getOrderByMovieShowId(int movieShowId) {
		List<Order> list = orderMapper.selectByMovieShowId(movieShowId);
		return list;
	}
	@Override
	public int deleteOrderById(String id) {
		int result = orderMapper.deleteByPrimaryKey(id);
		return result;
	}

}
