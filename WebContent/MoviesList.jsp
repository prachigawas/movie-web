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
<!-- 	<div class="header">
		<img src="resources/header.png" alt="headerImage" />
		<h1>Movie Web</h1>
	</div>
	<h2>FILTER BY</h2>

	<hr>


	<div>
			<label for="genre">Genre: </label> 
			<select id="genre" name="genre">
				<option value="">All</option>
				<option value="action">Action</option>
				<option value="comedy">Comedy</option>
			</select>
			<label for="sort">Sort by: </label> 
			<select id="sort" name="sort">
				<option value="">Select</option>
				<option value="length">Length</option>
				<option value="releaseDate">Release date</option>
			</select>
	</div>


	<div>
		<label for="language">Language: </label> 
		<select id="language" name="language">
			<option value="">All</option>
			<option value="english">English</option>
			<option value="hindi">Hindi</option>
		</select>
		
		<a href="mv" class="button">Search</a>
	</div>
	<hr>
	<br> -->

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

<div class="pagcenter">
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