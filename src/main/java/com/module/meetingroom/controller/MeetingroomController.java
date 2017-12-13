package com.module.meetingroom.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.openide.NotifyDescriptor.Exception;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.common.util.CommonWebUtils;
import com.module.menu.dto.MenuDto;

@Controller
public class MeetingroomController extends CommonWebUtils{
	private Logger log = LoggerFactory.getLogger(getClass());

	@Resource(name = "messageSourceAccessor")
	private MessageSourceAccessor message;
	
	
	/**
	 * 메뉴관리
	 * @param request
	 * @param  
	 * @return
	 * @throws Exception
	 */	
	@RequestMapping("/siteManage/test")
	public ModelAndView test(HttpServletRequest request, MenuDto menu){
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".adminLogin()");
		
		System.out.print("?????????????????????????????????????");
		
		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".adminLogin()");
		return null;
	}
}