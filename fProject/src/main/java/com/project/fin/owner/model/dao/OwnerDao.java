package com.project.fin.owner.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.project.fin.store.model.vo.Menu;
import com.project.fin.store.model.vo.MenuGroup;
import com.project.fin.store.model.vo.Store;

@Mapper
public interface OwnerDao {

	int insertStore(Store store);

	int insertMenuGroup(MenuGroup menuGroup);

}
