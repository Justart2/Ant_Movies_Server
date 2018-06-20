package com.cn.ant.dao;

import com.cn.ant.entity.ServiceNotes;

public interface ServiceNotesMapper {
    int deleteByPrimaryKey(Integer nId);

    int insert(ServiceNotes record);

    int insertSelective(ServiceNotes record);

    ServiceNotes selectByPrimaryKey(Integer nId);

    int updateByPrimaryKeySelective(ServiceNotes record);

    int updateByPrimaryKey(ServiceNotes record);
}