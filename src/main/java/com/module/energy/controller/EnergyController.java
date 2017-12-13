package com.module.energy.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.module.data.dto.GenerateDto;
import com.module.data.service.DataService;
import com.module.energy.dto.EnergyDto;
import com.module.energy.service.EnergyService;


@Controller
@RequestMapping({"/forum/**/*Data/**","/forum/**/*Graph/**"})
public class EnergyController {

	@Autowired
	private DataService dataService;
	
	@Autowired
	private EnergyService energyService;
	
	/**
	 * 이용자 > 과거 일사량 정보 > 시간 분포도
	 * @param request
	 * @return
	 */
	@RequestMapping("timeGraph")
	public String timeGraph(EnergyDto energyDto, HttpServletRequest request, Model model)throws Exception{

		
		String start_year = energyDto.getStart_year();
		String start_month = energyDto.getStart_month();
		String end_year = energyDto.getEnd_year();
		String end_month = energyDto.getEnd_month();

		if(start_year == null || start_year == ""){ start_year = "2016"; }
		if(start_month == null || start_month == ""){ start_month = "1"; }
		if(end_year == null || end_year == ""){ end_year = "2016"; }
		if(end_month == null || end_month == ""){ end_month = "12"; }
		if(Integer.parseInt(start_month) < 10){
			start_month = "0"+start_month;
		}
		if(Integer.parseInt(end_month) < 10){
			end_month = "0"+end_month;
		}
		energyDto.setStart_ym(start_year+start_month);
		energyDto.setEnd_ym(end_year+end_month);
		
		if(energyDto.getArea_code()==null || energyDto.getArea_code()==""){
			energyDto.setArea_code("1");
		}
		if(energyDto.getTime_flag()==null || energyDto.getTime_flag()==""){
			energyDto.setTime_flag("month");
		}
		
		// 발전량 조회
		List<EnergyDto> result = null;
		if(energyDto.getTime_flag().equals("month")){
			result = energyService.getTimeGraph_month(energyDto);
		}else if(energyDto.getTime_flag().equals("day")){
			result = energyService.getTimeGraph_day(energyDto);
		}
		model.addAttribute("result", result);
		String temp_kw = energyDto.getFuture_kw();
		
		// 일사량 조회
		energyDto.setFuture_kw("1");
		List<EnergyDto> result2 = null;
		if(energyDto.getTime_flag().equals("month")){
			result2 = energyService.getTimeGraph_month(energyDto);
		}else if(energyDto.getTime_flag().equals("day")){
			result2 = energyService.getTimeGraph_day(energyDto);
		}
		model.addAttribute("result2", result2);
		energyDto.setFuture_kw(temp_kw);
		
		
		model.addAttribute("energyDto", energyDto);
		
		GenerateDto dto = dataService.selectGenerate();
		
		if(dto.getReg_date() != null)
			model.addAttribute("generateData", dto);
		
		return "forum/energy/timeGraph";
	}


	/**
	 * 이용자 > 과거 일사량 정보 > 시간 분포도 엑셀다운로드
	 * @param request
	 * @return
	 */
	@RequestMapping("timeExcel")
	public String timeExcel(EnergyDto energyDto, HttpServletRequest request, Model model)throws Exception{
		
		String start_year = energyDto.getStart_year();
		String start_month = energyDto.getStart_month();
		String end_year = energyDto.getEnd_year();
		String end_month = energyDto.getEnd_month();

		
		if(start_year == null || start_year == ""){ start_year = "2016"; }
		if(start_month == null || start_month == ""){ start_month = "1"; }
		if(end_year == null || end_year == ""){ end_year = "2016"; }
		if(end_month == null || end_month == ""){ end_month = "12"; }
		if(Integer.parseInt(start_month) < 10){
			start_month = "0"+start_month;
		}
		if(Integer.parseInt(end_month) < 10){
			end_month = "0"+end_month;
		}
		energyDto.setStart_ym(start_year+start_month);
		energyDto.setEnd_ym(end_year+end_month);
		
		if(energyDto.getArea_code()==null || energyDto.getArea_code()==""){
			energyDto.setArea_code("1");
		}
		if(energyDto.getTime_flag()==null || energyDto.getTime_flag()==""){
			energyDto.setTime_flag("month");
		}
		
		List<EnergyDto> result = null;
		if(energyDto.getTime_flag().equals("month")){
			result = energyService.getTimeGraph_month(energyDto);
		}else if(energyDto.getTime_flag().equals("day")){
			result = energyService.getTimeGraph_day(energyDto);
		}
		model.addAttribute("result", result);
		
		model.addAttribute("energyDto", energyDto);
		
		GenerateDto dto = dataService.selectGenerate();
		
		if(dto.getReg_date() != null)
			model.addAttribute("generateData", dto);

		// 현재 날짜 구하기
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		Date currentTime = new Date ( );
		String mTime = mSimpleDateFormat.format ( currentTime );
		model.addAttribute("currentDate", mTime);
		
		return "excelDownView";
	}
	
	/**
	 * 이용자 > 과거 일사량 정보 > 공간 분포도
	 * @param request
	 * @return
	 */
	@RequestMapping("spaceGraph")
	public String spaceGraph(EnergyDto energyDto, HttpServletRequest request, Model model)throws Exception{

		if(energyDto.getTime_year() == null || energyDto.getTime_year() == ""){ 
			energyDto.setTime_year("2016");
		}
		if(energyDto.getMaster_code()==null || energyDto.getMaster_code()==""){
			energyDto.setMaster_code("1");
		}
		
		// 발전량 조회
		List<EnergyDto> result = energyService.getSpaceGraph(energyDto);
		model.addAttribute("result", result);
		String temp_kw = energyDto.getFuture_kw();
		
		// 일사량 조회
		energyDto.setFuture_kw("1");
		List<EnergyDto> result2 = energyService.getSpaceGraph(energyDto);
		model.addAttribute("result2", result2);
		energyDto.setFuture_kw(temp_kw);
		
		model.addAttribute("energyDto", energyDto);
		
		return "forum/energy/spaceGraph";
	}
	
	/**
	 * 이용자 > 미래발전량 예측 > 미래발전량 정보
	 * @param request
	 * @return
	 */
	@RequestMapping("futureGraph")
	public String futureGraph(EnergyDto energyDto, HttpServletRequest request, Model model)throws Exception{
		
		if(energyDto.getArea_code()==null || energyDto.getArea_code()==""){
			// 저장된 쿠키조회
			String c_area_code = "";
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
			    for (Cookie cookie : cookies) {
			        if("c_area_code1".equals(cookie.getName())){
			        	c_area_code = cookie.getValue();
			        }
			    }
				energyDto.setArea_code(c_area_code);
			}else{
				energyDto.setArea_code("1");
			}
		}
		// 발전량 조회
		List<EnergyDto> result = energyService.getFutureGraph(energyDto);
		model.addAttribute("result", result);
		String temp_kw = energyDto.getFuture_kw();
		
		// 일사량 조회
		energyDto.setFuture_kw("1");
		List<EnergyDto> result2 = energyService.getFutureGraph(energyDto);
		model.addAttribute("result2", result2);
		
		energyDto.setFuture_kw(temp_kw);
		model.addAttribute("energyDto", energyDto);
		
		//미래발전량 조회
		//EnergyDto energyDto = EnergyService.selectEnergy();
		//System.out.println(energyDto.getFuture_val()+":::::::::::::::::::::::::::");

		// 지역 좌표 구하기
		EnergyDto areaDto = energyService.getAreaXY(energyDto.getArea_code());
		model.addAttribute("areaDto", areaDto);
		
		GenerateDto generateData = dataService.selectGenerate();
		if(generateData.getReg_date() != null)
			model.addAttribute("generateData", generateData);
		
		return "forum/energy/futureGraph";
	}
	
	/**
	 * 이용자 > 동네예보 ajax
	 * @param master_code
	 * @param reps
	 * @param req
	 * @throws Exception
	 */
	@RequestMapping(value="selectCodeList",method=RequestMethod.POST)
	public ModelAndView selectCodeList(HttpServletRequest request, EnergyDto energyDto) throws Exception{
		ModelAndView mav = new ModelAndView("jsonViewer");
		try {
					
			List<EnergyDto> result = energyService.selectCodeList(energyDto);
			mav.addObject("result", result);		
			
			mav.addObject("RESULT_CODE","SUCCESS");
			
		} catch (Exception e) {
			mav.addObject("RESULT_CODE","FAIL");
		}		
		
		return mav;
	}
	
}

