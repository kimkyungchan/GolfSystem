<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 예약 검색</title>
<style>
#center {
	width: 700px;
	margin-left: auto;
	margin-right: auto;
}

table {
	border: 1px solid black;
	width: 700px;
	border-collapse: collapse;
}

th {border: 1px solid black;
	background-color: white;
	width: 150px;
}
td{border: 1px solid black;}
a {
	margin: 10px auto;
}

#page {
	text-align: center;
}
</style>
</head>
<body>
<div id="center">
		<h1>${search}로 검색한 결과입니다.</h1>

		<c:if test="${count != 0 }">
			<table>
				<tr>
					<th>예약번호</th>
                    <th>이름</th>
                    <th>예약일자</th>
                    <th>예약시간</th>
                    <th>코스</th>
                    <th>인원</th>
				</tr>
				<c:forEach items="${aRList}" var="res">
					<tr>
						<td>${res.resnum}</a></td>
						<td>${res.name}</td>
						<td><fmt:formatDate value="${res.resdate}" dateStyle="short"/> </td>
						<td>${res.restime}</td>
						<td>${res.rescourse}</td>
                        <td>${res.personct }</td>
					</tr>
				</c:forEach>
			</table>
			<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="search?p=${begin-1}&search=${search}&searchn=${searchn}">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="search?p=${i}&search=${search}&searchn=${searchn}">${i}</a>  <!--검색어를 계속 들고 다님-->
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="search?p=${end+1}&search=${search}&searchn=${searchn}">[다음]</a>
				</c:if>
			</div>

		</c:if>
		<c:if test="${count == 0 }">
	검색된 내용이 없습니다.
</c:if>
</body>
</html>