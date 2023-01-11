<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<style type="text/css">
	#exceldown{position:relative; left:220px; top:40px;}
</style>
<title>예약 현황</title>

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

			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">예약 현황</h1>

					<div class="card-body">
						<table id="datatablesSimple">
							<colgroup>
								<col style="width: 10%;" />
								<col />
								<col style="width: 12%;" />
								<col style="width: 12%;" />
								<col style="width: 12%;" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">예약 번호</th>
									<th scope="col">이름</th>
									<th scope="col">예약일자</th>
									<th scope="col">예약시간</th>
									<th scope="col">코스</th>
									<th scope="col">금액</th>
									<th scope="coL">예약 취소</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${count == 0}">
									<tr>
										<td colspan="5" class="tac">예약목록이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${count > 0}">
									<c:forEach items="${aRList}" var="res">
										<tr>
											<td>${res.resnum}</td>
											<td>${res.name}</td>
											<td><fmt:formatDate value="${res.resdate }"
													dateStyle="short" /></td>
											<td>${res.restime}</td>
											<td>${res.rescourse}</td>
											<td>${res.price}</td>
											<td><input type="button" id="${res.resnum}"
												value="예약 취소"></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
							<div>
								<input type="button" value="excel" class="btn btn-primary" id="exceldown"
									onclick="location.href='/adminRes/info'">
							</div>
						</table>
					</div>
				</div>
			</main>
		</div>
	</div>
	<!-- layout sidenav -->



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../../js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="../../js/datatables-simple-demo.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script>
		$(function() {
			$("input[id]").click(function() {
				let resnum = $(this).attr("id");
				$.ajax({
					url : "/adminRes/delete",
					data : "resnum=" + resnum,
					method : "delete"
				}).done(function() {
					alert("예약내역을 취소하시겠습니까?")
					location.href = "/adminRes/list";
				})
				return false;
			})
		})
	</script>

</body>
</html>