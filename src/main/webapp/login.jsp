<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login : MyCart</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container">

		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">
					<div class="card-header bg-custom text-white text-center">
						<h3>Login Here !!</h3>
					</div>
					<div class="card-body">
					<%@include file="components/message.jsp" %>
						<form action="LoginServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="email" type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="password" type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password">
							</div>
							<a href="register.jsp" class="text-center d-block">if not register then please register</a>
							<div class="container text-center mt-2">
								<button type="submit" class="btn btn-primary bg-custom border-0">Submit</button>
								<button type="reset" class="btn btn-primary bg-custom border-0">Reset</button>
							</div>

						</form>


					</div>
				</div>

			</div>
</body>
</html>