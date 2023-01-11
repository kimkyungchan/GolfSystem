<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="../../../css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>



<title>공지사항 상세보기</title>
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
				<i class="fas fa-table me-1"></i> 공지사항

			</div>

			<div class="card-body">
				<form method="post" id="updateform" action="/admin/notice/update">
					<input type="hidden" name="_method" value="put">
					<table id="datatablesSimple" class="dataTable-table">
						<tr>
							<td class="white">제목</td>
							<td><input name="title" value="${dto.title }" /> <input
								name="no" value="${dto.no}" type="hidden"></td>
						</tr>
						<tr>
							<td class="white">작성자</td>
							<td><p style="font-size: 10px">관리자
								<p></td>
						</tr>
						<tr>
							<td class="white">내용</td>
							<td><textarea name="content" cols="40" rows="10">${dto.content}</textarea></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="수정"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../../../js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="../../../js/datatables-simple-demo.js"></script>
</body>
</html>