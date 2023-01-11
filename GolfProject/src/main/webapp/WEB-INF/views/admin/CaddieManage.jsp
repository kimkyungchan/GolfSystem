<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		#delbt{border-radius: 40px; position: relative; left:230px;}
		#NewCadbt{border-radius: 40px; position: relative; left:1500px;}
		#updatebt{position: relative; left:112px;}
		#staticBackdropLabel1{position: relative; left:200px;}
		#cadprofile{background-image:url('../img/profile.PNG');  background-size: 463px 300px; width:463px; height:300px; border:2px solid;}
		#caddetailprofile{background-image:url('../img/profile.PNG');  background-size: 459px 300px; width:459px; height:300px; border:2px solid;}
		.modaltd1 { border : 1px solid black; font-weight:bold; text-align:center; width:18%;}
		.modaltd2 { border : 1px solid black; font-weight:bold; text-align:center; width:80%;}
		input{width:370px;}
	</style>
	
	<title>캐디 현황</title>
</head>

<body class="sb-nav-fixed">
		
		<!-- TOP FRAME -->
		<jsp:include page="../AdminFrame/top.jsp"/> 

 		 <!-- 전체적인 틀 div -->
		 <div id="layoutSidenav">
			<!-- Sidenav FRAME -->    
			<jsp:include page="../AdminFrame/sidemenu.jsp"/> 
			
			<!-- 본문 내용의 div -->
 			<div id="layoutSidenav_content">
 
				<main>
				   <div class="container-fluid px-4">
                        <h1 class="mt-4">캐디현황</h1>
                 
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                캐디목록
                                <button type="button" class="btn btn-primary" id="NewCadbt">캐디신규등록</button>
                            </div>
                            
                            <div class="card-body">
                               <table id="datatablesSimple">
                               		<thead>
                               		 	<tr>
                                        	<th>번호</th>
                                            <th>이름</th>
                                            <th>나이</th>
                                            <th>휴대폰</th>
                                            <th>이메일</th>
                                            <th>경력</th>
                                            <th>상태</th>
                                        </tr>
                               		</thead>
                               		<tbody>
                               			<c:forEach items="${caddietlist}" var="cadlist">
                               				<tr>
                               					<td>${cadlist.cadno}</td>
                               					<td>${cadlist.cadname}</td>
                               					<td>${cadlist.cadage}</td>
                               					<td>${cadlist.cadphone}</td>
                               					<td>${cadlist.cademail}</td>
                               					<td>${cadlist.cadcareer}</td>
                               					<c:choose>
                               						<c:when test = "${cadlist.state == 1}">
                               							<td>근무</td>
                               						</c:when>
                               						<c:when test = "${cadlist.state == 2}">
                               							<td>대기</td>
                               						</c:when>
                               						<c:when test = "${cadlist.state == 3}">
                               							<td>휴가</td>
                               						</c:when>
                               					</c:choose> 
                               				</tr>
                               			</c:forEach>
                               		</tbody>
                               </table>
                            
                            </div>   
                        </div>
				   </div>
				</main>
 			 </div>

	</div> <!-- layout sidenav -->
	

	<!-- Modal -->
  <div class="modal fade" id="caddieModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
 	 <div class="modal-dialog">
   		 <div class="modal-content">
      		<div class="modal-header">
        		<h1 class="modal-title fs-5" id="staticBackdropLabel">캐디상세보기</h1>
        		<button type="button" class="btn-secondary" id="delbt">캐디삭제</button>
        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      		</div>
    		<div class="modal-body">
        		<div>
        			<div id="caddetailprofile"></div>
        			<table>
        				<tr>
        					<td class="modaltd1">번호</td>
        					<td id="cadno" class="modaltd2"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">이름</td>
        					<td id="cadname" class="modaltd2"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">나이</td>
        					<td id="cadage" class="modaltd2"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">핸드폰번호</td>
        					<td id="cadphone" class="modaltd2"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">이메일</td>
        					<td id="cademail" class="modaltd2"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">경력</td>
        					<td id="cadcareer" class="modaltd2"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">상태</td>
        					<td class="modaltd2">
	        					<select id="statesel">
	            					<option value="1">근무</option>
	            					<option value="2">대기</option>
	            					<option value="3">휴가</option>
	            				</select> 
	            				<button type="button" class="btn btn-primary" id="updatebt">변경</button>
            				</td>
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
 
 <!-- 캐디등록 Modal -->
  <div class="modal fade" id="insertModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
 	 <div class="modal-dialog">
   		 <div class="modal-content">
      		<div class="modal-header">
        		<h1 class="modal-title fs-5" id="staticBackdropLabel1">캐디등록</h1>
        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      		</div>
    		<div class="modal-body">
    			<form id="writeform" method="post">
        		<div>
        			<div id="cadprofile"></div>
        			<table>
        				<tr>
        					<td class="modaltd1">이름</td>
        					<td class="modaltd2"><input type="text" name="cadname" id="cadname"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">나이</td>
        					<td class="modaltd2"><input type="text" name="cadage" id="cadage"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">이메일</td>
        					<td class="modaltd2"><input type="text" name="cademail" id="cademail"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">핸드폰번호</td>
        					<td class="modaltd2"><input type="text" name="cadphone" id="cadphone"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">경력</td>
        					<td class="modaltd2"><input type="text" name="cadcareer" id="cadcareer"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">상태</td>
        					<td class="modaltd2">
        						<select name="state" id="state">
            						<option value="1">근무</option>
            						<option value="2">대기</option>
            						<option value="3">휴가</option>
            				    </select>
            			    </td>
        				</tr>
        			</table>
         		</div>	
         		</form>
      		<div class="modal-footer">
      			<button type="button" class="btn btn-primary" id="insertCad">등록하기</button>
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
			
			let cadno="";
			$('#datatablesSimple > tbody').on('click', 'tr', function () {
				let td = $(this).children();
				cadno = td.eq(0).text();
				let cadname= td.eq(1).text();
				let cadage = td.eq(2).text();
				let cadphone = td.eq(3).text();
				let cademail = td.eq(4).text();
				let cadcareer = td.eq(5).text();
		
				$("#cadno").html(cadno);
				$("#cadname").html(cadname);
				$("#cadage").html(cadage);
				$("#cadphone").html(cadphone);
				$("#cademail").html(cademail);
				$("#cadcareer").html(cadcareer);
				
		
				$('#caddieModal').modal('show');
   			 });//tr click
			
			
			$("#NewCadbt").click(function(){
				$('#insertModal').modal('show');
			})//카트 등록 버튼 클릭
			
			$("#insertCad").click(function(){
				$("#writeform").submit();
			})//등록하기 버튼 클릭
			
			$("#updatebt").click(function(){
				let state=$('#statesel').val();
				$.ajax({
					url:'/admin/cadupdate',
					data:'state='+state+'&cadno='+cadno,
					dataType:'text',
					method:'get'
				}).done(function(){
					location.reload();
				})
			})//상세정보에서 상태 변경 클릭
			
			$("#delbt").click(function(){
				$.ajax({
					url:'/admin/caddelete',
					data:'cadno='+cadno,
					dataType:'text',
					method:'delete'
				}).done(function(){
					location.reload();
				})
			})//카트 삭제 버튼 클릭
			
		})//ready
	</script>
	
</body>
</html>