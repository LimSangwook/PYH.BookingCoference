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
	public List<ReserveDto> getReservationResult(ReserveDto reserve) throws Exception;

	/**
	 * 예약목록
	 * @return 
	 * */
	public List<ReserveDto> getReservationList(ReserveDto reserve) throws Exception;

	/**
	 * 예약 현황
	 * @return 
	 * */
	public List<ReserveDto> reservationView(ReserveDto reserve) throws Exception;

	/**
	 * 예약 현황
	 * @return 
	 * */
	public void reserveUpdate(ReserveDto reserve) throws Exception;
	
}
