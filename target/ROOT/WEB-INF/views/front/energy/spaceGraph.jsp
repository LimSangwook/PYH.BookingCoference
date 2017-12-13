<%@page import="com.module.energy.dto.EnergyDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/comm/taglib.jsp"%>
<%

	// 누적 일사량 구하기
	List<EnergyDto> energyDtoList2 = (List<EnergyDto>)request.getAttribute("result2");
	
	Double dt_total = 0.0;
	for(int i=0;i<energyDtoList2.size();i++){
		dt_total += Double.parseDouble(energyDtoList2.get(i).getTime_val());
	}

	// 총 발전량 구하기
	List<EnergyDto> energyDtoList = (List<EnergyDto>)request.getAttribute("result");

	Double d_total = 0.0;
	for(int i=0;i<energyDtoList.size();i++){
		d_total += Double.parseDouble(energyDtoList.get(i).getTime_val());
	}
	
	// 총 발전량 구하기
	Double dd_total = 0.0;
	dd_total = d_total * 29;

%>

		<script type="text/javascript">
		
			function select_space() {
				if($("input[name=future_radio]:checked").val()=="etc"){
					$("#future_kw").val($("#kw_input").val()/100);
				}else{
					$("#future_kw").val($("input[name=future_radio]:checked").val());
				}
				
				if($("#time_year").val() == ""){
					alert("기간 설정을 선택해 주세요.");
					$("#time_year").focus();
					return;
				}
				$("#space_form").submit();
			}
			
			function master_sel(v_name){
        		$("#master_code").val(v_name.split('@@')[0]);
        		$("#search_text").html(v_name.split('@@')[1]);
        		$("#total_area").val(v_name.split('@@')[1]);
			}
			
		</script>
	

          <div class="sub_section"> <!-- sub_section -->
            <h2 class="sub_main_title">과거일사량 정보</h2>
            <nav class="contents_menu">
              <ul>
                <li><a href="/forum/data/timeGraph/timeGraph.do">시간 분포도</a></li>
                <li class="on"><a href="/forum/data/spaceGraph/spaceGraph.do">공간 분포도</a></li>
              </ul>
            </nav>
          </div> <!-- sub_section -->
          <div class="sub_contents"><!--sub_contents -->
            <!-- ============== 내용 시작======================== -->
       	 	<form action="/forum/data/spaceGraph/spaceGraph.do" name="space_form" id="space_form" method="post">
      		<input type="hidden" name="total_area" id="total_area" value="${energyDto.total_area }" />
      		<input type="hidden" name="master_code" id="master_code" value="${energyDto.master_code }" />
	            <section class="search_section">
	              <div>
	                <table class="search_table">
	                  <colgroup>
	                    <col width="15%">
	                    <col width="auto">
	                   
	                  </colgroup>
	                  <tbody>
	                    <tr>
	                      <th>지역설정</th>
	                      <td colspan="" class="place_btn">
	                        <div class="search_bar change">
	                          <!--돋보기 아이콘을 누르세요.-->
					  		  <!--<span id="search_text">${energyDto.total_area }</span>-->
							  <span id="search_text"><c:choose>
														<c:when test="${energyDto.total_area ne null and energyDto.total_area ne ''}">
															${energyDto.total_area }
														</c:when>
														<c:otherwise>
															강릉시
														</c:otherwise>
													</c:choose>
								</span>							  
	                          <a href="javascript:regist_view('place_section')" class="search_ico"></a>
	                        </div>
	                      </td>
	                    </tr>
	                    <tr>
	                      <th>기간설정</th>
	
	                      <td class="text_left space_type">
	                                              <span>
                          	<select class="wid100" name="" id="time_type">
                              <option value="0">연도 기준</option>
                              <option value="1">월 기준</option>
                          	</select>
                        	</span>
	                        <span>
							<select class="wid160" name="time_year" id="time_year">
	                          <option value="">년도</option>
	                          <option value="2013" <c:if test="${energyDto.time_year eq '2013' }">selected="selected"</c:if>>2013년</option>
	                          <option value="2014" <c:if test="${energyDto.time_year eq '2014' }">selected="selected"</c:if>>2014년</option>
	                          <option value="2015" <c:if test="${energyDto.time_year eq '2015' }">selected="selected"</c:if>>2015년</option>
	                          <option value="2016" <c:if test="${energyDto.time_year eq '2016' }">selected="selected"</c:if>>2016년</option>
	                        </select>
							</span>
							<span>
							<select class="wid100" name="time_month" id="time_month">
	                          <option value="">월</option>
	                          <option value="1" <c:if test="${energyDto.time_month eq '1' }">selected="selected"</c:if>>1월</option>
	                          <option value="2" <c:if test="${energyDto.time_month eq '2' }">selected="selected"</c:if>>2월</option>
	                          <option value="3" <c:if test="${energyDto.time_month eq '3' }">selected="selected"</c:if>>3월</option>
							  <option value="4" <c:if test="${energyDto.time_month eq '4' }">selected="selected"</c:if>>4월</option>
							  <option value="5" <c:if test="${energyDto.time_month eq '5' }">selected="selected"</c:if>>5월</option>
							  <option value="6" <c:if test="${energyDto.time_month eq '6' }">selected="selected"</c:if>>6월</option>
							  <option value="7" <c:if test="${energyDto.time_month eq '7' }">selected="selected"</c:if>>7월</option>
							  <option value="8" <c:if test="${energyDto.time_month eq '8' }">selected="selected"</c:if>>8월</option>
							  <option value="9" <c:if test="${energyDto.time_month eq '9' }">selected="selected"</c:if>>9월</option>
							  <option value="10" <c:if test="${energyDto.time_month eq '10' }">selected="selected"</c:if>>10월</option>
							  <option value="11" <c:if test="${energyDto.time_month eq '11' }">selected="selected"</c:if>>11월</option>
							  <option value="12" <c:if test="${energyDto.time_month eq '12' }">selected="selected"</c:if>>12월</option>
	                        </select>
							</span>
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
	                <button type="button" name="button" class="search_btn" onclick="javascript:select_space();">결과조회</button>
	              </div>
	              <script type="text/javascript">
	                $('#time_type').on('change',function(){
	                  if($(this).val() == '0'){
	                    $('#time_month').css('display','none')
	                  } else {
	                    $('#time_month').css('display','inline-block')
	                  }
	                })
                </script>
	            </section>
            </form>
            <!--<p class="maketime">※ 기본 데이터는 2016년 강릉시 데이터입니다.</p>-->
            <section class="deco_line">
              <div class="average_data space_data">
                <span class="bg_red">${energyDto.total_area } 총 일사량</span><span class="bg_orange"><%=String.format("%.3f",dt_total )%><span class="s_font"><span class="s_font">MJ/㎡</span></span>
              </div>
            </section>
            <section class="space_solar_section">
              <h2><span></span>지역별 일사량</h2>
              <span class="space_solar_type">(단위 : MJ/㎡)</span>
              <div class="space_solar">
                <ul>
					<c:forEach var="result2" items="${result2}" varStatus="i">
	                  <li>
	                    <div><span>${i.count}</span><p>${result2.sub_name }<span><fmt:formatNumber value="${result2.time_val }" pattern=".000"/></span></p></div>
	                  </li>
	                </c:forEach>
                </ul>
              </div>
              <p class="info_text">※ 정렬기준은 일사량값 기준입니다.</p>
            </section>
            
            <section class="deco_line  mt6">
              <div class="average_data space_data">
                <span class="bg_red">${energyDto.total_area } 총 발전량</span><span class="bg_orange"><%=String.format("%.3f",dd_total )%><span class="s_font"><span class="s_font">Kw</span></span>
              </div>
            </section>
            <section class="space_solar_section">
              <h2><span></span>지역별 발전량</h2>
              <span class="space_solar_type">(단위 : Kw)</span>
              <div class="space_solar">
                <ul>
					<c:forEach var="result" items="${result}" varStatus="i">
	                  <li>
	                    <div><span>${i.count}</span><p>${result.sub_name }<span><fmt:formatNumber value="${result.time_val*29 }" pattern=".000"/></span></p></div>
	                  </li>
	                </c:forEach>
                </ul>
              </div>
              <p class="info_text">※ 정렬기준은 발전량값 기준입니다.</p>
            </section>
            
            <!-- <section class="graph_bg">
              <div id="chart_div" style="width:100%;min-width:768px; height: 500px;"></div>
            </section> -->

            <section class="bbs_form popup_wrap place_section">
              <a class="ico ico_close" class="popup_close" href="javascript:regist_close()">창닫기</a>
              <div>
                <div class="place_list">
                  <ul>
					<li><div><input type="radio" name="master_select" value="1" onclick="javascript:master_sel('1@@강릉시')">강릉시</div></li>
					<li><div><input type="radio" name="master_select" value="2" onclick="javascript:master_sel('2@@고성군')">고성군</div></li>
					<li><div><input type="radio" name="master_select" value="3" onclick="javascript:master_sel('3@@동해시')">동해시</div></li>
					<li><div><input type="radio" name="master_select" value="4" onclick="javascript:master_sel('4@@삼척시')">삼척시</div></li>
					<li><div><input type="radio" name="master_select" value="5" onclick="javascript:master_sel('5@@속초시')">속초시</div></li>
					<li><div><input type="radio" name="master_select" value="6" onclick="javascript:master_sel('6@@양구군')">양구군</div></li>
					<li><div><input type="radio" name="master_select" value="7" onclick="javascript:master_sel('7@@양양군')">양양군</div></li>
					<li><div><input type="radio" name="master_select" value="8" onclick="javascript:master_sel('8@@영월군')">영월군</div></li>
					<li><div><input type="radio" name="master_select" value="9" onclick="javascript:master_sel('9@@원주시')">원주시</div></li>
					<li><div><input type="radio" name="master_select" value="10" onclick="javascript:master_sel('10@@인제군')">인제군</div></li>
					<li><div><input type="radio" name="master_select" value="11" onclick="javascript:master_sel('11@@정선군')">정선군</div></li>
					<li><div><input type="radio" name="master_select" value="12" onclick="javascript:master_sel('12@@철원군')">철원군</div></li>
					<li><div><input type="radio" name="master_select" value="13" onclick="javascript:master_sel('13@@춘천시')">춘천시</div></li>
					<li><div><input type="radio" name="master_select" value="14" onclick="javascript:master_sel('14@@태백시')">태백시</div></li>
					<li><div><input type="radio" name="master_select" value="15" onclick="javascript:master_sel('15@@평창군')">평창군</div></li>
					<li><div><input type="radio" name="master_select" value="16" onclick="javascript:master_sel('16@@홍천군')">홍천군</div></li>
					<li><div><input type="radio" name="master_select" value="17" onclick="javascript:master_sel('17@@화천군')">화천군</div></li>
					<li><div><input type="radio" name="master_select" value="18" onclick="javascript:master_sel('18@@횡성군')">횡성군</div></li>
                  </ul>
                </div>
              </div>
              <button type="button" name="button" class="btn_basic" onclick="regist_close()">선택하기</button>
            </section>
            
            <!-- <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
            <script type="text/javascript">

  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawVisualization);

  function drawVisualization() {
    var data = google.visualization.arrayToDataTable([
        ['Day', '일사량(MJ/㎡)', {role : 'style'}],
        ['1', 1206.12,'color: #f00000'],     //1200 이상일 경우 color : #f00000
        ['2', 1352.15,'color: #f00000'],     //1200 이하일 경우 color : #f56e00
        ['3', 1386.94,'color: #f00000'],     //800 이하일 경우 color : #fdd000
        ['4', 1242.69,'color: #f00000'],
        ['5', 1076.41,'color: #f56e00'],
        ['6', 934.27,'color: #f56e00'],
        ['7', 582.34,'color: #fdd000'],
        ['8', 725.66,'color: #f56e00'],
        ['9', 513.24,'color: #fdd000'],
        ['10', 593.22,'color: #fdd000'],
        ['11', 943.33,'color: #f56e00'],
        ['12', 1076.41,'color: #f56e00'],
        ['13', 1206.12,'color: #f00000'],     //1200 이상일 경우 color : #f00000
        ['14', 1352.15,'color: #f00000'],     //1200 이하일 경우 color : #f56e00
        ['15', 1386.94,'color: #f00000'],     //800 이하일 경우 color : #fdd000
        ['16', 1242.69,'color: #f00000'],
        ['17', 1076.41,'color: #f56e00'],
        ['18', 934.27,'color: #f56e00'],
        ['19', 582.34,'color: #fdd000'],
        ['20', 725.66,'color: #f56e00'],
        ['21', 513.24,'color: #fdd000'],
        ['22', 593.22,'color: #fdd000'],
        ['23', 943.33,'color: #f56e00'],
        ['24', 1076.41,'color: #f56e00'],
        ['25', 725.66,'color: #f56e00'],
        ['26', 513.24,'color: #fdd000'],
        ['27', 593.22,'color: #fdd000'],
        ['28', 943.33,'color: #f56e00'],
        ['29', 1076.41,'color: #f56e00'],
        ['30', 1076.41,'color: #f56e00'],
        ['31', 1242.69,'color: #f00000']
      ]);
    var options = {
        vAxis: false,
        hAxis: false,
        // hAxis: {title: 'Month'},
        seriesType: 'bars',  //그래프 형식
        bar: {groupWidth: "15%"}, //그래프 width
        legend: { position: "none" },
        backgroundColor:'none', //배경
        fontName:'Nanum Gothic',  //폰트
        fontSize:'12', //폰트 크기
        animation:{
        duration: 1000,
        easing: 'linear',
        startup: true
      }
      };

    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }

            </script> -->
 

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
            }
            function regist_close() {
              $('.bbs_form').animate({opacity:0}, 500, function(){
                $('.bbs_form').hide();
              });
              $('.blind_black').animate({opacity:0}, 500, function(){
                $('.blind_black').hide();
              });
            }
            </script>




            <!-- ============== 내용 종료======================== -->