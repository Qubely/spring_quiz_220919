<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 추가</title>

<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<h1>판매자 추가</h1>
		<form method="post" action="/lesson04/quiz01/add_seller">
			<div class="form-group">
				<label for="nickname">닉네임</label>
				<input type="text" id="nickname" name="nickname" class="form-control col-3" placeholder="닉네임을 입력하세요">
			</div>
			<div class="form-group">
				<label for="profileImageUrl">프로필 사진 URL</label>
				<input type="text" id="profileImageUrl" name="profileImageUrl" class="form-control col-9" placeholder="프로필 사진 URL을 입력하세요">
			</div>
			<div class="form-group">
				<label for="temperature">온도</label>
				<input type="text" id="temperature" name="temperature" class="form-control col-3" placeholder="ex) 36.5">
			</div>
			<button type="submit" class="btn btn-primary">추가</button>
		</form>
	</div>
</body>
</html>