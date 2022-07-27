<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Project Add</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
</head>
<body>

<%--
<jsp:include page="/pms/footer.jsp"></jsp:include>
<jsp:include page="/pms/sidebar.jsp"></jsp:include>
<jsp:include page="/pms/topbar.jsp"></jsp:include>
 --%>


<!-- Site wrapper -->
<div class="wrapper">

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-6">
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">General</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="card-body">
              <div class="form-group">
                <label for="inputProjectCode"></label>
                <input type="text" id="inputProjectCode" class="form-control">
              </div>
              <div class="form-group">
                <label for="inputName">프로젝트명</label>
                <input type="text" id="inputName" class="form-control">
              </div>
              <div class="form-group">           
                <label for="inputProjectLeader">PM</label>
                <select id="inputPM" class="form-control pm-select">
                  <option selected disabled>PM 선택</option>
                  <option>멤버</option>
                  <option>정보</option>
                  <option>받아오기</option>
                </select>              
              </div>
              <div class="form-group"> 
              	<label for="inputProjectLeader">PM</label>
                <select id="inputPM" class="form-control pm-select">
                  <option selected disabled>인원 선택</option>
                  <option>멤버</option>
                  <option>정보</option>
                  <option>받아오기</option>
                </select> 
              </div>  
              <div class="form-group">
                <label for="inputDescription">프로젝트 설명</label>
                <textarea id="inputDescription" class="form-control" rows="4"></textarea>
              </div>
              <div class="form-group">
                <label for="inputClientCompany">시작일</label>
                <input type="text" id="inputClientCompany" class="form-control">
              </div>
			  <div class="form-group">
                <label for="inputClientCompany">종료일</label>
                <input type="text" id="inputClientCompany" class="form-control">
              </div>

            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
      </div>
      
      <div class="row">
        <div class="col-12">
          <a href="#" class="btn btn-secondary">취소</a>    
          <button type="button" id="regBtn" class="btn btn-success float-right">등록</button>
          <!--           
          <button type="button" id="uptBtn" class="btn btn-info">수정</button>
          <button type="button" id="delBtn" class="btn btn-danger">삭제</button> 
          -->

        </div>
      </div>
      <script type="text/javascript">
      /*
      	$("#regBtn").click(function(){
      		if(confirm("등록하시겠습니까?")){
      			$("").attr("action","${path}/calInsert");
      			$("").submit();
      		}
      	});
      	
      	$("#uptBtn").click(function(){
      		if(confirm("수정하시겠습니까?")){
      			$("").attr("action","${path}/calUpdate.do");
      			$("").submit();
      		}
      	});  
      	
      	$("#delBtn").click(function(){
      		if(confirm("삭제하시겠습니까?")){
      			$("").attr("action","${path}/calDelete.do");
      			$("").submit();
      		}
      	});        
	   */

      </script>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


  <!-- Control Sidebar -->

  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
</body>
</html>