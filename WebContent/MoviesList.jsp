<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>MovieWeb</title>
<link href="<c:url value="styles.css" />" rel="stylesheet">
</head>

<body>
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
				<a href="mv?page=${1}">&laquo;</a>
			</c:if>
			<c:if test="${currentPage != 1}">
				<a href="mv?page=${currentPage - 1}">&lsaquo;</a>
			</c:if>
			<c:forEach begin="1" end="${displayNoOfPages}" var="i">
				<c:choose>
					<c:when test="${currentPage eq i}">
						<a class="active">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="mv?page=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${currentPage lt noOfPages}">
				<td class="pagination"><a href="mv?page=${currentPage + 1}">&rsaquo;</a></td>
			</c:if>
			<c:if test="${currentPage lt noOfPages}">
				<td class="pagination"><a href="mv?page=${noOfPages}">&raquo;</a></td>
			</c:if>
		</div>
		</div>
</body>
</html>