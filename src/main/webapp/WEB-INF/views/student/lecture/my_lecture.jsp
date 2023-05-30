<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Acadmi!</title>
	<!-- CSS/favicon 적용 -->
	<c:import url="../../temp/style.jsp"></c:import>
	<!-- CSS/favicon 끝 -->
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Header 적용 -->
		<c:import url="../../temp/header.jsp"></c:import>
		<!-- Header 끝 -->

		<!-- Main Contents -->
		<div class="container-fluid">
			<div class="row">
				<!-- 2레벨 Sidebar 적용 -->
				<div class="content-wrapper">
					<c:import url="../../temp/sidebar/student_lecture.jsp"></c:import>
				</div>
				<!-- 2레벨 Sidebar 끝 -->
				
				<!-- Contents -->
				<div class="col">

					<!-- Content Header (Page header) -->
					<section class="content-header">
						<div class="container-fluid">
							<div class="row mb-2">
								<div class="col-sm-6">
									<h1>내 수강 신청</h1>
								</div>
								<div class="col-sm-6">
									<ol class="breadcrumb float-sm-right">
										<li class="breadcrumb-item"><a href="/">Home</a></li>
										<li class="breadcrumb-item active">내 수강 신청</li>
									</ol>
								</div>
							</div>
						</div><!-- /.container-fluid -->
					</section>

					<!-- Content -->
					<section class="content">
						
						<!-- Search -->
						<form action="./my_lecture">
							<input type="hidden" name="page" value="1">
							<div class="row justify-content-center mx-auto mb-3">
								<div class="col-md-6">
									<div class="form-group">
										<div class="input-group input-group-lg">
											<input type="text" class="form-control form-control-lg" placeholder="강의 이름을 입력하세요." name="search" value="${pagination.search}">
											<div class="input-group-append">
												<button type="submit" class="btn btn-lg btn-default">
													<i class="fa fa-search"></i>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
						
						<!-- Default box -->
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">신청 과목</h3>
								
								<div class="card-tools">
									<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
										<i class="fas fa-minus"></i>
									</button>
									<button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
										<i class="fas fa-times"></i>
									</button>
								</div>
							</div>
							
							<div class="card-body p-0">
								<div id="myLectureList">
								</div>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</section>
					<!-- /.content -->
				</div>
			</div>
		</div>

		<!-- Footer 적용 -->
		<c:import url="../../temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->

	</div>
<!-- ./wrapper -->
<script src="/js/student/lecture/my_lecture_list.js"></script>
<script>
</script>
</body>
</html>