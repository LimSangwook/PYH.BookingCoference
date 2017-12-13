package com.module.energy.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.module.energy.dto.EnergyDto;


public class ExcelDownView extends AbstractExcelView  {

	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
			String excelName = "";
			HSSFSheet worksheet = null;
			HSSFRow row = null;
			
			excelName = URLEncoder.encode("timeGraph","UTF-8");
		
            worksheet = workbook.createSheet(excelName+ " WorkSheet");
            row = worksheet.createRow(0);
            
			EnergyDto energyDto = (EnergyDto)model.get("energyDto");
			if(energyDto.getTime_flag().equals("month")){
	            row.createCell(0).setCellValue("지역명");
	            row.createCell(1).setCellValue("년도");
	            row.createCell(2).setCellValue("월");
	            row.createCell(3).setCellValue("누적 일사량");
			}else{
	            row.createCell(0).setCellValue("지역명");
	            row.createCell(1).setCellValue("년도");
	            row.createCell(2).setCellValue("월");
	            row.createCell(3).setCellValue("일");
	            row.createCell(4).setCellValue("누적 일사량");
			}

			List<EnergyDto> energyDtoList = (List<EnergyDto>)model.get("result");
			if(energyDto.getTime_flag().equals("month")){
	            for(int i=1;i<energyDtoList.size()+1;i++){
	                row = worksheet.createRow(i);
	                row.createCell(0).setCellValue(energyDto.getTotal_area());
	                row.createCell(1).setCellValue(energyDtoList.get(i-1).getTime_year());
	                row.createCell(2).setCellValue(energyDtoList.get(i-1).getTime_month());
	                row.createCell(3).setCellValue(energyDtoList.get(i-1).getTime_val());
	            }
			}else{
	            for(int i=1;i<energyDtoList.size()+1;i++){
	                row = worksheet.createRow(i);
	                row.createCell(0).setCellValue(energyDto.getTotal_area());
	                row.createCell(1).setCellValue(energyDtoList.get(i-1).getTime_year());
	                row.createCell(2).setCellValue(energyDtoList.get(i-1).getTime_month());
	                row.createCell(3).setCellValue(energyDtoList.get(i-1).getTime_day());
	                row.createCell(4).setCellValue(energyDtoList.get(i-1).getTime_val());
	            }
			}
            
			String currentDate = (String) model.get("currentDate"); 
			/* 엑셀 excel */
			response.setContentType("Application/Msexcel");
			response.setHeader("Content-Disposition", "ATTachment; Filename="+excelName+"_"+currentDate.replace("-", "_")+".xls");
            
            /* 한글 hwp 
            response.setContentType("Application/hwp");
            response.setHeader("Content-Disposition", "attachment; filename="+excelName+"_"+currentDate.replace("-", "_")+".hwp");
            */
	}
	
}
