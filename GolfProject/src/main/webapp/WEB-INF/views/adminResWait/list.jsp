<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="../css/styles.css" rel="stylesheet" />
	<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
	<title>예약 대기 현황</title>
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
                        <h1 class="mt-4">예약 대기 현황</h1>
                 
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                예약 대기 목록
                            </div>
                            
                            <div class="card-body">
                                <table id="datatablesSimple">
			                         <tr>
			                             <th>신청일자</th>
			                             <th>아이디</th>
			                             <th>희망일자</th>
			                             <th>희망시간</th>
			                             <th>희망코스</th>
			                             <th>예약가능확인</th>                           
			                         </tr>
			                         <c:forEach items="${aRWList}" var="reswait" varStatus="i">
			                           <tr id="hope${i.index}">
			                               
			                               <td><fmt:formatDate value="${reswait.signupdate}" dateStyle="short"/></td>
			                               <td>${reswait.id}</td>                             
			                               <td><fmt:formatDate value="${reswait.hopeday}" dateStyle="short"/></td>
			                               <td>${reswait.hopetime}</td>
			                               <td>${reswait.hopecourse}</td>
			                               <td><input type="button" itemid="hope${ i.index}" class="check" value="확인"> </td>         
			                           </tr>
			                          </c:forEach> 
                			    </table>
                            
                            </div>   
                        </div>
				   </div>
				</main>
 			 </div>

	</div> <!-- layout sidenav -->
	
	
<!-- <div id="center">
          <h1>예약대기 현황</h1>
          
          
	<c:if test="${count != 0}">
                   <table id="hope">
                         <tr>
                             <th>신청일자</th>
                             <th>아이디</th>
                             <th>희망일자</th>
                             <th>희망시간</th>
                             <th>희망코스</th>
                             <th>예약가능확인</th>                           
                         </tr>
                         <c:forEach items="${aRWList}" var="reswait" varStatus="i">
                           <tr id="hope${i.index}">
                               
                               <td><fmt:formatDate value="${reswait.signupdate}" dateStyle="short"/></td>
                               <td>${reswait.id}</td>                             
                               <td><fmt:formatDate value="${reswait.hopeday}" dateStyle="short"/></td>
                               <td>${reswait.hopetime}</td>
                               <td>${reswait.hopecourse}</td>
                               <td><input type="button" itemid="hope${ i.index}" class="check" value="확인"> </td>         
                           </tr>
                          </c:forEach> 
                   </table>
                   <div id="page">
                      <c:if test="${begin > pageNum }">
                         <a href="list?p=${begin-1 }">[이전]</a>
                      </c:if>
                      <c:forEach begin="${begin}" end="${end}" var="i">
                         <a href="list?p=${i}">${i}</a>
                      </c:forEach>
                      <c:if test="${end < totalPages }">
                         <a href="list?p=${end+1}">[다음]</a>
                      </c:if>
                   </div>
                   
                   
              </c:if>
              <c:if test="${count == 0 }">
              예약대기가 없습니다.
              </c:if>       
       </div> -->
       
 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="../js/datatables-simple-demo.js"></script>      
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

 $(function(){
	$(".check").click(function(){
		let num = $(this).attr("itemid");
		let hopeday = ($("#"+num+" td:nth-child(3)").text())
		let hopetime = ($("#"+num+" td:nth-child(4)").text())
		let hopecourse = ($("#"+num+" td:nth-child(5)").text())
		
		$.ajax({url:"/resWaitCheck",
			    data: "hopeday="+hopeday+"&hopetime="+hopetime+"&hopecourse="+hopecourse
		}).done(function(rep){
			
			if(rep == 0){
				alert("예약 가능");
			}else{
				alert( "불가능");
			}
		})
		
	})
})



</script>
</body>
</html>