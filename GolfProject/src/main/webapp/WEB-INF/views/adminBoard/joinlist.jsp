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

<title>조인게시판 목록</title>

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
					<h1 class="mt-4">조인 게시판</h1>

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
									<th scope="col">번호</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">작성일</th>
									<th scope="col">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${count == 0}">
									<tr>
										<td colspan="5" class="tac">게시판에 입력된 글이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${count > 0}">
									<c:forEach var="join" items="${jList}">
										<tr>
											<td>${join.no}</td>
											<td><a href="/admin/joinlist/content/${join.no}">${join.subject}</td>
											<td>${join.id}</td>
											<td><fmt:formatDate value="${join.regdate }"
													dateStyle="short" /></td>
											<td>${join.readcount}</td>

										</tr>
									</c:forEach>
								</c:if>
							</tbody>

						</table>

					</div>
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

	<!-- JQUERY 사용 -->
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

	<script>
		
	</script>
</html>
