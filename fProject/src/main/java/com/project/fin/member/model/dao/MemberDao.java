package com.project.fin.member.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.fin.orders.model.vo.Orders;

/*
 * 1. mapper.xml로 연결
 * 2. 추상메소드에 @Insert @Update @Delete @Select를 통해 간단한 쿼리 직접 작성
 * 		그렇다고 mapper.xml파일을 완전히 삭제할 수는 없다.
 * 		특히, 분기처리, 반복처리 복잡한 쿼리등은 어노테이션으로 해결안됨
 */
@Mapper
public interface MemberDao {

	List<Orders> selectOrdersList();

}
