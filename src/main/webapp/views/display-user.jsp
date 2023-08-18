<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<h1>List User</h1>
		<a href="./UserServlet?action=AddOrEdit" class="btn btn-primary">Add
			Users</a>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>UserName</th>
					<th>Password</th>
					<th>FullName</th>
					<th>Age</th>
					<th>Birthday</th>
					<th>Gender</th>
				</tr>
			</thead>

			<tbody>
				
				<c:forEach var="user" items="${ LIST_USER }">
				
					<tr>
					<td>${ user.username }</td>
					<td>${ user.password }</td>
					<td>${ user.fullname }</td>
					<td>${ user.age }</td>
					<td><fmt:formatDate value="${ user.birthday }" pattern="dd/MM/yyyy"/></td>
					<td>${ user.gender? "Nam":"Nữ" }</td>
					<td><a class="btn btn-primary btn-sm"
						href="./UserServlet?action=AddOrEdit&username=${ user.username }">Edit</a> | <a
						class="btn btn-danger btn-sm"
						href="./UserServlet?action=Delete&username=${ user.username }">Delete</a></td>
				</tr>
					
				</c:forEach>
			
			</tbody>
		</table>
	</div>

</body>
</html>