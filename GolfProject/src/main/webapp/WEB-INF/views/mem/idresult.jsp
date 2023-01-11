<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../sections/header.jsp"/>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-5">
            <h2 class="text-center mt-5 mb-2">아이디 찾기 결과</h2>

                <div class="mb-3">
                    <p>${search.name}님의 ID는 ${search.id}입니다.</p>   
                </div>

                <div class="d-grid gap-4">
                    <a href="/loginform">로그인</a>
                </div>
          
        </div>
    </div>
</div>

<jsp:include page="../sections/footer.jsp"/>