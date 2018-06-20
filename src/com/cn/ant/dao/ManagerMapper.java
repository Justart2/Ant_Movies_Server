package com.cn.ant.dao;

import com.cn.ant.entity.Manager;

public interface ManagerMapper {
    int deleteByPrimaryKey(Integer aId);

    int insert(Manager record);

    int insertSelective(Manager record);

    Manager selectByPrimaryKey(Integer aId);

    int updateByPrimaryKeySelective(Manager record);

    int updateByPrimaryKey(Manager record);
}