<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: mhdjang
  Date: 2023/01/01
  Time: 2:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../sections/header.jsp"/>

<script>
    $(function () {
       
    	$("tbody #salesbt").click(function(){
    		var tr = $(this).parent().parent();
    		var td = tr.children();
    		
    		var resnum = td.eq(0).text();
    		var id = td.eq(1).text();
    		var resdate = new Date(td.eq(2).text()); 
    		var course = td.eq(4).text();
    		var usetime = td.eq(3).text();
    		
    		var strprice= td.eq(6).text();
    		var price = parseInt(strprice.replace(" 원",""));
    	
    		$("#kakao").click(function(){    		
    			$.ajax({
    				url:'/kakaopay',
    				data:{
    					"resnum":resnum,
						"resdate":resdate,
						"price":price,
						"id":id,
						"rescourse":course,
						"restime":usetime
    				},
    				method:'get'
    			}).done(function(response){
    				location.href = response.next_redirect_pc_url
    			})
    		})
    		
    	})
        
        
    });
</script>

<div class="container">
    <h1 class="text-center mt-4 mb-4">결제하기</h1>

    <table class="table">
        <thead>
        <tr>
            <th scope="col">예약번호</th>
            <th scope="col">아이디</th>
            <th scope="col">예약일자</th>
            <th scope="col">예약시간</th>
            <th scope="col">코스명</th>
            <th scope="col">인원</th>
            <th scope="col">요금</th>
            <th scope="col">결제</th>
        </tr>
        </thead>
        <tbody id="tbody">
        <c:forEach items="${reservations}" var="reservation">
            <tr>
                <td>${reservation.resNum}</td>
                <td>${reservation.ID}</td>
                <td>${reservation.getFormattedDate()}</td>
                <td>${reservation.restime}</td>
                <td>${reservation.resCourse} 코스</td>
                <td>${reservation.numPerson} 명</td>
                <td>${reservation.price} 원</td>
                <td>
                    <button
                            type="button" class="btn btn-primary" id="salesbt" data-bs-toggle="modal"
                            data-bs-target="#purchase-modal">
                        결제하기
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


<div class="modal fade" id="purchase-modal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5">결제 방법 선택</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="취소하기"></button>
            </div>
            <div class="modal-body">
                <div class="d-grid gap-2">
                    <button type="button" class="btn btn-primary btn-block" id="kakao">카카오페이로 결제</button>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../sections/footer.jsp"/>
