<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>

<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!-- datepicker -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="/css/booking/style.css">

</head>
<body>
	
	<div id="wrap" class="container">
	
		<header class="d-flex justify-content-center align-items-center">
			<jsp:include page="header.jsp" />
		</header>
		
		<nav>
			<jsp:include page="nav.jsp" />
		</nav>
		
		<section class="contents2">
			<h2 class="text-center font-weight-bold m-4">예약 하기</h2>
			<div class="d-flex justify-content-center">
				<div class="reservation-box">
					<div class="my-2 font-weight-bold">이름</div>
					<input type="text" class="form-control" name="name">
					
					<div class="my-2 font-weight-bold">예약날짜</div>
					<input type="text" class="form-control" name="date">
					
					<div class="my-2 font-weight-bold">숙박일수</div>
					<input type="text" class="form-control" name="day">
					
					<div class="my-2 font-weight-bold">숙박인원</div>
					<input type="text" class="form-control" name="headcount">
					
					<div class="my-2 font-weight-bold">전화번호</div>
					<input type="text" class="form-control" name="phoneNumber">
					
					<button type="button" id="reservationBtn" class="btn btn-warning col-12 mt-3">예약하기</button>
				</div>
			</div>
		</section>
		
		<footer>
			<jsp:include page="footer.jsp" />
		</footer>
	</div>
	
	<script>
		$(document).ready(function() {
			
			$('input[name=date]').datepicker({
				dateFormat: "yy-mm-dd",
				dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
				monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				yearSuffix: '년',
				changeMonth: true,
				changeYear: true,
				minDate: 0
			});
			
			
			$('#reservationBtn').on('click', function() {
				let name = $('input[name=name]').val().trim();
				let date = $('input[name=date]').val().trim();
				let day = $('input[name=day]').val().trim();
				let headcount = $('input[name=headcount]').val().trim();
				let phoneNumber = $('input[name=phoneNumber]').val().trim();
				let state = "대기중";
				
				let checkNum = /^[0-9]*$/;
				
				if (name.length == "") {
					alert("이름을 입력하세요.");
					return;
				}
				if (date.length == "") {
					alert("예약날짜를 입력하세요.");
					return;
				}
				if (day.length == "") {
					alert("숙박일수를 입력하세요.");
					return;
				}
				if (!checkNum.test(day)) {
					alert("숙박일수에 숫자만 입력해 주세요.");
					return;
				}
				if (headcount.length == "") {
					alert("숙박인원을 입력하세요.");
					return;
				}
				if (!checkNum.test(headcount)) {
					alert("숙박인원에 숫자만 입력해 주세요.");
					return;
				}
				if (phoneNumber.length == "") {
					alert("전화번호를 입력하세요.");
					return;
				}
				if (phoneNumber.length > 13 || phoneNumber.length < 13) {
					alert("전화번호는 xxx-xxxx-xxxx형식으로 입력하세요.");
					return;
				}
				if (!phoneNumber.includes('-')) {
					alert("전화번호는 xxx-xxxx-xxxx형식으로 입력하세요.");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/booking/add_booking"
					, data:{"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber, "state":state}
					
					, success:function(data) {
						if (data.code == 1) {
							alert(data.result);
							location.href = "/booking/booking_list_view"
						} else if (data.code == 501) {
							alert(data.error_message);
						}
					}
					, error:function(e) {
						alert("에러" + e);
					}
					
				});
				
			});
			
		});
	</script>
	
</body>
</html>