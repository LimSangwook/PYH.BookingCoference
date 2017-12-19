package com.module.main.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.common.util.CommonUtils;
import com.common.util.CommonWebUtils;
import com.module.banner.service.BannerService;
import com.module.data.dto.GenerateDto;
import com.module.data.service.DataService;
import com.module.energy.dto.EnergyDto;
import com.module.energy.service.EnergyService;
import com.module.main.service.MainService;
import com.module.museum.dto.MuseumDto;
import com.module.museum.service.MuseumService;
import com.module.popup.dto.PopupDto;
import com.module.popup.service.PopupService;
import com.module.reserve.dto.ReserveDto;
import com.module.reserve.service.ReserveService;
import com.module.seo.dto.SeoDto;
import com.module.seo.service.SeoService;

@Controller
public class MainController extends CommonWebUtils{

	@Resource(name = "messageSourceAccessor")
	private MessageSourceAccessor message;
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	/*@Value("#{config['SITE.NAME']}")
	String siteName;*/
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private SeoService seoService;
	
	@Autowired
	private MuseumService museumService;
	
	@Autowired
	private BannerService bannerService;
	
	@Autowired
	private PopupService popupService;

	@Autowired
	private EnergyService energyService;

	@Autowired
	private DataService dataService;
	
	@Autowired
	private ReserveService reserveService;
	
	
	/**
	 * 박물관 포털 메인
	 * */
	@RequestMapping("portal/index")
	public ModelAndView index(HttpServletRequest request) throws Exception{
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".portal_index()");
		
		ModelAndView mav = new ModelAndView("main.layout");
		
		try {			
			
			// 메인배너 (박물관목록)
			mav.addObject("mainBannerMuseumList", bannerService.getMainBannerList("BANNER_MAIN_TOP_PORTAL"));
			// 휴관일안내
			mav.addObject("mainClosedOnList", bannerService.getMainBannerList("CLOSED_ON"));
			// 관련사이트
			mav.addObject("mainRelatedList", bannerService.getMainBannerList("RELATED_SITE"));
			
			// 팝업목록			
			List<PopupDto> popupList = popupService.getMainActivePopupList();
			for (PopupDto data : popupList) {
				if(StringUtils.isNotBlank(getCookie(request, "DISABLED_POPUP_"+data.getPopup_key()))){
					data.setIs_show_yn("N");
				}	
			}
			mav.addObject("mainPopupList", popupList);
			
					
		} catch (Exception e) {
			if(log.isWarnEnabled())log.warn(e.getMessage());
		}
		
		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".portal_index()");
		return mav;
	}	
	
	/**
	 * 신재생에너지 메인
	 * */
	@RequestMapping("front/index")
	public ModelAndView forumIndex(HttpServletRequest request) throws Exception{
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".front_index()");
		
		ModelAndView mav = new ModelAndView("front.main.layout");
		
		try {			
			// 팝업목록			
			List<PopupDto> popupList = popupService.getMainActivePopupList();
			for (PopupDto data : popupList) {
				if(StringUtils.isNotBlank(getCookie(request, "DISABLED_POPUP_"+data.getPopup_key()))){
					data.setIs_show_yn("N");
				}	
			}
			mav.addObject("mainPopupList", popupList);
			
			/* 현재 상중하단 사진은 가져오기만 하고 뿌리지않음 */
			// 메인 상단비주얼
			mav.addObject("mainTopVisual", bannerService.getMainBannerList("MAIN_TOP"));
			// 메인 중앙비주얼
			mav.addObject("mainMidVisual", bannerService.getMainBannerList("MAIN_MID"));
			// 메인 하단비주얼
			mav.addObject("mainBotVisual", bannerService.getMainBannerList("MAIN_BOT"));

			// 발전량 예측
			EnergyDto energyDto = new EnergyDto();
			if(energyDto.getArea_code()==null || energyDto.getArea_code()==""){
				energyDto.setArea_code("1");
			}
			List<EnergyDto> result = energyService.getFutureGraph(energyDto);
			mav.addObject("result", result);

			GenerateDto generateData = dataService.selectGenerate();
			mav.addObject("generateData", generateData);

			List<ReserveDto> dailyEvent = reserveService.getReserveCalendarList();
			mav.addObject("dailyEvent", dailyEvent);
			
		} catch (Exception e) {
			if(log.isWarnEnabled())log.warn(e.toString());
		}
		
		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".front_index()");
		return mav;
	}
	
	/**
	 * 박물관 템플릿 메인
	 * */
	@RequestMapping("museum/index")
	public ModelAndView museumMain(HttpServletRequest request, @RequestParam Map<String, String> params) throws Exception{
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".museumMain()");
		
		ModelAndView mav = new ModelAndView("museum/museum/index");
		
		try {			
			
			MuseumDto museumInfo = museumService.getMuseumActiveInfo(params.get("museum_no"));
			if(museumInfo != null){
				// 박물관 기본정보
				mav.addObject("museumResult", museumInfo);
				// 서브메뉴목록
				mav.addObject("museumMenuList", museumService.getMuseumMenuContList(museumInfo.getMuseum_no()));
			} else {
				throw new Exception("ERROR.NO.DATA");	
			}
			
		} catch (Exception e) {
			if(log.isWarnEnabled())log.warn(e.toString());
			redirectView(mav, message.getMessage(e.getMessage(), message.getMessage("ERROR.ACCESS.FAIL")) , getReferer(request));
		}
		
		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".museumMain()");
		return mav;
	}
	
	/**
	 * 박물관 템플릿 서브
	 * */
	@RequestMapping("museum/sub")
	public ModelAndView museumSub(HttpServletRequest request, @RequestParam Map<String, String> params) throws Exception{
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".museumSub()");
		
		ModelAndView mav = new ModelAndView("museum/museum/sub");
		
		try {			
			
			MuseumDto museumInfo = museumService.getMuseumActiveInfo(params.get("museum_no"));
			if(museumInfo != null){
				// 박물관 기본정보
				mav.addObject("museumResult", museumInfo);
				// 서브메뉴목록
				mav.addObject("museumMenuList", museumService.getMuseumMenuContList(museumInfo.getMuseum_no()));
				// 서브내용은 CommonInterceptor.java 제공... frontMuseumContentInfo
				
			} else {
				throw new Exception("ERROR.NO.DATA");	
			}
			
		} catch (Exception e) {
			if(log.isWarnEnabled())log.warn(e.toString());
			redirectView(mav, message.getMessage(e.getMessage(), message.getMessage("ERROR.ACCESS.FAIL")) , getReferer(request));
		}
		
		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".museumSub()");
		return mav;
	}
	
	/**
	 * 관리자 메인
	 * */
	@RequestMapping("/siteManage/index")
	public ModelAndView adminMain() throws Exception{
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".adminMain()");
		
		ModelAndView mav = new ModelAndView();
		
		try {			
			String currDate = CommonUtils.getCurrentDateTime("yyyy년MM월dd일");
			mav.addObject("currDate", currDate);
			mav.addObject("currWeek", CommonUtils.getWeekName(Integer.parseInt(StringUtils.substring(currDate, 0, 4)), Integer.parseInt(StringUtils.substring(currDate, 5, 7)), Integer.parseInt(StringUtils.substring(currDate, 8, 10))));
						
		} catch (Exception e) {
			if(log.isWarnEnabled())log.warn(e.getMessage());
		}
		
		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".adminMain()");
		return mav;
	}
	
	/**
	 * 사이트 기본정보
	 * @param request
	 * @param boardDto 
	 * @return ModelAndView
	 * @throws Exception
	 */	
	@RequestMapping("/siteManage/**/basicInfo")
	public ModelAndView basicInfo(HttpServletRequest request) throws Exception{
		if(log.isDebugEnabled())log.debug("[START] " + this.getClass().getName() + ".basicInfo()");
		
		ModelAndView mav = new ModelAndView("siteManage/basic/basicInfo");
		try {
			long fileSize =  mainService.getFileTotalUseSize();
			long dbSize = mainService.getDataBaseTotalUseSize();
			
			// 개설일
			SeoDto seoInfo = seoService.getSeoInfo();
			mav.addObject("openDay", seoInfo.getOpen_day());
			// 회원수
			//mav.addObject("memberTotalCount", mainService.getMemberTotalCount());
			// 작성글수
			mav.addObject("postTotalCount", mainService.getPostTotalCount());
			// 답변글수
			mav.addObject("replyTotalCount", mainService.getPostReplyTotalCount());
			// 총사용량
			mav.addObject("totalUseSize", CommonUtils.convertFileSize(fileSize+dbSize));
			// 파일사용량			
			mav.addObject("fileUseSize", CommonUtils.convertFileSize(fileSize));
			// DB사용량			
			mav.addObject("dataBaseUseSize", CommonUtils.convertFileSize(dbSize));			
			// SMS 잔여포인트
			//mav.addObject("smsPoint", mainService.getSmsPoint());
			
		} catch (Exception e) {
			if(log.isWarnEnabled())log.warn(e.getMessage());
		}		
		
		if(log.isDebugEnabled())log.debug("[END] " + this.getClass().getName() + ".basicInfo()");
		return mav;
	}
}
