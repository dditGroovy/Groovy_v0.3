<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
    <a href="#"><p>내 휴가</p></a>
    <a href="/employee/mySalary"><p>내 급여</p></a>
</div>

<div>
    <p>휴가 기록</p>
    <label><input type="checkbox"/>반려 기록만 보기</label>
    <select id="yearSelect">
        <option value="all">전체</option>
        <option value="2023" selected>2023</option>
        <option value="2022">2022</option>
    </select>
</div>

<div>
    <!-- 테이블 넣어줄 자리 -->
</div>
