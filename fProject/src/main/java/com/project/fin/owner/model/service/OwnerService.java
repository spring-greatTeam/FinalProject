package com.project.fin.owner.model.service;

import com.project.fin.store.model.vo.Menu;
import com.project.fin.store.model.vo.MenuGroup;
import com.project.fin.store.model.vo.Store;

public interface OwnerService {

	int insertStore(Store store);

	int insertMenuGroup(MenuGroup menuGroup);

}

