<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Dashboard</title>
  
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
   
  <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
  

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${path}/pms/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="${path}/pms/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="${path}/pms/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="${path}/pms/plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${path}/pms/dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="${path}/pms/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="${path}/pms/plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="${path}/pms/plugins/summernote/summernote-bs4.min.css">
<script type="text/javascript">
   $(document).ready(function(){
      <%-- 
      
      --%>   
   });

</script>

</head>

<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="${path}/pms/dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>

  <!-- topbar -->
  <jsp:include page="../topbar.jsp"/>
  <!-- /.topbar -->

  <!-- Main Sidebar Container -->
  <jsp:include page="../sidebar.jsp"/>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">내 사원정보</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Start v1</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container">
        <!-- 페이지 구성 시작!! -->
        <form id="frm01" enctype="multipart/form-data" action="${path}/sendEmpnoAndPassword.do" class="form" method="post">
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">${member.name}님 사원정보</h3>
            </div>
            <input id="mid" name="mid" type="hidden" value="${member.mid}" class="form-control" readonly>
            <div class="card-body">
              <div class="form-group">
                <label for="inputName">사원번호</label>
                <input id="empno" name="empno" type="text" value="${member.empno}" class="form-control" readonly>
              </div>
              <input type="hidden" name="pwCheck" value=""/>
              <div class="form-group">
                <label for="inputName">이메일</label>
                <input id="email" name="email" type="text" value="${member.email}" class="form-control">
              </div>
              <div class="form-group">
                <label for="inputName">이름</label>
                <input id="name" name="name" type="text" value="${member.name}" class="form-control" readonly>
              </div>
              <div class="form-group">
                <label for="inputName">핸드폰 번호</label>
                <input id="phonenumber" name="phonenumber" type="text" value="${member.phonenumber}" class="form-control">
              </div>
              <div class="form-group">
                <label for="inputName">생년월일</label>
                <input id="birthdate" name="birthdate" type="text" value="${member.birthdate}" class="form-control" readonly>
              </div>
                <label for="inputProjectLeader">권한</label>
              <div class="form-group">
                <input id="auth" name="auth" type="text" value="${member.auth}" class="form-control" readonly>
              </div>
              <div class="col-12" style="text-align:right">    
                <button type="button" onclick="authorize(${memlist.mid})" class="btn btn-primary btn-sm">회원정보 수정</button>
             </div>                                       
            </div>
            <!-- /.card-body -->
           </div>
          <!-- /.card -->
       </form>
     
        <!-- 페이지 구성 끝!! -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <section class="content">
      <div class="container">
        <!-- 페이지 구성 시작!! -->
        <form id="changePassword" method="post">
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">비밀번호 변경하기</h3>
            </div>
            <div class="card-body">
              <div class="form-group">
                <label for="currentPassword">현재 비밀번호</label>
                <input id="currentPassword" name="currentPassword" type="password" class="form-control">
              </div>
              <div class="form-group">
                <label for="newPassword">새 비밀번호</label>
                <input id="newPassword" name="password" type="password" class="form-control">
              </div>
              <div class="form-group">
                <label for="renewPassword">비밀번호 확인</label>
                <input id="renewPassword" name="renewPassword" type="password" class="form-control">
                <div id="pwDif">비밀번호를 다시 확인해주세요.</div>
                <div id="pwCor">비밀번호가 일치합니다.</div>
              </div>
              <input id="mid" name="mid" type="hidden" value="${member.mid}" class="form-control" readonly>
              <div class="col-12" style="text-align:right"> 
              	<button type="button" id="pwChBtn" class="btn btn-primary btn-sm">비밀번호 변경</button>
              </div>                                       
            </div>
            <!-- /.card-body -->
           </div>
          <!-- /.card -->
       </form>
     
        <!-- 페이지 구성 끝!! -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  </div>
  <jsp:include page="../footer.jsp"/>

  <!-- Control Sidebar -->
  <jsp:include page="../ctrlsidebar.jsp"/>
  <!-- /.control-sidebar -->
<!-- ./wrapper -->

<!-- jQuery -->
<script src="${path}/pms/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="${path}/pms/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="${path}/pms/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="${path}/pms/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="${path}/pms/plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="${path}/pms/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="${path}/pms/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="${path}/pms/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="${path}/pms/plugins/moment/moment.min.js"></script>
<script src="${path}/pms/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="${path}/pms/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="${path}/pms/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="${path}/pms/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="${path}/pms/dist/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${path}/pms/dist/js/demo.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="${path}/pms/dist/js/pages/dashboard.js"></script>
</body>

<script type="text/javascript">
		$("#pwCor").hide()
		$("#pwDif").hide()		
		var pwPattern = /^(?=.*[a-z])(?=.*\d)[a-z0-9_-]{8,16}$/
		$("#pwChBtn").click(function(){
			if($("#currentPassword").val()!="${member.password}"){
				alert("현재 비밀번호를 확인해주세요.")
				return
			}
			if($("#newPassword").val().length < 8 || $("#newPassword").val().length > 16 || !$("#newPassword").val().match(pwPattern)){
				alert("비밀번호는 8~16자 영문+숫자 조합입니다.");
				$("#newPassword").focus();
				return
			}
			if($("[name=pwCheck]").val() != "cor"){
				alert("새 비밀번호와 비밀번호 확인을 일치시켜주세요")
				return
			}
			$("#changePassword").attr("action","${path}/changePassword.do")
			$("#changePassword").submit()
		})
		
		$("#renewPassword").keyup(function(){
		     var pw1 = $("#newPassword").val()
		     var pw2 = $("#renewPassword").val()
		     if(pw1 != '' && pw2 !='') {
		 		if(pw1 == pw2) {
		 			$("#pwCor").show()
		 			$("#pwDif").hide()
		 			$("#pwCor").css({"color":"green"})
		 			$("[name=pwCheck]").val("cor")
		 		} else {
		 			$("#pwDif").show()
		 			$("#pwCor").hide()
		 			$("#pwDif").css({"color":"red"})
		 			$("[name=pwCheck]").val("dif")
		 		}
		 	}
		})
		$("#newPassword").keyup(function(){
		     var pw1 = $("#newPassword").val()
		     var pw2 = $("#renewPassword").val()
		     if(pw1 != '' && pw2 !='') {
		 		if(pw1 == pw2) {
		 			$("#pwCor").show()
		 			$("#pwDif").hide()
		 			$("#pwCor").css({"color":"green"})
		 			$("[name=pwCheck]").val("cor")
		 		} else {
		 			$("#pwDif").show()
		 			$("#pwCor").hide()
		 			$("#pwDif").css({"color":"red"})
		 			$("[name=pwCheck]").val("dif")
		 		}
		 	}
		})

   function authorize(mid){
      if(confirm("해당 사원정보를 수정하시겠습니까?")){
         $("form").attr("action","${path}/authorize.do");
         $("form").submit();
      }
   } 
   function deleteMember(){
      var mid = $("[name=mid]").val()
      
      if(confirm("해당 사원을 삭제하시겠습니까?")){
         location.href="${path}/deleteMember.do?mid="+mid;
      }
   } 
   
   var proc = "${proc}"
   if(proc=="upt"){
      alert("권한변경 및 승인 처리 완료\n사원 관리 페이지로 이동합니다.");
      location.href="${path}/memberlist.do";
   }      
   
   if(proc=="del"){
      alert("삭제완료\n사원 관리 페이지로 이동합니다.");
      location.href="${path}/memberlist.do";
   }
   
   $(function(){
      $("#sendBtn").click(function(){
         $.ajax({
            url : "sendEmpnoAndPassword.do",
            type : "POST",
            data : {
               email : $("#email").val()
            },
            success : function(result) {
               alert(result);
            },
         })
      });
   })
   
   if("${proc}"!=""){
	if("${proc}"=="pwChange"){
		alert("비밀번호가 변경되었습니다.\n변경된 비밀번호로 다시 로그인해주세요.")
		location.href="${path}/logout.do"
	}
} 
</script>
</html>