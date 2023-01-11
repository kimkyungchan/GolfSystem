<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../sections/header.jsp"/>

<link rel="stylesheet" href="/css/base.css" />
<script src="/js/script.js"></script>

<div id="wrap">
	<!-- header -->
	<div id="header">
		<h1>문의게시판</h1>
	</div><!-- // header -->
	
	<!-- container -->
	<div id="container">
		<form method="post" name="writeform">
			<fieldset>
				<legend>게시판 글쓰기 입력폼</legend>
				<input type="hidden" name="no" value="${dto.no}" />
				<input type="hidden" name="ref" value="${dto.ref}" />
				<input type="hidden" name="re_step" value="${dto.re_step}" />
				<input type="hidden" name="re_level" value="${dto.re_level}" />
				<div class="table_grp">
					<div class="table_type_01">
						<table>
							<colgroup>
								<col style="width:120px;" />
								<col />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">이름</th>
									<td><input type="text" class="txt w100" name="id" value="${user.id }"/></td>
								</tr>
								<tr>
									<th scope="row">제목</th>
									<td>
										<c:if test="${dto.no == 0 }">
										<input type="text" class="txt" name="subject" maxlength="50" />	
										</c:if>
										<c:if test="${dto.no != 0 }">
										<input type="text" class="txt" name="subject" maxlength="50" value="[답변]" />	
										</c:if>
									</td>
								</tr>
								<tr>
									<th scope="row">내용</th>
									<td>
										<div class="textarea_grp">
											<pre><textarea name="content"></textarea></pre>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_align_02">
						<span class="btn btnF_03 btnC_02 mr5">
							<input type="submit" value="작성" />
						</span>

						<a href="list" class="btn btnF_03 btnC_02">
							<span>글목록</span>
						</a>
					</div>
				</div>
			</fieldset>
		</form>
	</div><!-- // container -->
</div><!-- // wrap -->

<jsp:include page="../sections/footer.jsp"/>