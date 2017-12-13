package com.module.data.service;

import com.module.data.dto.GenerateDto;

public interface DataService {

	GenerateDto selectGenerate() throws Exception;

	void updateGenerate(GenerateDto dto) throws Exception;

}
