<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>JSP Page</title>
</head>
<body>
	<div class="container" style="margin-top: 10px;">
		<div class="row"
			style="border: 1px darkgrey solid; border-radius: 10px; width: 50%; margin: 0 auto; padding: 20px;">
			<div class="col-sm-12">
				<h2>Register</h2>
				<form action="./UserServlet" method="post">
					<input type="hidden" class="form-control" name="action"
						value="SaveOrUpdate">
					<div class="form-group">
						<label>UserName</label> <input type="text" class="form-control"
							name="username" value="${ USER.username }" placeholder="Enter UserName">
					</div>

					<div class="form-group">
						<label>Password</label> <input type="password"
							class="form-control" name="password" value="${ USER.password }"
							placeholder="Enter UserName">
					</div>

					<div class="form-group">
						<label>FullName</label> <input type="text" class="form-control"
							name="fullname" value="${ USER.fullname }" placeholder="Enter UserName">
					</div>

					<div class="form-group">
						<label>Age</label> <input type="number" class="form-control"
							name="age" value="${ USER.age }" placeholder="Enter age">
					</div>

					<div class="form-group">
						<label>Birthday</label> <input type="date" class="form-control"
							name="birthday" value="${ USER.birthday }" placeholder="Enter age">
					</div>

					<div class="form-group">
						<label>Gender</label>
						<div class="radio">
							<!--value = 1 => Nam| 0 =>Nu -->
							<label class="checkbox-inline"><input type="radio"
								name="gender" value="1" <c:if test="${ USER.gender }">checked</c:if> >Male</label> <label
								class="checkbox-inline"><input type="radio"
								name="gender" value="0" <c:if test="${ not USER.gender }">checked</c:if>> Female</label>

						</div>
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
					<button type="reset" class="btn btn-primary">Cancel</button>
					<a href="./UserServlet?action=list" class="btn btn-primary">Display Users</a>
				</form>
			</div>
		</div>
	</div>
</body>
</html>