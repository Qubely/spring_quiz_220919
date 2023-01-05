<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가</title>

<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
	
	<div class="container">
		<h1>즐겨 찾기 추가하기</h1>
		<div class="form-group">
			<label for="name">제목</label>
			<input type="text" id="name" name="name" class="form-control col-12">
		</div>
		<div class="form-group">
			<label for="url">주소</label>
			<div class="d-flex">
				<input type="text" id="url" name="url" class="form-control col-11">
				<button type="button" id="urlCheckBtn" class="btn btn-info ml-2">중복확인</button>
			</div>
			<small id="urlStatusArea"></small>
		</div>
		<button type="button" id="join" class="btn btn-success col-12">추가</button>
	</div>
	
	<script>
		$(document).ready(function() {
			
			$("#join").on("click", function() {
				
				let name = $("#name").val().trim();
				let url = $("#url").val().trim();
				
				if (name.length == "") {
					alert("이름을 입력하세요");
					return;
				}
				if (url.length == "") {
					alert("url 주소를 입력하세요");
					return;
				}
				if (url.startsWith("https") == false && url.startsWith("http") == false) {
					alert("http 또는 https로 시작하도록 입력하세요");
					return;
				}
				
				
				$.ajax({
					
					// request
					type:"POST"
					, url:"/lesson06/quiz01/add_bookmark"
					, data:{"name":name, "url":url}
					
					// response
					, success:function(data) {	// String JSON => object
						// alert(data);
						if (data.result == "성공") {
							location.href = "/lesson06/quiz01/after_add_bookmark"
						}
					}
					, error:function(e) {
						alert("에러" + e);
					}
					
				});
				
			});
			
			
			$('#urlCheckBtn').on("click", function() {
				let url = $('#url').val().trim();
				
				$('#urlStatusArea').empty();
				
				if (url.length == "") {
					$('#urlStatusArea').append('<span class="text-danger">url을 입력하세요</span>');
					return;
				}
				
				if (url.startsWith("https") == false && url.startsWith("http") == false) {
					$('#urlStatusArea').append('<span class="text-danger">http 또는 https로 시작하도록 입력하세요</span>');
					return;
				}
				
				$.ajax({
					// request
					type:"get"
					, url:"/lesson06/quiz02/is_duplication"
					, data:{"url":url}
					
					// response
					, success:function(data) {
						if (data.is_duplication) {
							$('#urlStatusArea').append('<span class="text-danger">중복된 url 입니다.</span>');
						} else {
							$('#urlStatusArea').append('<span class="text-primary">저장 가능한 url 입니다.</span>');
						}
					}
					, error:function(e) {
						alert("실패" + e);
					}
					
				});
				
			});
			
			
		});
	</script>
</body>
</html>