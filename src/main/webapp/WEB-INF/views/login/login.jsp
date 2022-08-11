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
        <a href="${path}/recoverpassword.do">비밀번호찾기</a>
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
	$(document).ready(function(){
		
		var userInputEmpno = getCookie("userInputEmpno");//저장된 쿠기값 가져오기
	    
		$("input[name='empno']").val(userInputEmpno); 
	     
	    if($("input[name='empno']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
	                                           // 아이디 저장하기 체크되어있을 시,
	        $("#remember").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#remember").change(function(){ // 체크박스에 변화가 발생시
	        if($("#remember").is(":checked")){ // ID 저장하기 체크했을 때,
	            var userInputEmpno = $("input[name='empno']").val();
	            setCookie("userInputEmpno", userInputEmpno, 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("userInputEmpno");
	        }
	    })
	    
	    
	});
	    
	    function setCookie(cookieName, value, exdays){
	        var exdate = new Date();
	        exdate.setDate(exdate.getDate() + exdays);
	        var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	        document.cookie = cookieName + "=" + cookieValue;
	    }
	     
	    function deleteCookie(cookieName){
	        var expireDate = new Date();
	        expireDate.setDate(expireDate.getDate() - 1);
	        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	    }
	    
	    function getCookie(cookieName) {
	        cookieName = cookieName + '=';
	        var cookieData = document.cookie;
	        var start = cookieData.indexOf(cookieName);
	        var cookieValue = '';
	        if(start != -1){
	            start += cookieName.length;
	            var end = cookieData.indexOf(';', start);
	            if(end == -1)end = cookieData.length;
	            cookieValue = cookieData.substring(start, end);
	        }
	        return unescape(cookieValue);
	    }
	
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
		
	}
	$("#login").keyup(function(){
		if(event.keyCode==13){
			login();
		}
	});
	
	$("#login").on('submit', function(){
		$.ajax({
			url: "${path}/loginCheck.do",
			method: "post",
			data: {
				empno: $("#empno").val(),
				password: $("#password").val()
			},
			dataType: "text",
			success: function(data){
				console.log(data);
				if(data!=="pass"){
					alert("사원번호와 비밀번호를 확인해주세요.");
				}else{
					return false;
				}
			},
			error: function(error){
				console.log(error);
			}
		})
	})
</script>
</body>
</html>