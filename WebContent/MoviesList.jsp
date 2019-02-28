<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>MovieWeb</title>
<link href="<c:url value="styles.css" />" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>

	<div class="apply">
		<table class="box">
			<tr>
				<th>Title</th>
				<th>Description</th>
				<th>Length</th>
				<th>Release Date</th>
			</tr>

			<c:forEach var="movie" items="${filteredMovies}">
				<tr>
					<td>${movie.title}</td>
					<td>${movie.description}</td>
					<td>${movie.movieLength}</td>
					<td>${movie.movieReleaseDate}</td>
				</tr>
			</c:forEach>
		</table>
		<br>

		<div class="pcenter">
			<div class="pagination">
				<c:if test="${currentPage != 1}">
					<button value="${1}" onclick="javascript:renderPage(this.value)">&laquo;</button>
				</c:if>
				<c:if test="${currentPage != 1}">
					<button value="${currentPage - 1}"
						onclick="javascript:renderPage(this.value)">&lsaquo;</button>
				</c:if>
				<c:forEach begin="1" end="${displayNoOfPages}" var="i">
					<c:choose>
						<c:when test="${currentPage eq i}">
							<button value="${i}" class="active"
								onclick="javascript:renderPage(this.value)">${i}</button>
						</c:when>
						<c:otherwise>
							<button value="${i}" onclick="javascript:renderPage(this.value)">${i}</button>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${currentPage lt noOfPages}">
					<td class="pagination"><button value="${currentPage + 1}"
							onclick="javascript:renderPage(this.value)">&rsaquo;</button></td>
				</c:if>
				<c:if test="${currentPage lt noOfPages}">
					<td class="pagination"><button value="${noOfPages}"
							onclick="javascript:renderPage(this.value)">&raquo;</button></td>
				</c:if>
				<br>
				<br>
				<h4>Page ${currentPage} of ${noOfPages}</h4>
			</div>

		</div>
	</div>

</body>
</html>