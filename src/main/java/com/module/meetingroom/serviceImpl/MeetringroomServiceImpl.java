package com.module.meetingroom.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.dao.CommonDao;
import com.module.meetingroom.dto.MeetingroomDto;
import com.module.meetingroom.service.MeetingroomService;
import com.module.reserve.dto.ReserveDto;

@Service("meetingroomService")
public class MeetringroomServiceImpl implements MeetingroomService{

	@Autowired
	private CommonDao commonDao;
		
	@SuppressWarnings("unchecked")
	@Override
	public  List<MeetingroomDto> getMeetingroomList(MeetingroomDto meetingroom) throws Exception {		
		return (List<MeetingroomDto>)commonDao.queryForObjectList("MEETINGROOM.getMeetingroomList", meetingroom);
	}

	@Override
	public MeetingroomDto getMeetingroomInfo(String meetingroomKey) throws Exception {
		MeetingroomDto result = (MeetingroomDto)commonDao.queryForObject("MEETINGROOM.getMeetingInfo", meetingroomKey);
		return result;
	}

	@Override
	public void insertReserveInfo(ReserveDto reserve) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateReserveInfo(ReserveDto reserve) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteReserveInfo(ReserveDto reserve) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ReserveDto getReserveActiveInfo() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	

}