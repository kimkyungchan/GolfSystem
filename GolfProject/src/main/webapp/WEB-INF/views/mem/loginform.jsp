<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../sections/header.jsp"/>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-5">
            <h2 class="text-center mt-5 mb-2">로그인</h2>
            <p class="text-center mb-5">아이디와 비밀번호 를 입력하세요</p>
            
           

            <form:form action="login" method="post" modelAttribute="command">
                <form:errors/>
                <div class="mb-3">
                    <label for="id" class="form-label">아이디</label>
                    <input type="text" class="form-control" name="id" id="id">
                    <form:errors path="id"/>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" id="password" name="password" size="10">
               		 <form:errors path="password"/>
                </div>

                <div class="d-grid gap-4">
                    <button type="submit" class="btn btn-primary">로그인</button>
                    <a href="/searchid" class="btn">아이디 찾기</a>
                    <a href="/searchpass" class="btn">비밀번호 찾기</a>
                    <a href="insert" class="btn">회원 가입</a>
                </div>
            </form:form>
        </div>
    </div>
</div>

<jsp:include page="../sections/footer.jsp"/>