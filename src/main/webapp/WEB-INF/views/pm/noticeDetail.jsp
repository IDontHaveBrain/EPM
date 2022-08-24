<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<c:if test="${param.iid == 0}">
<script type="text/javascript">
	alert("등록된 이슈가 없습니다!");
	location.href="WorkPageList.do?pid=${param.pid}";
</script>
</c:if>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Dashboard</title>

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
  <jsp:include page="pmsidebar.jsp"/>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
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
      <div class="container-fluid">
        <!-- 페이지 구성 시작!! -->
     
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">공지 상세</h3>

          
              </div>
            

            	
            <div class="card-body">
             <form class="form" method="post">
				<input type=hidden name="pid" value="${param.pid}" /> 
				<input type="hidden" name="nid" value="${param.nid}"/>
              <div class="form-group">
                <label for="inputName">공지 제목</label>
                <input type="text" name="ntitle" value="${notice.ntitle}" class="form-control" readonly>
              </div>
              <div class="form-group">
                <label for="inputDescription">내용</label>
                <textarea name="ncontent" class="form-control" rows="4" readonly>${notice.ncontent}</textarea>
              </div>              
			  </form>
              </div>
            <div class="card-footer">
            <div class="row">
        <div class="col-12">
          <a id="cancel" href="noticeList.do?pid=${param.pid}" class="btn btn-secondary">취소</a>  
          <button id="uptcancel" type="button" onclick="uptCancel()" class="btn btn-primary float-right" style="display:none;">수정취소</button>
          <button id="upt" type="button" onclick="changeNotice()" class="btn btn-primary float-right">수정</button>
          <button id="uptok" type="button" onclick="update()" class="btn btn-primary float-right" style="display:none;">저장</button>
        </div>
      </div>
            </div>
            </div>
 
      
      

    </section>
        <!-- 페이지 구성 끝!! -->
      </div><!-- /.container-fluid -->
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <jsp:include page="../footer.jsp"/>

  <!-- Control Sidebar -->
  <jsp:include page="../ctrlsidebar.jsp"/>
  <!-- /.control-sidebar -->
<!-- ./wrapper -->
<script type="text/javascript">
function changeNotice(){
	$("[name=ntitle]").prop("readonly", "");
	$("[name=ncontent]").prop("readonly", "");
	$("#upt").css("display", "none");
	$("#cancel").css("display", "none");
	$("#uptcancel").css("display", "");
	$("#uptok").css("display", "");
}
function uptCancel(){
	$("[name=ntitle]").prop("readonly", "readonly").val("${notice.ntitle}");
	$("[name=ncontent]").prop("readonly", "readonly").val("${notice.ncontent}");
	$("#upt").css("display", "");
	$("#cancel").css("display", "");
	$("#uptcancel").css("display", "none");
	$("#uptok").css("display", "none");
}
function update(){
	location.href="${path}/updateNotice.do?" + $("form").serialize();
}
	$(document).ready(function(){
		$(".nav-link").click(function(){
			var id = $(this).attr("id");
			if(id != undefined){
				location.href="${path}/" + id + ".do?pid=" + ${param.pid};
			}
		});
		$(".nav-link").removeClass("active");
		$("#noticeList").addClass("active");
	});
	
</script>
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
</html>