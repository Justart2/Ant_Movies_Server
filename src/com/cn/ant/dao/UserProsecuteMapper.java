package com.cn.ant.dao;

import com.cn.ant.entity.UserProsecute;

public interface UserProsecuteMapper {
    int deleteByPrimaryKey(Integer pId);

    int insert(UserProsecute record);

    int insertSelective(UserProsecute record);

    UserProsecute selectByPrimaryKey(Integer pId);

    int updateByPrimaryKeySelective(UserProsecute record);

    int updateByPrimaryKey(UserProsecute record);
}