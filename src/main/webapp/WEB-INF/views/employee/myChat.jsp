<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec"
           uri="http://www.springframework.org/security/tags" %>

<h1>채팅방 개설</h1>
<form action="#" method="post">
    <ul>
        <c:forEach items="${empList}" var="employee">
            <li>
                <label>
                    <input type="checkbox" name="selectedEmpls" value="${employee.emplId}"
                           data-emplNm="${employee.emplNm}">
                        ${employee.emplId} - ${employee.emplNm}
                </label>
            </li>
        </c:forEach>
    </ul>
    <button type="button" id="createRoomBtn">채팅방 생성</button>
</form>

<br/>
<hr>
<br/>
<h1>채팅방 리스트 불러오기</h1>
<form action="#" method="post">
    <!--원래는 로그인한 아이디가 자동으로 되는데, 없으니까 수동으로-->
    <input type="text" name="chttRoomEmplId1" id="chttRoomEmplId1">
    <button type="submit">불러오기</button>
</form>
<br/>
<form action="#">
    <input type="text" name="inviteEmplId" id="inviteEmplId">
    <button type="submit">사원 초대하기</button>
</form>
<br/>
<table border="1" style="width: 80%">
    <thead>
    <tr>
        <th>채팅방 번호</th>
        <th>채팅방 이름</th>
        <th>채팅방 타입</th>
        <th>채팅방 인원</th>
        <th>채팅방 멤버</th>
        <th>가장 마지막 대화 내역</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>\${채팅방 번호}</td>
        <td>\${채팅방 이름}</td>
        <td>\${채팅방 타입}</td>
        <td>\${채팅방 인원}</td>
        <td>\${채팅방 멤버}</td>
        <td>\${가장 마지막 대화 내역}</td>
    </tr>
    </tbody>
</table>
<br/>
<hr>
<br/>
<h1>채팅 불러오기</h1>
<form action="#" method="post">
    <!--원래는 로그인한 아이디가 자동으로 되는데, 없으니까 수동으로-->
    <input type="text" name="searchchattRoom" id="searchchattRoom" placeholder="채팅방번호 입력">
    <button type="submit">불러오기</button>
</form>
<div id="chatts">
    <table border="1" style="width: 80%">
        <tr>
            <th>채팅방 번호</th>
            <th>채팅방 이름</th>
            <th>채팅방 타입</th>
            <th>채팅방 인원</th>
            <th>채팅 멤버 사원 아이디</th>
            <th style="width: 35%">채팅 내용</th>
            <th>채팅 입력 날짜</th>
        </tr>
        <tr>
            <td>$채팅방 번호</td>
            <td>$채팅방 이름</td>
            <td>$채팅방 타입</td>
            <td>$채팅방 인원</td>
            <td>$채팅 멤버 사원 아이디</td>
            <td>$채팅 내용</td>
            <td>$채팅 입력 날짜</td>
        </tr>
    </table>
    <br/><br/>
    <form action="#" method="post">
        <label for="sendChattId">채팅방 번호</label>
        <input type="text" name="sendChattId" id="sendChattId">
        <label for="sendEmplId">보내는 사원 아이디</label>
        <input type="text" name="sendEmplId" id="sendEmplId">

        <textarea name="chttCn" id="chttCn" cols="80" rows="10"></textarea>
        <button>전송하기</button>
    </form>

</div>
<input type="text" name="sendEmplId" id="sendEmplId">

<textarea name="chttCn" id="chttCn" cols="80" rows="10"></textarea>
<button>전송하기</button>
</form>

</div>

<script>

    $("#createRoomBtn").click(function () {
        let roomMemList = [];

        $("input[name='selectedEmpls']:checked").each(function () {
            let EmployeeVO = {
                emplId: $(this).val(),
                emplNm: $(this).data("emplNm")
            };
            roomMemList.push(EmployeeVO);
        });

        $.ajax({
            url: "/chat/createRoom",
            type: "post",
            data: JSON.stringify(roomMemList),
            contentType: "application/json;charset:utf-8",
            success: function () {
                alert("채팅방 개설 성공");
            },
            error: function (request, status, error) {
                console.log("code: " + request.status)
                console.log("message: " + request.responseText)
                console.log("error: " + error);
            }
        });
    });
</script>