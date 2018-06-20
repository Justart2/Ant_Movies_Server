package com.cn.ant.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.ant.dao.UserMapper;
import com.cn.ant.entity.User;
import com.cn.ant.service.interf.IUserInterface;
@Service
public class UserImpl implements IUserInterface{
	@Resource
	UserMapper userMapper;
	@Override
	public User login(User u) {
		User user = userMapper.selectUserLoginInfo(u);
		
		return user;
	}
	@Override
	public int register(User u) {
		int result = userMapper.insert(u);
		
		return result;
	}
	/**
	 * 修改用户的个人信息
	 */
	@Override
	public int modifyUserMsg(User user) {
		return this.userMapper.modifyUserMsg(user);
	}
	@Override
	public int updateUsetPasw(HashMap<String, String> map) {
		return this.userMapper.updateUserPaswByID(map);
	}
	@Override
	public int updatePhoto(HashMap<String, String> map) {
		return this.userMapper.updateUserPhoto(map);
	}
	@Override
	public User getUserInfo(int userId) {
		User u = userMapper.selectByPrimaryKey(userId);
		return u;
	}
	@Override
	public User loginByPhone(User u) {
		User user = userMapper.selectUserLoginByPhoneInfo(u);
		return user;
	}
	//第三方的登录
	@Override
	public User loginByThirdPart(User u) {
		User user = userMapper.selectUserThirdLoginInfo(u);
		return user;
	}
}
