<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1><a href="/facility/meeting">회의실 예약</a></h1>
<h1><a href="/facility/rest">자리 예약</a></h1>
<h1><a href="/facility/vehicle">차량 예약</a></h1>

<hr/>
<c:forEach var="vehicleVO" items="${vehicles}">
    <button type="button" onclick="setRoomNumber(this); loadReservation(this);">
        <i></i>
        <div>
            <h3>${vehicleVO.vhcleVhcty}</h3> <!-- 차량 -->
            <p class="no">${vehicleVO.vhcleNo}</p> <!-- 차 번호 -->
            <h4>하이패스</h4>
            <p>${vehicleVO.commonCodeHipassAsnAt}</p> <!-- 가능/불가능 -->
            <h4>인원</h4>
            <p><span>${vehicleVO.vhclePsncpa}</span>명</p>
        </div>
    </button>
</c:forEach>
<hr/>
<h2 onclick="reserveVehicle()">예약하기</h2>
<div id="reserve">
    <form action="">
        <!-- 차량 클릭시 차 번호가 name값으로 들어옴 -->
        <input type="hidden" name="vhcleNo" id="vhcleNo"/>
        <p id="today"></p>
        <p id="time"></p>
        <span>오전</span>
        <button type="button" class="timeButton">9:00</button>
        <button type="button" class="timeButton">11:00</button>

        <span>오후</span>
        <button type="button" class="timeButton">13:00</button>
        <button type="button" class="timeButton">15:00</button>
        <button type="button" class="timeButton">17:00</button>
        <button type="button" class="timeButton">19:00</button>

        <%--    <h3>요청사항</h3>--%>
        <%--    <input type="text" name="" value="" placeholder="비품 등 요청 사항을 적어주세요 :)"/>--%>

        <div>
            <p><i></i>가능</p>
            <p><i></i>불가능</p>
        </div>

        <button type="button">예약하기</button>
    </form>
</div>
<h2 onclick="getMyReserveList()">내 예약 현황</h2>
<div id="myReserveList" style="display: none"></div>
<script>
    //날짜
    let today = document.querySelector("#today");

    const currentDate = new Date();
    const month = currentDate.getMonth() + 1;
    const day = currentDate.getDate();
    const daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
    const dayOfWeek = daysOfWeek[currentDate.getDay()];

    let todayCode = `\${month}.\${day}(\${dayOfWeek})`;
    today.innerText = todayCode;

    //차량 번호
    function setRoomNumber(vhcle) {
        vhcleNo = $(vhcle).find(".no").html();
        $("#vhcleNo").attr("value", vhcleNo);
    }

    function loadReservation(vhcle) {
        vhcleNo = $(vhcle).find(".no").html();

        let xhr = new XMLHttpRequest();
        xhr.open("get", `/facility/reservedVehicles/\${vhcleNo}`, true);
        xhr.setRequestHeader("ContentType", "application/json;charset=utf-8");
        xhr.onreadystatechange = function () {
            if (xhr.status == 200 && xhr.readyState == 4) {
                const timeButtonList = document.querySelectorAll(".timeButton");
                for (let j = 0; j < timeButtonList.length; j++) {
                    timeButtonList[j].removeAttribute("disabled");
                }
                let result = JSON.parse(xhr.responseText); // 어차피 예약된 애들만 옴
                for (let i = 0; i < result.length; i++) {
                    const reservedDate = new Date(result[i].vhcleResveBeginTime);
                    let reservedYear = reservedDate.getFullYear();
                    let reservedMonth = reservedDate.getMonth() + 1;
                    let reservedDay = reservedDate.getDate();
                    const reserved = `\${reservedYear}/\${reservedMonth}/\${reservedDay}`;

                    let nowYear = currentDate.getFullYear();
                    const now = `\${nowYear}/\${month}/\${day}`;

                    let reservedTime = reservedDate.getHours();
                    for (let j = 0; j < timeButtonList.length; j++) {
                        let timeButtonValue = timeButtonList[j].textContent;
                        timeButtonValue = timeButtonValue.substring(0, timeButtonValue.indexOf(":"));
                        if (reserved == now && reservedTime == timeButtonValue) {
                            timeButtonList[j].setAttribute("disabled", "disabled");
                        }
                    }
                }
            }
        }
        xhr.send(vhcleNo);
    }

    const myReserveList = document.querySelector("#myReserveList");
    const reserve = document.querySelector("#reserve");

    function getMyReserveList() {
        if (myReserveList.style.display === "none") {
            myReserveList.style.display = "block";
            reserve.style.display = "none";

            let xhr = new XMLHttpRequest();
            xhr.open("get", "/facility/myReservedVehicles", true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    let myReservedList = JSON.parse(xhr.responseText);
                    let tableStr = `<table border=1><tr><td>차번호</td><td>예약시간</td><td>취소</td></tr>`;
                    for (let i = 0; i < myReservedList.length; i++) {
                        let beginHour = new Date(myReservedList[i].vhcleResveBeginTime).getHours().toString() + ":00";
                        let endHour = new Date(myReservedList[i].vhcleResveEndTime).getHours().toString() + ":00";
                        let newTr = document.createElement("tr");

                        tableStr += `
                            <tr>
                                <td>\${myReservedList[i].vhcleNo}</td>
                                <td>\${beginHour} - \${endHour}</td>
                                <td><button onclick="cancelReservation()">취소</button></td>
                             </tr>`;
                        document.querySelector("#myReserveList").innerHTML = tableStr;
                    }
                }
            }
            xhr.send();
        }
    }

    function reserveVehicle() {
        if (reserve.style.display === "none") {
            reserve.style.display = "block";
            myReserveList.style.display = "none";
        }
    }


</script>
