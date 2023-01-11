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
	border-color: #49be5a;/* #0066A2 */
	height: 20px;
	width: 3Opx;
	font: bold15px arial,sans-serif;
	text-shadow: none;
}
</style>


<div id="wrap">
	<!-- header -->
	<div id="header">
		<h1>공지사항</h1>
	</div><!-- // header -->
	
	<!-- container -->
	<div id="container" >
		<h1>${search}로 검색한 결과입니다.</h1><br>
		
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
								<td colspan="5" class="tac">검색 조건에 맞는 글이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${count > 0}">
							<c:forEach var="article" items="${bList}">
							<tr>
								<td>${article.no}</td>
								<td class="subject">
									<a href="content/${article.no}">
										
										${article.title}
										
									</a>
								</td>
								<td>
									${article.admin_id}
								</td>
								<td><fmt:formatDate value="${article.writedate }" dateStyle="short"/></td>
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
		
		
		<br>
	<div id="search" align="center">
	<form action="search" >
	<select name="searchn">
	<option value="0">제목</option>	
	<option value="1">내용</option>		
	</select>
	<input type="text" name="search" size="15" maxlength="50" />
	<input type="submit" value="검색" class="form-submit-button">
	
	</form>
	</div>
	</div><!-- // container -->
</div><!-- // wrap -->
