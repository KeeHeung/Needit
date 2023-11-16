<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

<style>
@import url('https://fonts.googleapis.com/css?family=Questrial&display=swap');

.modal {
	--bs-modal-width: 395px;
}

.Calendar {
    text-align: center;
}

.Calendar>thead>tr:first-child>td {
    font-family: 'Questrial', sans-serif;
    font-size: 1.1em;
    font-weight: bold;
}

.Calendar>thead>tr:last-child>td {
    font-family: 'Questrial', sans-serif;
    font-weight: 600;     
}

.Calendar>tbody>tr>td>p {
    font-family: 'Montserrat', sans-serif;
    height: 45px;
    width: 45px;
    border-radius: 45px;
    transition-duration: .2s;
    line-height: 45px;
    margin: 2.5px;
    display: block;
    text-align: center;
}        

.pastDay {
    color: lightgray;
}

.today {
    background-color: #F5D042;            
    color: #fff;
    font-weight: 600;
    cursor: pointer;
}

.futureDay {
    background-color: #FFFFFF;
    cursor: pointer;
}
.futureDay:hover{
    background:#eee;
}

.futureDay.choiceDay,
.today.choiceDay {
    background: #0A174E;
    color: #fff;
    font-weight: 600;
    cursor: pointer;
}

#makeRent {
	color: white;
	background-color: rgb(255,83,63);
}
</style>

<script type="text/javascript">
$(function(){
    // 다음 달의 날짜에 대한 클릭 이벤트 추가
    $(".Calendar").on("click", ".futureMonth", function(){
        let clickedDate = parseInt($(this).text()); // 문자열을 숫자로 변환
        let nextMonth = nowMonth.getMonth() + 1; // 현재 월에 1을 더해 다음 달로 설정
        let fullDate = new Date(nowMonth.getFullYear(), nextMonth - 1, clickedDate); // 월의 경우 1을 빼줌
        console.log("클릭한 날짜 선택", fullDate);
        
        // 선택한 날짜를 hidden input에 설정
        $("#selectedDate").val(fullDate.getTime());

        $("#time").show();
    });
})
</script>

<script>
    window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행

    let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
    let today = new Date();     // 페이지를 로드한 날짜를 저장
    today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화

    // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
    function buildCalendar() {

        let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);
        let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);
        let tbody_Calendar = document.querySelector(".Calendar > tbody");
        document.getElementById("calYear").innerText = nowMonth.getFullYear();
        document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);

        while (tbody_Calendar.rows.length > 0) {
            tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
        }

        let nowRow = tbody_Calendar.insertRow();

        for (let j = 0; j < firstDate.getDay(); j++) {
            let nowColumn = nowRow.insertCell();
        }

        for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {

            let nowColumn = nowRow.insertCell();

            let newDIV = document.createElement("p");
            newDIV.innerHTML = leftPad(nowDay.getDate());
            nowColumn.appendChild(newDIV);

            if (nowDay.getDay() == 6) {
                nowRow = tbody_Calendar.insertRow();
            }

            if (nowDay < today) {
                newDIV.className = "pastDay";
            }
            else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) {
                newDIV.className = "today";
                newDIV.onclick = function () { choiceDate(this); }
            }
            else if (nowDay.getMonth() == today.getMonth() + 1 || nowDay.getMonth() == today.getMonth() + 2) {
                newDIV.className = "futureDay futureMonth";
                newDIV.onclick = function () { choiceDate(this); }
            }
            else {
                newDIV.className = "futureDay";
                newDIV.onclick = function () { choiceDate(this); }
            }       
        }
    }

    // 날짜 선택
    function choiceDate(newDIV) {
        if (document.getElementsByClassName("choiceDay")[0]) {
            document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");
        }
        newDIV.classList.add("choiceDay", "futureMonth");
    }

    // 이전달 버튼 클릭
    function prevCalendar() {
        nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());
        buildCalendar();
    }

    // 다음달 버튼 클릭
    function nextCalendar() {
        nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());
        buildCalendar();
    }

    // input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
    function leftPad(value) {
        if (value < 10) {
            value = "0" + value;
            return value;
        }
        return value;
    }
</script>
	
<!-- 대여 시간 -->
<script type="text/javascript">
$(function(){
    // 대여하기 버튼 클릭 시 서버로 전송
    $("#makeRent").click(function () {
        let selectedDate = $("#selectedDate").val();
        let selectedTime = $("input[name='time']:checked").val();

        // 예약 정보를 서버로 전송
        $.ajax({
            type: "POST",
            url: "/rent/rent"
            , data: {
            	boardNo: "${board.boardNo }",
            	renterId: "${id }",
            	rentDate: new Date(parseInt(selectedDate)),
                rentTime: selectedTime,
                rentStatus : 1
            }
            // 예약 성공 시 추가 작업 수행
            , success: function (res) {
                console.log("서버 응답:", res);
            }
            , error: function (error) {
                console.error("에러 발생:", error);
            }
        });
    });
});
</script>

<!-- Modal, 대여 -->
<div class="modal fade" id="rentModal" tabindex="-1" aria-labelledby="rentModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		
			<!-- Modal Header -->
			<div class="modal-header">
				<h5 class="modal-title" id="rentModalLabel">대여일 선택</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div><!-- .modal-header -->
			
			<!-- Modal Body -->
			<div class="modal-body">
				    <div>
				        <table class="Calendar">
				            <thead>
				                <tr>
				                    <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
				                    <td colspan="5">
				                        <span id="calYear"></span>년
				                        <span id="calMonth"></span>월
				                    </td>
				                    <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
				                </tr>
				                <tr>
				                    <td>일</td>
				                    <td>월</td>
				                    <td>화</td>
				                    <td>수</td>
				                    <td>목</td>
				                    <td>금</td>
				                    <td>토</td>
				                </tr>
				            </thead>
				
				            <tbody>
				            </tbody>
				        </table>
				    </div><br><br>
				    
				    <!-- 예약 시간을 선택하는 폼 -->
				    <form>
				        <div style="display: none;" id="time">
				            <div style="margin-bottom: 5px;">
			            	<span>대여 시간</span>
				            <select>
					            <option name="time" value="1" disabled="disabled"> 00:00 ~ 00:30 </option>
					            <option name="time" value="2"> 00:30 ~ 01:00 </option>
					            <option name="time" value="3"> 01:00 ~ 01:30 </option>
					            <option name="time" value="4"> 01:30 ~ 02:00 </option>
					            <option name="time" value="5"> 02:00 ~ 02:30 </option>
					            <option name="time" value="6"> 02:30 ~ 03:00 </option>
					            <option name="time" value="7"> 03:00 ~ 03:30 </option>
					            <option name="time" value="8"> 03:30 ~ 04:00 </option>
					            <option name="time" value="9"> 04:00 ~ 04:30 </option>
					            <option name="time" value="10"> 04:30 ~ 05:00 </option>
					            <option name="time" value="11"> 05:00 ~ 05:30 </option>
					            <option name="time" value="12"> 05:30 ~ 06:00 </option>
					            <option name="time" value="13"> 06:00 ~ 06:30 </option>
					            <option name="time" value="14"> 06:30 ~ 07:00 </option>
					            <option name="time" value="15"> 07:00 ~ 07:30 </option>
					            <option name="time" value="16"> 07:30 ~ 08:00 </option>
					            <option name="time" value="17"> 08:00 ~ 08:30 </option>
					            <option name="time" value="18"> 08:30 ~ 09:00 </option>
					            <option name="time" value="19"> 09:00 ~ 09:30 </option>
					            <option name="time" value="20"> 09:30 ~ 10:00 </option>
					            <option name="time" value="21"> 10:00 ~ 10:30 </option>
					            <option name="time" value="22"> 10:30 ~ 11:00 </option>
					            <option name="time" value="23"> 11:00 ~ 11:30 </option>
					            <option name="time" value="24"> 11:30 ~ 12:00 </option>
					            <option name="time" value="25"> 12:00 ~ 12:30 </option>
					            <option name="time" value="26"> 12:30 ~ 13:00 </option>
					            <option name="time" value="27"> 13:00 ~ 13:30 </option>
					            <option name="time" value="28"> 13:30 ~ 13:00 </option>
					            <option name="time" value="29"> 14:00 ~ 13:30 </option>
					            <option name="time" value="30"> 14:30 ~ 13:00 </option>
					            <option name="time" value="31"> 15:00 ~ 13:30 </option>
					            <option name="time" value="32"> 15:30 ~ 13:00 </option>
					            <option name="time" value="33"> 16:00 ~ 13:30 </option>
					            <option name="time" value="34"> 16:30 ~ 13:00 </option>
					            <option name="time" value="35"> 17:00 ~ 13:30 </option>
					            <option name="time" value="36"> 17:30 ~ 13:00 </option>
					            <option name="time" value="37"> 18:00 ~ 13:30 </option>
					            <option name="time" value="38"> 18:30 ~ 13:00 </option>
					            <option name="time" value="39"> 19:00 ~ 13:30 </option>
					            <option name="time" value="40"> 19:30 ~ 13:00 </option>
					            <option name="time" value="41"> 20:00 ~ 13:30 </option>
					            <option name="time" value="42"> 20:30 ~ 13:00 </option>
					            <option name="time" value="43"> 21:00 ~ 13:30 </option>
					            <option name="time" value="44"> 21:30 ~ 13:00 </option>
					            <option name="time" value="45"> 22:00 ~ 13:30 </option>
					            <option name="time" value="46"> 22:30 ~ 13:00 </option>
					            <option name="time" value="47"> 23:00 ~ 13:30 </option>
					            <option name="time" value="48"> 23:30 ~ 00:00 </option>
				            </select>
						    <button type="button" name="makeRent" id="makeRent" class="btn">대여하기</button>
				            </div>
				        </div>
				        
				        <!-- 선택한 날짜를 저장할 hidden input -->
				        <input type="hidden" name="selectedDate" id="selectedDate" >
				    </form>
			</div><!-- .modal-body -->
			
			<!-- Modal Footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			</div><!-- .modal-footer -->
		</div>
	</div><!-- .modal-dialog -->
</div><!-- .modal fade -->


