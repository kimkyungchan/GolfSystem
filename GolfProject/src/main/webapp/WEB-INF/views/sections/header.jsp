<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"
            integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.0.2/index.global.min.js'></script>
    <script src='https://momentjs.com/downloads/moment.js'></script>

    <template id="template-row">
        <tr class="reservation-row">
            <th scope="row">{{num}}</th>
            <td>{{date}}</td>
            <td>{{course}} 코스</td>
            <td>{{time}}</td>
            <td>
                <select class="num-person">
                    <option selected disabled>인원선택</option>
                    <option value="1">1명</option>
                    <option value="2">2명</option>
                    <option value="3">3명</option>
                    <option value="4">4명</option>
                </select>
            </td>
            <td>{{priceText}} 원</td>
            <td>
                <form method="POST" action="/reservation/submit">
                    <input type="hidden" name="date" value="{{date}}"/>
                    <input type="hidden" name="course" value="{{course}}"/>
                    <input type="hidden" name="time" value="{{time}}"/>
                    <input type="hidden" name="num_person" value="0"/>
                    <input type="hidden" name="price" value="{{price}}"/>
                    <button type="submit" class="btn btn-primary" disabled>예약하기</button>
                </form>
            </td>
        </tr>
    </template>
    <style>
        html {
            min-height: 100vh;
        }
        body {
            height: 100%;
            padding-bottom: 180px;
        }
        footer {
            position: fixed;
            width: 100%;
            left: 0;
            bottom: 0;
            z-index: 999;
        }
    </style>
</head>
<body>

<nav class="navbar bg-light">
    <div class="container">
        <a class="navbar-brand" href="/">
            <img src="/img/logo1.jpg" width="30" height="25" class="d-inline-block align-text-top">
            ACE Golf
        </a>

        <div class="d-flex flex-grow-1"></div>

        <div class="navbar-expand">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/">홈</a>
                </li>

                <c:if test="${cookie.get('LOGIN_USER_ID') != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">로그아웃</a>
                    </li>
                </c:if>

                <c:if test="${cookie.get('LOGIN_USER_ID') == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="/loginform">로그인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/insert">회원가입</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<nav class="navbar bg-light">
    <div class="container">
        <ul class="nav nav-justified flex-grow-1">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">이용안내</a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/other/location">오시는길</a></li>
                    <li><a class="dropdown-item" href="/other/weather">날씨정보</a></li>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">예약/결제</a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/reservation">예약하기</a></li>
                    <li><a class="dropdown-item" href="/me/ready-reservations">결제하기</a></li>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">부대시설</a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/other/food">식당</a></li>
                    <li><a class="dropdown-item" href="/other/cu">편의점</a></li>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">게시판</a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/notice/list">공지사항</a></li>
                    
                    <li><a class="dropdown-item" href="/ref/list">문의게시판</a></li>

                    

                    <li><a class="dropdown-item" href="/join/list">조인게시판</a></li>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">코스안내</a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/other/course">코스정보/공략</a></li>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">마이페이지</a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/updateform">회원정보수정</a></li>
                    <li><a class="dropdown-item" href="/deleteform">탈퇴하기</a></li>
                    <li><a class="dropdown-item" href="/me/reservations">예약확인/취소</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>