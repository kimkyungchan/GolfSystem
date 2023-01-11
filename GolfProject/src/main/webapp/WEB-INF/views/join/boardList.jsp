<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../sections/header.jsp"/>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<style>

.form-submit-button {
	background: #49be5a; /* #0066A2 */
	color: white;
	border-style: outset;
	border-color: #49be5a; /* #0066A2 */
	height: 20px;
	width: 3Opx;
	font: bold15px arial,sans-serif;
	text-shadow: none;
}
</style>

<div id="wrap">
	<!-- header -->
	<div id="header">
		<h1>조인게시판</h1>
	</div><!-- // header -->
	
	<!-- container -->
	<div id="container" >
		<p class="all_txt">글목록 <span>(전체글 : ${count})</span></p>
		
		<div class="table_grp">
			<div class="table_type_04">
				<table>
					<colgroup>
						<col style="width:10%;" />
						<col />
						<col style="width:12%;" />
						<col style="width:12%;" />
						<col style="width:12%;" />
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
								<td colspan="5" class="tac">게시판에 저장된 글이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${count > 0}">
							<c:forEach var="article" items="${bList}">
							<tr>
								<td>
									<c:out value="${start}"/>
									<c:set var="start" value="${start+1}" />
									
								</td>
								<td class="subject">
									<a href="content/${article.no}">
										<c:if test="${article.re_level > 0 }">
										<!-- 답변글이있으면 -->
										<span class="icon">
										<img src="/img/level.gif" width="${article.re_level * 10}">	
										<img src="/img/re.gif" alt="답변" /></span>
										</c:if>
										${article.subject}
										<c:if test="${article.readcount >= 20 }">
										<span class="icon"><img src="/img/hot.gif" alt="인기글" /></span>
										</c:if>
									</a>
								</td>
								<td>
									${article.id}
								</td>
								<td><fmt:formatDate value="${article.regdate }" dateStyle="short"/></td>
								<td>${article.readcount}</td>
								
							</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			
		</div>
		
		<!-- 페이징 -->
		<div class="paging">
		<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="list?p=${begin-1 }" class="page prv">&lt;</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="list?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="list?p=${end+1}" class="page next">&gt;</a>
				</c:if>
			</div>
		</div>	
		<div class="btn_align_02">
				<a href="write" class="btn btnF_03 btnC_02">
					<span>글쓰기</span>
				</a>
			</div><br>
	<div id="search" align="center">
	<form action="search">
	<select name="searchn">
	<option value="0">제목</option>	
	<option value="1">내용</option>	
	<option value="2">작성자</option>	
	</select>
	
	<input type="text" name="search" size="15" maxlength="50" />
	<input type="submit" value="검색 " class="form-submit-button">
	
	</form>
	</div>
	</div><!-- // container -->
</div><!-- // wrap -->

<jsp:include page="../sections/footer.jsp"/>