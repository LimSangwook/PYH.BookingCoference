<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="com.module.data.dto.GenerateDto"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.*"%>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLConnection" %>
<%@page import="com.module.energy.dto.EnergyDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/comm/taglib.jsp"%>
<%
	GenerateDto generateDto = (GenerateDto)request.getAttribute("generateData");
	EnergyDto areaDto = (EnergyDto)request.getAttribute("areaDto");
	
	// 누적 일사량 구하기
	List<EnergyDto> energyDtoList2 = (List<EnergyDto>)request.getAttribute("result2");
	Double t_sum0 = 0.0;
	Double t_sum1 = 0.0;
	Double t_sum2 = 0.0;
	Double t_sum3 = 0.0;
	Double t_sum4 = 0.0;
	Double t_sum5 = 0.0;
	Double t_sum6 = 0.0;
	Double t_sum7 = 0.0;
	Double t_sum8 = 0.0;
	Double t_sum9 = 0.0;
	Double t_sum10 = 0.0;
	Double t_sum11 = 0.0;
	Double t_sum12 = 0.0;
	Double t_sum13 = 0.0;
	Double t_sum14 = 0.0;
	Double t_sum15 = 0.0;
	Double t_sum16 = 0.0;
	Double t_sum17 = 0.0;
	Double t_sum18 = 0.0;
	Double t_sum19 = 0.0;
	Double t_sum20 = 0.0;
	Double t_sum21 = 0.0;
	Double t_sum22 = 0.0;
	Double t_sum23 = 0.0;
	Double t_sum24 = 0.0;
	Double t_sum25 = 0.0;
	Double t_sum26 = 0.0;
	Double t_sum27 = 0.0;
	Double t_sum28 = 0.0;
	Double t_sum29 = 0.0;
	Double t_sum30 = 0.0;
	Double t_sum31 = 0.0;
	Double t_sum32 = 0.0;
	Double t_sum33 = 0.0;
	Double t_sum34 = 0.0;
	Double t_sum35 = 0.0;
	Double t_sum36 = 0.0;
	Double total_t_sum = 0.0;
	if(energyDtoList2.size() > 0){
		t_sum0 = Double.parseDouble(energyDtoList2.get(0).getFuture_val());
		t_sum1 = Double.parseDouble(energyDtoList2.get(1).getFuture_val());
		t_sum2 = Double.parseDouble(energyDtoList2.get(2).getFuture_val());
		t_sum3 = Double.parseDouble(energyDtoList2.get(3).getFuture_val());
		t_sum4 = Double.parseDouble(energyDtoList2.get(4).getFuture_val());
		t_sum5 = Double.parseDouble(energyDtoList2.get(5).getFuture_val());
		t_sum6 = Double.parseDouble(energyDtoList2.get(6).getFuture_val());
		t_sum7 = Double.parseDouble(energyDtoList2.get(7).getFuture_val());
		t_sum8 = Double.parseDouble(energyDtoList2.get(8).getFuture_val());
		t_sum9 = Double.parseDouble(energyDtoList2.get(9).getFuture_val());
		t_sum10 = Double.parseDouble(energyDtoList2.get(10).getFuture_val());
		t_sum11 = Double.parseDouble(energyDtoList2.get(11).getFuture_val());
		t_sum12 = Double.parseDouble(energyDtoList2.get(12).getFuture_val());
		t_sum13 = Double.parseDouble(energyDtoList2.get(13).getFuture_val());
		t_sum14 = Double.parseDouble(energyDtoList2.get(14).getFuture_val());
		t_sum15 = Double.parseDouble(energyDtoList2.get(15).getFuture_val());
		t_sum16 = Double.parseDouble(energyDtoList2.get(16).getFuture_val());
		t_sum17 = Double.parseDouble(energyDtoList2.get(17).getFuture_val());
		t_sum18 = Double.parseDouble(energyDtoList2.get(18).getFuture_val());
		t_sum19 = Double.parseDouble(energyDtoList2.get(19).getFuture_val());
		t_sum20 = Double.parseDouble(energyDtoList2.get(20).getFuture_val());
		t_sum21 = Double.parseDouble(energyDtoList2.get(21).getFuture_val());
		t_sum22 = Double.parseDouble(energyDtoList2.get(22).getFuture_val());
		t_sum23 = Double.parseDouble(energyDtoList2.get(23).getFuture_val());
		t_sum24 = Double.parseDouble(energyDtoList2.get(24).getFuture_val());
		t_sum25 = Double.parseDouble(energyDtoList2.get(25).getFuture_val());
		t_sum26 = Double.parseDouble(energyDtoList2.get(26).getFuture_val());
		t_sum27 = Double.parseDouble(energyDtoList2.get(27).getFuture_val());
		t_sum28 = Double.parseDouble(energyDtoList2.get(28).getFuture_val());
		t_sum29 = Double.parseDouble(energyDtoList2.get(29).getFuture_val());
		t_sum30 = Double.parseDouble(energyDtoList2.get(30).getFuture_val());
		t_sum31 = Double.parseDouble(energyDtoList2.get(31).getFuture_val());
		t_sum32 = Double.parseDouble(energyDtoList2.get(32).getFuture_val());
		t_sum33 = Double.parseDouble(energyDtoList2.get(33).getFuture_val());
		t_sum34 = Double.parseDouble(energyDtoList2.get(34).getFuture_val());
		t_sum35 = Double.parseDouble(energyDtoList2.get(35).getFuture_val());
		t_sum36 = Double.parseDouble(energyDtoList2.get(36).getFuture_val());
		total_t_sum = t_sum0+t_sum1+t_sum2+t_sum3+t_sum4+t_sum5+t_sum6+t_sum7+t_sum8+t_sum9+t_sum10+t_sum11+t_sum12+t_sum13+t_sum14+t_sum15+t_sum16+t_sum17+t_sum18+t_sum19+t_sum20+t_sum21+t_sum22+t_sum23+t_sum24+t_sum25+t_sum26+t_sum27+t_sum28+t_sum29+t_sum30+t_sum31+t_sum32+t_sum33+t_sum34+t_sum35+t_sum36;
	}


	// 발전량 구하기
	List<EnergyDto> energyDtoList = (List<EnergyDto>)request.getAttribute("result");
	Double sum0 = 0.0;
	Double sum1 = 0.0;
	Double sum2 = 0.0;
	Double sum3 = 0.0;
	Double sum4 = 0.0;
	Double sum5 = 0.0;
	Double sum6 = 0.0;
	Double sum7 = 0.0;
	Double sum8 = 0.0;
	Double sum9 = 0.0;
	Double sum10 = 0.0;
	Double sum11 = 0.0;
	Double sum12 = 0.0;
	Double sum13 = 0.0;
	Double sum14 = 0.0;
	Double sum15 = 0.0;
	Double sum16 = 0.0;
	Double sum17 = 0.0;
	Double sum18 = 0.0;
	Double sum19 = 0.0;
	Double sum20 = 0.0;
	Double sum21 = 0.0;
	Double sum22 = 0.0;
	Double sum23 = 0.0;
	Double sum24 = 0.0;
	Double sum25 = 0.0;
	Double sum26 = 0.0;
	Double sum27 = 0.0;
	Double sum28 = 0.0;
	Double sum29 = 0.0;
	Double sum30 = 0.0;
	Double sum31 = 0.0;
	Double sum32 = 0.0;
	Double sum33 = 0.0;
	Double sum34 = 0.0;
	Double sum35 = 0.0;
	Double sum36 = 0.0;
	Double total_sum = 0.0;
	if(energyDtoList.size() > 0){
		sum0 = Double.parseDouble(energyDtoList.get(0).getFuture_val());
		sum1 = Double.parseDouble(energyDtoList.get(1).getFuture_val());
		sum2 = Double.parseDouble(energyDtoList.get(2).getFuture_val());
		sum3 = Double.parseDouble(energyDtoList.get(3).getFuture_val());
		sum4 = Double.parseDouble(energyDtoList.get(4).getFuture_val());
		sum5 = Double.parseDouble(energyDtoList.get(5).getFuture_val());
		sum6 = Double.parseDouble(energyDtoList.get(6).getFuture_val());
		sum7 = Double.parseDouble(energyDtoList.get(7).getFuture_val());
		sum8 = Double.parseDouble(energyDtoList.get(8).getFuture_val());
		sum9 = Double.parseDouble(energyDtoList.get(9).getFuture_val());
		sum10 = Double.parseDouble(energyDtoList.get(10).getFuture_val());
		sum11 = Double.parseDouble(energyDtoList.get(11).getFuture_val());
		sum12 = Double.parseDouble(energyDtoList.get(12).getFuture_val());
		sum13 = Double.parseDouble(energyDtoList.get(13).getFuture_val());
		sum14 = Double.parseDouble(energyDtoList.get(14).getFuture_val());
		sum15 = Double.parseDouble(energyDtoList.get(15).getFuture_val());
		sum16 = Double.parseDouble(energyDtoList.get(16).getFuture_val());
		sum17 = Double.parseDouble(energyDtoList.get(17).getFuture_val());
		sum18 = Double.parseDouble(energyDtoList.get(18).getFuture_val());
		sum19 = Double.parseDouble(energyDtoList.get(19).getFuture_val());
		sum20 = Double.parseDouble(energyDtoList.get(20).getFuture_val());
		sum21 = Double.parseDouble(energyDtoList.get(21).getFuture_val());
		sum22 = Double.parseDouble(energyDtoList.get(22).getFuture_val());
		sum23 = Double.parseDouble(energyDtoList.get(23).getFuture_val());
		sum24 = Double.parseDouble(energyDtoList.get(24).getFuture_val());
		sum25 = Double.parseDouble(energyDtoList.get(25).getFuture_val());
		sum26 = Double.parseDouble(energyDtoList.get(26).getFuture_val());
		sum27 = Double.parseDouble(energyDtoList.get(27).getFuture_val());
		sum28 = Double.parseDouble(energyDtoList.get(28).getFuture_val());
 		sum29 = Double.parseDouble(energyDtoList.get(29).getFuture_val());
		sum30 = Double.parseDouble(energyDtoList.get(30).getFuture_val());
		sum31 = Double.parseDouble(energyDtoList.get(31).getFuture_val());
		sum32 = Double.parseDouble(energyDtoList.get(32).getFuture_val());
		sum33 = Double.parseDouble(energyDtoList.get(33).getFuture_val());
		sum34 = Double.parseDouble(energyDtoList.get(34).getFuture_val());
		sum35 = Double.parseDouble(energyDtoList.get(35).getFuture_val());
		sum36 = Double.parseDouble(energyDtoList.get(36).getFuture_val());
		total_sum = sum0+sum1+sum2+sum3+sum4+sum5+sum6+sum7+sum8+sum9+sum10+sum11+sum12+sum13+sum14+sum15+sum16+sum17+sum18+sum19+sum20+sum21+sum22+sum23+sum24+sum25+sum26+sum27+sum28+sum29+sum30+sum31+sum32+sum33+sum34+sum35+sum36;
	}
	
	// 현재 날짜 구하기
	DecimalFormat df = new DecimalFormat("00");
	Calendar currentCalendar = Calendar.getInstance();
	String s_year = Integer.toString(currentCalendar.get(Calendar.YEAR));
	String s_month = df.format(currentCalendar.get(Calendar.MONTH) + 1);
	String s_day = df.format(currentCalendar.get(Calendar.DATE));
	int i_month = Integer.parseInt(s_month);
	
	// 금일 예상발전량 구하기
	Double y_sum0 = 0.0;
	Double y_sum1 = 0.0;
	Double y_sum2 = 0.0;
	Double y_sum3 = 0.0;
	Double y_sum4 = 0.0;
	Double y_sum5 = 0.0;
	Double y_sum6 = 0.0;
	Double y_sum7 = 0.0;
	Double y_sum8 = 0.0;
	Double y_sum9 = 0.0;
	Double y_sum10 = 0.0;
	Double y_sum11 = 0.0;
	Double y_sum12 = 0.0;
	Double y_sum13 = 0.0;
	Double y_sum14 = 0.0;
	Double y_sum15 = 0.0;
	Double y_sum16 = 0.0;
	Double y_sum17 = 0.0;
	Double y_sum18 = 0.0;
	Double y_sum19 = 0.0;
	Double y_sum20 = 0.0;
	Double y_sum21 = 0.0;
	Double y_sum22 = 0.0;
	Double y_sum23 = 0.0;
	Double y_sum24 = 0.0;
	Double y_sum25 = 0.0;
	Double y_sum26 = 0.0;
	Double y_sum27 = 0.0;
	Double y_sum28 = 0.0;
	Double y_sum29 = 0.0;
	Double y_sum30 = 0.0;
	Double y_sum31 = 0.0;
	Double y_sum32 = 0.0;
	Double y_sum33 = 0.0;
	Double y_sum34 = 0.0;
	Double y_sum35 = 0.0;
	Double y_sum36 = 0.0;
	Double y_total_sum = 0.0;
	Double month = 0.0;
	Double month_temp = 0.0; 
	String month_cal = "";

	if(i_month==1) { month = Double.parseDouble(generateDto.getMonth1()); month_cal = generateDto.getMonth1_cal(); month_temp = Double.parseDouble(generateDto.getMonth1_1()); }
	else if(i_month==2){ month = Double.parseDouble(generateDto.getMonth2()); month_cal = generateDto.getMonth2_cal(); month_temp = Double.parseDouble(generateDto.getMonth2_1()); }
	else if(i_month==3){ month = Double.parseDouble(generateDto.getMonth3()); month_cal = generateDto.getMonth3_cal(); month_temp = Double.parseDouble(generateDto.getMonth3_1()); }
	else if(i_month==4){ month = Double.parseDouble(generateDto.getMonth4()); month_cal = generateDto.getMonth4_cal(); month_temp = Double.parseDouble(generateDto.getMonth4_1()); }
	else if(i_month==5){ month = Double.parseDouble(generateDto.getMonth5()); month_cal = generateDto.getMonth5_cal(); month_temp = Double.parseDouble(generateDto.getMonth5_1()); }
	else if(i_month==6){ month = Double.parseDouble(generateDto.getMonth6()); month_cal = generateDto.getMonth6_cal(); month_temp = Double.parseDouble(generateDto.getMonth6_1()); }
	else if(i_month==7){ month = Double.parseDouble(generateDto.getMonth7()); month_cal = generateDto.getMonth7_cal(); month_temp = Double.parseDouble(generateDto.getMonth7_1()); }
	else if(i_month==8){ month = Double.parseDouble(generateDto.getMonth8()); month_cal = generateDto.getMonth8_cal(); month_temp = Double.parseDouble(generateDto.getMonth8_1()); }
	else if(i_month==9){ month = Double.parseDouble(generateDto.getMonth9()); month_cal = generateDto.getMonth9_cal(); month_temp = Double.parseDouble(generateDto.getMonth9_1()); }
	else if(i_month==10){ month = Double.parseDouble(generateDto.getMonth10()); month_cal = generateDto.getMonth10_cal(); month_temp = Double.parseDouble(generateDto.getMonth10_1()); }
	else if(i_month==11){ month = Double.parseDouble(generateDto.getMonth11()); month_cal = generateDto.getMonth11_cal(); month_temp = Double.parseDouble(generateDto.getMonth11_1()); }
	else if(i_month==12){ month = Double.parseDouble(generateDto.getMonth12()); month_cal = generateDto.getMonth12_cal(); month_temp = Double.parseDouble(generateDto.getMonth12_1()); }
	
	if(month_cal.equals("+")){
		y_sum0 = month * sum0 + month_temp;
		y_sum1 = month * sum1 + month_temp;
		y_sum2 = month * sum2 + month_temp;
		y_sum3 = month * sum3 + month_temp;
		y_sum4 = month * sum4 + month_temp;
		y_sum5 = month * sum5 + month_temp;
		y_sum6 = month * sum6 + month_temp;
		y_sum7 = month * sum7 + month_temp;
		y_sum8 = month * sum8 + month_temp;
		y_sum9 = month * sum9 + month_temp;
		y_sum10 = month * sum10 + month_temp;
		y_sum11 = month * sum11 + month_temp;
		y_sum12 = month * sum12 + month_temp;
		y_sum13 = month * sum13 + month_temp;
		y_sum14 = month * sum14 + month_temp;
		y_sum15 = month * sum15 + month_temp;
		y_sum16 = month * sum16 + month_temp;
		y_sum17 = month * sum17 + month_temp;
		y_sum18 = month * sum18 + month_temp;
		y_sum19 = month * sum19 + month_temp;
		y_sum20 = month * sum20 + month_temp;
		y_sum21 = month * sum21 + month_temp;
		y_sum22 = month * sum22 + month_temp;
		y_sum23 = month * sum23 + month_temp;
		y_sum24 = month * sum24 + month_temp;
		y_sum25 = month * sum25 + month_temp;
		y_sum26 = month * sum26 + month_temp;
		y_sum27 = month * sum27 + month_temp;
		y_sum28 = month * sum28 + month_temp;
		y_sum29 = month * sum29 + month_temp;
		y_sum30 = month * sum30 + month_temp;
		y_sum31 = month * sum31 + month_temp;
		y_sum32 = month * sum32 + month_temp;
		y_sum33 = month * sum33 + month_temp;
		y_sum34 = month * sum34 + month_temp;
		y_sum35 = month * sum35 + month_temp;
		y_sum36 = month * sum36 + month_temp;
	}else if(month_cal.equals("-")){
		y_sum0 = month * sum0 - month_temp;
		y_sum1 = month * sum1 - month_temp;
		y_sum2 = month * sum2 - month_temp;
		y_sum3 = month * sum3 - month_temp;
		y_sum4 = month * sum4 - month_temp;
		y_sum5 = month * sum5 - month_temp;
		y_sum6 = month * sum6 - month_temp;
		y_sum7 = month * sum7 - month_temp;
		y_sum8 = month * sum8 - month_temp;
		y_sum9 = month * sum9 - month_temp;
		y_sum10 = month * sum10 - month_temp;
		y_sum11 = month * sum11 - month_temp;
		y_sum12 = month * sum12 - month_temp;
		y_sum13 = month * sum13 - month_temp;
		y_sum14 = month * sum14 - month_temp;
		y_sum15 = month * sum15 - month_temp;
		y_sum16 = month * sum16 - month_temp;
		y_sum17 = month * sum17 - month_temp;
		y_sum18 = month * sum18 - month_temp;
		y_sum19 = month * sum19 - month_temp;
		y_sum20 = month * sum20 - month_temp;
		y_sum21 = month * sum21 - month_temp;
		y_sum22 = month * sum22 - month_temp;
		y_sum23 = month * sum23 - month_temp;
		y_sum24 = month * sum24 - month_temp;
		y_sum25 = month * sum25 - month_temp;
		y_sum26 = month * sum26 - month_temp;
		y_sum27 = month * sum27 - month_temp;
		y_sum28 = month * sum28 - month_temp;
		y_sum29 = month * sum29 - month_temp;
		y_sum30 = month * sum30 - month_temp;
		y_sum31 = month * sum31 - month_temp;
		y_sum32 = month * sum32 - month_temp;
		y_sum33 = month * sum33 - month_temp;
		y_sum34 = month * sum34 - month_temp;
		y_sum35 = month * sum35 - month_temp;
		y_sum36 = month * sum36 - month_temp;
	}
	y_total_sum = y_sum0+y_sum1+y_sum2+y_sum3+y_sum4+y_sum5+y_sum6+y_sum7+y_sum8+y_sum9+y_sum10+y_sum11+y_sum12+y_sum13+y_sum14+y_sum15+y_sum16+y_sum17+y_sum18+y_sum19+y_sum20+y_sum21+y_sum22+y_sum23+y_sum24+y_sum25+y_sum26+y_sum27+y_sum28+y_sum29+y_sum30+y_sum31+y_sum32+y_sum33+y_sum34+y_sum35+y_sum36;
	

	// 날짜 구하기
	Calendar cal = Calendar.getInstance();
	int yyyy = cal.get(Calendar.YEAR);
	int mm = cal.get(Calendar.MONTH) + 1;
	int dd = cal.get(Calendar.DAY_OF_MONTH);
	int hours = cal.get(Calendar.HOUR_OF_DAY);
	int minutes  = cal.get(Calendar.MINUTE);
	int week = cal.get(Calendar.DAY_OF_WEEK);
	String year = String.valueOf(yyyy);
	String r_month = String.valueOf(mm);
	String day = String.valueOf(dd);
	String hour = String.valueOf(hours);
	String minute = String.valueOf(minutes);
	if(hours<10) {
        hour='0'+hour;
    }
    if(mm<10) {
    	r_month='0'+r_month;
    }
    if(dd<10) {
        day='0'+day;
    }
    if(minutes <10){
    	minute='0'+minute;
    }
    // 요일구하기
    String strWeek = null;
    switch(week) {
     case Calendar.MONDAY:
      strWeek = "월";
      break;
     case Calendar.TUESDAY:
      strWeek = "화";
      break;
     case Calendar.WEDNESDAY:
      strWeek = "수";
      break;
     case Calendar.THURSDAY:
      strWeek = "목";
      break;
     case Calendar.FRIDAY:
      strWeek = "금";
      break;
     case Calendar.SATURDAY:
      strWeek = "토";
      break;
     default:
      strWeek = "일";
    }
	String yyyymmdd = year+r_month+day;

	//내일날짜구하기
	cal.add(Calendar.DATE, 1);
	int n_yyyy = cal.get(Calendar.YEAR);
	int n_mm = cal.get(Calendar.MONTH) + 1;
	int n_dd = cal.get(Calendar.DAY_OF_MONTH);
	int n_week = cal.get(Calendar.DAY_OF_WEEK);
	String n_year = String.valueOf(n_yyyy);
	String n_month = String.valueOf(n_mm);
	String n_day = String.valueOf(n_dd);
    if(n_mm<10) {
    	n_month='0'+n_month;
    }
    if(n_dd<10) {
    	n_day='0'+n_day;
    }
	String n_yyyymmdd = n_year+n_month+n_day;

    String n_strWeek = null;
    switch(n_week) {
     case Calendar.MONDAY:
    	 n_strWeek = "월";
      break;
     case Calendar.TUESDAY:
    	 n_strWeek = "화";
      break;
     case Calendar.WEDNESDAY:
    	 n_strWeek = "수";
      break;
     case Calendar.THURSDAY:
    	 n_strWeek = "목";
      break;
     case Calendar.FRIDAY:
    	 n_strWeek = "금";
      break;
     case Calendar.SATURDAY:
    	 n_strWeek = "토";
      break;
     default:
    	 n_strWeek = "일";
    }
	//모레날짜구하기
	cal.add(Calendar.DATE, 1);
	int nn_yyyy = cal.get(Calendar.YEAR);
	int nn_mm = cal.get(Calendar.MONTH) + 1;
	int nn_dd = cal.get(Calendar.DAY_OF_MONTH);
	String nn_year = String.valueOf(nn_yyyy);
	String nn_month = String.valueOf(nn_mm);
	String nn_day = String.valueOf(nn_dd);
    if(nn_mm<10) {
    	nn_month='0'+nn_month;
    }
    if(nn_dd<10) {
    	nn_day='0'+nn_day;
    }
	String nn_yyyymmdd = nn_year+nn_month+nn_day;
	
	//어제날짜구하기
	cal.add(Calendar.DATE, -3);
	int p_yyyy = cal.get(Calendar.YEAR);
	int p_mm = cal.get(Calendar.MONTH) + 1;
	int p_dd = cal.get(Calendar.DAY_OF_MONTH);
	String p_year = String.valueOf(p_yyyy);
	String p_month = String.valueOf(p_mm);
	String p_day = String.valueOf(p_dd);
    if(p_mm<10) {
    	p_month='0'+p_month;
    }
    if(p_dd<10) {
    	p_day='0'+p_day;
    }
	String p_yyyymmdd = p_year+p_month+p_day;
	
	// 날씨 구하기
	// 공공데이터포탈 key값
	String apikey = "Zc1pKtBxi7RTsj%2Faol%2FDZbsMmqiGYbdxffp24R8yGnLggvwWbuCuBxHIDzFJSkreP314nYVcmO%2BT1b2LPJNniw%3D%3D";
	
    String nx = areaDto.getVal_x();		//격자X
    String ny = areaDto.getVal_y();		//격자Y
	//String urlStr = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastGrib?ServiceKey="+apikey+"&base_date="+year+r_month+day+"&base_time="+hour+minute+"&nx="+nx+"&ny="+ny+"&pageNo=1&numOfRows=6";
	String urlStr = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData?ServiceKey="+apikey+"&base_date="+p_year+p_month+p_day+"&base_time=2300&nx="+nx+"&ny="+ny+"&numOfRows=1000";
	URL url = new URL(urlStr);
	URLConnection connection = url.openConnection();
	connection.setDoOutput(true);
	 
	// 타입 설정
	connection.setRequestProperty("CONTENT-TYPE","text/xml");
	
	//openStream() : URL페이지 정보를 읽어온다.
	BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(),"utf-8"));
	String inputLine;
	String weatherBuffer = "";
	String dustBuffer = "";
	 
	// 페이지의 정보를 저장한다.
	 while ((inputLine = in.readLine()) != null){
		 weatherBuffer += inputLine.trim();
	}
%>


	<script type="text/javascript">
		function select_future() {
			if($("input[name=future_radio]:checked").val()=="etc"){
				$("#future_kw").val($("#kw_input").val()/100);
			}else{
				$("#future_kw").val($("input[name=future_radio]:checked").val());
			}

			// 관심지역, 동네예보 둘 다 없다면
			if($("#area_code1").val()=="" && $("#area_code2").val()==""){
				alert("관심지역 또는 동네예보를 선택해주세요.");
				return;
			}
			// 동네예보가 있다면 동네예보로 검색
			if($("#area_code2").val()!=""){
				$("#area_code").val($("#area_code2").val());
			}else{	// 동네예보가 없다면 관심지역으로 검색
				$("#area_code").val($("#area_code1").val());
			}
			$("#future_form").submit();
		}
		
		function set_cookie(){
			if($("#area_code1").val()==""){
				alert("관심지역을 선택해 주세요.");
				return;
			}else{
				setCookie("c_area_code1", $("#area_code1").val(), 31); // 31일 동안 쿠키 보관
				setCookie("c_area_name1", $("#area_name1").val(), 31); // 31일 동안 쿠키 보관
			}
			alert("관심지역이 "+$("#area_name1").val()+"으로 변경되었습니다.");
		}
		
		function setCookie(cookieName, value, exdays){
		    var exdate = new Date();
		    exdate.setDate(exdate.getDate() + exdays);
		    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		    document.cookie = cookieName + "=" + cookieValue;
		}
		 
		function deleteCookie(cookieName){
		    var expireDate = new Date();
		    expireDate.setDate(expireDate.getDate() - 1);
		    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
		 
		function getCookie(cookieName) {
		    cookieName = cookieName + '=';
		    var cookieData = document.cookie;
		    var start = cookieData.indexOf(cookieName);
		    var cookieValue = '';
		    if(start != -1){
		        start += cookieName.length;
		        var end = cookieData.indexOf(';', start);
		        if(end == -1)end = cookieData.length;
		        cookieValue = cookieData.substring(start, end);
		    }
		    return unescape(cookieValue);
		}
		$( document ).ready(function() {
			var v_area_code1 = getCookie("c_area_code1");
			var v_area_name1 = getCookie("c_area_name1");
			
		    $("#area_code1").val(v_area_code1); 
		    $("#area_name1").val(v_area_name1); 
		    $("#search_text").html(v_area_name1); 

		    
		    
			//날씨 xml
			var weathertxt = '<%=weatherBuffer%>';

			//날씨 xml을 파싱
			//xmlDoc=parser.parseFromString(weathertxt,"text/xml");
			if (document.evaluate) {
				var parser = new DOMParser();
				xmlDoc = parser.parseFromString(weathertxt, "text/xml");
				xmlDoc.xml = weathertxt;
				xmlDoc.setType = "text/xml";
			}
			else // Internet Explorer
			{
				xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
				xmlDoc.async = false;
				xmlDoc.loadXML(weathertxt);
			}
		 
		  	// 특정 테그를 기준으로 변수에 담는다
		  	var xml = xmlDoc.getElementsByTagName('body');

			// getElementsByTagName : 태그 호출
			// childNodes : 자식 노드
			// nodeValue : 해당 노드의 값(text)
		  	
			var PTY=""; //강수형태
			var REH=""; //습도
			var RN1=""; //강수량
			var SKY=""; //하늘상태
			var T1H=""; //기온

			var yyyymmdd = "<%=yyyymmdd%>";
			var n_yyyymmdd = "<%=n_yyyymmdd%>";
			var nn_yyyymmdd = "<%=nn_yyyymmdd%>";

			var PTY_03;
			var PTY_06;
			var PTY_09;
			var PTY_12;
			var PTY_15;
			var PTY_18;
			var PTY_21;
			var PTY_24;
			var PTY_27;
			var PTY_30;
			var PTY_33;
			var PTY_36;
			var PTY_39;
			var PTY_42;
			var PTY_45;
			var PTY_48;
		  	for (var i = 0; i < xml[0].getElementsByTagName('item').length; i++){
		  		
		  		// pop - 강수확률
		  		if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('category')[0].childNodes[0].nodeValue == "POP"){
		  			if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0300" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						$('#POP_03').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0600" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						$('#POP_06').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0900" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						$('#POP_09').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1200" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						$('#POP_12').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1500" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						$('#POP_15').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1800" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						$('#POP_18').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "2100" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						$('#POP_21').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0000" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#POP_24').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0300" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#POP_27').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0600" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#POP_30').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0900" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#POP_33').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1200" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#POP_36').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1500" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#POP_39').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1800" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#POP_42').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "2100" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#POP_45').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0000" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == nn_yyyymmdd){
						$('#POP_48').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}
		  			
		  		// R06 - 강수량
		  		}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('category')[0].childNodes[0].nodeValue == "R06"){
		  			if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0600" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						$('#R06_03').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1200" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						$('#R06_09').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1800" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						$('#R06_15').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0000" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#R06_21').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0600" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#R06_27').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1200" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#R06_33').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1800" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#R06_39').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0000" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == nn_yyyymmdd){
						$('#R06_45').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
			  		}

			  	// T3H - 기온
		  		}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('category')[0].childNodes[0].nodeValue == "T3H"){
		  			if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0300" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						$('#T3H_03').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0600" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						$('#T3H_06').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0900" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						$('#T3H_09').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1200" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						$('#T3H_12').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1500" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						$('#T3H_15').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1800" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						$('#T3H_18').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "2100" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						$('#T3H_21').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0000" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#T3H_24').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0300" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#T3H_27').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0600" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#T3H_30').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0900" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#T3H_33').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1200" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#T3H_36').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1500" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#T3H_39').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1800" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#T3H_42').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "2100" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#T3H_45').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0000" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == nn_yyyymmdd){
						$('#T3H_48').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}
		  			
			  	// REH - 습도
		  		}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('category')[0].childNodes[0].nodeValue == "REH"){
		  			if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0300" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						$('#REH_03').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0600" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						$('#REH_06').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0900" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						$('#REH_09').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1200" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						$('#REH_12').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1500" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						$('#REH_15').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1800" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						$('#REH_18').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "2100" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						$('#REH_21').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0000" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#REH_24').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0300" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#REH_27').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0600" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#REH_30').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0900" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#REH_33').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1200" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#REH_36').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1500" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#REH_39').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1800" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#REH_42').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "2100" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						$('#REH_45').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0000" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == nn_yyyymmdd){
						$('#REH_48').html(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue);
		  			}

				// PTY - 강수상태
		  		}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('category')[0].childNodes[0].nodeValue == "PTY"){
		  			if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0300" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						PTY_03 = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0600" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						PTY_06 = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0900" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						PTY_09 = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1200" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						PTY_12 = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1500" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						PTY_15 = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1800" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						PTY_18 = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "2100" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
						PTY_21 = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0000" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						PTY_24 = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0300" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						PTY_27 = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0600" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						PTY_30 = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0900" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						PTY_33 = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1200" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						PTY_36 = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1500" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						PTY_39 = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1800" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						PTY_42 = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "2100" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
						PTY_45 = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0000" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == nn_yyyymmdd){
						PTY_48 = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
		  			}

				// SKY - 하늘상태
		  		}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('category')[0].childNodes[0].nodeValue == "SKY"){
		  			if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0300" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
		  				SKY = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
						if(PTY_03 == 0){ //강수형태 없을경우
							if(SKY == 1){//맑음
								$('#SKY_03').html('<img src="/assets/comn/img/sunny2.png" alt="맑음">');
							}else if(SKY = 2){
								$('#SKY_03').html('<img src="/assets/comn/img/little_cloud2.png" alt="구름적음">');
							}else if(SKY = 3){
								$('#SKY_03').html('<img src="/assets/comn/img/n_many_cloud2.png" alt="구름 많음">');
							}else if(SKY = 4){
								$('#SKY_03').html('<img src="/assets/comn/img/cloudy2.png" alt="흐림">');
							}
						}else if(PTY_03 == 1){
							$('#SKY_03').html('<img src="/assets/comn/img/rain2.png" alt="비">');
						}else if(PTY_03 == 2){
							$('#SKY_03').html('<img src="/assets/comn/img/snow_rain2.png" alt="비눈">');
						}else if(PTY_03 == 3){
							$('#SKY_03').html('<img src="/assets/comn/img/snow2.png" alt="눈">');
						}
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0600" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
		  				SKY = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
						if(PTY_06 == 0){ //강수형태 없을경우
							if(SKY == 1){//맑음
								$('#SKY_06').html('<img src="/assets/comn/img/sunny2.png" alt="맑음">');
							}else if(SKY = 2){
								$('#SKY_06').html('<img src="/assets/comn/img/little_cloud2.png" alt="구름적음">');
							}else if(SKY = 3){
								$('#SKY_06').html('<img src="/assets/comn/img/n_many_cloud2.png" alt="구름 많음">');
							}else if(SKY = 4){
								$('#SKY_06').html('<img src="/assets/comn/img/cloudy2.png" alt="흐림">');
							}
						}else if(PTY_06 == 1){
							$('#SKY_06').html('<img src="/assets/comn/img/rain2.png" alt="비">');
						}else if(PTY_06 == 2){
							$('#SKY_06').html('<img src="/assets/comn/img/snow_rain2.png" alt="비눈">');
						}else if(PTY_06 == 3){
							$('#SKY_06').html('<img src="/assets/comn/img/snow2.png" alt="눈">');
						}
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0900" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
		  				SKY = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
						if(PTY_09 == 0){ //강수형태 없을경우
							if(SKY == 1){//맑음
								$('#SKY_09').html('<img src="/assets/comn/img/sunny2.png" alt="맑음">');
							}else if(SKY = 2){
								$('#SKY_09').html('<img src="/assets/comn/img/little_cloud2.png" alt="구름적음">');
							}else if(SKY = 3){
								$('#SKY_09').html('<img src="/assets/comn/img/n_many_cloud2.png" alt="구름 많음">');
							}else if(SKY = 4){
								$('#SKY_09').html('<img src="/assets/comn/img/cloudy2.png" alt="흐림">');
							}
						}else if(PTY_09 == 1){
							$('#SKY_09').html('<img src="/assets/comn/img/rain2.png" alt="비">');
						}else if(PTY_09 == 2){
							$('#SKY_09').html('<img src="/assets/comn/img/snow_rain2.png" alt="비눈">');
						}else if(PTY_09 == 3){
							$('#SKY_09').html('<img src="/assets/comn/img/snow2.png" alt="눈">');
						}
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1200" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
		  				SKY = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
						if(PTY_12 == 0){ //강수형태 없을경우
							if(SKY == 1){//맑음
								$('#SKY_12').html('<img src="/assets/comn/img/sunny2.png" alt="맑음">');
							}else if(SKY = 2){
								$('#SKY_12').html('<img src="/assets/comn/img/little_cloud2.png" alt="구름적음">');
							}else if(SKY = 3){
								$('#SKY_12').html('<img src="/assets/comn/img/n_many_cloud2.png" alt="구름 많음">');
							}else if(SKY = 4){
								$('#SKY_12').html('<img src="/assets/comn/img/cloudy2.png" alt="흐림">');
							}
						}else if(PTY_12 == 1){
							$('#SKY_12').html('<img src="/assets/comn/img/rain2.png" alt="비">');
						}else if(PTY_12 == 2){
							$('#SKY_12').html('<img src="/assets/comn/img/snow_rain2.png" alt="비눈">');
						}else if(PTY_12 == 3){
							$('#SKY_12').html('<img src="/assets/comn/img/snow2.png" alt="눈">');
						}
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1500" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
		  				SKY = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
						if(PTY_15 == 0){ //강수형태 없을경우
							if(SKY == 1){//맑음
								$('#SKY_15').html('<img src="/assets/comn/img/sunny2.png" alt="맑음">');
							}else if(SKY = 2){
								$('#SKY_15').html('<img src="/assets/comn/img/little_cloud2.png" alt="구름적음">');
							}else if(SKY = 3){
								$('#SKY_15').html('<img src="/assets/comn/img/n_many_cloud2.png" alt="구름 많음">');
							}else if(SKY = 4){
								$('#SKY_15').html('<img src="/assets/comn/img/cloudy2.png" alt="흐림">');
							}
						}else if(PTY_15 == 1){
							$('#SKY_15').html('<img src="/assets/comn/img/rain2.png" alt="비">');
						}else if(PTY_15 == 2){
							$('#SKY_15').html('<img src="/assets/comn/img/snow_rain2.png" alt="비눈">');
						}else if(PTY_15 == 3){
							$('#SKY_15').html('<img src="/assets/comn/img/snow2.png" alt="눈">');
						}
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1800" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
		  				SKY = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
						if(PTY_18 == 0){ //강수형태 없을경우
							if(SKY == 1){//맑음
								$('#SKY_18').html('<img src="/assets/comn/img/sunny2.png" alt="맑음">');
							}else if(SKY = 2){
								$('#SKY_18').html('<img src="/assets/comn/img/little_cloud2.png" alt="구름적음">');
							}else if(SKY = 3){
								$('#SKY_18').html('<img src="/assets/comn/img/n_many_cloud2.png" alt="구름 많음">');
							}else if(SKY = 4){
								$('#SKY_18').html('<img src="/assets/comn/img/cloudy2.png" alt="흐림">');
							}
						}else if(PTY_18 == 1){
							$('#SKY_18').html('<img src="/assets/comn/img/rain2.png" alt="비">');
						}else if(PTY_18 == 2){
							$('#SKY_18').html('<img src="/assets/comn/img/snow_rain2.png" alt="비눈">');
						}else if(PTY_18 == 3){
							$('#SKY_18').html('<img src="/assets/comn/img/snow2.png" alt="눈">');
						}
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "2100" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == yyyymmdd){
		  				SKY = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
						if(PTY_21 == 0){ //강수형태 없을경우
							if(SKY == 1){//맑음
								$('#SKY_21').html('<img src="/assets/comn/img/sunny2.png" alt="맑음">');
							}else if(SKY = 2){
								$('#SKY_21').html('<img src="/assets/comn/img/little_cloud2.png" alt="구름적음">');
							}else if(SKY = 3){
								$('#SKY_21').html('<img src="/assets/comn/img/n_many_cloud2.png" alt="구름 많음">');
							}else if(SKY = 4){
								$('#SKY_21').html('<img src="/assets/comn/img/cloudy2.png" alt="흐림">');
							}
						}else if(PTY_21 == 1){
							$('#SKY_21').html('<img src="/assets/comn/img/rain2.png" alt="비">');
						}else if(PTY_21 == 2){
							$('#SKY_21').html('<img src="/assets/comn/img/snow_rain2.png" alt="비눈">');
						}else if(PTY_21 == 3){
							$('#SKY_21').html('<img src="/assets/comn/img/snow2.png" alt="눈">');
						}
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0000" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
		  				SKY = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
						if(PTY_24 == 0){ //강수형태 없을경우
							if(SKY == 1){//맑음
								$('#SKY_24').html('<img src="/assets/comn/img/sunny2.png" alt="맑음">');
							}else if(SKY = 2){
								$('#SKY_24').html('<img src="/assets/comn/img/little_cloud2.png" alt="구름적음">');
							}else if(SKY = 3){
								$('#SKY_24').html('<img src="/assets/comn/img/n_many_cloud2.png" alt="구름 많음">');
							}else if(SKY = 4){
								$('#SKY_24').html('<img src="/assets/comn/img/cloudy2.png" alt="흐림">');
							}
						}else if(PTY_24 == 1){
							$('#SKY_24').html('<img src="/assets/comn/img/rain2.png" alt="비">');
						}else if(PTY_24 == 2){
							$('#SKY_24').html('<img src="/assets/comn/img/snow_rain2.png" alt="비눈">');
						}else if(PTY_24 == 3){
							$('#SKY_24').html('<img src="/assets/comn/img/snow2.png" alt="눈">');
						}
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0300" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
		  				SKY = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
						if(PTY_27 == 0){ //강수형태 없을경우
							if(SKY == 1){//맑음
								$('#SKY_27').html('<img src="/assets/comn/img/sunny2.png" alt="맑음">');
							}else if(SKY = 2){
								$('#SKY_27').html('<img src="/assets/comn/img/little_cloud2.png" alt="구름적음">');
							}else if(SKY = 3){
								$('#SKY_27').html('<img src="/assets/comn/img/n_many_cloud2.png" alt="구름 많음">');
							}else if(SKY = 4){
								$('#SKY_27').html('<img src="/assets/comn/img/cloudy2.png" alt="흐림">');
							}
						}else if(PTY_27 == 1){
							$('#SKY_27').html('<img src="/assets/comn/img/rain2.png" alt="비">');
						}else if(PTY_27 == 2){
							$('#SKY_27').html('<img src="/assets/comn/img/snow_rain2.png" alt="비눈">');
						}else if(PTY_27 == 3){
							$('#SKY_27').html('<img src="/assets/comn/img/snow2.png" alt="눈">');
						}
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0600" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
		  				SKY = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
						if(PTY_30 == 0){ //강수형태 없을경우
							if(SKY == 1){//맑음
								$('#SKY_30').html('<img src="/assets/comn/img/sunny2.png" alt="맑음">');
							}else if(SKY = 2){
								$('#SKY_30').html('<img src="/assets/comn/img/little_cloud2.png" alt="구름적음">');
							}else if(SKY = 3){
								$('#SKY_30').html('<img src="/assets/comn/img/n_many_cloud2.png" alt="구름 많음">');
							}else if(SKY = 4){
								$('#SKY_30').html('<img src="/assets/comn/img/cloudy2.png" alt="흐림">');
							}
						}else if(PTY_30 == 1){
							$('#SKY_30').html('<img src="/assets/comn/img/rain2.png" alt="비">');
						}else if(PTY_30 == 2){
							$('#SKY_30').html('<img src="/assets/comn/img/snow_rain2.png" alt="비눈">');
						}else if(PTY_30 == 3){
							$('#SKY_30').html('<img src="/assets/comn/img/snow2.png" alt="눈">');
						}
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0900" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
		  				SKY = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
						if(PTY_33 == 0){ //강수형태 없을경우
							if(SKY == 1){//맑음
								$('#SKY_33').html('<img src="/assets/comn/img/sunny2.png" alt="맑음">');
							}else if(SKY = 2){
								$('#SKY_33').html('<img src="/assets/comn/img/little_cloud2.png" alt="구름적음">');
							}else if(SKY = 3){
								$('#SKY_33').html('<img src="/assets/comn/img/n_many_cloud2.png" alt="구름 많음">');
							}else if(SKY = 4){
								$('#SKY_33').html('<img src="/assets/comn/img/cloudy2.png" alt="흐림">');
							}
						}else if(PTY_33 == 1){
							$('#SKY_33').html('<img src="/assets/comn/img/rain2.png" alt="비">');
						}else if(PTY_33 == 2){
							$('#SKY_33').html('<img src="/assets/comn/img/snow_rain2.png" alt="비눈">');
						}else if(PTY_33 == 3){
							$('#SKY_33').html('<img src="/assets/comn/img/snow2.png" alt="눈">');
						}
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1200" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
		  				SKY = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
						if(PTY_36 == 0){ //강수형태 없을경우
							if(SKY == 1){//맑음
								$('#SKY_36').html('<img src="/assets/comn/img/sunny2.png" alt="맑음">');
							}else if(SKY = 2){
								$('#SKY_36').html('<img src="/assets/comn/img/little_cloud2.png" alt="구름적음">');
							}else if(SKY = 3){
								$('#SKY_36').html('<img src="/assets/comn/img/n_many_cloud2.png" alt="구름 많음">');
							}else if(SKY = 4){
								$('#SKY_36').html('<img src="/assets/comn/img/cloudy2.png" alt="흐림">');
							}
						}else if(PTY_36 == 1){
							$('#SKY_36').html('<img src="/assets/comn/img/rain2.png" alt="비">');
						}else if(PTY_36 == 2){
							$('#SKY_36').html('<img src="/assets/comn/img/snow_rain2.png" alt="비눈">');
						}else if(PTY_36 == 3){
							$('#SKY_36').html('<img src="/assets/comn/img/snow2.png" alt="눈">');
						}
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1500" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
		  				SKY = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
						if(PTY_39 == 0){ //강수형태 없을경우
							if(SKY == 1){//맑음
								$('#SKY_39').html('<img src="/assets/comn/img/sunny2.png" alt="맑음">');
							}else if(SKY = 2){
								$('#SKY_39').html('<img src="/assets/comn/img/little_cloud2.png" alt="구름적음">');
							}else if(SKY = 3){
								$('#SKY_39').html('<img src="/assets/comn/img/n_many_cloud2.png" alt="구름 많음">');
							}else if(SKY = 4){
								$('#SKY_39').html('<img src="/assets/comn/img/cloudy2.png" alt="흐림">');
							}
						}else if(PTY_39 == 1){
							$('#SKY_39').html('<img src="/assets/comn/img/rain2.png" alt="비">');
						}else if(PTY_39 == 2){
							$('#SKY_39').html('<img src="/assets/comn/img/snow_rain2.png" alt="비눈">');
						}else if(PTY_39 == 3){
							$('#SKY_39').html('<img src="/assets/comn/img/snow2.png" alt="눈">');
						}
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "1800" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
		  				SKY = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
						if(PTY_42 == 0){ //강수형태 없을경우
							if(SKY == 1){//맑음
								$('#SKY_42').html('<img src="/assets/comn/img/sunny2.png" alt="맑음">');
							}else if(SKY = 2){
								$('#SKY_42').html('<img src="/assets/comn/img/little_cloud2.png" alt="구름적음">');
							}else if(SKY = 3){
								$('#SKY_42').html('<img src="/assets/comn/img/n_many_cloud2.png" alt="구름 많음">');
							}else if(SKY = 4){
								$('#SKY_42').html('<img src="/assets/comn/img/cloudy2.png" alt="흐림">');
							}
						}else if(PTY_42 == 1){
							$('#SKY_42').html('<img src="/assets/comn/img/rain2.png" alt="비">');
						}else if(PTY_42 == 2){
							$('#SKY_42').html('<img src="/assets/comn/img/snow_rain2.png" alt="비눈">');
						}else if(PTY_42 == 3){
							$('#SKY_42').html('<img src="/assets/comn/img/snow2.png" alt="눈">');
						}
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "2100" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == n_yyyymmdd){
		  				SKY = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
						if(PTY_45 == 0){ //강수형태 없을경우
							if(SKY == 1){//맑음
								$('#SKY_45').html('<img src="/assets/comn/img/sunny2.png" alt="맑음">');
							}else if(SKY = 2){
								$('#SKY_45').html('<img src="/assets/comn/img/little_cloud2.png" alt="구름적음">');
							}else if(SKY = 3){
								$('#SKY_45').html('<img src="/assets/comn/img/n_many_cloud2.png" alt="구름 많음">');
							}else if(SKY = 4){
								$('#SKY_45').html('<img src="/assets/comn/img/cloudy2.png" alt="흐림">');
							}
						}else if(PTY_45 == 1){
							$('#SKY_45').html('<img src="/assets/comn/img/rain2.png" alt="비">');
						}else if(PTY_45 == 2){
							$('#SKY_45').html('<img src="/assets/comn/img/snow_rain2.png" alt="비눈">');
						}else if(PTY_45 == 3){
							$('#SKY_45').html('<img src="/assets/comn/img/snow2.png" alt="눈">');
						}
		  			}else if(xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue == "0000" && xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue == nn_yyyymmdd){
		  				SKY = xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue;
						if(PTY_48 == 0){ //강수형태 없을경우
							if(SKY == 1){//맑음
								$('#SKY_48').html('<img src="/assets/comn/img/sunny2.png" alt="맑음">');
							}else if(SKY = 2){
								$('#SKY_48').html('<img src="/assets/comn/img/little_cloud2.png" alt="구름적음">');
							}else if(SKY = 3){
								$('#SKY_48').html('<img src="/assets/comn/img/n_many_cloud2.png" alt="구름 많음">');
							}else if(SKY = 4){
								$('#SKY_48').html('<img src="/assets/comn/img/cloudy2.png" alt="흐림">');
							}
						}else if(PTY_48 == 1){
							$('#SKY_48').html('<img src="/assets/comn/img/rain2.png" alt="비">');
						}else if(PTY_48 == 2){
							$('#SKY_48').html('<img src="/assets/comn/img/snow_rain2.png" alt="비눈">');
						}else if(PTY_48 == 3){
							$('#SKY_48').html('<img src="/assets/comn/img/snow2.png" alt="눈">');
						}
		  			}
		  		}
				/* console.log(i+":::::::"+xml[0].getElementsByTagName('item')[i].getElementsByTagName('category')[0].childNodes[0].nodeValue+"@@@@@"+xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstDate')[0].childNodes[0].nodeValue+xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstTime')[0].childNodes[0].nodeValue+"####"+xml[0].getElementsByTagName('item')[i].getElementsByTagName('fcstValue')[0].childNodes[0].nodeValue); */
			}
		});
	</script>
	
	
	
      <div class="sub_section">
        <!-- sub_section -->
        <h2 class="sub_main_title">미래발전량 정보</h2>
      </div>
      <!-- sub_section -->
      <div class="sub_contents">
      	<form action="/forum/future/futureData/futureGraph.do" id="future_form" name="future_form" method="post">
      	<input type="hidden" name="area_code1" id="area_code1" value="${energyDto.area_code1 }" />
      	<input type="hidden" name="area_name1" id="area_name1" value="${energyDto.area_name1 }" />
      	<input type="hidden" name="area_code2" id="area_code2" value="${energyDto.area_code2 }" />
      	<input type="hidden" name="area_name2" id="area_name2" value="${energyDto.area_name2 }" />
      	<input type="hidden" name="area_code" id="area_code" value="${energyDto.area_code }" />
      	
      	
        <!--sub_contents -->
        <!-- ============== 내용 시작======================== -->
        <section class="search_section">
          <div>
            <table class="search_table">
              <colgroup>
                <col width="15%">
                <col width="22.5%">
                <col width="15%">
                <col width="5%">
                <col width="22.5%">
                <col width="15%">
              </colgroup>
              <tbody>
                <tr>
                  <th>관심지역</th>
                  <td colspan="5" class="place_btn change_bar">
                    <div class="search_bar change">
                      <!--돋보기 아이콘을 누르세요.-->
					  <span id="search_text">${energyDto.area_name1 }</span>
                      <a href="javascript:regist_view('attention_section')" class="search_ico"></a>
                    </div>
                    <button class="change_place" type="button" name="button" onclick="javascript:set_cookie();">변경하기</button>
                  </td>
                </tr>
                <tr>
                  <th>동네예보</th>
                  <td colspan="5" class="place_btn">
                    <div class="search_bar change">
                      <!--돋보기 아이콘을 누르세요.-->
					  <span id="search_text2"><c:choose>
														<c:when test="${cookie.c_area_name1 ne null and cookie.c_area_name1 ne ''}">
															${energyDto.area_name2 }
														</c:when>
														<c:when test="${energyDto.area_name2 ne null and energyDto.area_name2 ne ''}">
															${energyDto.area_name2 }
														</c:when>
														<c:otherwise>
															강릉시 강남동
														</c:otherwise>
													</c:choose><!--${energyDto.area_name2 }--></span>
                      <a href="javascript:regist_view('place_section')" class="search_ico"></a>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th>발전용량</th>
                  <td colspan="5" class="select_kw">
                  	<input type="hidden" name="future_kw" id="future_kw" value="" />
                    <input type="radio" name="future_radio" value="1" <c:if test="${energyDto.future_radio eq '1' || energyDto.future_radio eq null }">checked</c:if>> <span>100Kw</span>
                    <input type="radio" name="future_radio" value="1.2" <c:if test="${energyDto.future_radio eq '1.2' }">checked</c:if>> <span>120Kw</span>
                    <input type="radio" name="future_radio" value="1.5" <c:if test="${energyDto.future_radio eq '1.5' }">checked</c:if>> <span>150Kw</span>
                    <input type="radio" name="future_radio" value="2" <c:if test="${energyDto.future_radio eq '2' }">checked</c:if>> <span>200Kw</span>
                    <input type="radio" name="future_radio" value="etc" <c:if test="${energyDto.future_radio eq 'etc' }">checked</c:if>> <input type="text" id="kw_input" name="kw_input" value="<c:if test="${energyDto.future_radio eq 'etc' }">${energyDto.kw_input }</c:if>" placeholder="기타" class="wid80"> <span>Kw</span>
                  </td>
                </tr>
              </tbody>
            </table>
            <button type="button" name="button" class="search_btn" onclick="javascript:select_future();">예보보기</button>
          </div>
        </section>

        <section class="forecast_section"> <!-- forecast_section -->
          <p class="maketime">※<%=year %>년 <%=r_month %>월 <%=day %>일(<%=strWeek %>) 00:00 발표</p>
          <h2 class="sub_tit"><span></span>지역 날씨 정보</h2>
          <div class="forecast_div">
            <table class="forecast_jibang" summary="동네예보를 시간별로 날씨, 강수확률, 강수량을 나타낸 도표입니다.">
              <tbody>
                <tr>
                  <th scope="col" class="date">날짜</th>
                  <th colspan="8" scope="col" class="today">오늘(<%=day %>일 <%=strWeek %>)</th>
                  <th colspan="8" scope="col" class="tommorow">내일(<%=n_day %>일 <%=n_strWeek %>)</th>
			            <th scope="col" class="last"></th>
                </tr>
          			<tr class="time">
        					<th scope="row" class="bgblue fb">시각</th>
        					<td class="BR_R_none">03</td>
        					<td class="BR_R_none">06</td>
        					<td class="BR_R_none">09</td>
        					<td class="BR_R_none">12</td>
        					<td class="BR_R_none">15</td>
        					<td class="BR_R_none">18</td>
        					<td class="BR_R_none">21</td>
        					<td class="BR_R_none">00</td>
        					<td class="bg_tomorrow BR_R_none">03</td>
        					<td class="bg_tomorrow BR_R_none">06</td>
        					<td class="bg_tomorrow BR_R_none">09</td>
        					<td class="bg_tomorrow BR_R_none">12</td>
        					<td class="bg_tomorrow BR_R_none">15</td>
        					<td class="bg_tomorrow BR_R_none">18</td>
        					<td class="bg_tomorrow BR_R_none">21</td>
        					<td class="bg_tomorrow">24</td>
        				</tr>
        				<tr class="forecast_weather">
        					<th scope="row" class="bgblue fb">날씨</th>
        					<td class="" id="SKY_03">-</td>
        					<td class="" id="SKY_06">-</td>
        					<td class="PD_none" id="SKY_09">-</td>
        					<td class="PD_none" id="SKY_12">-</td>
        					<td class="PD_none" id="SKY_15">-</td>
        					<td class="PD_none" id="SKY_18">-</td>
        					<td class="PD_none" id="SKY_21">-</td>
        					<td class="PD_none" id="SKY_24">-</td>
        					<td class="bg_tomorrow PD_none" id="SKY_27">-</td>
        					<td class="bg_tomorrow PD_none" id="SKY_30">-</td>
        					<td class="bg_tomorrow PD_none" id="SKY_33">-</td>
        					<td class="bg_tomorrow PD_none" id="SKY_36">-</td>
        					<td class="bg_tomorrow PD_none" id="SKY_39">-</td>
        					<td class="bg_tomorrow PD_none" id="SKY_42">-</td>
        					<td class="bg_tomorrow PD_none" id="SKY_45">-</td>
        					<td class="bg_tomorrow PD_none" id="SKY_48">-</td>
        				</tr>
        				<tr>
      					 <th scope="row" class="bgblue">강수확률(%)</th>
      					 <td class="" id="POP_03">-</td>
      					 <td class="" id="POP_06">-</td>
      					 <td class="" id="POP_09">-</td>
      					 <td class="" id="POP_12">-</td>
      					 <td class="" id="POP_15">-</td>
      					 <td class="" id="POP_18">-</td>
      					 <td class="" id="POP_21">-</td>
      					 <td class="" id="POP_24">-</td>
      					 <td class="bg_tomorrow" id="POP_27">-</td>
      					 <td class="bg_tomorrow" id="POP_30">-</td>
      					 <td class="bg_tomorrow" id="POP_33">-</td>
      					 <td class="bg_tomorrow" id="POP_36">-</td>
      					 <td class="bg_tomorrow" id="POP_39">-</td>
      					 <td class="bg_tomorrow" id="POP_42">-</td>
      					 <td class="bg_tomorrow" id="POP_45">-</td>
      					 <td class="bg_tomorrow" id="POP_48">-</td>
        				</tr>
        				<tr>
        					<th scope="row" class="bgblue">강수량(mm)</th>
		  					 <td class="" id="R06_03" colspan="2">-</td>
		  					 <td class="" id="R06_09" colspan="2">-</td>
		  					 <td class="" id="R06_15" colspan="2">-</td>
		  					 <td class="" id="R06_21" colspan="2">-</td>
		  					 <td class="bg_tomorrow" id="R06_27" colspan="2">-</td>
		  					 <td class="bg_tomorrow" id="R06_33" colspan="2">-</td>
		  					 <td class="bg_tomorrow" id="R06_39" colspan="2">-</td>
		  					 <td class="bg_tomorrow" id="R06_45" colspan="2">-</td>
        				</tr>
        				<!-- 
        				<tr>
        			    <th scope="row" class="bgblue">최저/최고(℃)</th>
        					<td colspan="4" class=""><span class="low_deg">-</span><strong>/</strong><span class="high_deg">16</span></td>
        					<td colspan="8" class="bg_tomorrow"><span class="low_deg">10</span><strong>/</strong><span class="high_deg">14</span></td>
        					<td colspan="4" class=""><span class="low_deg">3</span><strong>/</strong><span class="high_deg">9</span></td>
        				</tr>
        				 -->
        				<tr class="degree">
        			    <th scope="row" class="bgblue">기온(℃)</th>
        					<td class="" id="T3H_03">-</td>
        					<td class="" id="T3H_06">-</td>
        					<td class="" id="T3H_09">-</td>
        					<td class="" id="T3H_12">-</td>
        					<td class="" id="T3H_15">-</td>
        					<td class="" id="T3H_18">-</td>
        					<td class="" id="T3H_21">-</td>
        					<td class="" id="T3H_24">-</td>
        					<td class="bg_tomorrow" id="T3H_27">-</td>
        					<td class="bg_tomorrow" id="T3H_30">-</td>
        					<td class="bg_tomorrow" id="T3H_33">-</td>
        					<td class="bg_tomorrow" id="T3H_36">-</td>
        					<td class="bg_tomorrow" id="T3H_39">-</td>
        					<td class="bg_tomorrow" id="T3H_42">-</td>
        					<td class="bg_tomorrow" id="T3H_45">-</td>
        					<td class="bg_tomorrow" id="T3H_48">-</td>
        				</tr>
        				<!-- 
        				<tr class="wind">
        					<th scope="row" class="bgblue">풍향/<br>풍속(m/s)</th>
        					<td class="" title="북풍 1m/s"><div><span><img src="/assets/comn/img/wn.png" alt="북풍 1m/s" title="북풍 1m/s"></span><p>1</p></div></td>
        					<td class="" title="북동풍 1m/s"><div><span><img src="/assets/comn/img/wne.png" alt="북동풍 1m/s" title="북서풍 1m/s"></span><p>1</p></div></td>
        					<td class=" " title="동풍 4m/s"><div><span><img src="/assets/comn/img/we.png" alt="동풍 1m/s" title="동풍 1m/s"></span><p>1</p></div></td>
        					<td class=" " title="남동풍 6m/s"><div><span><img src="/assets/comn/img/wse.png" alt="남동풍 1m/s" title="남동풍 1m/s"></span><p>1</p></div></td>
        					<td class="bg_tomorrow " title="남풍 4m/s"><div><span><img src="/assets/comn/img/ws.png" alt="남풍 1m/s" title="남풍 1m/s"></span><p>21</p></div></td>
        					<td class="bg_tomorrow " title="남서풍 3m/s"><div><span><img src="/assets/comn/img/wsw.png" alt="남서풍 1m/s" title="남서풍 1m/s"></span><p>12</p></div></td>
        					<td class="bg_tomorrow " title="서풍 3m/s"><div><span><img src="/assets/comn/img/ww.png" alt="서풍 1m/s" title="서풍 1m/s"></span><p>12</p></div></td>
        					<td class="bg_tomorrow " title="북서풍 2m/s"><div><span><img src="/assets/comn/img/wnw.png" alt="북서풍 1m/s" title="북서풍 1m/s"></span><p>1</p></div></td>
        					<td class="bg_tomorrow " title="북서풍 3m/s"><div><span><img src="/assets/comn/img/we.png" alt="북서풍 1m/s" title="북서풍 1m/s"></span><p>1</p></div></td>
        					<td class="bg_tomorrow " title="북서풍 4m/s"><div><span><img src="/assets/comn/img/we.png" alt="북서풍 1m/s" title="북서풍 1m/s"></span><p>1</p></div></td>
        					<td class="bg_tomorrow " title="서풍 4m/s"><div><span><img src="/assets/comn/img/we.png" alt="북서풍 1m/s" title="북서풍 1m/s"></span><p>1</p></div></td>
        					<td class="bg_tomorrow " title="북서풍 4m/s"><div><span><img src="/assets/comn/img/wnw.png" alt="북서풍 1m/s" title="북서풍 1m/s"></span><p>1</p></div></td>
        					<td class=" " title="북서풍 4m/s"><div><span><img src="/assets/comn/img/wnw.png" alt="북서풍 1m/s" title="북서풍 1m/s"></span><p>1</p></div></td>
        					<td class=" " title="북서풍 4m/s"><div><span><img src="/assets/comn/img/wnw.png" alt="북서풍 1m/s" title="북서풍 1m/s"></span><p>1</p></div></td>
        					<td class=" " title="북서풍 3m/s"><div><span><img src="/assets/comn/img/wnw.png" alt="북서풍 1m/s" title="북서풍 1m/s"></span><p>1</p></div></td>
        					<td class=" " title="북서풍 2m/s"><div><span><img src="/assets/comn/img/wnw.png" alt="북서풍 1m/s" title="북서풍 1m/s"></span><p>1</p></div></td>
        					<td class="last" title="북서풍 3m/s"><div><span><img src="/assets/comn/img/wnw.png" alt="북서풍 1m/s" title="북서풍 1m/s"></span><p>1</p></div></td>
        				</tr>
        				 -->
        				<tr class="humidity">
        					<th scope="row" class="bgblue_bottom">습도(%)</th>
        					<td class="" id="REH_03">-</td>
        					<td class="" id="REH_06">-</td>
        					<td class="" id="REH_09">-</td>
        					<td class="" id="REH_12">-</td>
        					<td class="" id="REH_15">-</td>
        					<td class="" id="REH_18">-</td>
        					<td class="" id="REH_21">-</td>
        					<td class="" id="REH_24">-</td>
        					<td class="bg_tomorrow" id="REH_27">-</td>
        					<td class="bg_tomorrow" id="REH_30">-</td>
        					<td class="bg_tomorrow" id="REH_33">-</td>
        					<td class="bg_tomorrow" id="REH_36">-</td>
        					<td class="bg_tomorrow" id="REH_39">-</td>
        					<td class="bg_tomorrow" id="REH_42">-</td>
        					<td class="bg_tomorrow" id="REH_45">-</td>
        					<td class="bg_tomorrow" id="REH_48">-</td>
        				</tr>
        			</tbody>
            </table>
          </div>
        </section>  <!-- forecast_section -->
        </br></br></br>   
        <p class="maketime">※<%=year %>년 <%=r_month %>월 <%=day %>일(<%=strWeek %>) 00:00 발표(데이터 갱신시간 07:00)</p>
        <div class="average_data space_data">
          <span class="bg_red">금일 예상발전량</span><span class="bg_orange"><%=String.format("%.3f",y_total_sum )%><span class="s_font">Kw</span></span>
        </div>
        <section class="graph_bg">
          <div id="chart_div" style="width:100%;min-width:768px; height: 500px;"></div>
        </section>
        <p class="info_text">※ 발전 예측량은 일사량과 기후조건을 기준으로 하는 값이며, 태양광발전기와 날씨조건에 따라 상이한 수치가 나올 수 있으므로, 참고용으로 활용하시기 바랍니다.</p>

        <div class="average_data space_data mt6">
          <span class="bg_red">누적일사량</span><span class="bg_orange"><%=String.format("%.3f",total_t_sum )%> <span class="s_font">MJ/㎡</span></span>
        </div>
        <section class="graph_bg">
          <div id="chart_div2" style="width:100%;min-width:768px; height: 500px;"></div>
        </section>
		

        <!-- ==============================팝업========================================= -->
        <section class="bbs_form popup_wrap attention_section">
          <a class="ico ico_close" class="popup_close" href="javascript:regist_close()">창닫기</a>
          <div>
            <div class="place_list">
             <ul>
				<li><div><input type="radio" name="master_code" value="1@@강릉시" onclick="javascript:regist_view('attention_section2')">강릉시</div></li>
				<li><div><input type="radio" name="master_code" value="2@@고성군" onclick="javascript:regist_view('attention_section2')">고성군</div></li>
				<li><div><input type="radio" name="master_code" value="3@@동해시" onclick="javascript:regist_view('attention_section2')">동해시</div></li>
				<li><div><input type="radio" name="master_code" value="4@@삼척시" onclick="javascript:regist_view('attention_section2')">삼척시</div></li>
				<li><div><input type="radio" name="master_code" value="5@@속초시" onclick="javascript:regist_view('attention_section2')">속초시</div></li>
				<li><div><input type="radio" name="master_code" value="6@@양구군" onclick="javascript:regist_view('attention_section2')">양구군</div></li>
				<li><div><input type="radio" name="master_code" value="7@@양양군" onclick="javascript:regist_view('attention_section2')">양양군</div></li>
				<li><div><input type="radio" name="master_code" value="8@@영월군" onclick="javascript:regist_view('attention_section2')">영월군</div></li>
				<li><div><input type="radio" name="master_code" value="9@@원주시" onclick="javascript:regist_view('attention_section2')">원주시</div></li>
				<li><div><input type="radio" name="master_code" value="10@@인제군" onclick="javascript:regist_view('attention_section2')">인제군</div></li>
				<li><div><input type="radio" name="master_code" value="11@@정선군" onclick="javascript:regist_view('attention_section2')">정선군</div></li>
				<li><div><input type="radio" name="master_code" value="12@@철원군" onclick="javascript:regist_view('attention_section2')">철원군</div></li>
				<li><div><input type="radio" name="master_code" value="13@@춘천시" onclick="javascript:regist_view('attention_section2')">춘천시</div></li>
				<li><div><input type="radio" name="master_code" value="14@@태백시" onclick="javascript:regist_view('attention_section2')">태백시</div></li>
				<li><div><input type="radio" name="master_code" value="15@@평창군" onclick="javascript:regist_view('attention_section2')">평창군</div></li>
				<li><div><input type="radio" name="master_code" value="16@@홍천군" onclick="javascript:regist_view('attention_section2')">홍천군</div></li>
				<li><div><input type="radio" name="master_code" value="17@@화천군" onclick="javascript:regist_view('attention_section2')">화천군</div></li>
				<li><div><input type="radio" name="master_code" value="18@@횡성군" onclick="javascript:regist_view('attention_section2')">횡성군</div></li>
             </ul>
            </div>
          </div>
          <button type="button" name="button" class="btn_basic">선택하기</button>
        </section>
         <section class="bbs_form popup_wrap place_section">
              <a class="ico ico_close" class="popup_close" href="javascript:regist_close()">창닫기</a>
              <div>
                <div class="place_list">
                  <ul>
					<li><div><input type="radio" name="master_code2" value="1@@강릉시" onclick="javascript:regist_view2('place_section2')">강릉시</div></li>
					<li><div><input type="radio" name="master_code2" value="2@@고성군" onclick="javascript:regist_view2('place_section2')">고성군</div></li>
					<li><div><input type="radio" name="master_code2" value="3@@동해시" onclick="javascript:regist_view2('place_section2')">동해시</div></li>
					<li><div><input type="radio" name="master_code2" value="4@@삼척시" onclick="javascript:regist_view2('place_section2')">삼척시</div></li>
					<li><div><input type="radio" name="master_code2" value="5@@속초시" onclick="javascript:regist_view2('place_section2')">속초시</div></li>
					<li><div><input type="radio" name="master_code2" value="6@@양구군" onclick="javascript:regist_view2('place_section2')">양구군</div></li>
					<li><div><input type="radio" name="master_code2" value="7@@양양군" onclick="javascript:regist_view2('place_section2')">양양군</div></li>
					<li><div><input type="radio" name="master_code2" value="8@@영월군" onclick="javascript:regist_view2('place_section2')">영월군</div></li>
					<li><div><input type="radio" name="master_code2" value="9@@원주시" onclick="javascript:regist_view2('place_section2')">원주시</div></li>
					<li><div><input type="radio" name="master_code2" value="10@@인제군" onclick="javascript:regist_view2('place_section2')">인제군</div></li>
					<li><div><input type="radio" name="master_code2" value="11@@정선군" onclick="javascript:regist_view2('place_section2')">정선군</div></li>
					<li><div><input type="radio" name="master_code2" value="12@@철원군" onclick="javascript:regist_view2('place_section2')">철원군</div></li>
					<li><div><input type="radio" name="master_code2" value="13@@춘천시" onclick="javascript:regist_view2('place_section2')">춘천시</div></li>
					<li><div><input type="radio" name="master_code2" value="14@@태백시" onclick="javascript:regist_view2('place_section2')">태백시</div></li>
					<li><div><input type="radio" name="master_code2" value="15@@평창군" onclick="javascript:regist_view2('place_section2')">평창군</div></li>
					<li><div><input type="radio" name="master_code2" value="16@@홍천군" onclick="javascript:regist_view2('place_section2')">홍천군</div></li>
					<li><div><input type="radio" name="master_code2" value="17@@화천군" onclick="javascript:regist_view2('place_section2')">화천군</div></li>
					<li><div><input type="radio" name="master_code2" value="18@@횡성군" onclick="javascript:regist_view2('place_section2')">횡성군</div></li>
                  </ul>
                </div>
              </div>
              <button type="button" name="button" class="btn_basic" onclick="regist_close()">선택하기</button>
            </section>
			<section class="bbs_form popup_wrap attention_section2">
              <a class="ico ico_close" class="popup_close" href="javascript:regist_close()">창닫기</a>
              <div>
                <div class="place_list">
                  <ul id="sub_place">

                  </ul>
                </div>
              </div>
              <button type="button" name="button" class="btn_basic" onclick="regist_close()">선택하기</button>
            </section>
			<section class="bbs_form popup_wrap place_section2">
              <a class="ico ico_close" class="popup_close" href="javascript:regist_close()">창닫기</a>
              <div>
                <div class="place_list">
                  <ul id="sub_place2">

                  </ul>
                </div>
              </div>
              <button type="button" name="button" class="btn_basic" onclick="regist_close()">선택하기</button>
            </section>
		</form>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
          google.charts.load('current', {
            'packages': ['corechart']
          });
          google.charts.setOnLoadCallback(drawVisualization);

          function drawVisualization() {
            var data = google.visualization.arrayToDataTable([
              ['Time', '발전량(Kw/h)', {
                role: 'style'
              }],
			  /*
              ['03~06', 2.21, 'color: #f00000'], //20 이상일 경우 color : #f00000
              ['06~09', 10.21, 'color: #f00000'], //20 이하일 경우 color : #f56e00
              ['09~12', 21.5, 'color: #f00000'], //10 이하일 경우 color : #fdd000
              ['12~15', 18.2, 'color: #f00000'],
              ['15~18', 15.1, 'color: #f56e00'],
              ['18~21', 5.54, 'color: #f56e00'],
              ['21~24', 0, 'color: #fdd000'],
              ['00~03', 0, 'color: #f56e00'],
              ['03~06', 2.21, 'color: #fdd000'],
              ['06~09', 22, 'color: #fdd000'],
              ['09~12', 26, 'color: #f56e00'],
              ['12~15', 20.68, 'color: #f56e00'],
              ['15~18', 10.21, 'color: #f00000']
			  */
              ['0', <%=y_sum3%>, 'color: <%if(y_sum3 >= 7500){%>#f00000<%}else if(y_sum3 <= 2500){%>fdd000<%}else{%>f56e00 <%}%>'], //20 이상일 경우 color : #f00000
              ['1', <%=y_sum4%>, 'color: <%if(y_sum4 >= 7500){%>#f00000<%}else if(y_sum4 <= 2500){%>fdd000<%}else{%>f56e00 <%}%>'], //20 이하일 경우 color : #f56e00
              ['2', <%=y_sum5%>, 'color: <%if(y_sum5 >= 7500){%>#f00000<%}else if(y_sum5 <= 2500){%>fdd000<%}else{%>f56e00 <%}%>'], //10 이하일 경우 color : #fdd000
              ['3', <%=y_sum6%>, 'color: <%if(y_sum6 >= 7500){%>#f00000<%}else if(y_sum6 <= 2500){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['4', <%=y_sum7%>, 'color: <%if(y_sum7 >= 7500){%>#f00000<%}else if(y_sum7 <= 2500){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['5', <%=y_sum8%>, 'color: <%if(y_sum8 >= 7500){%>#f00000<%}else if(y_sum8 <= 2500){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['6', <%=y_sum9%>, 'color: <%if(y_sum9 >= 7500){%>#f00000<%}else if(y_sum9 <= 2500){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['7', <%=y_sum10%>, 'color: <%if(y_sum10 >= 7500){%>#f00000<%}else if(y_sum10 <= 2500){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['8', <%=y_sum11%>, 'color: <%if(y_sum11 >= 7500){%>#f00000<%}else if(y_sum11 <= 2500){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['9', <%=y_sum12%>, 'color: <%if(y_sum12 >= 7500){%>#f00000<%}else if(y_sum12 <= 2500){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['10', <%=y_sum13%>, 'color: <%if(y_sum13 >= 7500){%>#f00000<%}else if(y_sum13 <= 2500){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['11', <%=y_sum14%>, 'color: <%if(y_sum14 >= 7500){%>#f00000<%}else if(y_sum14 <= 2500){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['12', <%=y_sum15%>, 'color: <%if(y_sum15 >= 7500){%>#f00000<%}else if(y_sum15 <= 2500){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['13', <%=y_sum16%>, 'color: <%if(y_sum16 >= 7500){%>#f00000<%}else if(y_sum16 <= 2500){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['14', <%=y_sum17%>, 'color: <%if(y_sum17 >= 7500){%>#f00000<%}else if(y_sum17 <= 2500){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['15', <%=y_sum18%>, 'color: <%if(y_sum18 >= 7500){%>#f00000<%}else if(y_sum18 <= 2500){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['16', <%=y_sum19%>, 'color: <%if(y_sum19 >= 7500){%>#f00000<%}else if(y_sum19 <= 2500){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['17', <%=y_sum20%>, 'color: <%if(y_sum20 >= 7500){%>#f00000<%}else if(y_sum20 <= 2500){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['18', <%=y_sum21%>, 'color: <%if(y_sum21 >= 7500){%>#f00000<%}else if(y_sum21 <= 2500){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['19', <%=y_sum22%>, 'color: <%if(y_sum22 >= 7500){%>#f00000<%}else if(y_sum22 <= 2500){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['20', <%=y_sum23%>, 'color: <%if(y_sum23 >= 7500){%>#f00000<%}else if(y_sum23 <= 2500){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['21', <%=y_sum24%>, 'color: <%if(y_sum24 >= 7500){%>#f00000<%}else if(y_sum24 <= 2500){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['22', <%=y_sum25%>, 'color: <%if(y_sum25 >= 7500){%>#f00000<%}else if(y_sum25 <= 2500){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['23', <%=y_sum26%>, 'color: <%if(y_sum26 >= 7500){%>#f00000<%}else if(y_sum26 <= 2500){%>fdd000<%}else{%>f56e00 <%}%>']
            ]);

            var data2 = google.visualization.arrayToDataTable([
              ['Month', '일사량(MJ/㎡)', {
                role: 'style'
              }],
			  /*
              ['2016-11', 1206.12, 'color: #f00000'], //1200 이상일 경우 color : #f00000
              ['2016-12', 1352.15, 'color: #f00000'], //1200 이하일 경우 color : #f56e00
              ['2017-01', 1386.94, 'color: #f00000'], //800 이하일 경우 color : #fdd000
              ['2017-02', 1242.69, 'color: #f00000'],
              ['2017-03', 1076.41, 'color: #f56e00'],
              ['2017-04', 934.27, 'color: #f56e00'],
              ['2017-05', 582.34, 'color: #fdd000'],
              ['2017-06', 725.66, 'color: #f56e00'],
              ['2017-07', 513.24, 'color: #fdd000'],
              ['2017-08', 593.22, 'color: #fdd000'],
              ['2017-09', 943.33, 'color: #f56e00'],
              ['2017-10', 1076.41, 'color: #f56e00']
			  */
              ['0', <%=t_sum3%>, 'color: <%if(t_sum3 >= 300){%>#f00000<%}else if(t_sum3 <= 100){%>fdd000<%}else{%>f56e00 <%}%>'], //20 이상일 경우 color : #f00000
              ['1', <%=t_sum4%>, 'color: <%if(t_sum4 >= 300){%>#f00000<%}else if(t_sum4 <= 100){%>fdd000<%}else{%>f56e00 <%}%>'], //20 이하일 경우 color : #f56e00
              ['2', <%=t_sum5%>, 'color: <%if(t_sum5 >= 300){%>#f00000<%}else if(t_sum5 <= 100){%>fdd000<%}else{%>f56e00 <%}%>'], //10 이하일 경우 color : #fdd000
              ['3', <%=t_sum6%>, 'color: <%if(t_sum6 >= 300){%>#f00000<%}else if(t_sum6 <= 100){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['4', <%=t_sum7%>, 'color: <%if(t_sum7 >= 300){%>#f00000<%}else if(t_sum7 <= 100){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['5', <%=t_sum8%>, 'color: <%if(t_sum8 >= 300){%>#f00000<%}else if(t_sum8 <= 100){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['6', <%=t_sum9%>, 'color: <%if(t_sum9 >= 300){%>#f00000<%}else if(t_sum9 <= 100){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['7', <%=t_sum10%>, 'color: <%if(t_sum10 >= 300){%>#f00000<%}else if(t_sum10 <= 100){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['8', <%=t_sum11%>, 'color: <%if(t_sum11 >= 300){%>#f00000<%}else if(t_sum11 <= 100){%>fdd000<%}else{%>f56e00 <%}%>'],
         	  ['9', <%=t_sum12%>, 'color: <%if(t_sum12 >= 300){%>#f00000<%}else if(t_sum12 <= 100){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['10', <%=t_sum13%>, 'color: <%if(t_sum13 >= 300){%>#f00000<%}else if(t_sum13 <= 100){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['11', <%=t_sum14%>, 'color: <%if(t_sum14 >= 300){%>#f00000<%}else if(t_sum14 <= 100){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['12', <%=t_sum15%>, 'color: <%if(t_sum15 >= 300){%>#f00000<%}else if(t_sum15 <= 100){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['13', <%=t_sum16%>, 'color: <%if(t_sum16 >= 300){%>#f00000<%}else if(t_sum16 <= 100){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['14', <%=t_sum17%>, 'color: <%if(t_sum17 >= 300){%>#f00000<%}else if(t_sum17 <= 100){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['15', <%=t_sum18%>, 'color: <%if(t_sum18 >= 300){%>#f00000<%}else if(t_sum18 <= 100){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['16', <%=t_sum19%>, 'color: <%if(t_sum19 >= 300){%>#f00000<%}else if(t_sum19 <= 100){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['17', <%=t_sum20%>, 'color: <%if(t_sum20 >= 300){%>#f00000<%}else if(t_sum20 <= 100){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['18', <%=t_sum21%>, 'color: <%if(t_sum21 >= 300){%>#f00000<%}else if(t_sum21 <= 100){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['19', <%=t_sum22%>, 'color: <%if(t_sum22 >= 300){%>#f00000<%}else if(t_sum22 <= 100){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['20', <%=t_sum23%>, 'color: <%if(t_sum23 >= 300){%>#f00000<%}else if(t_sum23 <= 100){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['21', <%=t_sum24%>, 'color: <%if(t_sum24 >= 300){%>#f00000<%}else if(t_sum24 <= 100){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['22', <%=t_sum25%>, 'color: <%if(t_sum25 >= 300){%>#f00000<%}else if(t_sum25 <= 100){%>fdd000<%}else{%>f56e00 <%}%>'],
              ['23', <%=t_sum26%>, 'color: <%if(t_sum26 >= 300){%>#f00000<%}else if(t_sum26 <= 100){%>fdd000<%}else{%>f56e00 <%}%>']
            ]);

            var options = {
              vAxis: false,
              hAxis: false,
              // hAxis: {title: 'Month'},
              seriesType: 'bars', //그래프 형식
              bar: {
                groupWidth: "15%"
              }, //그래프 width
              legend: {
                position: "none"
              },
              backgroundColor: 'none', //배경
              fontName: 'Nanum Gothic', //폰트
              fontSize: '12', //폰트 크기
              animation:{
              duration: 1000,
              easing: 'out',
              startup: true
            }
            };

            var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
            chart.draw(data, options);
            var chart2 = new google.visualization.ComboChart(document.getElementById('chart_div2'));
            chart2.draw(data2, options);
          }
        </script>

        <script type="text/javascript">
	        // 팝업
	        function preview(url) {
				$('.popup_wrap').find('iframe').attr('src',url);
				$('.blind_black').show();
				$('.blind_black').animate({opacity:0.6}, 500);
				$('.skin_view').show();
				$('.skin_view').animate({opacity:1}, 500);
	        }
	        
	        function regist_view(index) {
				$('.blind_black').show();
				$('.blind_black').animate({opacity:0.6}, 500);
				var view_box = $("." + index)
				$(view_box).show();
				$(view_box).animate({opacity:1}, 500);

				if($("input[name=master_code]:checked").val() != undefined){
					var v_master = $("input[name=master_code]:checked").val();
					var v_masterCode = v_master.split('@@')[0];
					var v_masterName = v_master.split('@@')[1];
					var params = {master_code : v_masterCode}
					ajaxCall(params,'/forum/future/futureData/selectCodeList.do');
					ajaxRes.success(function(result){
						var html=[], h=-1;
						if(result.RESULT_CODE == 'SUCCESS'){

							$('.attention_section').animate({opacity:0}, 500, function(){
								$('.attention_section').hide();
							});
							
							$(result.result).each(function(i,data){
	                			html[++h] = '<li><div><input type="radio" name="sub_area" value="" onclick="javascript:setSubArea(\''+data.area_code+'@@'+v_masterName+' '+data.sub_name+'\');">'+data.sub_name+'</div></li>';
							});
	
							if(h > -1){
								$('#sub_place').html(html.join(''));	
							} else {
								$('#sub_place').html('<li><div>데이터가 없습니다.</div></li>');
							}									
						}						
					});
				}
				$("input:radio[name=master_code]").prop("checked", false);
			}
	        
	        function regist_view2(index) {
				$('.blind_black').show();
				$('.blind_black').animate({opacity:0.6}, 500);
				var view_box = $("." + index)
				$(view_box).show();
				$(view_box).animate({opacity:1}, 500);

				if($("input[name=master_code2]:checked").val() != undefined){
					var v_master = $("input[name=master_code2]:checked").val();
					var v_masterCode = v_master.split('@@')[0];
					var v_masterName = v_master.split('@@')[1];
					var params = {master_code : v_masterCode}
					ajaxCall(params,'/forum/future/futureData/selectCodeList.do');
					ajaxRes.success(function(result){
						var html=[], h=-1;
						if(result.RESULT_CODE == 'SUCCESS'){
							
							$('.place_section').animate({opacity:0}, 500, function(){
								$('.place_section').hide();
							});
							
							$(result.result).each(function(i,data){
	                			html[++h] = '<li><div><input type="radio" name="sub_area" value="" onclick="javascript:setSubArea2(\''+data.area_code+'@@'+v_masterName+' '+data.sub_name+'\');">'+data.sub_name+'</div></li>';
							});
	
							if(h > -1){
								$('#sub_place2').html(html.join(''));	
							} else {
								$('#sub_place2').html('<li><div>데이터가 없습니다.</div></li>');
							}									
						}						
					});
				}
				$("input:radio[name=master_code2]").prop("checked", false);
			}
	        
	        function regist_close() {
				$('.bbs_form').animate({opacity:0}, 500, function(){
					$('.bbs_form').hide();
				});
				$('.blind_black').animate({opacity:0}, 500, function(){
					$('.blind_black').hide();
				});
	        }
	        
	        function setSubArea(sub_code){
	        	if(sub_code != null && sub_code != ""){
	        		$("#area_code1").val(sub_code.split('@@')[0]);
	        		$("#area_name1").val(sub_code.split('@@')[1]);
	        		$("#search_text").html(sub_code.split('@@')[1]);
	        	}
	        }
	        
	        function setSubArea2(sub_code){
	        	if(sub_code != null && sub_code != ""){
	        		$("#area_code2").val(sub_code.split('@@')[0]);
	        		$("#area_name2").val(sub_code.split('@@')[1]);
	        		$("#search_text2").html(sub_code.split('@@')[1]);
	        	}
	        }
        </script>
        <!-- ============== 내용 종료======================== -->
