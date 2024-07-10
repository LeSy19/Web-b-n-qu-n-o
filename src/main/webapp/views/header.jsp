<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>header</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link href="path_to_your_bootstrap_css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
<!-- CSS Bootstrap -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css"
	rel="stylesheet">

<!-- JavaScript Bootstrap (bao gồm Popper.js nếu cần) -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>


<link rel="stylesheet" href="../views/css/footer.css">

<style>
button.learn-more::before {
	position: absolute;
	content: "";
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: #f9c4d2;
	border-radius: inherit;
	box-shadow: 0 0 0 2px #727272, 0 0.625em 0 0 #ffe3e2;
	transform: translate3d(0, 0.75em, -1em);
	transition: transform 150ms cubic-bezier(0, 0, 0.58, 1), box-shadow
		150ms cubic-bezier(0, 0, 0.58, 1);
}

h3 {
	font-family: cursive; /* Sử dụng font cursive */
	font-size: 24px;
	font-weight: normal;
	color: #333;
	text-align: center;
	margin-top: 50px;
	margin-bottom: 50px;
}

.product__item {
	margin-bottom: 20px; /* Khoảng cách dưới giữa các card */
}

.categories__item {
	position: relative; /* Thiết lập vị trí tương đối */
	margin-bottom: 10px;
	margin-right: 10px;
}

.categories__text {
	position: absolute;
	top: 50%; /* Di chuyển văn bản xuống dưới 50% chiều cao của hình ảnh */
	left: 20px; /* Đặt văn bản ở mép trái của tấm hình */
	transform: translateY(-50%);
	/* Dịch chuyển văn bản lên trên để nằm chính giữa */
	padding: 10px;
	color: #fff;
	font-family: cursive;
	text-align: left;
	max-width: calc(100% - 40px);
}
li{
	list-style: none; 
}

.categories__text h1 {
	font-size: 24px; /* Cỡ chữ cho tiêu đề */
	margin-bottom: 5px; /* Khoảng cách dưới cho tiêu đề */
}

.categories__text h4, .categories__text a {
	color: #000; /* Chỉ định màu đen cho thẻ h4 và thẻ a */
}

.categories__text p {
	font-size: 14px; /* Cỡ chữ cho đoạn văn */
	margin-bottom: 10px; /* Khoảng cách dưới cho đoạn văn */
	color: #666; /* Chỉ định màu xám cho thẻ p */
}
</style>
</head>
<body>
	<header class="bg-light">
		<div class="container">
			<nav class="navbar navbar-expand-lg bg-body-tertiary">
				<div class="container-fluid">

					<a class="navbar-brand" href="#">CLOTHES SHOP</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"><s:message
										code="nav.list"></s:message></a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">Men</a></li>
									<li><a class="dropdown-item" href="#">Women</a></li>
									<li><a class="dropdown-item" href="#">baby</a></li>
									<li><a class="dropdown-item" href="#">kids</a></li>
								</ul></li>
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="/"><s:message code="nav.home"></s:message></a></li>
							<li class="nav-item"><a class="nav-link" href="/orders"><s:message
										code="nav.order"></s:message></a></li>
							<!-- Điều kiện để hiển thị menu quản lý -->
							<c:choose>
								<c:when test="${sessionScope.isLoggedIn}">
									<!-- Hiển thị menu quản lý khi người dùng đã đăng nhập -->
									<c:if test="${sessionScope.role eq 'ADMIN'}">
										<!-- Menu quản lý -->
										<li class="nav-item"><a class="nav-link"
											href="/editproduct/index"><s:message
										code="nav.manage"></s:message></a></li>
									</c:if>

								</c:when>

							</c:choose>

						</ul>
						<form action="/search" method="post">
							<input name="keywords" value="${keywords}">
							<button class="btn-primary">Search</button>
					</div>

					<!-- Right elements -->
					<div class="d-flex align-items-center">
						<!-- Icon -->
						<a class="nav-link me-3" href="/cart/view"> <i
							class="fas fa-shopping-cart"></i>
						</a> <a class="nav-link me-3" href="#"> <i class="fas fa-heart"></i>
						</a>
						<c:choose>
							<c:when test="${sessionScope.isLoggedIn}">
								<li class="nav-item"><a href="/account/logout"
									class="border rounded px-2 nav-link" target="_blank"> <i
										class="fas fa-sign-out-alt me-2"></i> Đăng xuất
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="nav-item"><a href="/login"
									class="border rounded px-2 nav-link" target="_blank"> <i
										class="fab fa-github me-2"></i> <s:message code="nav.login"></s:message>
								</a></li>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- Right elements -->
				</div>

			</nav>
		</div>
	</header>
	<div id="carouselExampleCaptions" class="carousel slide">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="../images/backgroud1.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>First slide label</h5>
					<p>Some representative placeholder content for the first slide.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="../images/backgroud2.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>Second slide label</h5>
					<p>Some representative placeholder content for the second
						slide.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="../images/backgroud3.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>Third slide label</h5>
					<p>Some representative placeholder content for the third slide.</p>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
</body>
</html>
