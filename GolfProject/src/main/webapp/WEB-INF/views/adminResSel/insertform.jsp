<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="../../css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<style>
#seldate {
	display: block;
	font: 1rem 'Fira Sans', sans-serif;
}

#seldate {
	margin: 0.4rem 0;
}
</style>


<title>예약 테이블 입력</title>
</head>

<body class="sb-nav-fixed">

	<!-- TOP FRAME -->
	<jsp:include page="../AdminFrame/top.jsp" />

	<!-- 전체적인 틀 div -->
	<div id="layoutSidenav">
		<!-- Sidenav FRAME -->
		<jsp:include page="../AdminFrame/sidemenu.jsp" />

		<!-- 본문 내용의 div -->
		<div id="layoutSidenav_content">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 예약 테이블 입력
			</div>

			<div class="card-body">
				<form action="rsinsert" method="post" id="rsinsertform">
					<table id="datatablesSimple" class="dataTable-table">

						<tr>
							<td>예약일 :</td>
							<td><input type="date" id="seldate" name="seldate"
								value="2023-01-06" min="2022-12-01" max="2023-12-31"></td>
						</tr><br>
						<tr>
							<td>코스 :</td>
							<td><c:forEach items="${cList}" var="course">
									<input type="radio" name="selcourse" id="selcourse"
										value="${course}">${course}
		</c:forEach></td>
						</tr>

						<tr>
							<td>시간 :</td>
							<td><select name="seltime">
									<option value="09:00">09:00</option>
									<option value="12:00">12:00</option>
									<option value="15:00">15:00</option>
									<option value="18:00">18:00</option>
							</select></td>
						</tr>
						<br>

						<tr>
							<td>가격 :</td>
							<td><input type="number" step="50000" min="0" 
							name="selprice" id="selprice" placeholder="금액을 입력하세요."></td>
						</tr>
						<br>

						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="입력"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../../js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="../../js/datatables-simple-demo.js"></script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script>
		$("#rsinsertform").submit(function() {		
			if (!$("#selprice").val()) {
				alert("금액을 입력하세요.");
				return false;
			}
			if (!$("#selcourse").val()) {
				alert("코스를 선택하세요.");
				return false;
			}

		});
		
		
	</script>



</body>
</html>