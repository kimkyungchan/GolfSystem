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
		.modaltd1 { border : 1px solid black; font-weight:bold; text-align:center; width:18%;}
		.modaltd2 { border : 1px solid black; font-weight:bold; text-align:center; width:80%;}
		#delbt{border-radius: 40px; position: relative; left:230px;}
		#memprofile{background-image:url('../img/profile.PNG');  background-size: 463px 300px; width:463px; height:300px; border:2px solid;}
	</style>
	
	<title>회원 현황</title>
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
                        <h1 class="mt-4">회원현황</h1>
                 
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                회원목록
                            </div>
                            
                            <div class="card-body">
                               <table id="datatablesSimple">
                               		<thead>
                               		 	<tr>
                                        	<th>아이디</th>
                                            <th>회원이름</th>
                                            <th>이메일</th>
                                            <th>주소</th>
                                            <th>핸드폰번호</th>
                                        </tr>
                               		</thead>
                               		<tbody>
                               			<c:forEach items="${mlist}" var="memlist">
                               				<tr>
                               					<th>${memlist.ID}</th>
                               					<th>${memlist.name}</th>
                               					<th>${memlist.email}</th>
                               					<th>${memlist.address}</th>
                               					<th>${memlist.phone}</th>
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
  <div class="modal fade" id="memModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
 	 <div class="modal-dialog">
   		 <div class="modal-content">
      		<div class="modal-header">
        		<h1 class="modal-title fs-5" id="staticBackdropLabel">회원상세보기</h1>
        		<button type="button" class="btn-secondary" id="delbt" >회원삭제</button>
        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      		</div>
    		<div class="modal-body">
        		<div>
        			<div id="memprofile"></div>
        			<table>
        					<tr>
        						<td class="modaltd1">아이디</td>
        						<td id="memID" class="modaltd2"> </td>
        					</tr>
        					<tr>
        						<td class="modaltd1">이름</td>
        						<td id="memName" class="modaltd2"> </td>
        					</tr>
        					<tr>
        						<td class="modaltd1">이메일</td>
        						<td id="memEmail" class="modaltd2"> </td>
        					</tr>
        					<tr>
        						<td class="modaltd1">주소</td>
        						<td id="memAddress" class="modaltd2"> </td>
        					</tr>
        					<tr>
        						<td class="modaltd1">핸드폰번호</td>
        						<td id="memPhone" class="modaltd2"> </td>
        					</tr>
        
        			</table>
         		</div>	
         		<br>
         		<div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                이용내역
                            </div>
         		 <div class="card mb-4">
         		 	 <div class="card-body">
                               <table id="datatablesSimple" class="dataTable-table">
                               		<thead>
                               		 	<tr>
                                        	<th>번호</th>
                                            <th>내장일자</th>
                                            <th>이용코스</th>
                                            <th>이용시간</th>
                                        </tr>
                               		</thead>
                               		<tbody id="mbody">
                               			
                               		</tbody>
                               </table>
         		    </div>
      		     </div>
      		 </div>
      		<div class="modal-footer">
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
			var id="";
			$('#datatablesSimple > tbody').on('click', 'tr', function () {
				var td = $(this).children();
				id = td.eq(0).text();
				var name = td.eq(1).text();
				var email = td.eq(2).text();
				var address = td.eq(3).text();
				var phone = td.eq(4).text();
		
				$("#memID").html(id);
				$("#memName").html(name);
				$("#memEmail").html(email);
				$("#memAddress").html(address);
				$("#memPhone").html(phone);
				
				$.ajax({
					url:"/admin/memberManage",
					data:"id="+id,
					dataType:"json",
					method:"post"
				}).done(function(data){
					
					var tabledata="";
					for(var key in data){
						tabledata+="<tr><td>"+data[key].ResNum+"</td><td>"+data[key].Paydate+"</td><td>"+data[key].Course+"</td><td>"+data[key].UseTime+"</td></tr>";
					}
					
					$("#datatablesSimple > #mbody").html(tabledata);
				});//done
		
				$('#memModal').modal('show');
   			 });//tr click
   			 
   			 
   			 $("#delbt").click(function(){
   				 $.ajax({
   					 url:"/admin/memberManage",
   					 data:"id="+id,
					 method:"delete"
   				 }).done(function(){
   					 location.reload();
   				 })//done
   			 });//delbt
			
			
			
		})//ready
	</script>
	
</body>
</html>