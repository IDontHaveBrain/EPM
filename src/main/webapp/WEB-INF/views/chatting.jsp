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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	var wsocket;
	$(document).ready(function(){
		$("#enterBtn").click(function(){
			if(confirm("채팅방 접속합니다.")){
				conn();
				
			}
		});
		// 아이디 입력 후,  enter 키를 입력시도 접속
		$("#id").keyup(function(){
			if(event.keyCode==13){
				conn();
			}
		});
		
		$("#exitBtn").click(function(){
			if(confirm("접속을 종료하시겠습니까?")){
				wsocket.send("msg:"+$("#id").val()+":접속 종료 했습니다.")
				wsocket.close();
				// 서버 handler public void afterConnectionClosed()
				// 와 연동
			}
		});
		
	});
	function conn(){
		wsocket = new WebSocket("ws:localhost:7080/${path}/chat-ws.do")
		wsocket.onopen=function(evt){ // 접속하는 핸들러 메서드와 연결
			console.log(evt)
			// 능동적으로 서버에 소켓통신으로 메시지를 보내는 것..
			wsocket.send("msg:"+$("#id").val()+":연결 접속했습니다.")
			// "msg:himan:연결접속했습니다."
		}
		// 메시지를 받을 때, 처리되는 메서드
		// 서버에서 push방식으로 메시지를 전달 받는데..
		wsocket.onmessage=function(evt){
			
			var msg = evt.data
			console.log(msg)
			if(msg.substring(0,4)=="msg:"){
				
				// msg:그룹명:전송자:메시지(단일 / )
				//
				var revMsg = msg.substring(4)
				console.log("#메시지 받기#")
				console.log(msg)
				$("#chatMessageArea").append(revMsg+"<br>")	
				// 자동 scolling 처리 로직
				// 1.  전체 charMessageArea의 입력된 최대 높이 구하기
				var mx = parseInt($("#chatMessageArea").height())
				// 2. 포함하고 있는 div의 scollTop을 통해 최대한 내용으로 scrolling 하기
				$("#chatArea").scrollTop(mx);				
			}
			
			
		}
		// 접속을 종료 처리할 때
		wsocket.onclose=function(){
			alert($("#id").val()+"접속 종료합니다.")
			$("#chatMessageArea").val("")
			$("#id").val("").focus();
			
		}		
		
	}
</script>

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
        
		<div class="input-group mb-2 ">
			<div class="input-group-prepend ">
				<span class="text-center input-group-text ">아이디</span>
			</div>
			<input id="id" class="form-control"  placeholder="접속할 아이디 입력하세요" />	
			
			<button type="button" id="enterBtn" class="btn btn-success">채팅입장</button>
			<button type="button" id="exitBtn" class="btn btn-danger">나가기</button>

							
		</div>  
 
			
		<div class="input-group mb-2">
			<div class="input-group-prepend">
				<span class="text-center input-group-text">내 용</span>
			</div>
			<div id="chatArea" class="input-group-append">
				<div id="chatMessageArea"></div>
			</div>			
		</div> 	
		
		<div class="input-group mb-2">
			<div class="input-group-prepend">
				<span class="text-center input-group-text">메시지</span>
			</div>
			<input id="msg" class="form-control" placeholder="보낼 메시지 입력" />	
				 
			<button type="button" id="sndBtn"  class="btn btn-info">메시지전송</button>
		</div> 
		<script type="text/javascript">
			$("#msg").keyup(function(){
				if(event.keyCode==13){
					wsocket.send("msg:"+$("#id").val()+":"+$(this).val())
					$(this).val("").focus()
				}
				
			});
			// 전송 버튼을 클릭시에 메시지 전송
			$("#sndBtn").click(function(){
				wsocket.send("msg:"+$("#id").val()+":"+$("#msg").val())
				$("#msg").val("").focus()				
				
			});
		
		</script>		
				
				
		
		<div class="text-right">
			<button type="button" onclick="goMain()" class="btn btn-info">메인화면</button>
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
</body>
</html>