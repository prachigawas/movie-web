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
	<div class="header">
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
			<option value="English">English</option>
			<option value="Hindi">Hindi</option>
		</select> 
		<a href="javascript:loadDoc()" class="button" id="hide">Search</a>
	</div>
	<hr>
	<br>

	<p id="showTable"></p>

	<script>
		function loadDoc() {
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					document.getElementById("showTable").innerHTML = this.responseText;
				}
			};
			var num=1;
			var genre='Action';
			var language='';
			var sort='length';
			xhttp.open("GET", "mv?page="+num+"&genre="+genre+"&language="+language+"&sort="+sort, true);
			xhttp.send();
		}
	</script>
</body>
</html>