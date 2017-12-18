package com.module.reserve.dto;

import java.util.Date;

import com.common.base.BaseForm;

public class ReserveDto extends BaseForm{
	
	private static final long serialVersionUID = 8698486905931897878L;
		
	/* 예약키 */
	private String reservation_key;
	
	/* 미팅룸 키 */
	private String meetingroom_key;
	
	/* 미팅룸 이름 */
	private String meetingroom_name;
	
	/* 예약가능여부 */
	private String room_availability;
	
	/* 예약일자 */
	private String reservation_date;
	
	/* 예약 비밀번호 */
	private String reservation_pwd;
	
	/* 상태 */
	private String status;
	
	/* 상태명 */
	private String status_name;
	
	/* 상태 */
	private Date status_time;
	
	/* 예약자 명*/
	private String name;
	
	/* 소속/기업명 */
	private String firm_name;
	
	/* 핸드폰1 */
	private String phone_number_1;
	
	/* 핸드폰2 */
	private String phone_number_2;
	
	/* 핸드폰3 */
	private String phone_number_3;
	
	/* 이메일 */
	private String email_addr_1;
	
	/* 이메일 */
	private String email_addr_2;
	
	/* 이메일 */
	private String email_addr_3;
	
	/* 요창사항 */
	private String request;
	
	/* 개인정보수집 및 활용 동의 여부 */
	private String agree_term_personal_info;
	
	/* 등록일자 */
	private Date reg_time;
	
	/* 수정일자 */
	private Date mod_time;
	
	/* 취소일자 */
	private Date cancel_time;
	
	/* 총가격 */
	private String total_price;
	
	/* godtkaud */
	private String event_name;
	
	
	private String reservation_year;
	
	private String reservation_month;
	
	private String reservation_day;
	
	private String reservation_dayofweek;
	
	private String date_availability;
	
	private String selected_date;
	
	private String image;
	
	
	private String reservation_time;
	private String[] reservation_times;
	private String total_times;
	private String reservation_term;
	private String time_availability;
	private String color;

	public String getReservation_key() {
		return reservation_key;
	}

	public void setReservation_key(String reservation_key) {
		this.reservation_key = reservation_key;
	}

	public String getMeetingroom_key() {
		return meetingroom_key;
	}

	public void setMeetingroom_key(String meetingroom_key) {
		this.meetingroom_key = meetingroom_key;
	}
	
	public String getMeetingroom_name() {
		return meetingroom_name;
	}

	public void setMeetingroom_name(String meetingroom_name) {
		this.meetingroom_name = meetingroom_name;
	}

	public String getReservation_date() {
		return reservation_date;
	}

	
	public String getRoom_availability() {
		return room_availability;
	}

	public void setRoom_availability(String room_availability) {
		this.room_availability = room_availability;
	}

	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}

	public String getReservation_pwd() {
		return reservation_pwd;
	}

	public void setReservation_pwd(String reservation_pwd) {
		this.reservation_pwd = reservation_pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFirm_name() {
		return firm_name;
	}

	public void setFirm_name(String firm_name) {
		this.firm_name = firm_name;
	}

	public String getPhone_number_1() {
		return phone_number_1;
	}

	public void setPhone_number_1(String phone_number_1) {
		this.phone_number_1 = phone_number_1;
	}

	public String getPhone_number_2() {
		return phone_number_2;
	}

	public void setPhone_number_2(String phone_number_2) {
		this.phone_number_2 = phone_number_2;
	}

	public String getPhone_number_3() {
		return phone_number_3;
	}

	public void setPhone_number_3(String phone_number_3) {
		this.phone_number_3 = phone_number_3;
	}
	

	public String getEmail_addr_1() {
		return email_addr_1;
	}

	public void setEmail_addr_1(String email_addr_1) {
		this.email_addr_1 = email_addr_1;
	}

	public String getEmail_addr_2() {
		return email_addr_2;
	}

	public void setEmail_addr_2(String email_addr_2) {
		this.email_addr_2 = email_addr_2;
	}
	
	public String getEmail_addr_3() {
		return email_addr_3;
	}

	public void setEmail_addr_3(String email_addr_3) {
		this.email_addr_3 = email_addr_3;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getAgree_term_personal_info() {
		return agree_term_personal_info;
	}

	public void setAgree_term_personal_info(String agree_term_personal_info) {
		this.agree_term_personal_info = agree_term_personal_info;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
		
	public String getStatus_name() {
		return status_name;
	}

	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}

	public Date getStatus_time() {
		return status_time;
	}

	public void setStatus_time(Date status_time) {
		this.status_time = status_time;
	}

	public Date getReg_time() {
		return reg_time;
	}

	public void setReg_time(Date reg_time) {
		this.reg_time = reg_time;
	}

	public Date getMod_time() {
		return mod_time;
	}

	public void setMod_time(Date mod_time) {
		this.mod_time = mod_time;
	}

	public Date getCancel_time() {
		return cancel_time;
	}

	public void setCancel_time(Date cancel_time) {
		this.cancel_time = cancel_time;
	}
	
	public String getTotal_price() {
		return total_price;
	}

	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}

	public String getReservation_year() {
		return reservation_year;
	}

	public void setReservation_year(String reservation_year) {
		this.reservation_year = reservation_year;
	}

	public String getReservation_month() {
		return reservation_month;
	}

	public void setReservation_month(String reservation_month) {
		this.reservation_month = reservation_month;
	}

	public String getReservation_day() {
		return reservation_day;
	}

	public void setReservation_day(String reservation_day) {
		this.reservation_day = reservation_day;
	}

	public String getReservation_dayofweek() {
		return reservation_dayofweek;
	}

	public void setReservation_dayofweek(String reservation_dayofweek) {
		this.reservation_dayofweek = reservation_dayofweek;
	}

	public String getDate_availability() {
		return date_availability;
	}

	public void setDate_availability(String date_availability) {
		this.date_availability = date_availability;
	}

	public String getSelected_date() {
		return selected_date;
	}

	public void setSelected_date(String selected_date) {
		this.selected_date = selected_date;
	}

	public String getReservation_time() {
		return reservation_time;
	}

	public void setReservation_time(String reservation_time) {
		this.reservation_time = reservation_time;
	}

	public String getReservation_term() {
		return reservation_term;
	}

	public void setReservation_term(String reservation_term) {
		this.reservation_term = reservation_term;
	}

	public String getTime_availability() {
		return time_availability;
	}

	public void setTime_availability(String time_availability) {
		this.time_availability = time_availability;
	}

	public String[] getReservation_times() {
		return reservation_times;
	}

	public void setReservation_times(String[] reservation_times) {
		this.reservation_times = reservation_times;
	}

	public String getTotal_times() {
		return total_times;
	}

	public void setTotal_times(String total_times) {
		this.total_times = total_times;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getEvent_name() {
		return event_name;
	}

	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}	
	
	
	
	
}