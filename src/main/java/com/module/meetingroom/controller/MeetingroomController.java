package com.module.meetingroom.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.common.util.CommonWebUtils;
import com.common.util.PagingUtil;
import com.module.board.dto.BoardConfigDto;
import com.module.file.service.FileService;
import com.module.meetingroom.dto.MeetingroomDto;
import com.module.meetingroom.service.MeetingroomService;
import com.module.user.dto.UserDto;

@Controller
@RequestMapping("/siteManage/**/meetingroom*")
public class MeetingroomController extends CommonWebUtils{

	private Logger log = LoggerFactory.getLogger(getClass());

	@Resource(name = "messageSourceAccessor")
	private MessageSourceAccessor message;
	
	@Autowired
	private MeetingroomService meetingroomService;
	
	@Autowired
	private FileService fileService;
	
	/**
	 * 회의실 관리 목록
	 * @param request
	 * @param meetingroom
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/siteManage/**/meetingroomList")
	public ModelAndView meetingroomList(HttpServletRequest request, MeetingroomDto meetingroom) throws Exception{
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".meetingroomList()");
		
		ModelAndView mav = new ModelAndView("siteManage/meetingroom/meetingroomList");
		try {
			meetingroom.setSearch_type(StringUtils.equals("manager", (String)request.getAttribute("menuCode"))?"admin":"member");
			mav.addObject("result", meetingroomService.getMeetingroomList(meetingroom));
			mav.addObject("theForm", meetingroom);
			mav.addObject("pageNavigation", PagingUtil.printPageNavi(meetingroom, getParameter(request,"meetingroomList.do?","meetingroom_id|page")));
			
		} catch (Exception e) {
			if(log.isWarnEnabled())log.warn(e.getMessage());
		}
		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".meetingroomList()");
		return mav;
	}
	
	/**
	 * 회의실 관리 생성/수정 폼
	 * @param request
	 * @param boardDto 
	 * @return
	 * @throws Exception
	 */	
	@RequestMapping
	public ModelAndView meetingroomForm(HttpServletRequest request, MeetingroomDto meetingroom) throws Exception{
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".meetingroomForm()");
		
		ModelAndView mav = new ModelAndView("siteManage/meetingroom/meetingroomForm");
		
		try {
			// 첨부파일속성정보	
			BoardConfigDto boardConfig = new BoardConfigDto();
			boardConfig.setEditor_use_yn("N");
			boardConfig.setFile_count_limit(999);
			boardConfig.setFile_size_limit(999);
			boardConfig.setFile_ext_limit("jpeg|jpg|png|gif");
			
			if(StringUtils.isNotBlank(meetingroom.getMeetingroom_key())){
				MeetingroomDto result = (MeetingroomDto)meetingroomService.getMeetingroomInfo(meetingroom.getMeetingroom_key());
				if(result != null){
					result.setAct("update");
					mav.addObject("fileList", fileService.getMeetingroomFileList(result.getMeetingroom_key()));
					meetingroom = (MeetingroomDto)result.clone();
				} else {
					throw new Exception("ERROR.NO.DATA");
				}
			}
			
			mav.addObject("theForm", meetingroom);
			mav.addObject("boardConfig", boardConfig);
			mav.addObject("defaultParameter", getParameter(request,"?","meetingroom_key"));
			
		} catch (Exception e) {
			if(log.isDebugEnabled())log.debug(e.toString());
			redirectView(mav, message.getMessage(e.getMessage(), message.getMessage("ERROR.ACCESS.FAIL")), getReferer(request));
		}			
		
		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".meetingroomForm()");
		return mav;
	}
	
	/**
	 * 회의실 등록/수정/삭제
	 * @param HttpServletRequest
	 * @param boardDto 
	 * @return ModelAndView 
	 * @throws Exception
	 */	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView meetingroomSave(HttpServletRequest request, MeetingroomDto meetingroom) throws Exception{
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".meetingroomSave()");
		
		ModelAndView mav = new ModelAndView();		
		String returnPage = "";
		String addParam = "";
		if(StringUtils.isNotBlank(request.getParameter("meetingroom_key")))
			addParam = "meetingroom_key="+request.getParameter("meetingroom_key");
			
		try {			
			// 글등록 
			if(StringUtils.equals("insert", meetingroom.getAct())){
				int meetingroomKey = meetingroomService.insertMeetingroomInfo(request, meetingroom);
				returnPage = "meetingroomForm.do?meetingroom_key="+meetingroomKey;
				
			// 수정	
			}else if(StringUtils.equals("update", meetingroom.getAct())){
				meetingroomService.updateMeetingroomInfo(request, meetingroom);
				returnPage = "meetingroomList.do?meetingroom_key="+meetingroom.getMeetingroom_key()+(StringUtils.isNotBlank(addParam)?"&"+addParam:"");
				
			}else if(StringUtils.equals("delete", meetingroom.getAct())){
				meetingroomService.deleteMeetingroomInfo(request, meetingroom);
				returnPage = "meetingroomList.do"+(StringUtils.isNotBlank(addParam)?"?"+addParam:"");
			}
				
			redirectView(mav, "", returnPage);
			
		} catch (Exception e) {
			e.printStackTrace();
			redirectView(mav, message.getMessage(e.getMessage(), message.getMessage("ERROR.ACCESS.FAIL")), getReferer(request));
		}		
		
		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".meetingroomSave()");
		return mav;
	}
}