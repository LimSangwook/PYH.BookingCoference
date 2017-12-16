package com.module.meetingroom.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	 * 회의실 생성
	 * */
	public int insertMeetingroomInfo(HttpServletRequest request, MeetingroomDto meetingroom) throws Exception;
	
	/**
	 * 회의실 정보수정
	 * */
	public void updateMeetingroomInfo(HttpServletRequest request, MeetingroomDto meetingroom) throws Exception;
	
	/**
	 * 회의실 정보삭제
	 * */
	public void deleteMeetingroomInfo(HttpServletRequest request, MeetingroomDto meetingroom) throws Exception;
	
	/**
	 * 현재 진행중인 포럼/박람회 조회
	 * */
	public ReserveDto getReserveActiveInfo() throws Exception;

	

}
