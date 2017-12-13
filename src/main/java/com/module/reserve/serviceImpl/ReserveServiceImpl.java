package com.module.reserve.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.dao.CommonDao;
import com.module.reserve.dto.ReserveDto;
import com.module.reserve.service.ReserveService;

@Service("reserveService")
public class ReserveServiceImpl implements ReserveService{

	@Autowired
	private CommonDao commonDao;
	
	@Override
	public void insertReserveInfo(ReserveDto reserve) throws Exception {
		// 포럼/박람회 기본정보 등록
		int reserveKey = (Integer)commonDao.insert("RESERVE.insertReserveInfo", reserve);
		reserve.setReserve_key(String.valueOf(reserveKey));
		
		// 상세정보 등록 (개요 및 일정, 포럼프로그램, 전시장 소개, 문화공연행사)
		commonDao.insert("RESERVE.insertReserveCont", reserve);
	}
	
	@Override
	public void updateReserveInfo(ReserveDto reserve) throws Exception {
		// 포럼/박람회 기본정보 변경
		commonDao.update("RESERVE.updateReserveInfo", reserve);
		// 상세정보 등록 (개요 및 일정, 포럼프로그램, 전시장 소개, 문화공연행사)
		commonDao.insert("RESERVE.insertReserveCont", reserve);	
	}
	
	@Override
	public void deleteReserveInfo(ReserveDto reserve) throws Exception {
		commonDao.update("RESERVE.deleteReserveInfo", reserve);
	}	
	
	@Override
	public ReserveDto getReserveInfo(String reserveKey) throws Exception {
		return (ReserveDto)commonDao.queryForObject("RESERVE.getReserveInfo", reserveKey);
	}
	
	@Override
	public ReserveDto getReserveActiveInfo() throws Exception {
		return (ReserveDto)commonDao.queryForObject("RESERVE.getReserveActiveInfo");
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ReserveDto> getReserveList(ReserveDto reserve) throws Exception {		
		return (List<ReserveDto>)commonDao.queryForObjectList("RESERVE.getReserveList", reserve);
	}
	

}