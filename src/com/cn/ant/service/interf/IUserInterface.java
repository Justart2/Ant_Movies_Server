package com.cn.ant.service.interf;

import java.util.HashMap;

import com.cn.ant.entity.User;

public interface IUserInterface {

	public User login(User u);

	public User loginByPhone(User u);

	public User getUserInfo(int userId);
	
	public User loginByThirdPart(User u);

	public int register(User u);

	// 修改用户的的人信息
	int modifyUserMsg(User user);

	// 通过id修改用户的pasw
	int updateUsetPasw(HashMap<String, String> map);

	int updatePhoto(HashMap<String, String> map);
}
