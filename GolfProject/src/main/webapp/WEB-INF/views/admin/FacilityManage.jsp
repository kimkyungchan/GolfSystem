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
	  #golf, #cart, #toilet, #restaurant{width:350px; height:350px;}
	  #golf{position:relative; left:450px; top:250px; background-image:url('../img/course.jpg'); background-size:350px 350px; font-weight:bold; font-size:25px}
	  #cart{position:relative; left:1000px; bottom:100px; background-image:url('../img/golfcart.jpg'); background-size:350px 350px; font-weight:bold; font-size:25px}
	  #toilet{position:relative; left:450px; top:80px; background-image:url('../img/toliet.jpg'); background-size:350px 350px; font-weight:bold; font-size:25px}
	  #restaurant{position:relative; left:1000px; bottom:270px; background-image:url('../img/restaurant.jpg'); background-size:350px 350px; font-weight:bold; font-size:25px}
	  #mainh1{position:relative; left:700px; top:100px;}
	  td, th{text-align:center;}
	</style>
	
	<title>점검내역기록</title>
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
 				<h1 id="mainh1">점검 내역 기록 페이지</h1>
 			
 				<button type="button" id="golf" value=1>골프코스 점검</button>
 				<button type="button" id="cart" value=2>카트 점검</button>
 				<button type="button" id="toilet" value=3>화장실 점검</button>
 				<button type="button" id="restaurant" value=4>음식점 점검</button>
			
 			</div>

	</div> <!-- layout sidenav -->
	

	<!-- Modal -->
  <div class="modal fade" id="facilityModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
 	 <div class="modal-dialog modal-xl">
   		 <div class="modal-content">
      		<div class="modal-header">
        		<h1 class="modal-title fs-5" id="staticBackdropLabel"></h1>
        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      		</div>
    		<div class="modal-body">
                
               <form id="writeform" method="post" action="/admin/save">
                <table id="datatablesSimple" class="dataTable-table">
                	<thead>
                		<tr> 
	                		<th rowspan="2" class="headth">번호</th>
	                		<th rowspan="2" class="headth">점검문항</th>
                			<th colspan="3" class="headth">점검결과</th>
                			<th rowspan="2" class="headth">비고</th>
                		</tr>
                	    <tr> 
	                		<th>예</th>
	                		<th>아니오</th>
	                		<th>해당없음</th>
                		</tr>
                	</thead>
                	
                	<tbody>
                	</tbody>
                </table>
               </form>
        		
      		<div class="modal-footer">
      			<button type="button" class="btn btn-primary" id="save">저장</button>
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
			
			var value = "";
			var i=1;
			var content ="";
			
			$("#golf").click(function(){
				value = $(this).val();
				
				$.ajax({
					url:'/admin/facility/pop',
					data:'value='+value,
					dataType:'json',
					method:'get'
				}).done(function(data){
					$("#staticBackdropLabel").text("골프 코스 점검 기록표");
					
					for(var key in data){
						content+="<tr><td>"+data[key].num+"</td><td>"+data[key].content+"</td>"
						+"<td><input type=radio name=result"+i+" value=1></td><td><input type=radio name=result"+i+" value=2></td><td><input type=radio name=result"+i+" value=3></td>"
						+"<td><input type=text id=remark></td></tr>";
						
						i++;
					}
					i=1;
					$("#datatablesSimple tbody").html(content);
					content="";
					$("#facilityModal").modal("show");
				})
			})
			
			$("#cart").click(function(){
				value = $(this).val();
				
				$.ajax({
					url:'/admin/facility/pop',
					data:'value='+value,
					dataType:'json',
					method:'get'
				}).done(function(data){
					$("#staticBackdropLabel").text("카트 점검 기록표");
					
					for(var key in data){
						content+="<tr><td>"+data[key].num+"</td><td>"+data[key].content+"</td>"
						+"<td><input type=radio name=result"+i+" value=1></td><td><input type=radio name=result"+i+" value=2></td><td><input type=radio name=result"+i+" value=3></td>"
						+"<td><input type=text id=remark></td></tr>";
						
						i++;
					}
					i=1;
					$("#datatablesSimple tbody").html(content);
					content="";
					$("#facilityModal").modal("show");	
				})
			})
			
			$("#toilet").click(function(){
				value = $(this).val();
				
				$.ajax({
					url:'/admin/facility/pop',
					data:'value='+value,
					dataType:'json',
					method:'get'
				}).done(function(data){
					$("#staticBackdropLabel").text("화장실 점검 기록표");
					
					for(var key in data){
						content+="<tr><td>"+data[key].num+"</td><td>"+data[key].content+"</td>"
						+"<td><input type=radio name=result"+i+" value=1></td><td><input type=radio name=result"+i+" value=2></td><td><input type=radio name=result"+i+" value=3></td>"
						+"<td><input type=text id=remark></td></tr>";
						
						i++;
					}
					i=1;
					$("#datatablesSimple tbody").html(content);
					content="";
					$("#facilityModal").modal("show");
				})
			})
			
			$("#restaurant").click(function(){
				value = $(this).val();
				
				$.ajax({
					url:'/admin/facility/pop',
					data:'value='+value,
					dataType:'json',
					method:'get'
				}).done(function(data){
					$("#staticBackdropLabel").text("음식점 점검 기록표");
					
					for(var key in data){
						content+="<tr><td id=num>"+data[key].num+"</td><td>"+data[key].content+"</td>"
						+"<td><input type=radio name=result"+i+" value=1></td><td><input type=radio name=result"+i+" value=2></td><td><input type=radio name=result"+i+" value=3></td>"
						+"<td><input type=text id=remark"+i+" ></td></tr>";
						
						i++;
					}
					i=1;
					$("#datatablesSimple tbody").html(content);
					content="";
					$("#facilityModal").modal("show");
				})
			})
			
			$("#save").click(function(){
				
				var numarray = [];
				var resultcheck = [];
				var remarkarray = [];
				var dataarray=[];
				
				var num = $("tbody tr").children();
				var remark = $("tbody tr td").children();
				
				var numcount=0;
				var remarkcount=3;
				
				
				for(var i=1;i<6;i++){
					numarray.push(num.eq(numcount).text());
					resultcheck.push($("input[name=result"+i+"]:checked").val());
					remarkarray.push(remark.eq(remarkcount).val());
					numcount+=6;
					remarkcount+=4;
				}
				dataarray.push(numarray);
				dataarray.push(resultcheck);
				dataarray.push(remarkarray);
				dataarray.push(value);
				
				numcount=0;
				remarkcount=3;
	
				$.ajax({
					url:'/admin/save',
					data : 'dataarray='+JSON.stringify(dataarray),
					method:'post'
				}).done(function(){
					location.reload();
				})

			})
			
		})//ready
	</script>
	
</body>
</html>