package com.project.fin.owner.model.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.project.fin.owner.model.dao.OwnerDao;
import com.project.fin.owner.model.service.OwnerService;
import com.project.fin.owner.model.vo.Owner;

public class OwnerServiceImpl implements OwnerService{
	
	@Autowired
	private OwnerDao ownerDao;
	
	@Override
	public int insertOwner(Owner owner) {
		return ownerDao.insertOwner(owner);
	}
	
}
