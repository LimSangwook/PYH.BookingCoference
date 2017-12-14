package com.module.meetingroom.service;

import java.util.List;

import com.module.meetingroom.dto.MeetingroomDto;
import com.module.reserve.dto.ReserveDto;


public interface MeetingroomService {

	
	/**
	 * 회의실 목록 조회
	 * */
	public List<MeetingroomDto> getMeetingroomList(MeetingroomDto meetingroom) throws Exception;
	
	/**
	 * 회의실 상세조회
	 * */
	public MeetingroomDto getMeetingroomInfo(String meetingroomKey) throws Exception;
	
	/**
	 * 
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
	 * 현재 진행중인 포럼/박람회 조회
	 * */
	public ReserveDto getReserveActiveInfo() throws Exception;

	

}
