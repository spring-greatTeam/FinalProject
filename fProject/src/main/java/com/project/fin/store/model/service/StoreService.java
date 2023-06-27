package com.project.fin.store.model.service;

import java.util.List;

import com.project.fin.store.model.vo.Store;

public interface StoreService {
	
	List<Store> selectStoreList();

	Store selectOneStore(int storeNo);

}
