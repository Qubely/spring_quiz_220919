<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-10 m-4">
	<h2 class="font-weight-bold">날씨 입력</h2>
	<div>
		<form method="post" action="/lesson05/add_weatherHistory">
			<div class="d-flex m-3 mt-5">
				<div class="d-flex align-items-center form-group col-4">
					<label for="date" class="mb-0 p-0 col-3">날짜</label> <input
						type=text id="date" name="date" class="form-control"
						placeholder="예) 2023-01-03">
				</div>
				<div class="d-flex align-items-center form-group col-4">
					<label for="weather" class="mb-0 p-0 col-2">날씨</label> <select
						id="weather" name="weather" class="form-control">
						<option>맑음</option>
						<option>구름조금</option>
						<option>흐림</option>
						<option>비</option>
					</select>
				</div>
				<div class="d-flex align-items-center form-group col-4">
					<label for="microDust" class="mb-0 p-0 col-2">날씨</label> <select
						id="microDust" name="microDust" class="form-control">
						<option>좋음</option>
						<option>보통</option>
						<option>나쁨</option>
						<option>최악</option>
					</select>
				</div>
			</div>
			<div class="d-flex m-3 mt-5">
				<div class="d-flex align-items-center form-group col-4">
					<label for="temperatures" class="mb-0 p-0 col-2">기온</label>
					<div class="input-group">
						<input type="text" class="form-control" id="temperatures"
							name="temperatures">
						<div class="input-group-append">
							<span class="input-group-text">&ordm;C</span>
						</div>
					</div>
				</div>
				<div class="d-flex align-items-center form-group col-4">
					<label for="precipitation" class="mb-0 p-0 col-3">강수량</label>
					<div class="input-group">
						<input type="text" class="form-control" id="precipitation"
							name="precipitation">
						<div class="input-group-append">
							<span class="input-group-text">mm</span>
						</div>
					</div>
				</div>
				<div class="d-flex align-items-center form-group col-4">
					<label for="windSpeed" class="mb-0 p-0 col-2">풍속</label>
					<div class="input-group">
						<input type="text" class="form-control" id="windSpeed"
							name="windSpeed">
						<div class="input-group-append">
							<span class="input-group-text">km/h</span>
						</div>
					</div>
				</div>
			</div>
			<div class="d-flex justify-content-end m-3">
				<button type="submit" class="btn btn-success">저장</button>
			</div>
		</form>
	</div>
</div>