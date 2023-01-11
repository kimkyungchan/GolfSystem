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
	
	<style>
		.selbt{width:200px; height:70px;  margin:auto; font-size: 40px; background-color:#F2F2F2; position:relative; left:780px;}
	</style>

<title>캐디/카트 지정하기</title>
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
 			
 				<!-- 예약 현황 -->
                <div class="card-header">
        	        <i class="fas fa-table me-1"></i>
        	         예약 목록
        	    </div>	
 				<div class="card-body">
       	         <table id="datatablesSimple" class="dataTable-table">
        	           <thead>
       	    	           <tr>
                	         <th>예약번호</th>
                             <th>이름</th>
                             <th>예약일자</th>
                             <th>예약시간</th>
                             <th>코스</th>
                             <th>인원</th>
                             <th>선택</th>
                      	   </tr>
        	          </thead>
   	                  <tbody>
    	                    <c:forEach items="${res}" var="res">
    	                      <tr>
     	                         <td>${res.resnum}</td>
                             	 <td>${res.name}</td>                             
                            	 <td>${res.resdate}</td>
                          	     <td>${res.restime}</td>
                          	     <td>${res.rescourse}</td>
                          	     <td>${res.numperson}</td>
    	                         <td><input type="radio" name="res" value=1></td>
  		                     </tr>
               		       </c:forEach>
                     </tbody>
                  </table> 			
 				<!-- 대기중인 캐디 현황 -->	
 				<div class="card-header">
        	        <i class="fas fa-table me-1"></i>
        	         캐디목록
        	    </div>	
 				<div class="dataTable-container">
       	         <table id="datatablesSimple" class="dataTable-table">
        	           <thead>
       	    	           <tr>
                	        <th>번호</th>
                    	    <th>이름</th>
                        	<th>나이</th>
       	                    <th>휴대폰</th>
     	                    <th>이메일</th>
     	         	        <th>경력</th>
     	       	            <th>상태</th>
                        	<th>선택</th>
                      	   </tr>
        	          </thead>
   	                  <tbody>
    	                    <c:forEach items="${caddie}" var="cadlist">
    	                      <tr>
     	                        <td>${cadlist.cadno}</td>
    	                        <td>${cadlist.cadname}</td>
        	                    <td>${cadlist.cadage}</td>
   		                        <td>${cadlist.cadphone}</td>
    	                        <td>${cadlist.cademail}</td>
     	                        <td>${cadlist.cadcareer}</td>
    	                        <td>${cadlist.state}</td>
    	                        <td><input type="radio" name="caddie" value=1></td>
  		                     </tr>
               		       </c:forEach>
                     </tbody>
                  </table> 
                  </div>
                <!-- 대기중인 카트 현황 -->  
                <div class="card-header">
        	        <i class="fas fa-table me-1"></i>
        	         카트목록
        	    </div>	  
                <div class="dataTable-container">  
                  <table id="datatablesSimple" class="dataTable-table">
       			      <thead>
    	              	 <tr>
  	                      <th>번호</th>
 	                      <th>생산년도</th>
  	                      <th>최대속도</th>
   	                      <th>최대운행거리</th>
    	                  <th>적재함</th>
   	                      <th>상태</th>
    	                  <th>선택</th>
    	                 </tr>
    	             </thead>
   	                 <tbody>
                  		<c:forEach items="${cart}" var="clist">
                	     <tr>
                    	    <td>${clist.cartno}</td>
                   		    <td>${clist.productyear}</td>
          	                <td>${clist.maxspeed}</td>
          	                <td>${clist.maxdistance}</td>
         	                <td>${clist.weight}</td>
         	                <td>${clist.state}</td>
            	            <td><input type="radio" name="cart" value=1></td>
          	            </tr>
                 	   </c:forEach>
                	 </tbody>
            	   </table>
            	   </div><br>
            	    <button type="button" id="select" class="selbt">지정하기</button>	
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
		
			$(".dataTable-top").remove();
			$(".dataTable-bottom").remove();
			
			
			$("#select").click(function(){
				var check = $("input[name=caddie]:checked").parent();
				var cadtr = check.parent();
				var cadtd = cadtr.children();
				var cadnum = cadtd.eq(0).text();
				
				var check1 = $("input[name=cart]:checked").parent();
				var carttr = check1.parent();
				var carttd = carttr.children();
				var cartnum = carttd.eq(0).text();
				
				var check2 = $("input[name=res]:checked").parent();
				var restr = check2.parent();
				var restd = restr.children();
				var resnum = restd.eq(0).text();
				
				$.ajax({
					url:'/admin/cadcartupdate',
					data:'cadnum='+cadnum+'&cartnum='+cartnum+'&resnum='+resnum,
					method:'get'
				}).done(function(){
					location.reload();
				})
			})//select bt click
			
			
		})//ready
	</script>
	
</body>
</html>