package com.module.reserve.service;

import java.util.List;

import com.module.reserve.dto.ReserveDto;


public interface ReserveService {

	/**
	 * 포럼/박람회 정보등록
	 * */
	public void insertReserveInfo(ReserveDto reserve) throws Exception;
	
	/**
	 * 포럼/박람회 정보수정
	 * */
	public void updateReserveInfo(ReserveDto reserve) throws Exception;
	
	/**
	 * 포럼/박람회 정보삭제
	 * */
	public void deleteReserveInfo(ReserveDto reserve) throws Exception;
	
	/**
	 * 포럼/박람회 상세조회
	 * */
	public ReserveDto getReserveInfo(String reserveKey) throws Exception;
	
	/**
	 * 현재 진행중인 포럼/박람회 조회
	 * */
	public ReserveDto getReserveActiveInfo() throws Exception;
	
	/**
	 * 포럼/박람회 목록조회
	 * search_type 전체 : 1, 지난포럼 : 2
	 * */
	public List<ReserveDto> getReserveList(ReserveDto forum) throws Exception;
	

}
