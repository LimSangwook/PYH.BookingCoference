package com.module.reserve.dto;

import java.util.Date;

import com.common.base.BaseForm;

public class ReserveDateDto extends BaseForm{
	
	private static final long serialVersionUID = -4266000785970167477L;

	private String reservation_date;
	
	private String reservation_year;
	
	private String reservation_month;
	
	private String reservation_day;
	
	private String reservation_dayofweek;
	
	private String availability;
	
	private String selected_date;
	
	public String getReservation_date() {
		return reservation_date;
	}

	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
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

	public String getAvailability() {
		return availability;
	}

	public void setAvailability(String availability) {
		this.availability = availability;
	}

	public String getSelected_date() {
		return selected_date;
	}

	public void setSelected_date(String selected_date) {
		this.selected_date = selected_date;
	}
	
	
}