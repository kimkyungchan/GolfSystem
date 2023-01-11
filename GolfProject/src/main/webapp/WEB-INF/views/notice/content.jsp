<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../sections/header.jsp"/>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<title>공지사항 상세보기</title>
<div id="wrap">
	<!-- header -->
	<div id="header">
		<h1>공지사항</h1>
	</div><!-- // header -->
	
	<!-- container -->
	<div id="container">
		
			<div class="table_grp">
				<div class="table_type_01">
					<table>
						<colgroup>
							<col style="width:120px;" />
							<col />
							<col style="width:120px;" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">글번호</th>
								<td>${dto.no}</td>
								<th scope="row">제목</th>
								<td colspan="3">${dto.title}</td>
							
								
							</tr>
							<tr>
								<th scope="row">작성자</th>
								<td><p style="font-size:10px">관리자<p></td>
								<th scope="row">등록일</th>
								<td><fmt:formatDate value="${dto.writedate}" dateStyle="long" /></td>
							
								<th scope="row">조회수</th>
								<td>${dto.readcount}</td>
							
							</tr>
							
							<tr>
								<th scope="row">글내용</th>
								<td colspan="5"><pre>${dto.content}</pre></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn_align_02">
	
					<span class="btn btnF_03 btnC_02 mr5">
						<input type="button" value="목록" onclick="location.href='../list'" />
					</span>	
					
				</div>
			
		</div>
	</div><!-- // container -->
</div><!-- // wrap -->

<jsp:include page="../sections/footer.jsp"/>