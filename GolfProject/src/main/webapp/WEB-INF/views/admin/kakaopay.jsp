<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>결제</title>
</head>
<body>

	<table id="kakaotable">
		<thead>
		   <tr>
			<th>예약번호</th>
			<th>이름</th>
			<th>예약날짜</th>
			<th>예약코스</th>
			<th>예약시간</th>
			<th>인원</th>
			<th>가격</th>
			<th>결제</th>
		   </tr>
		</thead>
		<tbody>
		   <tr>
			<td>5235</td>
			<td>kk</td>
			<td>2022-12-30</td>
			<td>A</td>
			<td>10:00 ~ 12:00</td>
			<td>4</td>
			<td>210000</td>
			<td><button type="button" id="kakaopay">결제</button></td>
		   </tr>
		</tbody>
		
	</table>
	
	<!-- JQUERY 사용 -->
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	
	<script>
		$(function(){
			
			var td=$("#kakaotable tbody tr").children();
			
			var resnum = parseInt(td.eq(0).text());
			var name = td.eq(1).text();
			var quedate = new Date(td.eq(2).text());
			var price = parseInt(td.eq(6).text());
			
			$("#kakaopay").click(function(){
				$.ajax({
					url:'/kakaopay1',
					data:{
						"resnum":resnum,
						"name":name,
						"resdate":quedate,
						"price":price
					},
					method:'get'
				}).done(function(response){
					location.href = response.next_redirect_pc_url
				})
			})
		})//ready
	</script>
</body>
</html>