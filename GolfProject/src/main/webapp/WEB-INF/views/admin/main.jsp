<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>관리자 메인</title>

	<link href="../css/styles.css" rel="stylesheet" />
	<style>
		#Allcontent{width:2100px; height:1900px; display:block;}
		#version{position:relative; left:1850px;}
		#maintitle{font-size:70px; font-weight:bold; position:relative; top:120px; left:100px; color:white;}
		#movecategory{display:inline-block; position:relative; top:150px; left:120px;}
		#member{background-image:url('../img/member.PNG');  background-size: 300px 300px; position:relative; bottom:30px;}
		#res{position:relative; left:170px; bottom:30px; background-image:url('../img/res.PNG');  background-size: 300px 300px;}
		#facility{position:relative; left:340px; bottom:30px; background-image:url('../img/Inspection.PNG');  background-size: 300px 300px;}
		#cadcart{background-image:url('../img/cadcart.PNG');  background-size: 300px 300px;}
		#notice{position:relative; left:510px; bottom:30px; background-image:url('../img/notice.PNG');  background-size: 300px 300px;}
		#locker{position:relative; left:170px; background-image:url('../img/locker.PNG');  background-size: 300px 300px;}
		#sales{position:relative; left:340px; background-image:url('../img/sales.PNG');  background-size: 300px 300px;}
		#Ref{position:relative; left:510px; background-image:url('../img/inquery.PNG');  background-size: 300px 300px;}
		
		.maintop{background-color:white; color:black; font-weight:bold; font-size:15px;}
		.mainbottom{background-color:white; color:black; font-weight:bold; font-size:15px;}
		.maincontent{background-image:url('../img/main.jpg'); background-size: 2100px 1300px; width:2100px; height:960px;}
		.button {display: inline-block; width: 300px; height: 300px; background: #4E9CAF; padding: 10px; text-align: center; 
		         color:black; font-weight: bold; font-size:20px;line-height: 25px; text-decoration-line:none; border:5px solid;}
		.testdiv{display: inline-block; width:300px; height:300px; background:#4E9CAF;}
		
		body{overflow:hidden;}
		h3{position:relative; top:100px; left:170px; color:white;}	
	</style>
</head>
<body>
	<div id="Allcontent">
	
		<div class="maintop">
			<span id="logo"> AGS</span> <span id="version">VERSION 1.0</span>
		</div> <!-- TOP 종료 -->
		
		<div class="maincontent">
			<p id="maintitle">Ace Golf System</p>
			<h3>${admin.name} 관리자님 안녕하세요.</h3>
			
			<div id="movecategory">
				<div id="deliverdiv">
				<a href="/admin/memberManage" class="button" id="member">회원현황</a>
				<a href="/adminRes/list" class="button" id="res">예약현황</a>
				<a href="/admin/facility" class="button" id="facility">점검내역기록</a>
				<a href="/admin/notice/adminlist" class="button" id="notice">공지사항</a><br>
				<a href="/admin/cadcartCheck" class="button" id="cadcart">캐디카트지정</a>
				<a href="/admin/locker" class="button" id="locker">사물함지정</a>
				<a href="/admin/SalesManage" class="button" id="sales">매출관리</a>
				<a href="/admin/reflist" class="button" id="Ref">문의게시판</a>
			   </div>
			</div>
		</div> <!-- content 종료 -->
		
		<div class="mainbottom">
			<span></span>
		</div> <!-- bottom 종료 -->
		
	</div> <!-- 전체 DIV -->

</body>
</html>