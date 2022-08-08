<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>

<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Effective PM | 로그인</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${path}/pms/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="${path}/pms/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${path}/pms/dist/css/adminlte.min.css">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <!-- /.login-logo -->
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <a class="h1"><b>Effective</b>PM</a>
    </div>
    <div class="card-body">
      <p class="login-box-msg">로그인을 진행해주세요</p>

      <form action="login.do" id="login" method="post">
        <div class="input-group mb-3">
          <input type="text" name="empno" id="empno" class="form-control" placeholder="사원번호">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" name="password" id="password" class="form-control" placeholder="비밀번호">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="remember">
              <label for="remember">
                사원번호 저장
              </label>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-4">
            <button type="button" onclick="login(); return false;" class="btn btn-primary btn-block">로그인</button>
          </div>
          <!-- /.col -->
        </div>
      </form>

      <!-- /.social-auth-links -->

      <p class="mt-3 mb-1">
        <a href="${path}/findMyPassword.do">비밀번호찾기</a>
      </p>
      <p class="mb-0">
        <a href="${path}/register.do" class="text-center">사원등록신청</a>
      </p>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="${path}/pms/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${path}/pms/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${path}/pms/dist/js/adminlte.min.js"></script>
<script type="text/javascript">
		//alert(name)
	function login() {
			
		if ($("#empno").val() == null || $("#empno").val() == "") {
			alert("사원번호를 입력해주세요.");
			$("#email").focus();
			 
			return false;
		}
		
		if ($("#password").val() == null || $("#password").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#password").focus();
			
			return false;		
		}
		
		if (confirm("로그인하시겠습니까?")) {
			 
			$("#login").submit();
			return false;
		}
		
		$("#password").keyup(function(){
			if(event.keyCode==13){
				$("#login").submit();
			}
		})
	}
</script>
</body>
</html>