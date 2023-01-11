<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="../../../css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<!-- TOP FRAME -->
	<jsp:include page="../AdminFrame/top.jsp" />

	<!-- 전체적인 틀 div -->
	<div id="layoutSidenav">

		<!-- Sidenav FRAME -->
		<jsp:include page="../AdminFrame/sidemenu.jsp" />

		<!-- 본문 내용의 div -->
		<div id="layoutSidenav_content">
			
				<!-- // header -->
				<div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                문의게시판                         
                            </div>

				<!-- container -->
				<div id="container">

					<div class="table_grp">
						<div class="table_type_01">
							<table>
								<colgroup>
									<col style="width: 120px;" />
									<col />
									<col style="width: 120px;" />
									<col />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">글번호</th>
										<td>${article.no}</td>
										<th scope="row">조회수</th>
										<td>${article.readcount}</td>
									</tr>
									<tr>
										<th scope="row">작성자</th>
										<td>${article.id}</td>
										<th scope="row">작성일</th>

										<td><fmt:formatDate value="${article.regdate}"
												dateStyle="long" /></td>

									</tr>
									<tr>
										<th scope="row">글제목</th>
										<td colspan="3">${article.subject}</td>
									</tr>
									<tr>
										<th scope="row">글내용</th>
										<td colspan="3"><pre>${article.content}</pre></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div align="right">
						
            <input class="btn" type="button" value="답글" onclick="location.href='/admin/reflist/write?no=${article.no}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level}'" />
            <input class="btn" type="button" value="삭제" id="${article.no}">
            <input class="btn" type="button" value="목록" onclick="location.href='..'">
          </div>
						
						

					</div>
				</div>
			</div>
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<script>
				$(function() {
					$("input[id]").click(function() {
						let no = $(this).attr("id");
						$.ajax({
							url : "/reflist/delete",
							data : "no=" + no,
							method : "delete"
						}).done(function() {
							location.href = "/admin/reflist";
						})
						return false;
					})
				})
			</script>
</body>
</html>