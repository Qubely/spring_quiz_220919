<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="col-10 m-4">
	<h2 class="font-weight-bold">과거 날씨</h2>
	<table class="table text-center">
		<thead>
			<tr>
				<th>날짜</th>
				<th>날씨</th>
				<th>기온</th>
				<th>강수량</th>
				<th>미세먼지</th>
				<th>풍속</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="weatherHistory" items="${weatherHistoryList}">
				<tr>
					<td><fmt:formatDate value="${weatherHistory.date}"
							pattern="yyyy년 MM월 dd일" /></td>
					<td><c:choose>
							<c:when test="${weatherHistory.weather eq '맑음'}">
												${fn:replace(weatherHistory.weather, '맑음', '<img src="/img/lesson05/sunny.jpg" alt="맑음">')}
											</c:when>
							<c:when test="${weatherHistory.weather eq '흐림'}">
												${fn:replace(weatherHistory.weather, '흐림', '<img src="/img/lesson05/cloudy.jpg" alt="흐림">')}
											</c:when>
							<c:when test="${weatherHistory.weather eq '구름조금'}">
												${fn:replace(weatherHistory.weather, '구름조금', '<img src="/img/lesson05/partlyCloudy.jpg" alt="구름조금">')}
											</c:when>
							<c:otherwise>
												${fn:replace(weatherHistory.weather, '비', '<img src="/img/lesson05/rainy.jpg" alt="비">')}
											</c:otherwise>
						</c:choose></td>
					<td>${weatherHistory.temperatures}&ordm;C</td>
					<td>${weatherHistory.precipitation}mm</td>
					<td>${weatherHistory.microDust}</td>
					<td>${weatherHistory.windSpeed}km/h</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>