package com.module.reserve.controller;

import java.util.List;

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

import com.baroservice.ws.BaroServiceSMS;
import com.common.util.CommonWebUtils;
import com.common.util.JProperties;
import com.common.util.PagingUtil;
import com.module.main.service.MainService;
import com.module.meetingroom.dto.MeetingroomDto;
import com.module.meetingroom.service.MeetingroomService;
import com.module.reserve.dto.ReserveDto;
import com.module.reserve.service.ReserveService;

@Controller
@RequestMapping({"/siteManage/**/reserve*","/front/**/reserve*"})
public class ReserveController extends CommonWebUtils{

	private Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	private MainService mainService;

	@Resource(name = "messageSourceAccessor")
	private MessageSourceAccessor message;

	@Autowired
	private MeetingroomService meetingroomService;

	@Autowired
	private ReserveService reserveService;
	

	/**
	 * 회의실 관리 목록 - 달력
	 * @param request
	 * @param meetingroom
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/siteManage/**/reserveCalendarList")
	public ModelAndView reserveCalendarList(HttpServletRequest request, ReserveDto reserve) throws Exception{
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".reserveCalendarList()");

		ModelAndView mav = new ModelAndView("siteManage/reserve/reserveCalendarList");
		try {
			List<ReserveDto> dailyEvent = reserveService.getReserveCalendarList(reserve);
			List<MeetingroomDto> meetingroomList = meetingroomService.getMeetingroomList();
			mav.addObject("meetingroomList", meetingroomList);
			
			mav.addObject("dailyEvent", dailyEvent);

		} catch (Exception e) {
			if(log.isDebugEnabled())log.debug(e.toString());
			redirectView(mav, message.getMessage(e.getMessage(), message.getMessage("ERROR.ACCESS.FAIL")), getReferer(request));
		}

		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".reserveCalendarList()");
		return mav;
	}

	/**
	 * 회의실 관리 목록 - 일반
	 * @param request
	 * @param meetingroom
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/siteManage/**/reserveCommonList")
	public ModelAndView reserveCommonList(HttpServletRequest request, ReserveDto reserve) throws Exception{
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".reserveCommonList()");

		ModelAndView mav = new ModelAndView("siteManage/reserve/reserveCommonList");
		try {
			reserve.setSearch_type(StringUtils.equals("adminManage", (String)request.getAttribute("menuCode"))?"admin":"member");
			List<ReserveDto> reservationList = reserveService.getReserveCommonList(reserve);
			List<MeetingroomDto> meetingroomList = meetingroomService.getMeetingroomList();
			mav.addObject("meetingroomList", meetingroomList);
			mav.addObject("theForm", reserve);
			mav.addObject("reservationList", reservationList);
			mav.addObject("userAuthLevelCodeList", mainService.getCommonCodeList("USER_AUTH_LEVEL"));
			mav.addObject("defaultParameter", getParameter(request,"&","meetingroom_key|order_type|order_column"));
			mav.addObject("pageNavigation", PagingUtil.printPageNavi(reserve, getParameter(request,"reserveCommonList.do?","reservationkey|page")));

		} catch (Exception e) {
			if(log.isDebugEnabled())log.debug(e.toString());
			redirectView(mav, message.getMessage(e.getMessage(), message.getMessage("ERROR.ACCESS.FAIL")), getReferer(request));
		}

		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".reserveCommonList()");
		return mav;
	}

	/**
	 * 예약 승인페이지
	 * @param request
	 * @param ReserveDto
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/siteManage/**/reserveApproval")
	public ModelAndView reserveApproval(HttpServletRequest request, ReserveDto reserve) throws Exception{
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".reserveApproval()");
		ModelAndView mav = new ModelAndView("siteManage/reserve/reserveApproval");

		try {
			ReserveDto result = reserveService.reserveApproval(reserve);
			mav.addObject("reserveInfo", result);

		} catch (Exception e) {
			if(log.isDebugEnabled())log.debug(e.toString());
			redirectView(mav, message.getMessage(e.getMessage(), message.getMessage("ERROR.ACCESS.FAIL")), getReferer(request));
		}

		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".reserveApproval()");
		return mav;
	}

	/**
	 * 회의실 예약 가이드
	 * @param request
	 * @param ReserveDto
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/front/**/reserveGuide")
	public ModelAndView reserveGuide(HttpServletRequest request, ReserveDto reserve) throws Exception{
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".reserveGuide()");

		ModelAndView mav = new ModelAndView("front/reservation/reserveGuide");

		try {
			mav.addObject("reserveInfo", reserve);

		} catch (Exception e) {
			if(log.isDebugEnabled())log.debug(e.toString());
			redirectView(mav, message.getMessage(e.getMessage(), message.getMessage("ERROR.ACCESS.FAIL")), getReferer(request));
		}

		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".reserveGuide()");
		return mav;
	}

	/**
	 * 회의실 예약 달력
	 * @param request
	 * @param ReserveDto
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/front/**/reserveCalendar")
	public ModelAndView reserveCalendar(HttpServletRequest request, ReserveDto reserve) throws Exception{
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".reserveCalendar()");

		ModelAndView mav = new ModelAndView("front/reservation/reserveCalendar");

		try {
			List<ReserveDto> eventList = reserveService.getReserveEventList(reserve);
			List<MeetingroomDto> meetingroomList = meetingroomService.getMeetingroomList();
			mav.addObject("meetingroomList", meetingroomList);
			mav.addObject("eventList", eventList);
			mav.addObject("reserve", reserve);

		} catch (Exception e) {
			if(log.isDebugEnabled())log.debug(e.toString());
			redirectView(mav, message.getMessage(e.getMessage(), message.getMessage("ERROR.ACCESS.FAIL")), getReferer(request));
		}

		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".reserveCalendar()");
		return mav;
	}

	/**
	 * 회의실 예약 달력
	 * @param request
	 * @param ReserveDto
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/front/**/reserveDetail")
	public ModelAndView reserveDetail(HttpServletRequest request, ReserveDto reserve) throws Exception{
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".reserveDetail()");

		ModelAndView mav = new ModelAndView("popup.layout");

		try {
			mav.addObject("detail", reserveService.getReservationDetail(reserve));

		} catch (Exception e) {
			if(log.isDebugEnabled())log.debug(e.toString());
			redirectView(mav, message.getMessage(e.getMessage(), message.getMessage("ERROR.ACCESS.FAIL")), getReferer(request));
		}

		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".reserveDetail()");
		return mav;
	}

	/**
	 * 회의실 /날짜/시간 선택
	 * @param request
	 * @param ReserveDto
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/front/**/reserveDateTime")
	public ModelAndView reserveDateTime(HttpServletRequest request, ReserveDto reserve) throws Exception{
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".reserveDateTime()");

		ModelAndView mav = new ModelAndView("front/reservation/reserveDateTime");
		try {
			List<ReserveDto> meetingrooms = reserveService.getMeetingroomStatusList(reserve);
			mav.addObject("meetingroomList", meetingrooms);

			if (reserve.getMeetingroom_key() == null || "".equals(reserve.getMeetingroom_key())) {
				reserve.setMeetingroom_key(meetingrooms.get(0).getMeetingroom_key());
			}

			mav.addObject("dateList", reserveService.getDateList(reserve));
			mav.addObject("timeList", reserveService.getTimeList(reserve));

			mav.addObject("reserveInfo", reserve);

		} catch (Exception e) {
			if(log.isDebugEnabled())log.debug(e.toString());
			redirectView(mav, message.getMessage(e.getMessage(), message.getMessage("ERROR.ACCESS.FAIL")), getReferer(request));
		}

		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".reserveDateTime()");
		return mav;
	}

	/**
	 * 회의실 /날짜/시간 선택
	 * @param request
	 * @param ReserveDto
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/front/**/reserveDateTimeJson")
	public ModelAndView reserveDateTimeJson(HttpServletRequest request, ReserveDto reserve) throws Exception{
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".reserveDateTimeJson()");

		ModelAndView mav = new ModelAndView("jsonViewer");

		try {
			mav.addObject("RESULT_CODE","SUCCESS");
			List<ReserveDto> meetingrooms = reserveService.getMeetingroomStatusList(reserve);
			mav.addObject("meetingroomList", meetingrooms);

			if (reserve.getMeetingroom_key() == null || "".equals(reserve.getMeetingroom_key())) {
				reserve.setMeetingroom_key(meetingrooms.get(0).getMeetingroom_key());
			}

			mav.addObject("dateList", reserveService.getDateList(reserve));
			mav.addObject("timeList", reserveService.getTimeList(reserve));

		} catch (Exception e) {
			mav.addObject("RESULT_CODE","FAIL");
			if(log.isWarnEnabled())log.warn(e.getMessage());
		}


		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".reserveDateTimeJson()");
		return mav;
	}

	/**
	 * 회의실 예약자 정보
	 * @param request
	 * @param ReserveDto
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/front/**/reserveUser")
	public ModelAndView reserveUser(HttpServletRequest request, ReserveDto reserve) throws Exception{
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".reserveUser()");

		ModelAndView mav = new ModelAndView("front/reservation/reserveUser");
		try {
			MeetingroomDto meetingroom = meetingroomService.getMeetingroomInfo(reserve.getMeetingroom_key());
			reserve.setMeetingroom_name(meetingroom.getName());
			reserve.setTotal_price(String.valueOf(meetingroom.getHourly_price() * reserve.getReservation_times().length));

			String totalTime = reserve.getReservation_times()[0] + ":00 ~ " + (Integer.parseInt(reserve.getReservation_times()[reserve.getReservation_times().length - 1])+ 1) + ":00";
			reserve.setTotal_times(totalTime);

			mav.addObject("reserveInfo", reserve);

		} catch (Exception e) {
			if(log.isDebugEnabled())log.debug(e.toString());
			redirectView(mav, message.getMessage(e.getMessage(), message.getMessage("ERROR.ACCESS.FAIL")), getReferer(request));
		}

		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".reserveUser()");
		return mav;
	}

	/**
	 * 회의실 예약 저장
	 * @param request
	 * @param ReserveDto
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/front/**/reserveSave")
	public ModelAndView reserveSave(HttpServletRequest request, ReserveDto reserve) throws Exception{
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".reserveSave()");

		ModelAndView mav = new ModelAndView();
		String returnPage = "";

		try {
			int reservationKey = reserveService.reserveSave(reserve);
			reserve.setReservation_key(String.valueOf(reservationKey));
			returnPage = "reserveStatus.do?reservation_key="+reservationKey+"&name="+reserve.getName()+"&reservation_pwd="+reserve.getReservation_pwd();

			redirectView(mav, "", returnPage);
		} catch (Exception e) {
			if(log.isDebugEnabled())log.debug(e.toString());
			redirectView(mav, message.getMessage(e.getMessage(), message.getMessage("ERROR.ACCESS.FAIL")), getReferer(request));
		}

		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".reserveSave()");
		return mav;
	}

	/**
	 * 회의실 예약 결과
	 * @param request
	 * @param ReserveDto
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/front/**/reserveStatus")
	public ModelAndView reserveStatus(HttpServletRequest request, ReserveDto reserve) throws Exception{
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".reserveStatus()");

		ModelAndView mav = new ModelAndView("front/reservation/reserveStatus");
		try {
			mav.addObject("reserveInfo", reserveService.getReservationResult(reserve));

		} catch (Exception e) {
			if(log.isDebugEnabled())log.debug(e.toString());
			redirectView(mav, message.getMessage(e.getMessage(), message.getMessage("ERROR.ACCESS.FAIL")), getReferer(request));
		}

		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".reserveStatus()");
		return mav;
	}

	/**
	 * 회의실 예약 결과
	 * @param request
	 * @param ReserveDto
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/front/**/reserveResult")
	public ModelAndView reserveResult(HttpServletRequest request, ReserveDto reserve) throws Exception{
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".reserveResult()");

		ModelAndView mav = new ModelAndView("front/reservation/reserveResult");
		try {
			mav.addObject("reserveInfo", reserveService.getReservationResult(reserve));

		} catch (Exception e) {
			if(log.isDebugEnabled())log.debug(e.toString());
			redirectView(mav, message.getMessage(e.getMessage(), message.getMessage("ERROR.ACCESS.FAIL")), getReferer(request));
		}

		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".reserveResult()");
		return mav;
	}

	/**
	 * 회의실 예약 결과조회 로그인
	 * @param request
	 * @param ReserveDto
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/front/**/reserveStatusLogin")
	public ModelAndView reserveStatusLogin(HttpServletRequest request, ReserveDto reserve) throws Exception{
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".reserveStatusLogin()");

		ModelAndView mav = new ModelAndView("front/reservation/reserveLogin");

		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".reserveStatusLogin()");
		return mav;
	}

	/**
	 * 예약 현황보기
	 * @param request
	 * @param ReserveDto
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/siteManage/**/reserveUpdate")
	public ModelAndView reserveUpdate(HttpServletRequest request, ReserveDto reserve) throws Exception{
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".reserveUpdate()");

		ModelAndView mav = new ModelAndView();
		String returnPage = "";

		try {
			reserveService.reserveUpdate(reserve);
			ReserveDto result = reserveService.reserveApproval(reserve);
			returnPage = "reserveApproval.do?reservation_key="+reserve.getReservation_key();
			result.setMessage(result.getStatus(), result.getName(), result.getStatus_name(), result.getMeetingroom_name(), result.getTotal_price(), result.getReservation_date(), result.getTotal_times());
			
		    if (reserve.getStatus() != null && !"W".equals(reserve.getStatus())) {
				String CERTKEY = JProperties.getString("BARO.SMS.WS.CERTKEY"); //인증키
				String CorpNum = JProperties.getString("BARO.SMS.WS.CORPNUM");		//연계사업자 사업자번호 ('-' 제외, 10자리) 		
				String SenderID = JProperties.getString("BARO.SMS.WS.SENDERID");		//연계사업자 담당자 아이디
				String FromNumber = JProperties.getString("BARO.SMS.WS.FROMNUMBER");;		//발신번호
				String ToName = result.getName();			//수신자명
				String ToNumber = result.getPhone_number_1()+result.getPhone_number_2()+result.getPhone_number_3();		//수신번호
				String Contents = result.getMessage();		//내용
				String SendDT = "";			//전송일시 (yyyyMMddHHmmss 형식) (빈 문자열 입력시 즉시 전송, 미래일자 입력시 예약 전송)
				String RefKey = "";			//연동사부여 전송키

				BaroServiceSMS BS_SMS = new BaroServiceSMS();
				String Result = BS_SMS.getBaroServiceSMSSoap().sendMessage(CERTKEY, CorpNum, SenderID, FromNumber, ToName, ToNumber, Contents, SendDT, RefKey);
				
				System.out.println("Result====> " + Result);
			}	
		    
			redirectView(mav, "", returnPage);
		} catch (Exception e) {
			if(log.isDebugEnabled())log.debug(e.toString());
			redirectView(mav, message.getMessage(e.getMessage(), message.getMessage("ERROR.ACCESS.FAIL")), getReferer(request));
		}

		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".reserveUpdate()");
		return mav;
	}


}
