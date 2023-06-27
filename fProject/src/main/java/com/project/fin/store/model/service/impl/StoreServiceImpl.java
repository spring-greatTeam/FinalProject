package com.project.fin.store.model.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fin.store.model.dao.StoreDao;
import com.project.fin.store.model.service.StoreService;
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
}
