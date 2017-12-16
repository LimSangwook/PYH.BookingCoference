package com.module.meetingroom.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.dao.CommonDao;
import com.common.util.CommonUtils;
import com.common.util.CommonWebUtils;
import com.module.file.dto.FileDto;
import com.module.meetingroom.dto.MeetingroomDto;
import com.module.meetingroom.service.MeetingroomService;
import com.module.reserve.dto.ReserveDto;
import com.module.user.dto.UserDto;

@Service("meetingroomService")
public class MeetingroomServiceImpl implements MeetingroomService{

	@Autowired
	private CommonDao commonDao;
		
	@SuppressWarnings("unchecked")
	@Override
	public  List<MeetingroomDto> getMeetingroomList(MeetingroomDto meetingroom) throws Exception {
		List<MeetingroomDto> meetingroomList = (List<MeetingroomDto>) commonDao.queryForObjectList("MEETINGROOM.getMeetingroomList", meetingroom);
		
		for (int i = 0; i < meetingroomList.size(); i++) {
			String meetingroomKey = meetingroomList.get(i).getMeetingroom_key();
			List<FileDto> fileList= (List<FileDto>) commonDao.queryForObjectList("MEETINGROOMFILE.getFileList", meetingroomKey);
			meetingroomList.get(i).setFileList(fileList);			
		}
		return meetingroomList;
	}

	@Override
	public MeetingroomDto getMeetingroomInfo(String meetingroomKey) throws Exception {
		MeetingroomDto result = (MeetingroomDto)commonDao.queryForObject("MEETINGROOM.getMeetingInfo", meetingroomKey);
		return result;
	}

	@Override
	public int insertMeetingroomInfo(HttpServletRequest request, MeetingroomDto meetingroom) throws Exception {
		// 세션정보조회
		UserDto sessionInfo = CommonWebUtils.getSession(request);
				
		meetingroom.setReg_id(sessionInfo.getUser_id());
		meetingroom.setIp(CommonUtils.getClientIpAddress(request));	
		
		Integer meetingroomKey = (Integer)commonDao.insert("MEETINGROOM.insertMeetingroomInfo", meetingroom);
		
		
		meetingroom.setMeetingroom_key(String.valueOf(meetingroomKey));
							
		// 첨부파일저장
		saveFileInfo(meetingroom);		
		
		// 게시판 첨부파일수 업데이트
		commonDao.update("MEETINGROOM.updateFileCount", meetingroom);
		
		return meetingroomKey;
	}

	@Override
	public void updateMeetingroomInfo(HttpServletRequest request, MeetingroomDto meetingroom) throws Exception {
		// 세션정보조회
		UserDto sessionInfo = CommonWebUtils.getSession(request);
		meetingroom.setMod_id(sessionInfo.getUser_id());
		
		commonDao.update("MEETINGROOM.updateMeetingroomInfo", meetingroom);
		
		// 첨부파일저장
		saveFileInfo(meetingroom);
		
		// 게시판 첨부파일수 업데이트
		commonDao.update("MEETINGROOM.updateFileCount", meetingroom);
	}

	@Override
	public void deleteMeetingroomInfo(HttpServletRequest request, MeetingroomDto meetingroom) throws Exception {
		// 세션정보조회
		UserDto sessionInfo = CommonWebUtils.getSession(request);
		meetingroom.setDel_id(sessionInfo.getUser_id());
		
		commonDao.update("MEETINGROOM.deleteMeetingroomInfo", meetingroom);		
		
	}

	@Override
	public ReserveDto getReserveActiveInfo() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 파일정보 처리
	private void saveFileInfo(MeetingroomDto meetingroom) {
		// 1) 첨부파일저장
		if(meetingroom.getFile() != null){
			FileDto file = null;
			List<FileDto> list = new ArrayList<FileDto>();
			int i=1;
			for (String data : meetingroom.getFile()) {
				file = new FileDto();
				String[] fileArr = StringUtils.split(data,"|");
				/**
				 * file[0] = real_file_name
				 * file[1] = save_file_name
				 * file[2] = file_path
				 * file[3] = file_size
				 * file[4] = image_width_size
				 * file[5] = image_height_size
				 * file[6] = file_ext
				 * */
				file.setReal_file_name(fileArr[0]);
				file.setSave_file_name(fileArr[1]);
				file.setFile_path(fileArr[2]);
				file.setFile_size(Integer.valueOf(fileArr[3]));
				file.setImage_width_size(Integer.valueOf(fileArr[4]));
				file.setImage_height_size(Integer.valueOf(fileArr[5]));
				file.setFile_ext(fileArr[6]);
				
				file.setOrder_level(i++);
				file.setMeetingroom_key(String.valueOf(meetingroom.getMeetingroom_key()));
				
				list.add(file);
			}			
			commonDao.batchInsert("MEETINGROOMFILE.insertFile", list);
		}
		// 2) 첨부파일 삭제데이터 처리
		if(meetingroom.getRemove() != null){
			commonDao.update("MEETINGROOMFILE.deleteFileInfo", meetingroom);
		}
		// 3) 첨부파일 일련번호 세팅		
		@SuppressWarnings("unchecked")
		List<FileDto> fileList = (List<FileDto>)commonDao.queryForObjectList("MEETINGROOMFILE.getFileList", meetingroom.getMeetingroom_key());
		if(fileList != null){
			int i=1;
			for (FileDto data : fileList) {
				data.setOrder_level(i++);			
			}	
			commonDao.batchUpdate("MEETINGROOMFILE.updateFileOrderLevel", fileList);
		}		
	}
	

}