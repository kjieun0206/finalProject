package com.kh.fooding.store.model.dao;


import org.mybatis.spring.SqlSessionTemplate;

import com.kh.fooding.store.model.vo.Store;

import com.kh.fooding.store.model.vo.Sam;

import java.util.ArrayList;

public interface StoreDao {

	int insertStoreInfo(Store s, SqlSessionTemplate sqlSession);

	ArrayList<Sam> searchResult(String searchKey, SqlSessionTemplate sqlSession);
}
