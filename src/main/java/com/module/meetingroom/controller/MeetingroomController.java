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
import org.springframework.web.servlet.ModelAndView;

import com.common.util.CommonUtils;
import com.common.util.CommonWebUtils;
import com.common.util.PagingUtil;
import com.module.meetingroom.dto.MeetingroomDto;
import com.module.meetingroom.service.MeetingroomService;
import com.module.museum.dto.MuseumDto;
import com.module.user.dto.UserDto;

@Controller
@RequestMapping("/siteManage/**/meetingroom*")
public class MeetingroomController extends CommonWebUtils{

	private Logger log = LoggerFactory.getLogger(getClass());

	@Resource(name = "messageSourceAccessor")
	private MessageSourceAccessor message;
	
	@Autowired
	private MeetingroomService meetingroomService;
	
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
	 * 회의실 관리 수정 폼
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
			if(StringUtils.isNotBlank(meetingroom.getMeetingroom_key())){
				MeetingroomDto result = (MeetingroomDto)meetingroomService.getMeetingroomInfo(meetingroom.getMeetingroom_key());
				if(result != null){
					result.setAct("update");
					meetingroom = (MeetingroomDto)result.clone();
				} else {
					throw new Exception("ERROR.NO.DATA");
				}
			}
			
			mav.addObject("theForm", meetingroom);
			mav.addObject("defaultParameter", getParameter(request,"?","meetingroom_key"));
			
		} catch (Exception e) {
			if(log.isDebugEnabled())log.debug(e.toString());
			redirectView(mav, message.getMessage(e.getMessage(), message.getMessage("ERROR.ACCESS.FAIL")), getReferer(request));
		}			
		
		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".meetingroomForm()");
		return mav;
	}
}