<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


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

<hr>

<h1>채팅방 목록</h1>
<div>
    <c:forEach items="${chatRoomList}" var="chatRoom">
        <div>
            <img src="/uploads/${chatRoom.chatRoomThumbnail}" alt="${chatRoom.chatRoomThumbnail}"/>
            <p>${chatRoom.chttRoomNm}</p>
            <p>${chatRoom.latestChat}</p>
        </div>
    </c:forEach>
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