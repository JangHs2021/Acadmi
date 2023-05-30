<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table class="table table-striped projects">
	<thead>
		<tr>
			<th style="width: 8%">강의 번호</th>
			<th style="width: 8%">강의 이름</th>
			<th style="width: 8%">학년</th>
			<th style="width: 8%">구분</th>
			<th style="width: 8%">학과</th>
			<th style="width: 8%">학점</th>
			<th style="width: 8%">요일</th>
			<th style="width: 8%">시작 시간</th>
			<th style="width: 8%">종료 시간</th>
			<th style="width: 8%">강의실</th>
			<th style="width: 8%">수강 인원</th>
			<th style="width: 12%"></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list}" var="lectureVO">
			<tr>
				<td>${lectureVO.lectureNum}</td>
				<td><a>${lectureVO.lectureName}</a><br/><small> ${lectureVO.professorVO.username}</small></td>
				<td>${lectureVO.grade}학년</td>
				<td>
					<c:if test="${lectureVO.category eq '전공 필수'}">전공 필수</c:if>
					<c:if test="${lectureVO.category eq '전공 선택'}">전공 선택</c:if>
					<c:if test="${lectureVO.category eq '필수 교양'}">필수 교양</c:if>
					<c:if test="${lectureVO.category eq '선택 교양'}">선택 교양</c:if>
				</td>
				<td>${lectureVO.departmentVO.deptName}</td>
				<td>${lectureVO.completionGrade}</td>
				<td>${lectureVO.weekday}</td>
				<td>
					<c:if test="${lectureVO.startTime eq 1}">AM 09:00</c:if>
					<c:if test="${lectureVO.startTime eq 2}">AM 10:00</c:if>
					<c:if test="${lectureVO.startTime eq 3}">AM 11:00</c:if>
					<c:if test="${lectureVO.startTime eq 4}">PM 12:00</c:if>
					<c:if test="${lectureVO.startTime eq 5}">PM 13:00</c:if>
					<c:if test="${lectureVO.startTime eq 6}">PM 14:00</c:if>
					<c:if test="${lectureVO.startTime eq 7}">PM 15:00</c:if>
					<c:if test="${lectureVO.startTime eq 8}">PM 16:00</c:if>
					<c:if test="${lectureVO.startTime eq 9}">PM 17:00</c:if>
					<c:if test="${lectureVO.startTime eq 10}">PM 18:00</c:if>
				</td>
				<td>
					<c:if test="${lectureVO.endTime eq 1}">AM 09:00</c:if>
					<c:if test="${lectureVO.endTime eq 2}">AM 10:00</c:if>
					<c:if test="${lectureVO.endTime eq 3}">AM 11:00</c:if>
					<c:if test="${lectureVO.endTime eq 4}">PM 12:00</c:if>
					<c:if test="${lectureVO.endTime eq 5}">PM 13:00</c:if>
					<c:if test="${lectureVO.endTime eq 6}">PM 14:00</c:if>
					<c:if test="${lectureVO.endTime eq 7}">PM 15:00</c:if>
					<c:if test="${lectureVO.endTime eq 8}">PM 16:00</c:if>
					<c:if test="${lectureVO.endTime eq 9}">PM 17:00</c:if>
					<c:if test="${lectureVO.endTime eq 10}">PM 18:00</c:if>
				</td>
				<td>${lectureVO.lectureRoomVO.lectureBuilding} ${lectureVO.lectureRoomVO.lectureRoom}</td>
				<td>${lectureVO.subscription}/${lectureVO.personal}명</td>
				<td class="project-actions text-right">
					<input type="hidden" name="lectureNum" value="${lectureVO.lectureNum}">
					<input type="hidden" name="username" value="${member.username}">
					<button class="btn btn-danger btn-sm" id="mld" type="button" data-mld-num="${lectureVO.lectureNum}">
						<i class="fas fa-xmark"></i>
						취소
					</button>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>