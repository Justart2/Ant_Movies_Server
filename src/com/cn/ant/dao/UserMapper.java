package com.cn.ant.dao;

import java.util.HashMap;

import com.cn.ant.entity.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer uId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer uId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    User selectUserLoginInfo(User user);
    
    int modifyUserMsg(User user);
  //通过id 修改用户的密码
  	int updateUserPaswByID(HashMap<String, String> map);
  //通过用户的Id修改用户的头像
  	int updateUserPhoto(HashMap<String, String> map);
  	
  	User selectUserLoginByPhoneInfo(User user);
  	
  	User selectUserThirdLoginInfo(User user);
}