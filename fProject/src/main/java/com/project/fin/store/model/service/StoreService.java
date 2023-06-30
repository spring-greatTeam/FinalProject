package com.project.fin.store.model.service;

import java.util.ArrayList;
import java.util.List;

import com.project.fin.store.model.vo.Menu;
import com.project.fin.store.model.vo.MenuGroup;
import com.project.fin.store.model.vo.Options;
import com.project.fin.store.model.vo.Store;

public interface StoreService {
	
	List<Store> selectStoreList();

	Store selectOneStore(int storeNo);

	List<Menu> selectMenuList(int storeNo);

	List<MenuGroup> selectgroupList(int storeNo);


}
