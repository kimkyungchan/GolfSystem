<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../sections/header.jsp"/>

<style>
	#input , #result{ display: none;}
	#mail_ck{position:relative; left:540px; bottom:40px;}
</style>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-5">
            <h2 class="text-center mt-5 mb-2">비밀번호 찾기</h2>
            <p class="text-center mb-5">아이디, 이메일을 입력해주세요</p>

  
            <form action="/newpass" method="get">
                <div class="mb-3">
                    <label for="id" class="form-label">아이디</label>
                    <input type="text" class="form-control" name="id" id="id">
                </div>
                
                <div class="mb-3">
                    <label for="email" class="form-label">이메일</label>
                    <div>
                    <input type="email" class="form-control" id="email" name="email" size="50" placeholder="ex1@naver.com">
					<input type="button" id="mail_ck" class="btn btn-primary" value="메일 인증"><br>
					</div>
					<div id="input">
					   인증번호 : <input id="ck_num"> <input type="button" id="ck_b" class="btn btn-primary" value="인증">
					</div>
					<div id="result">
					
					</div>
                </div>

                <div class="d-grid gap-4">
                    <button type="submit" class="btn btn-primary" id="selpass">비밀번호 초기화</button>
                </div>
           </form>
        </div>
    </div>
</div>

<jsp:include page="../sections/footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	$(function(){
		let num="";
		let id="";
		
		$("#mail_ck").click(function(){
			let email = $("#email").val();
			id = $("#id").val();
			
			if(!email){
				alert("이메일을 입력해주세요!")
				return false;
			} 
			
			if(!id){
				alert("아이디를 입력해주세요!")
				return false;
			} 
			
			$.ajax({
				url:'/send',
				data:'emailadd='+email,
				dataType:'json'
			}).done(function(data){
				if(eval(data[1])){
					num = data[0];
					alert("메일이 전송되었습니다. 인증번호를 입력하세요.")
					$("#input,#result").css("display","block");
				}
			})
		})//mailck
		
		$("#ck_b").click(function(){
			let ck_num = $("#ck_num").val();
			
			if(ck_num == num){
				$("#result").html("인증이 확인되었습니다.")
				$("#result").append("<input type='hidden' id='ck' value='1'>");
			}else{
				$("#result").html("인증 실패했습니다. 다시 확인하세요.");
			}
		}) //ck_b
		
		$("#selpass").click(function(){
			let ck_email = $("#ck").val();
			
			if(ck_email != 1){
				alert("이메일 인증을 진행해주세요");
				return false;
			}
		})
		
	})// ready

</script>
