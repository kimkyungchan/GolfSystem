<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../sections/header.jsp"/>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-5">
            <h2 class="text-center mt-5 mb-2">회원 탈퇴</h2>
            <p class="text-center mb-5">탈퇴하시려면 비밀번호를 입력해주세요</p>

            <c:if test="${result == false}">
                <p>입력하신 비밀번호는 틀렸습니다.</p>
            </c:if>

            <form action="delete" method="post" onsubmit="checkVal()">
                
                <div class="mb-3">
                    <label for="id" class="form-label">아이디</label>
                    <input type="text" class="form-control" id="id" value="${user.id}" disabled>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" id="password" name="pword" size="10">
                </div>

                <div class="d-grid gap-4">
                    <button type="submit" class="btn btn-primary">탈퇴</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        function checkVal(){
            let pw = document.querySelector("#password").value;
            if(!pw){
                alert("비밀번호 입력하세요");
                return false;
            }
           // alert("탈퇴되었습니다.")
        }

    </script>
</div>

<jsp:include page="../sections/footer.jsp"/>