package com.module.data.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.module.data.dto.GenerateDto;
import com.module.data.service.DataService;

@Controller
@RequestMapping("/siteManage/**")
public class DataController {
	
	@Autowired
	private DataService dataService;
	
	/**
	 * 관리자 > 발전량 등록 폼
	 * @param request
	 * @return
	 */
	@RequestMapping("genDataForm")
	public String genDataForm(HttpServletRequest request, Model model)throws Exception{
		
		GenerateDto dto = dataService.selectGenerate();
		
		if(dto.getReg_date() != null)
			model.addAttribute("generateData", dto);
		
		return "siteManage/generate/generateForm";
	}
	
	/**
	 *  관리자 > 발전량 등록/수정
	 */
	@RequestMapping("saveGenerate")
	public String saveDataForm(@ModelAttribute GenerateDto dto)throws Exception{
		
		dataService.updateGenerate(dto);
		
		return "redirect:genDataForm.do";
	}
}
