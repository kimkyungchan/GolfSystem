<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../sections/header.jsp"/>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-5">
            <h2 class="text-center mt-5 mb-2">아이디 찾기</h2>
            <p class="text-center mb-5">이름과 핸드폰번호를 입력하세요</p>

            <form action="/searchid" method="post" modelAttribute="command">
                <div class="mb-3">
                    <label for="id" class="form-label">이름</label>
                    <input type="text" class="form-control" name="name" id="name">
                </div>
                <div class="mb-3">
                    <label for="phone" class="form-label">핸드폰번호</label> 
                    <span>&emsp; &emsp;  &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;(양식 : 010-0000-0000)</span>
                    <input type="text" class="form-control" id="phone" name="phone" size="20">
                </div>

                <div class="d-grid gap-4">
                    <button type="submit" class="btn btn-primary">아이디 찾기</button>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="../sections/footer.jsp"/>