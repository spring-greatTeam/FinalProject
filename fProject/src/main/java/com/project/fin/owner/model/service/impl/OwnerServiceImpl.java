package com.project.fin.owner.model.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fin.owner.model.dao.OwnerDao;
import com.project.fin.owner.model.service.OwnerService;
import com.project.fin.store.model.vo.Menu;
import com.project.fin.store.model.vo.MenuGroup;
import com.project.fin.store.model.vo.Store;
@Service
public class OwnerServiceImpl implements OwnerService{
	
	
	  @Autowired
	  private OwnerDao ownerDao;
	  
	  @Override 
	  public int insertStore(Store store) { 
		  return ownerDao.insertStore(store); 
		  }

	@Override
	public int insertMenuGroup(MenuGroup menuGroup) {
		return ownerDao.insertMenuGroup(menuGroup);
	}
	 
	
}
