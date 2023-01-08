<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>

<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
	
	<div class="container">
		<h1>즐겨찾기 목록</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bookmark" items="${bookmarkList}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${bookmark.name}</td>
						<td>${bookmark.url}</td>
						<td>
							<%-- 1. name속성, value속성 삭제 --%>
							<%-- <button type="button" class="deleteBtn btn btn-danger" value="${bookmark.id}">삭제</button> --%>
							
							<%-- 2. data를 이용해서 태그에 임시 저장하기 --%>
							<button type="button" class="deleteBtn btn btn-danger" data-bookmark-id="${bookmark.id}">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<script>
		
		$(document).ready(function() {
			
			// 1. name속성, value속성 삭제
			/* $('.deleteBtn').on("click", function() {
				// let id = $(this).val();
				// let id = $(this).attr("value");
				// let id = e.target.value;
			}); */
			
			// 2. data를 이용해서 태그에 임시 저장하기
			// 태그 : data-bookmark-id	data- 뒤에 우리가 이름을 정한다.(대문자 절대 안됨)
			// 스크립트 : $(this).data('bookmark-id')
			$(".deleteBtn").on("click", function() {
				let id = $(this).data('bookmark-id');
				
				$.ajax({
					type:"delete"
					, url:"/lesson06/quiz02/is_deleted"
					, data:{"id":id}
				
					, success:function(data) {
						if (data.code == 1) {
							document.location.reload(true);
						} else if (data.code == 500) {
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