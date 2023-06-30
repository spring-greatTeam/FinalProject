package com.project.fin.store.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.fin.store.model.vo.Menu;
import com.project.fin.store.model.vo.MenuGroup;
import com.project.fin.store.model.vo.Options;
import com.project.fin.store.model.vo.Store;

@Mapper
public interface StoreDao {
	List<Store> selectStoreList();

	Store selectOneStore(int storeNo);

	List<Menu> selectMenuList(int storeNo);

	List<MenuGroup> selectgroupList(int storeNo);

	Menu selectOneMenu(int menuNo);

	List<Options> selectOption(String menuNo);

	List<Options> selectOpTest(int menu2);

//	Menu selectMenuList2(int menuNo);








}
