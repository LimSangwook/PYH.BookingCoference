package com.module.data.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.dao.CommonDao;
import com.module.data.dto.GenerateDto;
import com.module.data.service.DataService;

@Service("dataService")
public class DataServiceImpl implements DataService{
	
	@Autowired
	private CommonDao commonDao;
	
	@Override
	public GenerateDto selectGenerate() throws Exception {
		return (GenerateDto) commonDao.queryForObject("DATA.getGenerateData");
	}
	
	@Override
	public void updateGenerate(GenerateDto dto) throws Exception {
		commonDao.update("DATA.updateGnerateData", dto);
	}
	
}
