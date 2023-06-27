package com.project.fin.store.model.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fin.store.model.dao.StoreDao;
import com.project.fin.store.model.service.StoreService;
import com.project.fin.store.model.vo.Store;

import lombok.AllArgsConstructor;

@Service
public class StoreServiceImpl implements StoreService {
	
	// dependency injection -> DI 환경
	@Autowired
	private StoreDao storedao;

	@Override
	public List<Store> selectStoreList() {
		
		// 스토어 서비스 업데이트 예정
		
		return storedao.selectStoreList();
	}

}
