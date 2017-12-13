<%@page import="com.module.energy.dto.EnergyDto"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/comm/taglib.jsp"%>
<%


	// 누적 일사량 구하기
	List<EnergyDto> energyDtoList2 = (List<EnergyDto>)request.getAttribute("result2");
	
	Double dt_total = 0.0;
	for(int i=0;i<energyDtoList2.size();i++){
		dt_total += Double.parseDouble(energyDtoList2.get(i).getTime_val());
	}


	// 누적 발전량 구하기
	List<EnergyDto> energyDtoList = (List<EnergyDto>)request.getAttribute("result");
	EnergyDto energyDto = (EnergyDto)request.getAttribute("energyDto");
	
	
	Double d_total = 0.0;
	for(int i=0;i<energyDtoList.size();i++){
		d_total += Double.parseDouble(energyDtoList.get(i).getTime_val());
	}
	
	// 총 발전량 구하기
	Double dd_total = 0.0;
	dd_total = d_total * 29;
%>
	<script type="text/javascript">
	
		function select_time() {
			if($("input[name=future_radio]:checked").val()=="etc"){
				$("#future_kw").val($("#kw_input").val()/100);
			}else{
				$("#future_kw").val($("input[name=future_radio]:checked").val());
			}
			
			if($("#time_year").val() == "" || $("#time_month1").val() == "" || $("#time_year2").val() == "" || $("#time_month2").val() == "" ){
				alert("기간 설정을 선택해 주세요.");
				return;
			}
			var start_dt = $("#time_year").val() + $("#time_month1").val();
			var end_dt = $("#time_year2").val() + $("#time_month2").val();
			console.log("start_dt::"+start_dt);
			console.log("end_dt::"+end_dt);
			if(start_dt==end_dt){
				$("#time_flag").val("day");
			}else{
				$("#time_flag").val("month");
			}
			$("#time_form").attr("action","/forum/data/timeGraph/timeGraph.do");
			$("#time_form").submit();
		}

		function excel_time() {
			if($("#time_year").val() == "" || $("#time_month1").val() == "" || $("#time_year2").val() == "" || $("#time_month2").val() == "" ){
				alert("기간 설정을 선택해 주세요.");
				return;
			}			
			$("#time_form").attr("action","/forum/data/timeGraph/timeExcel.do");
			$("#time_form").submit();
		}
	</script>



      <div class="sub_section">
        <!-- sub_section -->
        <h2 class="sub_main_title">과거일사량 정보</h2>
        <nav class="contents_menu">
          <ul>
            <li class="on"><a href="/forum/data/timeGraph/timeGraph.do">시간 분포도</a></li>
            <li><a href="/forum/data/spaceGraph/spaceGraph.do">공간 분포도</a></li>
          </ul>
        </nav>
      </div>
      <!-- sub_section -->
      <div class="sub_contents">
        <!--sub_contents -->
        <!-- ============== 내용 시작======================== -->
        <form action="/forum/data/timeGraph/timeGraph.do" name="time_form" id="time_form" method="post">
      	<input type="hidden" name="area_code" id="area_code" value="${energyDto.area_code }" />
      	<input type="hidden" name="time_flag" id="time_flag" value="${energyDto.time_flag }" />
      	<input type="hidden" name="total_area" id="total_area" value="${energyDto.total_area }" />
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
                  <th>기간설정</th>
                  <td>
                    <select class="col100" name="start_year" id="time_year">
                          <option value="">년도</option>
                          <option value="2013" <c:if test="${energyDto.start_year eq '2013' }">selected="selected"</c:if>>2013년</option>
                          <option value="2014" <c:if test="${energyDto.start_year eq '2014' }">selected="selected"</c:if>>2014년</option>
                          <option value="2015" <c:if test="${energyDto.start_year eq '2015' }">selected="selected"</c:if>>2015년</option>
                          <option value="2016" <c:if test="${energyDto.start_year eq '2016' }">selected="selected"</c:if> 
													  <c:if test="${energyDto.start_year eq null }">selected="selected"</c:if>>2016년</option>
                        </select>
                  </td>
                  <td>
                    <select class="col100" name="start_month" id="time_month1">
                          <option value="">월</option>
                          <option value="1" <c:if test="${energyDto.start_month eq '1' }">selected="selected"</c:if>
												  <c:if test="${energyDto.start_month eq null }">selected="selected"</c:if>>1월</option>
                          <option value="2" <c:if test="${energyDto.start_month eq '2' }">selected="selected"</c:if>>2월</option>
                          <option value="3" <c:if test="${energyDto.start_month eq '3' }">selected="selected"</c:if>>3월</option>
						  <option value="4" <c:if test="${energyDto.start_month eq '4' }">selected="selected"</c:if>>4월</option>
						  <option value="5" <c:if test="${energyDto.start_month eq '5' }">selected="selected"</c:if>>5월</option>
						  <option value="6" <c:if test="${energyDto.start_month eq '6' }">selected="selected"</c:if>>6월</option>
						  <option value="7" <c:if test="${energyDto.start_month eq '7' }">selected="selected"</c:if>>7월</option>
						  <option value="8" <c:if test="${energyDto.start_month eq '8' }">selected="selected"</c:if>>8월</option>
						  <option value="9" <c:if test="${energyDto.start_month eq '9' }">selected="selected"</c:if>>9월</option>
						  <option value="10" <c:if test="${energyDto.start_month eq '10' }">selected="selected"</c:if>>10월</option>
						  <option value="11" <c:if test="${energyDto.start_month eq '11' }">selected="selected"</c:if>>11월</option>
						  <option value="12" <c:if test="${energyDto.start_month eq '12' }">selected="selected"</c:if>>12월</option>
                        </select>
                  </td>
                  <td>
                    ~
                  </td>
                  <td>
                    <select class="col100" name="end_year" id="time_year2">
                          <option value="">년도</option>
                          <option value="2013" <c:if test="${energyDto.end_year eq '2013' }">selected="selected"</c:if>>2013년</option>
                          <option value="2014" <c:if test="${energyDto.end_year eq '2014' }">selected="selected"</c:if>>2014년</option>
                          <option value="2015" <c:if test="${energyDto.end_year eq '2015' }">selected="selected"</c:if>>2015년</option>
                          <option value="2016" <c:if test="${energyDto.end_year eq '2016' }">selected="selected"</c:if>
													  <c:if test="${energyDto.end_year eq null }">selected="selected"</c:if>>2016년</option>
                        </select>
                  </td>
                  <td>
                    <select class="col100" name="end_month" id="time_month2">
                          <option value="">월</option>
                          <option value="1" <c:if test="${energyDto.end_month eq '1' }">selected="selected"</c:if>>1월</option>
                          <option value="2" <c:if test="${energyDto.end_month eq '2' }">selected="selected"</c:if>>2월</option>
                          <option value="3" <c:if test="${energyDto.end_month eq '3' }">selected="selected"</c:if>>3월</option>
						  <option value="4" <c:if test="${energyDto.end_month eq '4' }">selected="selected"</c:if>>4월</option>
						  <option value="5" <c:if test="${energyDto.end_month eq '5' }">selected="selected"</c:if>>5월</option>
						  <option value="6" <c:if test="${energyDto.end_month eq '6' }">selected="selected"</c:if>>6월</option>
						  <option value="7" <c:if test="${energyDto.end_month eq '7' }">selected="selected"</c:if>>7월</option>
						  <option value="8" <c:if test="${energyDto.end_month eq '8' }">selected="selected"</c:if>>8월</option>
						  <option value="9" <c:if test="${energyDto.end_month eq '9' }">selected="selected"</c:if>>9월</option>
						  <option value="10" <c:if test="${energyDto.end_month eq '10' }">selected="selected"</c:if>>10월</option>
						  <option value="11" <c:if test="${energyDto.end_month eq '11' }">selected="selected"</c:if>>11월</option>
						  <option value="12" <c:if test="${energyDto.end_month eq '12' }">selected="selected"</c:if>
												   <c:if test="${energyDto.end_month eq null }">selected="selected"</c:if>>12월</option>
                        </select>
                  </td>
                </tr>
                <tr>
                  <th>지역설정</th>
                  <td colspan="5" class="place_btn">
                    <div class="search_bar change">
                      <!--돋보기 아이콘을 누르세요.-->
					  <span id="search_text"><c:choose>
														<c:when test="${energyDto.total_area ne null and energyDto.total_area ne ''}">
															${energyDto.total_area }
														</c:when>
														<c:otherwise>
															강릉시 강남동
														</c:otherwise>
													</c:choose>
						</span>
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
            <button type="button" name="button" class="search_btn" onclick="javascript:select_time();">결과조회</button>
          </div>
        </section>
        <!--<p class="maketime">※ 기본 데이터는 강릉시 강남동 데이터입니다.</p>-->
        <div class="average_data space_data">
          <span class="bg_red">누적일사량</span>
          <span class="bg_orange"><%=String.format("%.3f",dt_total )%><span class="s_font">MJ/㎡</span></span>
          
        </div>
        <section class="graph_bg">
          <div id="chart_div" style="width:100%;min-width:768px; height: 500px;"></div>
        </section>
        <div class="average_data space_data mt6">
          <span class="bg_red">누적발전량</span>
          <span class="bg_orange"><%=String.format("%.3f",dd_total )%><span class="s_font">Kw</span></span>
        </div>
        <section class="graph_bg">
          <div id="chart_div2" style="width:100%;min-width:768px; height: 500px;"></div>
        </section>
      
        <div class="text_right">
          <button class="btn_basic" type="button" name="button" onclick="javascript:excel_time();">엑셀다운</button>
        </div>
		</form>


        <!-- ===============================팝업=====================================-->
        <section class="bbs_form popup_wrap place_section">
              <a class="ico ico_close" class="popup_close" href="javascript:regist_close()">창닫기</a>
              <div>
                <div class="place_list">
                  <ul>
					<li><div><input type="radio" name="master_code" value="1@@강릉시" onclick="javascript:regist_view('place_section2')">강릉시</div></li>
					<li><div><input type="radio" name="master_code" value="2@@고성군" onclick="javascript:regist_view('place_section2')">고성군</div></li>
					<li><div><input type="radio" name="master_code" value="3@@동해시" onclick="javascript:regist_view('place_section2')">동해시</div></li>
					<li><div><input type="radio" name="master_code" value="4@@삼척시" onclick="javascript:regist_view('place_section2')">삼척시</div></li>
					<li><div><input type="radio" name="master_code" value="5@@속초시" onclick="javascript:regist_view('place_section2')">속초시</div></li>
					<li><div><input type="radio" name="master_code" value="6@@양구군" onclick="javascript:regist_view('place_section2')">양구군</div></li>
					<li><div><input type="radio" name="master_code" value="7@@양양군" onclick="javascript:regist_view('place_section2')">양양군</div></li>
					<li><div><input type="radio" name="master_code" value="8@@영월군" onclick="javascript:regist_view('place_section2')">영월군</div></li>
					<li><div><input type="radio" name="master_code" value="9@@원주시" onclick="javascript:regist_view('place_section2')">원주시</div></li>
					<li><div><input type="radio" name="master_code" value="10@@인제군" onclick="javascript:regist_view('place_section2')">인제군</div></li>
					<li><div><input type="radio" name="master_code" value="11@@정선군" onclick="javascript:regist_view('place_section2')">정선군</div></li>
					<li><div><input type="radio" name="master_code" value="12@@철원군" onclick="javascript:regist_view('place_section2')">철원군</div></li>
					<li><div><input type="radio" name="master_code" value="13@@춘천시" onclick="javascript:regist_view('place_section2')">춘천시</div></li>
					<li><div><input type="radio" name="master_code" value="14@@태백시" onclick="javascript:regist_view('place_section2')">태백시</div></li>
					<li><div><input type="radio" name="master_code" value="15@@평창군" onclick="javascript:regist_view('place_section2')">평창군</div></li>
					<li><div><input type="radio" name="master_code" value="16@@홍천군" onclick="javascript:regist_view('place_section2')">홍천군</div></li>
					<li><div><input type="radio" name="master_code" value="17@@화천군" onclick="javascript:regist_view('place_section2')">화천군</div></li>
					<li><div><input type="radio" name="master_code" value="18@@횡성군" onclick="javascript:regist_view('place_section2')">횡성군</div></li>
                  </ul>
                </div>
              </div>
              <button type="button" name="button" class="btn_basic" onclick="regist_close()">선택하기</button>
            </section>
            <section class="bbs_form popup_wrap place_section2">
              <a class="ico ico_close" class="popup_close" href="javascript:regist_close()">창닫기</a>
              <div>
                <div class="place_list">
                  <ul id="sub_place">
                  
                  </ul>
                </div>
              </div>
              <button type="button" name="button" class="btn_basic" onclick="regist_close()">선택하기</button>
            </section>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
          google.charts.load('current', {
            'packages': ['corechart']
          });
          google.charts.setOnLoadCallback(drawVisualization);

          function drawVisualization() {
            var data = google.visualization.arrayToDataTable([
              ['Month', '일사량(MJ/㎡)', {
                role: 'style' 
              }],
              /* 
              ['2016-01', ${generateData.month1}, 'color: #f00000'], //1200 이상일 경우 color : #f00000
              ['2016-02', ${generateData.month2}, 'color: #f00000'], //1200 이하일 경우 color : #f56e00
              ['2016-03', ${generateData.month3}, 'color: #f00000'], //800 이하일 경우 color : #fdd000
              ['2016-04', ${generateData.month4}, 'color: #f00000'],
              ['2016-05', ${generateData.month5}, 'color: #f56e00'],
              ['2016-06', ${generateData.month6}, 'color: #f56e00'],
              ['2016-07', ${generateData.month7}, 'color: #fdd000'],
              ['2016-08', ${generateData.month8}, 'color: #f56e00'],
              ['2016-09', ${generateData.month9}, 'color: #fdd000'],
              ['2016-10', ${generateData.month10}, 'color: #fdd000'],
              ['2016-11', ${generateData.month11}, 'color: #f56e00'],
              ['2016-12', ${generateData.month12}, 'color: #f56e00']
               */
              <%
              if(energyDto.getTime_flag().equals("month")){
              	for(int i=0;i<energyDtoList2.size();i++){
              %>
				['<%=energyDtoList2.get(i).getTime_date().substring(0,4)%>-<%=energyDtoList2.get(i).getTime_date().substring(4,6)%>', <%=energyDtoList2.get(i).getTime_val()%>, 'color: #f00000']<%if(i!=energyDtoList2.size()-1){%>,<%}%>
              <%
              	}
              }else{
               	for(int i=0;i<energyDtoList2.size();i++){
              %>
				['<%=energyDtoList2.get(i).getTime_day()%>', <%=energyDtoList2.get(i).getTime_val()%>, 'color: #f00000']<%if(i!=energyDtoList2.size()-1){%>,<%}%>
              <%
               	}
              }
              %>
            ]);
            var data2 = google.visualization.arrayToDataTable([
			  ['Month', '발전량(Kw/h)', {
			    role: 'style'
			  }],
			  /* 
			  ['2016-11', 1206.12, 'color: #f00000'], //그래프 색은 실 발전량 데이트를 토대로 바뀔 예정입니다.
			  ['2016-12', 1352.15, 'color: #f00000'], 
			  ['2017-01', 1386.94, 'color: #f00000'],
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
              <%
              if(energyDto.getTime_flag().equals("month")){
              	for(int i=0;i<energyDtoList.size();i++){
               		Double d_val = Double.parseDouble(energyDtoList.get(i).getTime_val())*29;
              %>
				['<%=energyDtoList.get(i).getTime_date().substring(0,4)%>-<%=energyDtoList.get(i).getTime_date().substring(4,6)%>', <%=d_val%>, 'color: #f00000']<%if(i!=energyDtoList.size()-1){%>,<%}%>
              <%
              	}
              }else{
               	for(int i=0;i<energyDtoList.size();i++){
               		Double d_val = Double.parseDouble(energyDtoList.get(i).getTime_val())*29;
              %>
				['<%=energyDtoList.get(i).getTime_day()%>', <%=d_val%>, 'color: #f00000']<%if(i!=energyDtoList.size()-1){%>,<%}%>
              <%
               	}
              }
              %>
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
              fontSize: '13', //폰트 크기
              animation:{
              duration: 1000,
              easing: 'linear',
              startup: true
            }
            };

            var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
            var chart2 = new google.visualization.ComboChart(document.getElementById('chart_div2'));
            chart.draw(data, options);
            chart2.draw(data2, options);
          }
        </script>
       <!-- <script src="comn/js/birthday.js" type="text/javascript"></script>-->
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
						$('.place_section').animate({opacity:0}, 500, function(){
							$('.place_section').hide();
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
        		$("#area_code").val(sub_code.split('@@')[0]);
        		$("#search_text").html(sub_code.split('@@')[1]);
        		$("#total_area").val(sub_code.split('@@')[1]);
        	}
        }
        </script>




        <!-- ============== 내용 종료======================== -->