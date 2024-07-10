<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">

<head>
<title>Login</title>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<!-- Bootstrap CSS v5.2.1 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<style>
body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	background-color: #f8f9fa;
}

.card {
	border: none;
}

.card-img {
	border-top-left-radius: 0.5rem;
	border-bottom-left-radius: 0.5rem;
}

.form-container {
	padding: 30px;
}

.welcome-heading h5 {
	font-size: 28px;
	font-family: 'Roboto', sans-serif;
	color: #333;
	margin-bottom: 20px;
}

.welcome-heading p {
	font-size: 16px;
	font-family: 'Roboto', sans-serif;
	color: #555;
	margin-bottom: 20px;
	letter-spacing: 0.5px;
}

.btn-primary {
	width: 100%;
}

.form-group {
	text-align: left;
}

.alert {
	text-align: center;
}
</style>
</head>

<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="card">
					<div class="row g-0">
						<div class="col-md-6">
							<!-- Sử dụng contextPath để đảm bảo đường dẫn chính xác -->
							<img src="../images/Login.jpg" class="card-img h-100"
								alt="Login Image">
						</div>
						<div class="col-md-6 bg-light">
							<div class="form-container">
								<div class="welcome-heading text-center">
									<h5>LOGIN</h5>
									<p>
										Don't have an account yet? <a href="/register">Sign up</a>
									</p>
								</div>
								<form action="/account/login" method="post">
									<div class="form-group mb-3">
										<label for="username" class="form-label">Username:</label> <input
											type="text" class="form-control" id="username"
											name="username">
									</div>
									<div class="form-group mb-3">
										<label for="password" class="form-label">Password:</label> <input
											type="password" class="form-control" id="password"
											name="password">
									</div>
									<div class="form-group form-check mb-3">
										<input type="checkbox" class="form-check-input" id="remember"
											name="remember"> <label class="form-check-label"
											for="remember">Remember me</label>
										<!-- Thêm dòng "Forgot password" bên phải của checkbox -->
										<a href="/forgot-password" class="float-end">Forgot password</a>
									</div>
									<button type="submit" class="btn btn-primary">Login</button>
									<c:if test="${not empty error}">
										<div class="alert alert-danger mt-3">${message}</div>
									</c:if>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous">
		
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous">
		
	</script>
</body>

</html>
