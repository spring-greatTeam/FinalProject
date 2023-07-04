package com.project.fin.owner.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.project.fin.owner.model.vo.Owner;

@Mapper
public interface OwnerDao {

	int insertOwner(Owner owner);

}
