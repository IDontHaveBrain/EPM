<%--
  Created by IntelliJ IDEA.
  User: skawn
  Date: 2022-07-28
  Time: 오후 12:13
  To change this template use File | Settings | File Templates.
--%>
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
	   
        
    	//Date picker
	    $('#reservationdate').datepicker({
	    	format: 'L'

	    });
		


	});
	function updatePmember(){
		    $.ajax({
		      url: "${path}/ajaxPmember.do",
		      data: "pid=" + ${param.pid},
		      dataType: "json",
		      success: function (data) {
		        console.log(data)
		        var list = data.pmemberList;
		        var addHTML = "";
		        var addPage = "";
		        $(list).each(function (idx, rst) {
		        	addHTML+="<option value='"+rst.mid+"'>"+rst.name"</option>";
		        });

		        console.log(addHTML);
		        $("#inputPM").html(addHTML);
		        $("#inputMem").html(addHTML);
		      }
		    });
		  }
	updatePmember();
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
            <h1 class="m-0">프로젝트 수정</h1>
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
        <form id="frm01" enctype="multipart/form-data" action="${path}/projectInsert.do" class="form"  method="post">             
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">프로젝트 수정</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            
            <div class="card-body">
              <div class="form-group">
                <label for="inputName">프로젝트명</label>
                <input id="inputName" type="text" value="${project.pname}" class="form-control">
              </div>
              <div class="form-group">           
                <label for="inputProjectLeader">PM</label>
                <select id="inputPM" class="form-control pm-select">
                	<option selected disabled>PM 선택</option>
    				<c:forEach var="pmember" items="${pmemberList}">
						<option value="${pmember.mid }">${pmember.name}</option>
					</c:forEach>
                </select>              
              </div>
              <div class="form-group"> 
              	<label for="inputProjectLeader">참여 멤버</label>
                <select id="inputPM" class="form-control pm-select">
                	<option selected disabled>멤버 선택</option>
    				<c:forEach var="pmember" items="${pmemberList}">
						<option value="${pmember.mid }">${pmember.name}</option>
					</c:forEach>
                </select> 
              </div>  
              <div class="form-group">
                <label for="inputDescription">프로젝트 설명</label>
                <textarea id="inputDescription" class="form-control" rows="4">${project.pcomment}</textarea>
              </div>
              <div class="form-group">
                <label for="inputClientCompany">시작일 :</label>
                <fmt:formatDate value="${project.pstart}"/>
                <input type="date" id="inputClientCompany" class="form-control">
              </div>
			  <div class="form-group">
                <label for="inputClientCompany">종료일 :</label>
                <fmt:formatDate value="${project.pend}"/>
                <input type="date" id="inputClientCompany" value="${project.pstart}" class="form-control">
              </div> 
            </div>
            <!-- /.card-body -->
     	   </div>
          <!-- /.card -->
      
      <div class="row">
        <div class="col-12">
          <button type="button" onclick="goMain()" class="btn btn-secondary">취소</button>
          <button type="button" onclick="deleteProc()" class="btn btn-danger float-right">삭제</button>
          <button type="button" onclick="updateProc()" class="btn btn-success float-right">수정</button>

        </div>
      </div>
   
     </form>
        <!-- 페이지 구성 끝!! -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <jsp:include page="../footer.jsp"/>

  <!-- Control Sidebar -->
  <jsp:include page="../ctrlsidebar.jsp"/>
  <!-- /.control-sidebar -->>
</div>
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


<script type="text/javascript">
/*
 function updateProc(){
	if(confirm("수정하시겠습니까?")){
		// 유효성 check
		$("form").attr("action","${path}/updateProject.do");
		$("form").submit();
	}
}


var proc = "${proc}"
	if(proc=="upt"){
		if(confirm("수정성공!\n조회리스트화면으로 이동하시겠습니까?")){
			location.href="${path}/boardList.do";
		}
	}
	

 */
	function deleteProc(){
		if(confirm("삭제하시겠습니까?")){
			$("form").attr("action","${path}/deleteProject.do");
			$("form").submit();		
		}
	}
 
var proc = "${proc}"	
	if(proc=="del"){
		alert("삭제성공!")
	}

 function goMain(){
		location.href="${path}/projectList.do";
	}


</script>
</body>
</html>