<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>관리자 로그인</title>
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <style type="text/css">
        	#layoutAuthentication{position:relative; top:300px;}
        	.bg-primary{ background-image:url('../img/login.jpg'); background-size: 2100px 1300px;}
        </style>
</head>
<body class="bg-primary">

 <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">관리자 로그인</h3></div>
                                    <div class="card-body">
                                        <form:form action="login"  method="post" modelAttribute="command">
                                        <form:errors element="div"/>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputID" name="Admin_ID" type="text" placeholder="ID" />
                                                <label for="inputID">ID</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputPassword" name="Admin_PASS" type="password" placeholder="Password" />
                                                <label for="inputPassword">Password</label>
                                            </div>
                                         	<div  class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                         		<input type="submit" value="로그인" class="btn btn-primary">
                                         	</div>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
      </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <script src="../js/scripts.js"></script>
</body>
</html>