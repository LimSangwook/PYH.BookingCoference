package com.module.energy.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.dao.CommonDao;
import com.module.energy.dto.EnergyDto;
import com.module.energy.service.EnergyService;

@Service("energyService")
public class EnergyServiceImpl implements EnergyService {

	@Autowired
	private CommonDao commonDao;
	
	@Override
	public EnergyDto selectEnergy() throws Exception {
		return (EnergyDto) commonDao.queryForObject("ENERGY.getEnergyData");
	}

	@Override
	public List<EnergyDto> getTimeGraph_month(EnergyDto energyDto) throws Exception {
		return (List<EnergyDto>) commonDao.queryForObjectList("ENERGY.getTimeGraph_month", energyDto);
	}
	@Override
	public List<EnergyDto> getTimeGraph_day(EnergyDto energyDto) throws Exception {
		return (List<EnergyDto>) commonDao.queryForObjectList("ENERGY.getTimeGraph_day", energyDto);
	}

	@Override
	public List<EnergyDto> getSpaceGraph(EnergyDto energyDto) throws Exception {
		List<EnergyDto> result = null;
		result = (List<EnergyDto>)commonDao.queryForObjectList("ENERGY.getSpaceGraph", energyDto);
		return result;
	}

	@Override
	public List<EnergyDto> getFutureGraph(EnergyDto energyDto) throws Exception {
		List<EnergyDto> result = null;
		result = (List<EnergyDto>)commonDao.queryForObjectList("ENERGY.getFutureGraph", energyDto);
		return result;
	}

	@Override
	public EnergyDto getAreaXY(String area_code) throws Exception {
		return (EnergyDto)commonDao.queryForObject("ENERGY.getAreaXY", area_code);
	}
	
	@Override
	public List<EnergyDto> selectCodeList(EnergyDto energyDto) throws Exception {
		return (List<EnergyDto>)commonDao.queryForObjectList("ENERGY.getCodeList", energyDto);
	}
}
