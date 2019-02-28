<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>MovieWeb</title>
<link href="<c:url value="styles.css" />" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
			<option value="Action">Action</option>
			<option value="Comedy">Comedy</option>
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
		<a class="button" id="hide">Search</a>
	</div>
	<hr>
	<br>

		<p id="addTable"></p>
		
		<script type="text/javascript">
		  $(".button").click(function(){
			    $.get("mv?genre="+$("#genre").children("option:selected").val()+"&language="+$("#language").children("option:selected").val()+"&sort="+$("#sort").children("option:selected").val(), function(data, status){
			    		document.getElementById("addTable").innerHTML =data;
			    });
			  });
		  </script>
		  
		  <script>
		  function renderPage(pageNum){
			    $.get("mv?page="+pageNum+"&genre="+$("#genre").children("option:selected").val()+
			    		"&language="+$("#language").children("option:selected").val()+
			    		"&sort="+$("#sort").children("option:selected").val(), function(data, status){
			    		document.getElementById("addTable").innerHTML =data;
			    });
			  };
		  </script>
	
</body>
</html>