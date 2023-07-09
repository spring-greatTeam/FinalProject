package com.project.fin.owner.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fin.owner.model.dao.OwnerDao;
import com.project.fin.owner.model.vo.Owner;
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
	
	@Override
	public int insertMenu(Menu menu) {
		return ownerDao.insertMenu(menu);
	}
	
	@Override
	public Owner selectOneOwner(String ownerId) {
		return ownerDao.selectOneOwner(ownerId);
	}

	@Override
	public int insertOwner(Owner owner) {
		return ownerDao.insertOwner(owner);
	}

	@Override
	public int updateOwner(Owner owner) {
		return ownerDao.updateOwner(owner);
	}

	@Override
	public int updatePwd(Owner owner) {
		return ownerDao.updatePwd(owner);
	}

	@Override
	public List<MenuGroup> selectGroupList(int storeNo) {
		return ownerDao.selectGroupList(storeNo);
	}

}
