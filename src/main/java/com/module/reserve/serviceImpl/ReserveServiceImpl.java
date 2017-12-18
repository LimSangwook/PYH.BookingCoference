package com.module.reserve.serviceImpl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.dao.CommonDao;
import com.common.util.CommonUtils;
import com.common.util.CommonWebUtils;
import com.common.util.JProperties;
import com.common.util.StringEncrypter;
import com.module.reserve.dto.ReserveDateDto;
import com.module.reserve.dto.ReserveDto;
import com.module.reserve.service.ReserveService;
import com.module.user.dto.UserDto;

@Service("reserveService")
public class ReserveServiceImpl implements ReserveService{

	@Autowired
	private CommonDao commonDao;
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ReserveDto> getMeetingroomStatusList(ReserveDto reserve) throws Exception {		
		return (List<ReserveDto>)commonDao.queryForObjectList("RESERVE.getMeetingroomStatusList", reserve);
	}
	
	@SuppressWarnings("unchecked")
	public List<ReserveDto> getDateList(ReserveDto reserve) throws Exception {
		return (List<ReserveDto>)commonDao.queryForObjectList("RESERVE.getDateList", reserve);
	}
	
	@SuppressWarnings("unchecked")
	public List<ReserveDto> getTimeList(ReserveDto reserve) throws Exception {
		return (List<ReserveDto>)commonDao.queryForObjectList("RESERVE.getTimeList", reserve);	
	}

	public ReserveDto getReserveRoomInfo(ReserveDto reserve) throws Exception {
		return (ReserveDto)commonDao.queryForObject("RESERVE.getReserveRoomInfo", reserve);
	}
	
	public int reserveSave(ReserveDto reserve) throws Exception {	
		if (reserve.getAgree_term_personal_info() != null && "on".equals(reserve.getAgree_term_personal_info())) {
			reserve.setAgree_term_personal_info("1");
		}
		
		int reservationKey = (Integer)commonDao.insert("RESERVE.reserveSaveInfo", reserve);
		reserve.setReservation_key(String.valueOf(reservationKey));
		
		for (int i = 0; i < reserve.getReservation_times().length; i++){
			reserve.setReservation_time(reserve.getReservation_times()[i]);
			commonDao.insert("RESERVE.reserveSaveMapp", reserve);
		}			
		
		return reservationKey;
	}
	
	@SuppressWarnings("unchecked")
	public List<ReserveDto> getReservationResult(ReserveDto reserve) throws Exception {
		return (List<ReserveDto>)commonDao.queryForObjectList("RESERVE.getReservationResult", reserve);	
	}
	
	@SuppressWarnings("unchecked")
	public List<ReserveDto> getReservationList(ReserveDto reserve) throws Exception {
		List<ReserveDto> result = null;
		int totalCount = (Integer)commonDao.queryForObject("RESERVE.getRserveTotalCount", reserve);
		if(totalCount > 0){
			result = (List<ReserveDto>)commonDao.queryForObjectList("RESERVE.getReservationList", reserve);
			reserve.setTotal_count(totalCount);
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<ReserveDto> reservationView(ReserveDto reserve) throws Exception {
		return (List<ReserveDto>)commonDao.queryForObjectList("RESERVE.reservationView", reserve);
	}
	
	public void reserveUpdate(ReserveDto reserve) throws Exception {
		commonDao.update("RESERVE.reserveUpdate", reserve);
	}
}