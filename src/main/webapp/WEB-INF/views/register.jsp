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
  <title>Effective PM | Registration Page </title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${path}/pms/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="${path}/pms/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${path}/pms/dist/css/adminlte.min.css">
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <a href="../../index2.html" class="h1"><b>Effective</b>PM</a>
    </div>
    <div class="card-body">
      <p class="login-box-msg">Register a new membership</p>

      <form id="register" action="register.do" method="post">
        <input type="hidden" id="email_yn" name="email_yn" value="N"/>
        <div class="input-group mb-3">
          <input type="text" name="name" id="name" class="form-control" placeholder="Full name">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="email" name="email" id="email" class="form-control" placeholder="Email">
          <div class="col-4">
          	<button type="button" id="dupCheck" class="btn btn-primary btn-block">중복체크</button>
          </div>
          <div class="input-group-append">
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" name="password" id="password" class="form-control" placeholder="Password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" name="confirmPassword" id="confirmPassword"class="form-control" placeholder="Retype password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="agreeTerms" name="terms" value="agree">
              <label for="agreeTerms">
               I agree to the <a href="#">terms</a>
              </label>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-4">
            <button type="button" class="btn btn-primary btn-block" onclick="fnSubmit(); return false;">Register</button>
          </div>
          <!-- /.col -->
        </div>
      </form>

      <div class="social-auth-links text-center">
        <a href="#" class="btn btn-block btn-primary">
          <i class="fab fa-facebook mr-2"></i>
          Sign up using Facebook
        </a>
        <a href="#" class="btn btn-block btn-danger">
          <i class="fab fa-google-plus mr-2"></i>
          Sign up using Google+
        </a>
      </div>

      <a href="login.html" class="text-center">I already have a membership</a>
    </div>
    <!-- /.form-box -->
  </div><!-- /.card -->
</div>
<!-- /.register-box -->

<!-- jQuery -->
<script src="${path}/pms/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${path}/pms/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${path}/pms/dist/js/adminlte.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#dupCheck").click(function(){
			$.ajax({
				url:"${path}/dupCheck.do",
				data:"email="+$("#email").val(),
				dataType:"json",
				success:function(data){
					console.log(data)
					if(data.dupCheck){
						alert("이미 등록된 이메일입니다.\n다른 이메일을 입력하세요")
						$("#email_yn").val("N");
						$("[name=email]").val("").focus();
					}else{
						alert("등록가능한 이메일입니다!")
						$("#email_yn").val("Y");
					}
				},
				error:function(err){
					console.log(err)
				}
			});
		})
	});
	
		function fnSubmit() {
			
			var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			if ($("#name").val() == null || $("#name").val() == "") {
				alert("이름을 입력해주세요.");
				$("#name").focus();
			 
				return false;
			}
			 
			if ($("#email").val() == null || $("#email").val() == "") {
				alert("이메일을 입력해주세요.");
				$("#email").focus();
				 
				return false;
			}
			 
			if ($("#email_yn").val() != 'Y') {
				alert("이메일 중복체크를 눌러주세요.");
				$("#email_yn").focus();
				 
				return false;
			}

			
			if ($("#password").val() == null || $("#password").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
				 
				return false;
			}
			 
			if ($("#confirmPassword").val() == null || $("#confirmPassword").val() == "") {
				alert("비밀번호 확인을 입력해주세요.");
				$("#confirmPassword").focus();
				 
				return false;
			}
			 
			if ($("#password").val() != $("#confirmPassword").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				$("#confirmPassword").focus();
				 
				return false;
			}
			if(!email_rule.test($("#email").val())){
				alert("이메일을 형식에 맞게 입력해주세요. ex) example@gmail.com");
				$("#email").focus();
				return false;
				}
			
			if (confirm("회원가입하시겠습니까?")) {
			 
			$("#register").submit();
			return false;
			}
			 
		}
</script>
</body>
</html>
