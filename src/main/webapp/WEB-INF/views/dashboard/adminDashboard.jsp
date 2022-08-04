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
  <title>EPM Dashboard</title>

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
  <!-- jQuery -->
  <script src="${path}/pms/plugins/jquery/jquery.min.js"></script>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<script>
  function updateIssue(cnt){
    $.ajax({
      url: "${path}/issueListAjax.do",
      data: "pid=" + 1 + "&curPage=" + cnt,
      dataType: "json",
      success: function (data) {
        //console.log(data)
        var list = data.ilist;
        var addHTML = "";
        var addPage = "";
        $(list).each(function (idx, rst) {
          addHTML += "<tr><td>" + (idx + 1) + "</td><td>" + rst.jname
            + "</td><td>" + rst.ititle + "</td><td>" + rst.iprogress + "</td>";
          addHTML += "<td>" + rst.name + "</td><td>" + new Date(rst.iuptdate).toLocaleDateString()+ "</td></tr>";
        });
        //console.log(addHTML);
        $("#ilist").html(addHTML);
        // Page 처리
        var isch = data.issuesSch;
        //console.log(isch.startBlock);
        addPage += "<li class='page-item'><a class='page-link' href='javascript:goPageI(" + (isch.startBlock-1) + ")'>&laquo;</a></li>";
        for(var i = isch.startBlock; i <= isch.endBlock; i++){
          addPage += '<li class="page-item ' + (isch.curPage==i?'active':'') + '">';
          addPage += '<a class="page-link" href="javascript:goPageI(' + i + ')">' + i + '</a></li>';
        }
        addPage += '<li class="page-item"><a class="page-link" href="javascript:goPageI(' + (isch.endBlock+1) + ')">&raquo;</a></li>';
        $("#ipage").html(addPage);
      }
    });
  }

  function updateNotice(cnt){
    $.ajax({
      url: "${path}/noticeListAjax.do",
      data: "pid=" + 1 + "&curPage=" + cnt,
      dataType: "json",
      success: function (data) {
        //console.log(data)
        var list = data.nlist;
        var addHTML = "";
        var addPage = "";
        $(list).each(function (idx, rst) {
          addHTML += "<tr><td>" + (idx + 1) + "</td><td>" + rst.ntitle
            + "</td>";
          addHTML += "<td>" + new Date(rst.nuptdate).toLocaleDateString()+ "</td></tr>";
        });
        //console.log(addHTML);
        $("#nlist").html(addHTML);
        // Page 처리
        var nsch = data.noticeSch;
        //console.log(isch.startBlock);
        addPage += "<li class='page-item'><a class='page-link' href='javascript:goPageN(" + (nsch.startBlock-1) + ")'>&laquo;</a></li>";
        for(var i = nsch.startBlock; i <= nsch.endBlock; i++){
          addPage += '<li class="page-item ' + (nsch.curPage==i?'active':'') + '">';
          addPage += '<a class="page-link" href="javascript:goPageN(' + i + ')">' + i + '</a></li>';
        }
        addPage += '<li class="page-item"><a class="page-link" href="javascript:goPageN(' + (nsch.endBlock+1) + ')">&raquo;</a></li>';
        $("#npage").html(addPage);
      }
    });
  }

  function goPageI(cnt){
    // 요청값으로 현재 클릭한 페이지를 설정하고, 서버에 전달..
    updateIssue(cnt);
  }
  function goPageN(cnt){
    // 요청값으로 현재 클릭한 페이지를 설정하고, 서버에 전달..
    updateNotice(cnt);
  }

  $(document).ready(function () {
    updateIssue(1);
    updateNotice(1);
  });
</script>

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
            <h1 class="m-0">Admin Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Admin Dashboard</li>
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
        <div class="row">
          <div> <h4>간트차트 영역</h4> </div>
        </div>

        <div class="row">
          <c:forEach var="prj" items="${prjList}">
            <div class="col-lg-12">
              <div class="card card-primary collapsed-card">
                <div class="card-header">
                  <h3 class="card-title">${prj.pname}</h3>

                  <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
                    </button>
                  </div>
                  <!-- /.card-tools -->
                </div>
                <!-- /.card-header -->
                <div class="card-body p-0">
                  <div class="embed-responsive embed-responsive-16by9">
                    <iframe class="embed-responsive-item" src="dashboard.do?pid=${prj.pid}&hide=1"></iframe>
                  </div>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
            </div>
          </c:forEach>

        </div>
        <!-- 페이지 구성 끝!! -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <jsp:include page="../footer.jsp"/>

  <!-- Control Sidebar -->
  <jsp:include page="../ctrlsidebar.jsp"/>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

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
<script>
  // 이슈차트
  var pieChartCanvas = $('#issuePieChart').get(0).getContext('2d')
  var pieData = {
    labels: [
      '해결',
      '해결중',
      '해결불가',
    ],
    datasets: [
      {
        data: [${iprog[0]}, ${iprog[1]}, ${iprog[2]}],
        backgroundColor: ['#00a65a', '#f39c12', '#f56954']
      }
    ]
  }
  var pieOptions = {
    legend: {
      display: false
    }
  }
  // Create pie or douhnut chart
  // You can switch between pie and douhnut using the method below.
  // eslint-disable-next-line no-unused-vars
  var pieChart = new Chart(pieChartCanvas, {
    type: 'doughnut',
    data: pieData,
    options: pieOptions
  })
  // 업무차트
  var pieChartCanvas = $('#jobPieChart').get(0).getContext('2d')
  var pieData = {
    labels: [
      '완료',
      '진행중',
    ],
    datasets: [
      {
        data: [${jprog[0]}, ${jprog[1]}],
        backgroundColor: ['#00a65a', '#f39c12']
      }
    ]
  }
  var pieOptions = {
    legend: {
      display: false
    }
  }
  // Create pie or douhnut chart
  // You can switch between pie and douhnut using the method below.
  // eslint-disable-next-line no-unused-vars
  var pieChart = new Chart(pieChartCanvas, {
    type: 'doughnut',
    data: pieData,
    options: pieOptions
  })
</script>
</body>
</html>
