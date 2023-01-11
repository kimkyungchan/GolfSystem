<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../sections/header.jsp"/>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-5">
            <h2 class="text-center mt-5 mb-2">비밀번호 초기화</h2>

           
           	<form action="/newpass" method="post" id="formdata">
           		<div class="mb-3" id="iddiv">
                    아이디 : <label for="id" class="form-label" id="idsel">${id}</label>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" name="password" id="password">
                </div>
                <div class="mb-3">
                    <label for="ckpassword" class="form-label">비밀번호 확인</label>
                    <input type="password" class="form-control" id="ckpassword" name="ckpassword" size="50">
                </div>

                <div class="d-grid gap-4">
                    <button type="button" class="btn btn-primary" id="updatepass">설정하기</button>
                </div>
             </form>
        </div>
    </div>
</div>

<jsp:include page="../sections/footer.jsp"/>
<script>

	$(function(){
		$("#updatepass").click(function(){
			let pass = $("#password").val();
			let ckpass = $("#ckpassword").val();
			let id = $("#idsel").text();
			
			if(!pass){
				alert("비밀번호를 입력해주세요");
			}
			
			if(!ckpass){
				alert("비밀번호 확인을 입력해주세요");
			}
			
			if(pass.length <6 || pass.length >8){
             	alert("비밀번호는 6~8자리를 입력해야 합니다.")
             	return false;
             }
			
			if(ckpass.length <6 || ckpass.length >8){
             	alert("비밀번호는 6~8자리를 입력해야 합니다.")
             	return false;
             }
			
			if(pass != ckpass){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}else{
				let content = "<input type=hidden name=id id=id value="+id+">";
				$("#formdata #iddiv").html(content);
				$("#formdata").submit();
			}
		})
	})//ready
	
</script>