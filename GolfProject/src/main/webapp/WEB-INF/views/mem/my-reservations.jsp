<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../sections/header.jsp"/>

<script>
    $(function () {
        $('.cancel').on('click', function (e) {
            if (!window.confirm('정말 취소하시겠습니까?')) {
                e.preventDefault();
            }
        });
    });
</script>

<div class="container">
    <h1 class="text-center mt-4 mb-4">예약 확인/취소</h1>

    <table class="table">
        <thead>
        <tr>
            <th scope="col">번호</th>
            <th scope="col">예약일자</th>
            <th scope="col">예약시간</th>
            <th scope="col">코스명</th>
            <th scope="col">예약자</th>
            <th scope="col">연락처</th>
            <th scope="col">인원</th>
            <th scope="col">취소</th>
        </tr>
        </thead>
        <tbody id="tbody">
        <c:forEach items="${reservations}" var="reservation">
            <tr>
                <td>${reservation.resNum}</td>
                <td>${reservation.getFormattedDate()}</td>
                <td>${reservation.restime}</td>
                <td>${reservation.resCourse} 코스</td>
                <td>${member.name}</td>
                <td>${member.phone}</td>
                <td>${reservation.numPerson} 명</td>
                <td>
                    <form method="POST" action="/reservation/cancel">
                        <input type="hidden" name="res_num" value="${reservation.resNum}">
                        <button type="submit" class="btn btn-primary cancel">취소하기</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="../sections/footer.jsp"/>
