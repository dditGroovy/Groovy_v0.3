<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
    <a href="#"><p>내 휴가</p></a>
    <a href="/employee/mySalary"><p>내 급여</p></a>
</div>

<div>
    <div>
        <table>
            <tr>
                <th>발생 연차</th>
                <th>사용 연차</th>
                <th>잔여 연차</th>
            </tr>
            <tr>
                <th>05</th>
                <th>03</th>
                <th>02</th>
            </tr>
        </table>
    </div>
    <div>
        <div>
            <div>
                <div><p>휴가 기록</p></div>
                <div><a href="/employee/vacationRecord">더보기</a></div>
            </div>
            <div>
                <table>
                    <tr>
                        <td>연차 | 20XX년 XX월 XX일</td>
                    </tr>
                    <tr>
                        <td>연차 | 20XX년 XX월 XX일</td>
                    </tr>
                    <tr>
                        <td>연차 | 20XX년 XX월 XX일</td>
                    </tr>
                    <tr>
                        <td>연차 | 20XX년 XX월 XX일</td>
                    </tr>
                </table>
            </div>
        </div>
        <div>
            <p>구성원의 휴가(연락금지)</p>
            <table>
                <tr>
                    <td>이혜진 | 연차 20XX년 XX월 XX일</td>
                </tr>
            </table>
        </div>
    </div>
</div>

<!-- 휴가기록 pop -->
<div class="modal">
    <div>
        <p>연차</p>
        <i></i>
    </div>
    <form>
        <p>휴가 일정</p>
        <input type="date" required><img/><input type="date" required>
        <p>휴가 내용</p>
        <textarea required></textarea><br/>
        <p>상세내용</p>
        <p>연속 휴가일 경우 마지막 연차 종류를 선택해주세요.</p>
        <label><input type="radio" name="option" value="오전 반차"/>오전 반차</label><br/>
        <label><input type="radio" name="option" value="오후 반차"/>오후 반차</label><br/>
        <label><input type="radio" name="option" value="하루종일"/>하루종일</label>
        <br/>
        <input type="submit" value="확인"/>
    </form>
</div>

<!-- 구성원의휴가 pop -->
<div class="modal">
    <div>
        <p>연차</p>
        <i></i>
    </div>
    <div>
        <img/>
        <p>이혜진</p>
    </div>
    <p>휴가 일정</p>
    <input type="date" readonly><img/><input type="date" readonly>
    <p>휴가 내용</p>
    <textarea readonly></textarea><br/>
    <p>상세내용</p>
    <p>연속 휴가일 경우 마지막 연차 종류를 선택해주세요.</p>
    <label><input type="radio" name="option" value="오전 반차"/>오전 반차</label><br/>
    <label><input type="radio" name="option" value="오후 반차"/>오후 반차</label><br/>
    <label><input type="radio" name="option" value="하루종일"/>하루종일</label>
    <br/>
    <input type="button" value="확인"/>
</div>