<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../sections/header.jsp"/>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-5">
            <h2 class="text-center mt-5 mb-2">회원 정보 수정</h2>
            <p class="text-center mb-5">${user.id}님의 정보를 수정합니다.</p>

            <form action="update" method="post" id="updateform">
                <input type="hidden" name="_method" value="put">
                <input type="hidden" name="id" value="${user.id}">

                <div class="mb-3">
                    <label for="id" class="form-label">아이디</label>
                    <input type="text" class="form-control" id="id" value="${user.id}" disabled>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" id="password" name="password" value="${user.password}" size="10">
                </div>
                <div class="mb-3">
                    <label for="name" class="form-label">이름</label>
                    <input type="text" class="form-control" id="name" value="${user.name}" disabled>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">이메일</label>
                    <input type="email" class="form-control" id="email" name="email" value="${user.email}">
                </div>
                <div class="mb-3">
                    <label for="phone" class="form-label">연락처</label>
                    <input type="phone" class="form-control" id="phone" name="phone" value="${user.phone}">
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text">주소</span>
                    <input type="text" class="form-control" id="address" name="address" value="${user.address}">
                    <button class="btn btn-outline-secondary" type="button" id="addbtn" onclick="addPost()">우편번호 검색</button>
                </div>

                <div class="d-grid gap-4">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                </div>
            </form>
        </div>
    </div>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function addPost(){
            new daum.Postcode({
                oncomplete: function(data) {
                    document.querySelector("#address").value = data.address;
                    alert("나머지 주소도 입력하세요.");
                }
            }).open();
        }

        $(function(){
            $("#updateform").submit(function(){
                if(!$("#password").val()){
                    alert("비밀번호를 입력해야 합니다.");
                    return false;
                }
                if($("#password").val().length <6 || $("#password").val().length >8){
                	alert("비밀번호는 6~8자리를 입력해야 합니다.")
                	return false;
                }
                
                
                alert("수정되었습니다.");
            });
        })//ready

    </script>
</div>

<jsp:include page="../sections/footer.jsp"/>