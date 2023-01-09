<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 왼 -->
<section
	class="real-time-reserved col-4 d-flex justify-content-center align-items-center">
	<div class="display-4 text-white">
		<div>실시간</div>
		<div>예약하기</div>
	</div>
</section>

<!-- 중 -->
<section class="check col-4">
	<div class="m-3">
		<span class="reserve-check mr-3">예약 확인</span>
	</div>

	<!-- 예약 확인 -->
	<div id="memberInputBox" class="m-2">
		<div class="d-flex justify-content-end mr-3">
			<span class="text-white">이름:</span> <input type="text" id="name"
				class="form-control input-form">
		</div>
		<div class="d-flex justify-content-end mr-3 mt-2">
			<span class="text-white">전화번호:</span> <input type="text"
				id="phoneNumber" class="form-control input-form">
		</div>

		<div class="text-right mt-3 mr-3">
			<button type="button" id="submitBtn" class="btn btn-success submit-btn">조회하기</button>
		</div>
	</div>
</section>

<!-- 오 -->
<section
	class="inquiry col-4 d-flex justify-content-center align-items-center">
	<div class="text-white">
		<h4 class="font-weight-bold">예약문의:</h4>
		<h1>
			010-<br>0000-1111
		</h1>
	</div>
</section>