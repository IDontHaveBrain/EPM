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
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="${path}/pms/dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>

  <!-- topbar -->
  <jsp:include page="topbar.jsp"/>
  <!-- /.topbar -->

  <!-- Main Sidebar Container -->
  <jsp:include page="sidebar.jsp"/>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Start</h1>
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
        	<div class="container">
            <div class="card">
              <div class="card-header">        	
             <div class="card-body">
             
                <table id="example1" class="table table-bordered table-striped">
                <c:forEach var="wl" items="${workpage}">
                <h2 style="text-align:center">${wl.pname}</h2><br>
                  <thead>
                    <tr>
                      <th style="text-align:center;" style="width: 150px">업무이름</th>
                      <th style="text-align:center;" style="width: 150px">담당자이름</th>
                      <th style="text-align:center;" style="width: 200px">진행상황</th>
                      <th style="text-align:center;" style="width: 40px">%</th>
                      <th style="text-align:center;" style="width: 160px">시작날짜</th>
                      <th style="text-align:center;" style="width: 160px">마감날짜</th>
                      <th style="text-align:center;" style="width: 160px">수정일</th>
                    </tr>
                  </thead>
                  <tbody>
                  
                    <tr>
                     <td style="text-align:center;">${wl.jname}</td>
                      <td style="text-align:center;">${wl.name}</td>
                      <td>
                        <div class="progress progress-xs">
                          <div class="progress-bar progress-bar-danger" style="width: ${wl.progress}%"></div>
                        </div>
                      </td>
                      <td style="text-align:center;"><span class="badge bg-primary">${wl.progress}%</span></td>
                      <td style="text-align:center;"><fmt:formatDate value="${wl.jstart}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                      <td style="text-align:center;"><fmt:formatDate value="${wl.jend}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                      <td style="text-align:center;"><fmt:formatDate value="${wl.juptdate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>

                    </tr>
                  <tr>
                    <td style="text-align:center" colspan="7" >내용</td>
                  </tr>
                    <tr>
                    <td style="text-align:center" colspan="7">
                    	<textarea rows="10" class="form-control" readonly>${wl.content}</textarea></td>
                    </tr>
                    <tr>
         </c:forEach>

         
                    <td style="text-align:center" colspan="7">파일</td>
                    </tr>
                    <td style="text-align:center" colspan="7">
                 
	<form enctype="multipart/form-data" action="${path}/WorkPageInsert.do" 
		 class="form"  method="post">
			<div class="input-group-prepend">
				<span class="text-center input-group-text">첨부파일</span>
				<input type="file" name="report" class="form-control" placeholder="파일을 첨부하세요" />
					<input type="submit" value="저장" class="btn btn-success float-right">
			</div>

	</form>
                    </td>
                    </tr>


		
			
			 

                   
    <tr><td colspan="7">
	  <div class="row">
        <div class="col-12">
          <a href="WorkPageList.do" class="btn btn-secondary">뒤로가기</a>
      	
			<input type="button" value="승인요청" class="btn btn-success float-right">
			</div>
        </div>
	</td></tr>
                  </tbody>
                </table>
              </div>             
             </div>              
            </div>
            
                     <c:forEach var="ws" items="${flist}">
         <td>"${ws.fname}"</td>
           </c:forEach>
            </div>
        <!-- 페이지 구성 끝!! -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <jsp:include page="footer.jsp"/>

  <!-- Control Sidebar -->
  <jsp:include page="ctrlsidebar.jsp"/>
  <!-- /.control-sidebar -->
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
$("[name=fname]").click(function(){
	if(confirm("다운로드하시겠습니까?")){
		location.href="${path}/download.do?fname="+$(this).val()
	}
});
</script>
</body>
</html>
