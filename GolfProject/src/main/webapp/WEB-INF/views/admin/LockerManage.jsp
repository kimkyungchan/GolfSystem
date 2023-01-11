<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="../css/styles.css" rel="stylesheet" />
	<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
	<!-- 부트스트랩 모달 css 이용 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	
	<style>
		 input{width:370px;}
		.lockbt{width:400px; height:100px;  margin:auto; font-size: 40px; background-color:#F2F2F2; position:relative; right:40px; top:40px;}
		.locktable{border:2px solid black; width:200px; height:150px; text-align:center; margin-bottom:10px; background-image:url('../img/locker.jpg'); background-size:200px 150px; color:white; font-size:20px; font-weight:bold;}
		.modaltd1 { border : 1px solid black; font-weight:bold; text-align:center; width:20%;}
		.modaltd2 { border : 1px solid black; font-weight:bold; text-align:center; width:80%;}
		#parent{display:flex; position:relative; left:50px;}
		#line1, #line2, #line3, #line4, #line5{flex:1; padding:5px;} 
		#headtitle{position:relative; left:700px; font-size:60px; font-weight:bold;}
		#staticBackdropLabel{position:relative; left:150px;}
		#detaillockerdiv{background-image:url('../img/locker.jpg');  background-size: 463px 300px; width:463px; height:300px; border:2px solid; color:white;}
		#modaltable{position:relative; left:1px; width:459px; height:298px; border:3px solid;}
	</style>
	
<title>사물함 관리</title>
</head>    
<body>
		<!-- Topframe -->
		<jsp:include page="../AdminFrame/top.jsp"/> 

 		 <!-- 전체적인 틀 div -->
		 <div id="layoutSidenav">
			<!-- Sidenav FRAME -->    
			<jsp:include page="../AdminFrame/sidemenu.jsp"/> 
			
			<!-- 본문 내용의 div -->
 			<div id="layoutSidenav_content">
 				<p id="headtitle">사물함 관리</p>
 				<hr>
 				<!-- 사물함 button 들어가는 div -->
 				<jsp:include page="../AdminFrame/lockerlist.jsp"/> 
 			</div> <!-- content -->
 		</div> <!-- sidenav -->
 		
  <!-- Modal -->
  <div class="modal fade" id="lockerModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
 	 <div class="modal-dialog">
   		 <div class="modal-content">
      		<div class="modal-header">
        		<h1 class="modal-title fs-5" id="staticBackdropLabel">사물함 상세보기</h1>
        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      		</div>
    		<div class="modal-body">
        		<div id="detaillockerdiv">
        			<div id="modalpic"></div>
        			<table id="modaltable">
        				<tr>
        					<td class="modaltd1">사물함 번호</td>
        					<td id="lockno" class="modaltd2"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">사용자</td>
        					<td id="id" class="modaltd2"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">시작시간</td>
        					<td id="start" class="modaltd2"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">종료시간</td>
        					<td id="end" class="modaltd2"></td>
        				</tr>
        			</table>
         		</div>	
      		<div class="modal-footer">
        		<button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
      		</div>
    	</div>
  	</div>
  </div>
 </div>
 
  <!-- 사물함지정 Modal -->
  <div class="modal fade" id="insertModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
 	 <div class="modal-dialog">
   		 <div class="modal-content">
      		<div class="modal-header">
        		<h1 class="modal-title fs-5" id="staticBackdropLabel">사물함 지정하기</h1>
        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      		</div>
    		<div class="modal-body">
    			<form id="writeform" method="post">
        		<div>
        			<table id="modaltable">
        				<tr>
        					<td class="modaltd1">사물함번호</td>
        					<td class="modaltd2"><input type="text" name="lockno" id="inlockno"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">사용자</td>
        					<td class="modaltd2"><input type="text" name="id" id="inid"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">시작시간</td>
        					<td class="modaltd2"><input type="text" name="start" id="instart" placeholder="ex) 10:00"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">종료시간</td>
        					<td class="modaltd2"><input type="text" name="end" id="inend" placeholder="ex) 12:00"></td>
        				</tr>
        			</table>
         		</div>	
         		</form><br>
      		<div class="modal-footer">
      			<button type="button" class="btn btn-primary" id="insertlock">지정하기</button>
        		<button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
      		</div>
    	</div>
  	</div>
  </div>
 </div>	

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="../js/datatables-simple-demo.js"></script>
    <!-- 부트스트랩 모달 js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<!-- JQUERY 사용 -->
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<script>
 	$(function(){
 		
 		$(".lockbt").click(function(){
			$("#insertModal").modal("show");
		})//메인 지정하기 버튼
			
	
		$("#insertlock").click(function(){
			$("#writeform").submit();		
		})//모달 내 지정하기 버튼
		
		
		$(".locktable #no td").click(function(){
			let no = $(this).text();
			let num = parseInt(no)-1;
			let state = $("#lockstate"+num).children().text();
			
			let test = state.includes("대기");
			
			if(test){
				alert("사물함을 지정해주세요.")
			}else{
				$.ajax({
					url : '/admin/detaillock',
					data : 'lockno='+no,
					dataType : 'json',
					method : 'get'
				}).done(function(data){
					$("div #lockno").text(data.lockno);
					$("div #id").text(data.id);
					$("div #start").text(data.start);
					$("div #end").text(data.end);
					
					$("#lockerModal").modal("show");
				})		
			}
			
		})
	
 	})//ready
 
</script>

</body>
</html>    