<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션</title>

<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

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
		
		<section>
			<jsp:include page="logoImg.jsp" />
		</section>
		
		<section class="contents1 d-flex">
			<jsp:include page="contentsMain.jsp" />
		</section>
		
		<footer>
			<jsp:include page="footer.jsp" />
		</footer>
	</div>
	
	<script>
		$(document).ready(function() {
			
			
			
			$('#submitBtn').on("click", function() {
				let name = $('#name').val().trim();
				let phoneNumber = $('#phoneNumber').val().trim();
				
				if (name.length == "") {
					alert("이름을 입력해 주세요.");
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
					, url:"/booking/reservation_check"
					, data:{"name":name, "phoneNumber":phoneNumber}
				
					, success:function(data) {
						if (data.code == 1) {
							// 예약날짜가 Date 타입일 때 잘라내기
							// data.result.date.slice(0, 10)
							alert("이름 : " + data.result.name + "\n날짜 : " + data.result.date
									+ "\n일수 : " + data.result.day + "\n인원 : " + data.result.headcount
									+ "\n상태 : " + data.result.state);
							
						} else if (data.code == 502) {
							alert(data.error_message);
						}
					}
					, error:function(e) {
						alert("조회 실패");
					}
					
				});
			});
		});
	</script>
</body>
</html>