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
  <title>Effective PM | 사원등록 </title>

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
      <a class="h1"><b>Effective</b>PM</a>
    </div>
    <div class="card-body">
      <p class="login-box-msg">사원등록을 진행해주세요</p>

      <form id="register" action="register.do" method="post">
        <input type="hidden" id="email_yn" name="email_yn" value="N"/>
        <div class="input-group mb-3">
          <input type="text" name="name" id="name" class="form-control" placeholder="성함">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="email" name="email" id="email" class="form-control" placeholder="이메일">
          <div class="col-4">
          	<button type="button" id="dupCheck" class="btn btn-danger col fileinput-button">중복체크</button>
          </div>
          <div class="input-group-append">
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="date" name="birthdate" id="birthdate" class="form-control" value="1994-01-26">
          <div class="input-group-append">
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="number" name="phonenumber" id="phonenumber" class="form-control" placeholder="핸드폰 번호 ex) 01011112222">
          <div class="input-group-append">
          </div>
        </div>
        <div class="row">
          <!-- /.col -->
          <div class="col-12" style="text-align:center">
            <button type="button" class="btn btn-primary btn-block" onclick="fnSubmit(); return false;">사원등록신청</button>
          </div>
          <!-- /.col -->
        </div>
        <p class="mt-3 mb-1">
        <a href="${path}/login.do" class="text-center">로그인</a>
        </p>
      </form>
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
			
			if ($("#birthdate").val() == null || $("#birthdate").val() == "") {
				alert("생년월일을 선택해주세요.");
				$("#birthdate").focus();
				 
				return false;
			}
			
			if ($("#phonenumber").val() == null || $("#phonenumber").val() == "") {
				alert("핸드폰 번호를 입력해주세요.");
				$("#phonenumber").focus();
				 
				return false;
			}
			 
			if ($("#email_yn").val() != 'Y') {
				alert("이메일 중복체크를 눌러주세요.");
				$("#email_yn").focus();
				 
				return false;
			}
			
	         if (confirm("사원등록신청을 완료하시겠습니까?")) {
	             $("#register").submit();
	             alert("사원등록신청 완료!\n관리자의 승인을 기다려주세요.")
	             return false;
	             
	        }

		}
</script>
</body>
</html>
