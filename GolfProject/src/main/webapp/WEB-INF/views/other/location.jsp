<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../sections/header.jsp"/>

<div class="container pt-4 pb-4">
    <div class="row justify-content-center">
        <div class="col-8 text-center">
            <h2 class="text-center mt-5 mb-5">오시는 길</h2>

            <img src="https://maps.googleapis.com/maps/api/staticmap?center=%EA%B2%BD%EA%B8%B0%EB%8F%84%20%ED%8C%8C%EC%A3%BC%EC%8B%9C%20%EA%B4%91%ED%83%84%EB%A9%B4%20%EC%84%9C%EC%9B%90%EA%B8%B8%20333&key=AIzaSyCeTSQSsk6B_PkIbvIqW18rnkNBYgNqv3Y&size=730x450&maptype=roadmap">

            <div class="mb-3 mt-5 row">
                <label class="col-sm-2 col-form-label">주소: </label>
                <div class="col-sm-10">
                    <input type="text" readonly class="form-control-plaintext" value="경기도 파주시 광탄면 서원길 333">
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">대표 전화: </label>
                <div class="col-sm-10">
                    <input type="text" readonly class="form-control-plaintext" value="010-1234-1234">
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="../sections/footer.jsp"/>