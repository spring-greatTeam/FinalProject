package com.project.fin.owner.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.fin.owner.model.vo.Owner;
import com.project.fin.store.model.vo.Menu;
import com.project.fin.store.model.vo.MenuGroup;
import com.project.fin.store.model.vo.Store;

@Mapper
public interface OwnerDao {

	int insertStore(Store store);

	int insertMenuGroup(MenuGroup menuGroup);

	int insertMenu(Menu menu);
	
	Owner selectOneOwner(String ownerId);

	int insertOwner(Owner owner);

	int updateOwner(Owner owner);

	int updatePwd(Owner owner);
}
