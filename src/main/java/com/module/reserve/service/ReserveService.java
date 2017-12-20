package com.module.reserve.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.module.reserve.dto.ReserveDto;


public interface ReserveService {
	/**
	 * 미팅룸 예약현황 조회 목록조회
	 * */
	public List<ReserveDto> getMeetingroomStatusList(ReserveDto reserve) throws Exception;

	/**
	 * 한달 리스트 조회
	 * */
	public List<ReserveDto> getDateList(ReserveDto reserve) throws Exception;

	/**
	 * 예약시간 리스트 조회
	 * */
	public List<ReserveDto> getTimeList(ReserveDto reserve) throws Exception;


	/**
	 * 회의실/가격/날짜/시간 정보
	 * */
	public ReserveDto getReserveRoomInfo(ReserveDto reserve) throws Exception;

	/**
	 * 예약 저장
	 * @return 
	 * */
	public int reserveSave(ReserveDto reserve) throws Exception;

	/**
	 * 예약 저장
	 * @return 
	 * */
	public ReserveDto getReservationResult(ReserveDto reserve) throws Exception;

	/**
	 * 예약목록
	 * @return 
	 * */
	public List<ReserveDto> getReserveCommonList(ReserveDto reserve) throws Exception;

	/**
	 * 예약 이벤트 목록
	 * @return 
	 * */	
	public List<ReserveDto> getReserveEventList(ReserveDto reserve) throws Exception;

	/**
	 * 예약 일별 목록
	 * @return 
	 * */	
	public List<ReserveDto> getReserveCalendarList(ReserveDto reserve) throws Exception;
	
	
	public ReserveDto getReservationDetail(ReserveDto reserve) throws Exception; 

	/**
	 * 예약 승인페이지
	 * @return 
	 * */
	public ReserveDto reserveApproval(ReserveDto reserve) throws Exception;

	/**
	 * 예약 현황
	 * @return 
	 * */
	public void reserveUpdate(ReserveDto reserve) throws Exception;
	
}
