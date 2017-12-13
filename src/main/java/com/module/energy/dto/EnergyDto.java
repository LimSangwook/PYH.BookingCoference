package com.module.energy.dto;

import com.common.base.BaseForm;

public class EnergyDto extends BaseForm{
	private static final long serialVersionUID = 1L;
	
	String master_code;	// 마스터 지역코드
	String master_name;	// 마스터 지역명
	String area_code;	// 지역코드
	String area_name;	// 지역명
	String area_code1;	// 지역코드
	String area_name1;	// 지역명
	String area_code2;	// 지역코드
	String area_name2;	// 지역명
	String sub_name;	// 서브 지역명
	String total_area;	// 토탈 지역명
	String future_time;	// 미래 발전양 시간
	String future_val;	// 미래 발전양
	String future_kw;	// 미래 발전양(발전용량)
	String future_radio;// 미래 발전양(발전용량 라디오 선택값)
	String kw_input;	// 미래 발전양(발전용량 라디오 선택값-기타)
	String time_year;	// 년도
	String time_month;	// 월
	String time_date;	// 년월
	String start_year;	// 시작 년도
	String start_month;	// 시작 월
	String start_ym;	// 시작 년월
	String end_year;	// 끝 년도
	String end_month;	// 끝 월
	String end_ym;	// 끝 년월
	String time_day;	// 일
	String time_val;	// 과거 일사량
	String time_flag;	// 과기 일사량 flag(month,day);
	String val_x;	// 좌표 X값
	String val_y;	// 좌표 Y값
	
	public String getArea_code() {
		return area_code;
	}
	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}
	public String getArea_name() {
		return area_name;
	}
	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}
	public String getFuture_val() {
		return future_val;
	}
	public void setFuture_val(String future_val) {
		this.future_val = future_val;
	}
	public String getTime_year() {
		return time_year;
	}
	public void setTime_year(String time_year) {
		this.time_year = time_year;
	}
	public String getTime_month() {
		return time_month;
	}
	public void setTime_month(String time_month) {
		this.time_month = time_month;
	}
	public String getTime_day() {
		return time_day;
	}
	public void setTime_day(String time_day) {
		this.time_day = time_day;
	}
	public String getTime_val() {
		return time_val;
	}
	public void setTime_val(String time_val) {
		this.time_val = time_val;
	}
	public String getStart_year() {
		return start_year;
	}
	public void setStart_year(String start_year) {
		this.start_year = start_year;
	}
	public String getStart_month() {
		return start_month;
	}
	public void setStart_month(String start_month) {
		this.start_month = start_month;
	}
	public String getEnd_year() {
		return end_year;
	}
	public void setEnd_year(String end_year) {
		this.end_year = end_year;
	}
	public String getEnd_month() {
		return end_month;
	}
	public void setEnd_month(String end_month) {
		this.end_month = end_month;
	}
	public String getTime_date() {
		return time_date;
	}
	public void setTime_date(String time_date) {
		this.time_date = time_date;
	}
	public String getStart_ym() {
		return start_ym;
	}
	public void setStart_ym(String start_ym) {
		this.start_ym = start_ym;
	}
	public String getEnd_ym() {
		return end_ym;
	}
	public void setEnd_ym(String end_ym) {
		this.end_ym = end_ym;
	}
	public String getFuture_time() {
		return future_time;
	}
	public void setFuture_time(String future_time) {
		this.future_time = future_time;
	}
	public String getFuture_kw() {
		return future_kw;
	}
	public void setFuture_kw(String future_kw) {
		this.future_kw = future_kw;
	}
	public String getFuture_radio() {
		return future_radio;
	}
	public void setFuture_radio(String future_radio) {
		this.future_radio = future_radio;
	}
	public String getMaster_code() {
		return master_code;
	}
	public void setMaster_code(String master_code) {
		this.master_code = master_code;
	}
	public String getMaster_name() {
		return master_name;
	}
	public void setMaster_name(String master_name) {
		this.master_name = master_name;
	}
	public String getSub_name() {
		return sub_name;
	}
	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}
	public String getTime_flag() {
		return time_flag;
	}
	public void setTime_flag(String time_flag) {
		this.time_flag = time_flag;
	}
	public String getTotal_area() {
		return total_area;
	}
	public void setTotal_area(String total_area) {
		this.total_area = total_area;
	}
	public String getArea_code1() {
		return area_code1;
	}
	public void setArea_code1(String area_code1) {
		this.area_code1 = area_code1;
	}
	public String getArea_name1() {
		return area_name1;
	}
	public void setArea_name1(String area_name1) {
		this.area_name1 = area_name1;
	}
	public String getArea_code2() {
		return area_code2;
	}
	public void setArea_code2(String area_code2) {
		this.area_code2 = area_code2;
	}
	public String getArea_name2() {
		return area_name2;
	}
	public void setArea_name2(String area_name2) {
		this.area_name2 = area_name2;
	}
	public String getKw_input() {
		return kw_input;
	}
	public void setKw_input(String kw_input) {
		this.kw_input = kw_input;
	}
	public String getVal_x() {
		return val_x;
	}
	public void setVal_x(String val_x) {
		this.val_x = val_x;
	}
	public String getVal_y() {
		return val_y;
	}
	public void setVal_y(String val_y) {
		this.val_y = val_y;
	}

	
}
