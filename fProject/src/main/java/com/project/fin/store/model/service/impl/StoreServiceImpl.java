package com.project.fin.store.model.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fin.store.model.dao.StoreDao;
import com.project.fin.store.model.service.StoreService;
import com.project.fin.store.model.vo.Menu;
import com.project.fin.store.model.vo.MenuGroup;
import com.project.fin.store.model.vo.Options;
import com.project.fin.store.model.vo.Store;

@Service
public class StoreServiceImpl implements StoreService {
	@Autowired
	private StoreDao storedao;
	
	@Override
	public List<Store> selectStoreList() {
		return storedao.selectStoreList();
	}
	
	@Override
	public Store selectOneStore(int storeNo) {
		return storedao.selectOneStore(storeNo);
	}
	
	@Override
	public List<Menu> selectMenuList(int storeNo) {
		return storedao.selectMenuList(storeNo);
	}
	
	@Override
	public List<MenuGroup> selectgroupList(int storeNo) {
		return storedao.selectgroupList(storeNo);
	}

	@Override
	public Menu selectOneMenu(String menuNo) {
		return storedao.selectOneMenu(menuNo);
	}

	@Override
	public List<Options> selectOption(String menuNo) {
		
		return storedao.selectOption(menuNo);
	}


	







}
