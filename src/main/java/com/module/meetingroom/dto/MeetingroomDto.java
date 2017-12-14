package com.module.meetingroom.dto;

import java.util.Date;

import com.common.base.BaseForm;

public class MeetingroomDto extends BaseForm{

	private static final long serialVersionUID = -637886717360492841L;

	/* 미팅룸 PK */
	private String meetingroom_key;
	
	/* 미팅룸 명 */
	private String name;

	/* 미팅룸 타입 */
	private String type;

	/* 미팅룸 크기 */
	private String size;

	/* 미팅룸 최대수용인원 */
	private int max_capacity;

	/* 미팅룸 주요시설 */
	private String facility;

	/* 미팅룸 가격(시간당) */
	private int hourly_price;

	/* 미팅룸 공개여부 */
	private int publish;

	/* 미팅룸 공개여부 한글*/
	private String publish_name;
	
	/* 미팅룸 메인이미지 */
	private String master_image;

	/* 미팅룸 등록일 */
	private Date reg_date;

	/* 미팅룸 수정일 */
	private Date mod_date;

	/* 미팅룸 삭제일 */
	private Date del_date;

	/* 미팅룸 등록자ID */
	private String reg_id;

	/* 미팅룸 수정자ID */
	private String mod_id;

	/* 미팅룸 삭제자ID */
	private String del_id;

	public String getMeetingroom_key() {
		return meetingroom_key;
	}

	public void setMeetingroom_key(String meetingroom_key) {
		this.meetingroom_key = meetingroom_key;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public int getMax_capacity() {
		return max_capacity;
	}

	public void setMax_capacity(int max_capacity) {
		this.max_capacity = max_capacity;
	}

	public String getFacility() {
		return facility;
	}

	public void setFacility(String facility) {
		this.facility = facility;
	}

	public int getHourly_price() {
		return hourly_price;
	}

	public void setHourly_price(int hourly_price) {
		this.hourly_price = hourly_price;
	}

	public int getPublish() {
		return publish;
	}

	public void setPublish(int publish) {
		this.publish = publish;
	}

	public String getPublish_name() {
		return publish_name;
	}

	public void setPublish_name(String publish_name) {
		this.publish_name = publish_name;
	}

	public String getMaster_image() {
		return master_image;
	}

	public void setMaster_image(String master_image) {
		this.master_image = master_image;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Date getMod_date() {
		return mod_date;
	}

	public void setMod_date(Date mod_date) {
		this.mod_date = mod_date;
	}

	public Date getDel_date() {
		return del_date;
	}

	public void setDel_date(Date del_date) {
		this.del_date = del_date;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public String getMod_id() {
		return mod_id;
	}

	public void setMod_id(String mod_id) {
		this.mod_id = mod_id;
	}

	public String getDel_id() {
		return del_id;
	}

	public void setDel_id(String del_id) {
		this.del_id = del_id;
	}
}

