package com.quiz.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {
	
	public RealEstate selsctRealEstate(int id);
	
	public List<RealEstate> selectRentPriceList(int rentPrice);
	
	public List<RealEstate> selectTypeAreaPriceList(@Param("area") int area, @Param("price") int price);
}
