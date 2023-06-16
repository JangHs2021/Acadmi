<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/style.jsp"></c:import>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style type="text/css">
	#row {
	  display: flex;
	  justify-content: center; /* 가로 방향으로 가운데 정렬 */
	  align-items: center; /* 세로 방향으로 가운데 정렬 */
	}
	
	.col-custom {
	  flex-grow: 1;
	}
	
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Header 적용 -->
		<c:import url="../temp/administrator_header.jsp"></c:import>
		<!-- Header 끝 -->
	
		<div class="content-wrapper">
			<div class="col">
					
				<!-- header start -->
				<div class="row">
					<div class="col mt-3">
						<div class="card">
							<h3 class="my-3 mx-3">강의실 조회</h3>
						</div>
					</div>
				</div>
				<!-- header end -->
	
				<!-- Default box -->
				<div class="card">
					<div class="card-header">
							
						<div class="card-tools">
							<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
								<i class="fas fa-minus"></i>
							</button>		
						</div>
					
						<!-- Search -->
						<form action="./lectureRoomList" id="search-form">
								<input type="hidden" name="page" value="1">
									<div class="row justify-content-center mx-auto my-3" >
										<div class="col-custom">
											<div class="row"  id="row">
												<div class="col-2">
													<div class="form-group">
														<label>상태</label>
														<select class="select2" name="status" style="width : 100%;">
															<option value="">전체</option>
															<option value="1">사용 가능</option>
															<option value="0">사용 불가</option>
															
														</select>
													</div>
												</div>
												<div class="col-2">
													<div class="form-group">
														<label>강의실 건물</label>
														<select class="select2" name="lectureBuilding" style="width: 100%;">
															<option value="">전체</option>
															<c:forEach items="${list2}" var="lectureRoom">
																<option value="${lectureRoom.lectureBuilding}">${lectureRoom.lectureBuilding }</option>
															</c:forEach>
														</select>
													</div>
												</div>
											<div class="col-4">
												<div class="form-group">
													<label>강의실 호수</label>
													<div class="input-group">
														<input type="text" class="form-control" name="lectureRoom" placeholder="강의실 호수를 입력하세요.">
														<div class="input-group-append">
															<button type="submit" class="btn btn-default" id="submit">
																<i class="fas fa-search "></i>
															</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							
						</form>
					</div>
						   <!-- Default box -->
				        <div class="card-body p-0">
							<table class="table table-hover text-nowrap" style="text-align : center;"id="table1">
				              <thead>
				                  <tr>
				                      <th style="width: 10%">
				                          강의실 건물
				                      </th>
				                      <th style="width: 10%">
				                          강의실 호수
				                      </th>
				                      <th style="width: 10%" class="text-center">
				                          최대 수용 인원
				                      </th>
				                      <th style="width : 15%">
				                          사용 여부
				                      </th>
				                      <th style="width: 10%">
				                 
				                      </th>
				                    
				                  </tr>
				              </thead>
				              <tbody>
				                <c:forEach items="${list}" var="lectureRoomVO">
										<tr class="find">
											
											<c:if test="${lectureRoomVO.status eq 0}">
												<td class="lectureRoom" style="color: #E2E2E2;">${lectureRoomVO.lectureBuilding}</td>
												<td class="lectureRoom" style="color: #E2E2E2;">${lectureRoomVO.lectureRoom}</td>
												<td class="lectureRoom" style="color: #E2E2E2;">${lectureRoomVO.personal}</td>
												<td>
													<select name="status" class="select2" style="width : 31%">
														<option value="0"selected >사용 불가</option>
														<option value="1">사용 가능</option>
													</select>
												</td>
											</c:if>
											<c:if test="${lectureRoomVO.status eq 1 }">
												<td>${lectureRoomVO.lectureBuilding}</td>
												<td>${lectureRoomVO.lectureRoom}</td>
												<td >${lectureRoomVO.personal}</td>
												<td>
													<select name="status" class="select2" style="width : 31%">
														<option value="0" >사용 불가</option>
														<option value="1"selected>사용 가능</option>
													</select>
												</td>
											</c:if>
										<td>
											<button type="button" class="btn btn-primary" id="update" data-lecture="${lectureRoomVO.lectureBuilding}${lectureRoomVO.lectureRoom}"
												data-lectureBuilding="${lectureRoomVO.lectureBuilding}" data-lectureRoom="${lectureRoomVO.lectureRoom }">
												수정
											</button> 
										</td>
									</tr>
								</c:forEach>
				              </tbody>
				          </table>
				        </div>
					<!-- /.card-body -->
					<!-- Pagination -->
				    	<div class="row g-3 justify-content-center" style="margin: 20px auto;" id="pagination">
							<nav aria-label="Page navigation example">
								<ul class="pagination pagination-sm mx-auto" style="width: 200px;">
									<li class="page-item ${pagination.page eq 1? 'disabled' : '' }">
										<a class="page-link" href="./lectureRoomList?page=1&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="1" style="color:#17a2b8;">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
									<li class="page-item ${pagination.pre eq false ? 'disabled' : ''}">
										<a class="page-link" href="./lectureRoomList"page=${pagination.startNum-1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="${pagination.startNum-1}" style="color:#17a2b8;">
											<span aria-hidden="true">&lsaquo;</span>
										</a>
									</li>
									<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
										<li class="page-item"><a class="page-link" href="./lectureRoomList?page=${i}&kind=${pagination.kind}&search=${pagination.search}" data-board-page="${i}" style="color:#17a2b8;">${i}</a></li>
									</c:forEach>
									<li class="page-item ${pagination.next eq false ? 'disabled' : ''}">
										<a class="page-link" href="./lectureRoomList?page=${pagination.lastNum+1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.lastNum+1}" style="color:#17a2b8;">
											<span aria-hidden="true">&rsaquo;</span>
										</a>
									</li>
									<li class="page-item ${pagination.next eq totalPage ? 'disabled' : ''}">
										<a class="page-link" href="./lectureRoomList?page=${pagination.totalPage}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.totalPage}">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</ul>
							</nav>
					   </div>
					<div class="wrapper" style="margin : 0 20px 20px 0;">
						 <a href="./lectureRoomAdd"><button type="button" id="add2" class="btn btn-info" style="float : right;">강의실 등록</button></a>
					 </div>
				</div>
			</div>
		</div>
	</div>
				
	<!-- ./wrapper -->

<c:import url="../temp/footer.jsp"></c:import>
<script type="text/javascript" src="../js/administrator/lectureRoomList.js"></script>
<script type="text/javascript">
/* select 디자인 */
   $(function () {
	      $('.select2').select2()
	 });
</script>
</body>
</html>