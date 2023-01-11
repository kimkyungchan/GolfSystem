<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../sections/header.jsp"/>

<style>
	#input , #result{ display: none;}
</style>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-5">
            <h2 class="text-center mt-5 mb-2">회원 가입</h2>
            <p class="text-center mb-5">ACE Golf 에 오신 것을 환영합니다.</p>

            <form action="insert" method="post" id="joinform">
                <div class="input-group mb-3">
                    <span class="input-group-text">ID</span>
                    <input type="text" onkeyup="input_check()" class="form-control" id="id" name="id">
                    <button class="btn btn-outline-secondary" type="button" id="id_check">중복 확인</button>
                </div>
                <div class="mb-3">
                    <label for="name" class="form-label">이름</label>
                    <input type="text" class="form-control" id="name" name="name">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" id="password" name="password">
                </div>
                <div class="mb-3">
                    <label for="password_check" class="form-label">비밀번호 확인</label>
                    <input type="password" class="form-control" id="password_check">
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">이메일</label>
                    <input type="email" class="form-control" id="email" name="email">
                </div>
                <div class="mb-3">
                    <label for="phone" class="form-label" >연락처</label>
                    <input type="phone" class="form-control" id="phone" name="phone" placeholder="ex) 010-0000-0000">
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text">주소</span>
                    <input type="text" class="form-control" id="address" name="address">
                    <button class="btn btn-outline-secondary" type="button" id="addbtn" onclick="addPost()">우편번호 검색</button>
                </div>
                <button type="submit" class="btn btn-primary">가입하기</button>
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
            $("#id_check").click(function(){
                let id = $("#id").val();
                if(!id){
                    window.alert("아이디를 입력하세요");
                    return false;
                }
                $.ajax({url:"/idCheck", data:"id="+id, datatype:"text"}
                ).done(function(data){

                    if(data == ""){
                        window.alert("사용할 수 있는 아이디 입니다.");
                        $("#joinform").append("<input type='hidden' id='id_ck' value='1'>");
                    }else{
                        window.alert("이미 사용중인 아이디 입니다.");
                    }
                })
            });//아이디 중복 확인 click

            $("#joinform").submit(function(){
                if($("#id_ck").val() != 1){
                    alert("아이디 중복 체크 하셔야 합니다.")
                    return false;
                }
                if(!$("#password").val()){
                    alert("비밀번호를 입력해야 합니다.");
                    return false;
                }
                if($("#password").val().length <6 || $("#password").val().length >8){
                	alert("비밀번호는 6~8자리를 입력해야 합니다.")
                	return false;
                }
               
                alert("회원가입이 완료되었습니다.")

            });


        })//ready
        function input_check() {
            let value = document.getElementById("id").value;
            let patt = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g;
            let temp = patt.test(value);
            if (temp) {
               document.getElementById("id").value = "";
               alert("한글은 입력되면 안됩니다.")
               
 
            }
         }
    </script>

</div>

<jsp:include page="../sections/footer.jsp"/>