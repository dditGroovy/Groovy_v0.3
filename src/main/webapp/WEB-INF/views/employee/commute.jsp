<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div>
    <p>출근 <span>08:54</span></p>
</div>
<div>
    <p>퇴근 <span>18:00</span></p>
</div>
<div>
    <p>오늘 근무 시간</p>
    <p>05시간 30분</p>
</div>
<div>
    <p>이번주 총 근무 시간</p>
    <p>34시간 30분</p>
</div>

<div class="bar">

</div>

<div>
    <p>주간 출 • 퇴근 시간 확인</p>
    <table border="1">
        <tr>
            <th>월</th>
            <th>화</th>
            <th>수</th>
            <th>목</th>
            <th>금</th>
        </tr>
        <tr>
            <td></td>
        </tr>
    </table>
</div>

<div>
    <p>근태 현황</p>
    <select name="sortOptions" id="" class="stroke">
        <option value="2023">2023</option>
    </select>
    <c:forEach var="eachMonth" begin="1" end="12">
        <input type="button" class="month" value="<c:out value="${eachMonth}" />">
    </c:forEach>
</div>

<div class="modal">
    <div>
        <p>근태 현황</p>
        <i></i>
    </div>
    <table>
        <tr>
            <th>날짜</th>
            <th>상태</th>
            <th>근무시간</th>
        </tr>
        <tr>
            <td></td>
        </tr>
    </table>
    <button type="button" value="확인"></button>
</div>