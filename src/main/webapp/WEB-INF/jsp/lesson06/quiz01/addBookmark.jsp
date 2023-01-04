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
			<input type="text" id="url" name="url" class="form-control col-12">
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
				
				$.ajax({
					
					// request
					type:"POST"
					, url:"/lesson06/quiz01/add_bookmark"
					, data:{"name":name, "url":url}
					
					// response
					, success:function(data) {
						alert(data);
						location.href = "/lesson06/quiz01/after_add_bookmark"
					}
					, error:function(e) {
						alert("에러");
					}
					
					
				});
				
			});
			
		});
	</script>
</body>
</html>