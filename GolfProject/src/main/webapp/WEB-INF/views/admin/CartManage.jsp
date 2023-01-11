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
		#NewCartbt{border-radius: 40px; position: relative; left:1500px;}
		#updatebt{position: relative; left:105px;}
		#staticBackdropLabel1{position: relative; left:200px;}
		#cartprofile{background-image:url('../img/cartprofile.PNG');  background-size: 463px 300px; width:463px; height:300px; border:2px solid;}
		#cartdetailprofile{background-image:url('../img/cartprofile.PNG');  background-size: 453px 300px; width:453px; height:300px; border:2px solid;}
		.modaltd1 { border : 1px solid black; font-weight:bold; text-align:center; width:22%;}
		.modaltd2 { border : 1px solid black; font-weight:bold; text-align:center; width:80%;}
		input{width:370px;}
	</style>
	
	<title>카트 현황</title>
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
                        <h1 class="mt-4">카트현황</h1>
                 
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                카트목록
                                <button type="button" class="btn btn-primary" id="NewCartbt">카트신규등록</button>
                            </div>
                            
                            <div class="card-body">
                               <table id="datatablesSimple">
                               		<thead>
                               		 	<tr>
                                        	<th>번호</th>
                                            <th>생산년도</th>
                                            <th>최대속도</th>
                                            <th>최대운행거리</th>
                                            <th>적재함</th>
                                            <th>상태</th>
                                        </tr>
                               		</thead>
                               		<tbody>
                               			<c:forEach items="${cartlist}" var="clist">
                               				<tr>
                               					<td>${clist.cartno}</td>
                               					<td>${clist.productyear}</td>
                               					<td>${clist.maxspeed}</td>
                               					<td>${clist.maxdistance}</td>
                               					<td>${clist.weight}</td>
                               					<c:choose>
                               						<c:when test = "${clist.state == 1}">
                               							<td>운행</td>
                               						</c:when>
                               						<c:when test = "${clist.state == 2}">
                               							<td>대기</td>
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
	

	<!-- 상세보기 Modal -->
  <div class="modal fade" id="cartModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
 	 <div class="modal-dialog">
   		 <div class="modal-content">
      		<div class="modal-header">
        		<h1 class="modal-title fs-5" id="staticBackdropLabel">카트상세보기</h1>
        		<button type="button" class="btn-secondary" id="delbt">카트삭제</button>
        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      		</div>
    		<div class="modal-body">
    			<div id="cartdetailprofile"> </div>
        		<div>
        			<table>
        				<tr>
        					<td class="modaltd1">번호</td>
        					<td id="cartno" class="modaltd2"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">생산년도</td>
        					<td id="productyear" class="modaltd2"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">최대속도</td>
        					<td id="maxspeed" class="modaltd2"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">최대운행거리</td>
        					<td id="maxdistance" class="modaltd2"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">적재함</td>
        					<td id="weight" class="modaltd2"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">상태</td>
        					<td class="modaltd2">
        						<select id="statesel">
            						<option value="1">운행</option>
            						<option value="2">대기</option>
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
 
 <!-- 카트등록 Modal -->
  <div class="modal fade" id="insertModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
 	 <div class="modal-dialog">
   		 <div class="modal-content">
      		<div class="modal-header">
        		<h1 class="modal-title fs-5" id="staticBackdropLabel1">카트등록</h1>
        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      		</div>
    		<div class="modal-body">
    			<form id="writeform" method="post">
    			<div id="cartprofile"> </div>
        		<div>
        			<table>
        				<tr>
        					<td class="modaltd1">생산년도</td>
        					<td class="modaltd2"><input type="text" name="productyear" id="ProductYear"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">최대속도</td>
        					<td class="modaltd2"><input type="text" name="maxspeed" id="MaxSpeed"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">최대운행거리</td>
        					<td class="modaltd2"><input type="text" name="maxdistance" id="MaxDistance"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">적재함</td>
        					<td class="modaltd2"><input type="text" name="weight" id="Weight"></td>
        				</tr>
        				<tr>
        					<td class="modaltd1">상태</td>
        					<td class="modaltd2">
        						<select name="state" id="State">
            						<option value="1">운행</option>
            						<option value="2">대기</option>
            				    </select>
            				</td>
        				</tr>
        			</table>
         		</div>	
         		</form>
      		<div class="modal-footer">
      			<button type="button" class="btn btn-primary" id="insertCart">등록하기</button>
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
			
			let cartno="";
			$('#datatablesSimple > tbody').on('click', 'tr', function () {
				let td = $(this).children();
				cartno = td.eq(0).text();
				let productyear = td.eq(1).text();
				let maxspeed = td.eq(2).text();
				let maxdistance = td.eq(3).text();
				let weight = td.eq(4).text();
		
				$("#cartno").html(cartno);
				$("#productyear").html(productyear);
				$("#maxspeed").html(maxspeed);
				$("#maxdistance").html(maxdistance);
				$("#weight").html(weight);
				
		
				$('#cartModal').modal('show');
   			 });//tr click
			
			
			$("#NewCartbt").click(function(){
				$('#insertModal').modal('show');
			})//카트 등록 버튼 클릭
			
			$("#insertCart").click(function(){
				$("#writeform").submit();
			})//등록하기 버튼 클릭
			
			$("#updatebt").click(function(){
				let state=$('#statesel').val();
				$.ajax({
					url:'/admin/cartupdate',
					data:'state='+state+'&cartno='+cartno,
					dataType:'text',
					method:'get'
				}).done(function(){
					location.reload();
				})
			})//상세정보에서 상태 변경 클릭
			
			$("#delbt").click(function(){
				$.ajax({
					url:'/admin/cartdelete',
					data:'cartno='+cartno,
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