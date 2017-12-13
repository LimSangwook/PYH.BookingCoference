package com.module.reserve.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.common.util.CommonWebUtils;
import com.module.reserve.dto.ReserveDto;
import com.module.reserve.service.ReserveService;

@Controller
@RequestMapping({"/siteManage/**/reserve*","/front/**/reserve*"})
public class ReserveController extends CommonWebUtils{

	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Resource(name = "messageSourceAccessor")
	private MessageSourceAccessor message;
	
	@Autowired
	private ReserveService reserveService;
	
	/**
	 * 포펌/박람회 정보 등록/수정폼
	 * @param request
	 * @param ReserveDto 
	 * @return ModelAndView
	 * @throws Exception
	 */	
	@RequestMapping("/siteManage/**/reserveForm")
	public ModelAndView reserveForm(HttpServletRequest request, ReserveDto reserve) throws Exception{
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".reserveForm()");
		
		ModelAndView mav = new ModelAndView("siteManage/reserve/reserveForm");
		
		try {
		/*
			if(StringUtils.isNotBlank(reserve.getReserve_key())){
				ForumDto result = (ForumDto)forumService.getForumInfo(forum.getForum_key());
				if(result != null){
					result.setAct("update");
					forum = (ForumDto)result.clone();
				} else {
					throw new Exception("ERROR.NO.DATA");
				}
			}
		*/	
			mav.addObject("reserveInfo", reserve);			
			
		} catch (Exception e) {
			if(log.isDebugEnabled())log.debug(e.toString());
			redirectView(mav, message.getMessage(e.getMessage(), message.getMessage("ERROR.ACCESS.FAIL")), getReferer(request));
		}		
		
		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".reserveForm()");
		return mav;
	}
	
//	/**
//	 * 포펌/박람회 정보
//	 * @param request
//	 * @param ReserveDto 
//	 * @return ModelAndView
//	 * @throws Exception
//	 */	
//	@RequestMapping("/forum/**/forumDetail")
//	public ModelAndView forumDetail(HttpServletRequest request, ForumDto forum) throws Exception{
//		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".forumDetail()");
//		
//		ModelAndView mav = new ModelAndView("forum/forum/forumDetail");
//		
//		try {
//						
//			ForumDto result = (ForumDto)forumService.getForumInfo(forum.getForum_key());
//			if(result == null)throw new Exception("ERROR.NO.DATA");
//			mav.addObject("forumInfo", result);			
//			
//		} catch (Exception e) {
//			if(log.isDebugEnabled())log.debug(e.toString());
//			redirectView(mav, message.getMessage(e.getMessage(), message.getMessage("ERROR.ACCESS.FAIL")), getReferer(request));
//		}		
//		
//		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".forumDetail()");
//		return mav;
//	}
//	
//	/**
//	 * 포펌/박람회 정보 등록/수정/삭제
//	 * @param request
//	 * @param ReserveDto 
//	 * @return ModelAndView
//	 * @throws Exception
//	 */	
//	@RequestMapping(value="/siteManage/**/forumSave", method=RequestMethod.POST)
//	public ModelAndView forumSave(HttpServletRequest request, ForumDto forum) throws Exception{
//		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".forumSave()");
//		
//		ModelAndView mav = new ModelAndView();
//		String returnUrl = "";
//		try {
//			if(StringUtils.equals("insert", forum.getAct())){
//				returnUrl = "forumList.do";
//				forumService.insertForumInfo(forum);	
//			} else if(StringUtils.equals("update", forum.getAct())){
//				returnUrl = "forumForm.do?forum_key="+forum.getForum_key();
//				forumService.updateForumInfo(forum);
//			} else if(StringUtils.equals("delete", forum.getAct())){
//				returnUrl = "forumList.do";
//				forumService.deleteForumInfo(forum);
//			}
//			
//			redirectView(mav, "", returnUrl);
//
//		} catch (Exception e) {
//			if(log.isDebugEnabled())log.debug(e.toString());
//			redirectView(mav, message.getMessage(e.getMessage(), message.getMessage("ERROR.ACCESS.FAIL")), getReferer(request));
//		}		
//		
//		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".forumSave()");
//		return mav;
//	}
//	
//	/**
//	 * 포펌/박람회 목록 
//	 * @param request
//	 * @param ReserveDto 
//	 * @return ModelAndView
//	 * @throws Exception
//	 */	
//	@RequestMapping
//	public ModelAndView forumList(HttpServletRequest request, ForumDto forum) throws Exception{
//		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".forumList()");
//		
//		ModelAndView mav = new ModelAndView();
//		
//		try {			
//			
//			String siteGubun = (String)request.getAttribute("siteGubun");	
//			if(StringUtils.equals("siteManage", siteGubun)){
//				// 전체 포럼 조회
//				forum.setSearch_type("1");
//			} else {
//				// 지난 포럼/박람회 조회
//				forum.setSearch_type("2");
//			}			
//			mav.addObject("result", forumService.getForumList(forum));
//			mav.addObject("theForm", forum);			
//			mav.setViewName(siteGubun+"/forum/forumList");
//			
//		} catch (Exception e) {
//			if(log.isDebugEnabled())log.debug(e.toString());
//			redirectView(mav, message.getMessage(e.getMessage(), message.getMessage("ERROR.ACCESS.FAIL")), getReferer(request));
//		}		
//		
//		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".forumList()");
//		return mav;
//	}


}
