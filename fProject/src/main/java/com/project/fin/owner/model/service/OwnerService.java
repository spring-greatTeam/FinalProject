package com.project.fin.owner.model.service;

import java.util.List;

import com.project.fin.owner.model.vo.Owner;
import com.project.fin.store.model.vo.Menu;
import com.project.fin.store.model.vo.MenuGroup;
import com.project.fin.store.model.vo.Store;

public interface OwnerService {

	int insertStore(Store store);

	int insertMenuGroup(MenuGroup menuGroup);
	
	int insertMenu(Menu menu);
	
	Owner selectOneOwner(String OwnerId);

	int insertOwner(Owner owner);

	int updateOwner(Owner owner);

	int updatePwd(Owner owner);

	
}

