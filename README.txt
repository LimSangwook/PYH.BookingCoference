-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.7.20-log - MySQL Community Server (GPL)
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 테이블 kric.menu_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `menu_info` (
  `MENU_CODE` varchar(30) NOT NULL COMMENT '메뉴코드',
  `PARENT_MENU_CODE` varchar(30) DEFAULT NULL COMMENT '부모메뉴코드',
  `MENU_LOCATION_CODE` varchar(255) DEFAULT NULL COMMENT '메뉴위치코드',
  `MENU_NAME` varchar(50) NOT NULL COMMENT '메뉴명',
  `MENU_KIND` varchar(30) NOT NULL COMMENT '메뉴유형',
  `ORDER_STEP` int(11) NOT NULL COMMENT '메뉴깊이',
  `ORDER_LEVEL` int(11) NOT NULL COMMENT '메뉴순서',
  `LINK_ADDRESS` varchar(255) DEFAULT NULL COMMENT '연결주소',
  `IS_NEW_WINDOW` varchar(1) NOT NULL COMMENT '새창열림여부',
  `STATUS` varchar(1) NOT NULL COMMENT '상태',
  `START_SHOW_DATE` varchar(10) DEFAULT NULL COMMENT '노출시작일시',
  `END_SHOW_DATE` varchar(10) DEFAULT NULL COMMENT '노출종료일시',
  `MENU_AUTH_LEVEL` varchar(30) DEFAULT NULL COMMENT '접근권한레벨',
  `BOARD_ID` int(11) DEFAULT NULL COMMENT '게시판아이디',
  `PAGE_SEQ` int(11) DEFAULT NULL COMMENT '페이지번호',
  PRIMARY KEY (`MENU_CODE`),
  KEY `FK_BOARD_CONFIG_TO_MENU_INFO` (`BOARD_ID`),
  KEY `FK_HTML_PAGE_TO_MENU_INFO` (`PAGE_SEQ`),
  CONSTRAINT `FK_BOARD_CONFIG_TO_MENU_INFO` FOREIGN KEY (`BOARD_ID`) REFERENCES `board_config` (`BOARD_ID`),
  CONSTRAINT `FK_HTML_PAGE_TO_MENU_INFO` FOREIGN KEY (`PAGE_SEQ`) REFERENCES `html_page` (`PAGE_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='메뉴정보';

-- 테이블 데이터 kric.menu_info:~89 rows (대략적) 내보내기
/*!40000 ALTER TABLE `menu_info` DISABLE KEYS */;
INSERT INTO `menu_info` (`MENU_CODE`, `PARENT_MENU_CODE`, `MENU_LOCATION_CODE`, `MENU_NAME`, `MENU_KIND`, `ORDER_STEP`, `ORDER_LEVEL`, `LINK_ADDRESS`, `IS_NEW_WINDOW`, `STATUS`, `START_SHOW_DATE`, `END_SHOW_DATE`, `MENU_AUTH_LEVEL`, `BOARD_ID`, `PAGE_SEQ`) VALUES
	('adminManage', 'user', 'user_adminManage', '관리자관리', 'menu', 2, 2, '/user/adminManage/userList.do', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('analytics', 'basic', 'basic_analytics', '통계관리', 'menu', 2, 3, '/basicset/basic/banner/bannserList.do', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('banner', 'basicset', 'basicset_basic_banner', '배너관리', 'menu', 3, 4, '/basicset/basic/banner/bannerList.do', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('basic', 'admin', 'basic', '홈페이지관리', 'menu', 1, 1, '/basic/basicInfo/basicInfo.do', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('basicInfo', 'basicset', 'basicset_basic_basicInfo', '기본정보', 'menu', 3, 1, '/basicset/basic/basicInfo/basicInfo.do', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('basicset', 'basic', 'basic_basicset', '기본설정', 'menu', 2, 1, '/basic/basicInfo/basicInfo.do', 'N', 'Y', NULL, NULL, NULL, NULL, NULL),
	('board', 'admin', 'board', '커뮤니티 관리', 'menu', 1, 5, '/board/noticeList/board01/boardList.do', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('board01', 'noticeList', 'board_noticeList_board01', '공지사항', 'board', 3, 1, '/board/noticeList/board01/boardList.do', 'N', 'Y', NULL, NULL, NULL, 2, NULL),
	('board02', 'noticeList', 'board_noticeList_board02', '보도자료', 'board', 3, 2, '/board/noticeList/board02/boardList.do', 'N', 'Y', NULL, NULL, NULL, 103, NULL),
	('board03', 'noticeList', 'board_noticeList_board03', '행사안내', 'menu', 3, 3, '/board/noticeList/board03/boardList.do', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('board04', 'noticeList', 'board_noticeList_board04', '갤러리', 'menu', 3, 4, '/board/noticeList/board01/boardList.do', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('board05', 'noticeList', 'board_noticeList_board05', '경영공시', 'menu', 3, 5, '/board/noticeList/board05/boardList.do', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('board06', 'infor', 'board_infor_board06', '자료실', 'menu', 3, 2, '', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('boardConfig', 'config', 'board_config_boardConfig', '게시판 목록', 'menu', 3, 1, '/board/config/boardConfigList.do', 'N', 'Y', NULL, NULL, NULL, NULL, NULL),
	('business', 'notify', 'notify_business', '경영공시', 'board', 2, 5, '/front/notify/business/boardList.do', 'N', 'Y', NULL, NULL, NULL, 116, NULL),
	('carbon', 'researching', 'researching_carbon', '탄소배출권', 'menu', 2, 2, '/front/researching/carbon/html.do', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('change', 'researching', 'researching_change', '기후변화적응', 'html', 2, 1, '/front/researching/change/html.do', 'N', 'Y', NULL, NULL, '9|8', NULL, 48),
	('climate', 'infor', 'board_infor_climate', '기후변화동향', 'menu', 3, 1, '', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('community', 'front', 'community', '고객마당', 'board', 1, 5, '/front/community/qna/boardList.do', 'N', 'Y', NULL, NULL, '9|8', 111, NULL),
	('config', 'board', 'board_config', '게시판관리', 'menu', 2, 2, '/board/config/boardConfigList.do', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('contents', 'basic', 'basic_contents', '메뉴관리', 'menu', 2, 2, '/basic/contents/contManage/htmlList.do', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('contManage', 'contents', 'basic_contents_contManage', '콘텐츠관리', 'menu', 3, 2, '/basic/contents/contManage/htmlList.do', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('data', 'front', 'data', '과거 일사량 정보', 'menu', 1, 4, '/front/data/timeGraph/timeGraph.do', 'N', 'D', NULL, NULL, NULL, NULL, NULL),
	('download', 'homepage', 'homepage_download', '홍보 브로셔 다운로드', 'html', 2, 1, '/front/homepage/download/html.do', 'N', 'Y', NULL, NULL, NULL, NULL, 46),
	('education', 'researching', 'researching_education', '기후변화교육', 'html', 2, 6, '/front/researching/education/html.do', 'N', 'Y', NULL, NULL, '9|8', NULL, 53),
	('energy', 'researching', 'researching_energy', '에너지효율', 'html', 2, 4, '/front/researching/energy/html.do', 'N', 'Y', NULL, NULL, '9|8', NULL, 51),
	('event', 'notify', 'notify_event', '행사안내', 'menu', 2, 3, '', 'N', 'Y', NULL, NULL, NULL, NULL, NULL),
	('file', 'information', 'information_file', '자료실', 'board', 2, 2, '/front/information/file/boardList.do', 'N', 'Y', NULL, NULL, '9|8', 110, NULL),
	('forum', 'information', 'information_forum', '대한민국탄소포럼', 'html', 2, 3, '/front/information/forum/html.do', 'N', 'Y', NULL, NULL, '9|8', NULL, 54),
	('future', 'front', 'future', '미래 발전량 예측', 'menu', 1, 5, '/front/future/futureData/futureGraph.do', 'N', 'D', NULL, NULL, NULL, NULL, NULL),
	('futureData', 'future', 'future_futureData', '미래 발전량 정보', 'menu', 2, 1, '/front/future/futureData/futureGraph.do', 'N', 'D', NULL, NULL, NULL, NULL, NULL),
	('genData', 'generate', 'generate_genData', '일사량 정보 등록', 'menu', 2, 1, '/generate/genData/genDataForm.do', 'N', 'D', NULL, NULL, NULL, NULL, NULL),
	('generate', 'admin', 'generate', '미래 발전량 정보 관리', 'menu', 1, 4, '/generate/genData/genDataForm.do', 'N', 'D', NULL, NULL, NULL, NULL, NULL),
	('greenhouse', 'researching', 'researching_greenhouse', '온실가스 감축', 'html', 2, 3, '/front/researching/greenhouse/html.do', 'N', 'Y', NULL, NULL, '9|8', NULL, 50),
	('greeting', 'researcher', 'researcher_greeting', '인사말', 'html', 2, 1, '/front/researcher/greeting/html.do', 'N', 'Y', NULL, NULL, '9|8', NULL, 57),
	('homepage', 'front', 'homepage', '홈페이지 사용법', 'menu', 1, 6, '/front/homepage/download/html.do', 'N', 'D', NULL, NULL, NULL, NULL, NULL),
	('htmlMenu', 'contents', 'basic_contents_htmlMenu', 'HTML', 'menu', 2, 1, '/basic/contents/htmlManage.do', 'N', 'D', NULL, NULL, '9|8', NULL, NULL),
	('idea', 'userList', 'board_userList_idea', '연구 아이디어', 'menu', 3, 2, '', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('info', 'front', 'info', '알림마당', 'menu', 1, 7, '/forum/info/notice/boardList.do', 'N', 'D', NULL, NULL, NULL, NULL, NULL),
	('infor', 'board', 'board_infor', '정보마당관리', 'menu', 2, 4, '', 'N', 'Y', NULL, NULL, NULL, NULL, NULL),
	('information', 'front', 'information', '정보마당', 'board', 1, 4, '/front/information/trend/boardList.do', 'N', 'Y', NULL, NULL, '9|8', 109, NULL),
	('international', 'researching', 'researching_international', '국제협력', 'html', 2, 5, '/front/researching/international/html.do', 'N', 'Y', NULL, NULL, '9|8', NULL, 52),
	('intro', 'front', 'intro', '사업소개', 'html', 1, 3, '/front/intro/service/html.do', 'N', 'D', NULL, NULL, NULL, NULL, 42),
	('introduce', 'researcher', 'researcher_introduce', '연구원소개', 'html', 2, 2, '/front/researcher/introduce/html.do', 'N', 'Y', NULL, NULL, NULL, NULL, 58),
	('manager', 'reservation', 'reservation_manager', '회의실관리', 'menu', 2, 1, '/reservation/manager/meetingroomList.do', 'N', 'Y', NULL, NULL, '9|8', 2, NULL),
	('media', 'notify', 'notify_media', '언론보도', 'board', 2, 2, '/front/notify/media/boardList.do', 'N', 'Y', NULL, NULL, NULL, 114, NULL),
	('meetingroom', 'userReserve', 'community_userReserve_meetingroom', '회의실안내', 'html', 3, 1, 'community/userReserve/meetingroom/html.do', 'N', 'Y', NULL, NULL, NULL, NULL, 56),
	('menu', 'contents', 'basic_contents_menu', '메뉴관리', 'menu', 3, 1, '/basic/contents/menu/menuManage.do', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('notice', 'info', 'info_notice', '공지사항', 'board', 2, 1, '/front/info/notice/boardList.do', 'N', 'Y', NULL, NULL, NULL, 2, NULL),
	('noticeList', 'board', 'board_noticeList', '알림마당관리', 'menu', 2, 1, '/board/noticeList/board01/boardList.do', 'N', 'Y', NULL, NULL, NULL, NULL, NULL),
	('notification', 'notify', 'notify_notification', '공지사항', 'board', 2, 1, '/front/notify/notification/boardList.do', 'N', 'Y', NULL, NULL, '9|8', 113, NULL),
	('notify', 'front', 'notify', '알림마당', 'board', 1, 6, '/front/notify/notification/boardList.do', 'N', 'Y', NULL, NULL, '9|8', 113, NULL),
	('organization', 'researcher', 'researcher_organization', '조직도', 'html', 2, 3, '/front/researcher/organization/html.do', 'N', 'Y', NULL, NULL, NULL, NULL, 59),
	('photo', 'notify', 'notify_photo', '사진자료', 'board', 2, 4, '/front/notify/photo/boardList.do', 'N', 'Y', NULL, NULL, NULL, 115, NULL),
	('policy', 'publication', 'publication_policy', '정책브리프', 'menu', 2, 3, '/front/publication/policy/boardList.do', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('popup', 'basicset', 'basicset_basic_popup', '팝업관리', 'menu', 3, 3, '/basicset/basic/popup/popupList.do', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('project', 'researching', 'researching_project', '연구과제수행', 'board', 2, 7, '/front/researching/project/boardList.do', 'N', 'Y', NULL, NULL, '9|8', 105, NULL),
	('publication', 'front', 'publication', '발간물', 'board', 1, 2, '/front/publication/researchReport/boardList.do', 'N', 'Y', NULL, NULL, '9|8', 106, NULL),
	('qanda', 'userList', 'board_userList_qanda', 'Q&A', 'menu', 3, 1, '', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('qna', 'community', 'community_qna', 'Q&A', 'board', 2, 1, '/front/community/qna/boardList.do', 'N', 'Y', NULL, NULL, '9|8', 111, NULL),
	('recruit', 'community', 'community_recruit', '상시인력모집', 'html', 2, 3, '/front/community/recruit/html.do', 'N', 'Y', NULL, NULL, '9|8', NULL, 55),
	('reference', 'info', 'info_reference', '자료실', 'board', 2, 2, '/front/info/reference/boardList.do', 'N', 'Y', NULL, NULL, NULL, 103, NULL),
	('research', 'admin', 'research', '연구관리', 'menu', 1, 4, '', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('research01', 'research', 'research_research01', '연구과제관리', 'menu', 2, 1, '', 'N', 'Y', NULL, NULL, NULL, NULL, NULL),
	('research02', 'research', 'research_research02', '연구보고서', 'menu', 2, 2, '', 'N', 'Y', NULL, NULL, NULL, NULL, NULL),
	('research03', 'research', 'research_research03', '용역보고서', 'menu', 2, 3, '', 'N', 'Y', NULL, NULL, NULL, NULL, NULL),
	('research04', 'research', 'research_research04', '정책브리프', 'menu', 2, 4, '', 'N', 'Y', NULL, NULL, NULL, NULL, NULL),
	('researcher', 'front', 'researcher', '연구원소개', 'html', 1, 7, '/front/researcher/greeting/html.do', 'N', 'Y', NULL, NULL, '9|8', NULL, 57),
	('researching', 'front', 'researching', '연구활동', 'html', 1, 1, '/front/researching/change/html.do', 'N', 'Y', NULL, NULL, '9|8', NULL, 48),
	('researchReport', 'publication', 'publication_researchReport', '연구보고서', 'board', 2, 1, '/front/publication/researchReport/boardList.do', 'N', 'Y', NULL, NULL, '9|8', 106, NULL),
	('reservation', 'admin', 'reservation', '회의실관리', 'menu', 1, 3, '', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('reserve', 'reservation', 'reservation_reserve', '신청관리', 'menu', 2, 2, '/reservation/reserve/reserveCalendarList.do', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('roadmap', 'researcher', 'researcher_roadmap', '찾아오시는길', 'menu', 2, 4, '', 'N', 'Y', NULL, NULL, NULL, NULL, NULL),
	('roomReserve', 'userReserve', 'community_userReserve_roomReserve', '회의실 예약', 'menu', 3, 2, '', 'N', 'Y', NULL, NULL, NULL, NULL, NULL),
	('seoInfo', 'basicset', 'basicset_basic_seoInfo', 'SEO정보', 'menu', 3, 2, '/basicset/basic/seoInfo/seoForm.do', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('service', 'intro', 'intro_service', '사업소개', 'html', 2, 1, '/front/intro/service/html.do', 'N', 'D', NULL, NULL, NULL, NULL, 42),
	('serviceReport', 'publication', 'publication_serviceReport', '용역보고서', 'board', 2, 2, '/front/publication/serviceReport/boardList.do', 'N', 'Y', NULL, NULL, '9|8', 107, NULL),
	('site', 'homepage', 'homepage_site', '사이트 맵', 'html', 2, 2, '/front/homepage/site/html.do', 'N', 'Y', NULL, NULL, NULL, NULL, 47),
	('solar', 'admin', 'solar', '과거 일사량 정보 관리', 'menu', 1, 3, '/solar/solarData/boardList.do', 'N', 'D', NULL, NULL, NULL, NULL, NULL),
	('solarData', 'solar', 'solar_solarData', '일사량 정보 등록', 'board', 2, 1, '/solar/solarData/boardList.do', 'N', 'D', NULL, NULL, NULL, 104, NULL),
	('spaceGraph', 'data', 'data_spaceGraph', '공간 분포도', 'menu', 2, 2, '/front/data/spaceGraph/spaceGraph.do', 'N', 'Y', NULL, NULL, NULL, NULL, NULL),
	('suggest', 'community', 'community_suggest', '연구아이디어제안', 'board', 2, 2, '/front/community/suggest/boardList.do', 'N', 'Y', NULL, NULL, '9|8', 112, NULL),
	('timeGraph', 'data', 'data_timeGraph', '시간 분포도', 'menu', 2, 1, '/front/data/timeGraph/timeGraph.do', 'N', 'Y', NULL, NULL, NULL, NULL, NULL),
	('trend', 'information', 'information_trend', '기후변화동향', 'board', 2, 1, '/front/information/trend/boardList.do', 'N', 'Y', NULL, NULL, '9|8', 109, NULL),
	('user', 'admin', 'user', '회원관리', 'menu', 1, 2, '/user/adminManage/userList.do', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('userList', 'board', 'board_userList', '고객마당관리', 'menu', 2, 3, '', 'N', 'Y', NULL, NULL, NULL, NULL, NULL),
	('userManager', 'user', 'user_userManager', '일반회원 관리', 'menu', 2, 1, '/user/adminManage/userList.do', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('userReserve', 'community', 'community_userReserve', '회의실예약', 'menu', 2, 4, '/front/reservation/reserve/reserveGuide.do', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL),
	('visitor', 'analytics', 'basic_analytics_visitor', '방문자', 'menu', 3, 1, '', 'N', 'Y', NULL, NULL, '9|8', NULL, NULL);
/*!40000 ALTER TABLE `menu_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;




-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.7.20-log - MySQL Community Server (GPL)
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 테이블 kric.meetingroom_file 구조 내보내기
CREATE TABLE IF NOT EXISTS `meetingroom_file` (
  `FILE_KEY` int(11) NOT NULL AUTO_INCREMENT COMMENT '파일고유번호',
  `MEETINGROOM_KEY` int(11) NOT NULL COMMENT '회의실고유번호',
  `ORDER_LEVEL` int(11) NOT NULL COMMENT '정렬순서',
  `REAL_FILE_NAME` varchar(255) NOT NULL COMMENT '실제파일명',
  `SAVE_FILE_NAME` varchar(255) NOT NULL COMMENT '저장파일명',
  `FILE_PATH` varchar(255) NOT NULL COMMENT '파일경로',
  `FILE_EXT` varchar(30) NOT NULL COMMENT '파일확장자명',
  `FILE_SIZE` int(11) NOT NULL COMMENT '파일사이즈',
  `FILE_DOWN_CNT` int(11) NOT NULL COMMENT '파일다운로드수',
  `IMAGE_WIDTH_SIZE` int(11) DEFAULT NULL COMMENT '이미지가로사이즈',
  `IMAGE_HEIGHT_SIZE` int(11) DEFAULT NULL COMMENT '이미지세로사이즈',
  `STATUS` varchar(1) NOT NULL COMMENT '상태',
  `REG_DATE` datetime NOT NULL COMMENT '등록일시',
  PRIMARY KEY (`FILE_KEY`,`MEETINGROOM_KEY`),
  KEY `FK_MEETINGROOM_TO_BOARD_FILE` (`MEETINGROOM_KEY`),
  CONSTRAINT `FK_MEETINGROOM_TO_BOARD_FILE` FOREIGN KEY (`MEETINGROOM_KEY`) REFERENCES `meetingroom_info` (`MEETINGROOM_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=347 DEFAULT CHARSET=utf8 COMMENT='미팅룸첨부파일정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 kric.meetingroom_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `meetingroom_info` (
  `MEETINGROOM_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `TYPE` varchar(30) DEFAULT NULL,
  `SIZE` int(3) DEFAULT NULL,
  `MAX_CAPACITY` int(3) DEFAULT NULL,
  `FACILITY` varchar(255) DEFAULT NULL,
  `HOURLY_PRICE` int(8) DEFAULT NULL,
  `PUBLISH` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `ATTACH_CNT` int(2) DEFAULT '0',
  `REG_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MOD_DATE` datetime DEFAULT NULL,
  `DEL_DATE` datetime DEFAULT NULL,
  `REG_ID` varchar(100) NOT NULL,
  `MOD_ID` varchar(100) DEFAULT NULL,
  `DEL_ID` varchar(100) DEFAULT NULL,
  `STATUS` char(1) NOT NULL DEFAULT 'Y' COMMENT 'Y: 등록 D:삭제',
  `COLOR` char(7) DEFAULT NULL,
  PRIMARY KEY (`MEETINGROOM_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Meeting Room Info\r\nAdded by Karl on 2017.12.13';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 kric.reservation_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `reservation_info` (
  `RESERVATION_KEY` int(11) NOT NULL AUTO_INCREMENT COMMENT '예약 키',
  `RESERVATION_PWD` varchar(30) NOT NULL COMMENT '예약 비밀번호',
  `NAME` varchar(20) NOT NULL COMMENT '예약자명',
  `FIRM_NAME` varchar(30) NOT NULL COMMENT '소속(기업명)',
  `PHONE_NUMBER_1` char(4) NOT NULL COMMENT '핸드폰번호1',
  `STATUS` char(1) NOT NULL DEFAULT 'W' COMMENT 'C:취소 W:대기 A:승인',
  `STATUS_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'STATUS 상태 변경 시간',
  `PHONE_NUMBER_2` char(4) NOT NULL COMMENT '핸드폰번호2',
  `PHONE_NUMBER_3` char(4) NOT NULL COMMENT '핸드폰번호3',
  `EMAIL_ADDR_1` varchar(20) NOT NULL COMMENT '이메일',
  `EMAIL_ADDR_2` varchar(20) DEFAULT NULL,
  `EMAIL_ADDR_3` varchar(20) DEFAULT NULL,
  `REQUEST` varchar(50) NOT NULL COMMENT '요청사항',
  `AGREE_TERM_PERSONAL_INFO` char(1) NOT NULL COMMENT '개인정보 수집 및 이용 동의',
  `TOTAL_PRICE` varchar(7) NOT NULL COMMENT '총가격',
  `TOTAL_TIMES` varchar(20) NOT NULL,
  `EVENT_NAME` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`RESERVATION_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 kric.reservation_mapp 구조 내보내기
CREATE TABLE IF NOT EXISTS `reservation_mapp` (
  `RESERVATION_KEY` int(11) NOT NULL,
  `MEETINGROOM_KEY` int(11) NOT NULL,
  `RESERVATION_DATE` date NOT NULL,
  `RESERVATION_TIME` char(2) NOT NULL COMMENT '예약시작시간부터 한시간 단위 EX) 08 = 08~09시, 09 = 09~10시, 14 =14~15시',
  `STATUS` char(1) NOT NULL DEFAULT 'W' COMMENT 'C:취소 W:대기 A:승인 (현재사용X)',
  `REG_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MOD_TIME` datetime DEFAULT NULL,
  `CANCEL_TIME` datetime DEFAULT NULL,
  UNIQUE KEY `MEETINGROOM_KEY_RESERVATION_DATE_RESERVATION_TIME` (`MEETINGROOM_KEY`,`RESERVATION_DATE`,`RESERVATION_TIME`),
  KEY `FK1_RESERVATION_KEY` (`RESERVATION_KEY`),
  CONSTRAINT `FK1_RESERVATION_KEY` FOREIGN KEY (`RESERVATION_KEY`) REFERENCES `reservation_info` (`RESERVATION_KEY`),
  CONSTRAINT `FK2_MEETINGROOM_KEY` FOREIGN KEY (`MEETINGROOM_KEY`) REFERENCES `meetingroom_info` (`MEETINGROOM_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
