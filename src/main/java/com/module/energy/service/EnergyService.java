package com.module.energy.service;

import java.util.List;

import com.module.board.dto.BoardDto;
import com.module.energy.dto.EnergyDto;

public interface EnergyService {

	EnergyDto selectEnergy() throws Exception;

	public List<EnergyDto> getTimeGraph_month(EnergyDto energyDto) throws Exception;
	public List<EnergyDto> getTimeGraph_day(EnergyDto energyDto) throws Exception;

	public List<EnergyDto> getSpaceGraph(EnergyDto energyDto) throws Exception;

	public List<EnergyDto> getFutureGraph(EnergyDto energyDto) throws Exception;

	public EnergyDto getAreaXY(String area_code) throws Exception;

	public List<EnergyDto> selectCodeList(EnergyDto energyDto) throws Exception;
}
