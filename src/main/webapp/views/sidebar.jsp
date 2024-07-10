<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>header</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../views/css/footer.css">

    <style>
        h3 {font-family: cursive; font-size: 24px; font-weight: normal; color: #333; text-align: center;margin-top: 50px;margin-bottom: 50px;}

        .product__item { margin-bottom: 20px;}

        .product__details {padding: 20px; background-color: #f9f9f9;border-radius: 10px;}

        .product__details img {max-width: 100%;height: auto;margin-bottom: 15px; }

        .product__details span {display: block; margin-bottom: 10px; }

        .product__details .btn {width: 100%;}

        .categories__text { position: absolute; top: 50%; left: 20px; transform: translateY(-50%); padding: 10px; color: #fff;
                            font-family: cursive; text-align: left;  max-width: calc(100% - 40px);}

        .categories__text h1  font-size: 24px;margin-bottom: 5px; }

        .categories__text h4, .categories__text a {color: #000; }

        .categories__text p { font-size: 14px; margin-bottom: 10px; color: #666;}
    </style>
</head>
<body>
<section class="categories">
    <div class="row">
        <h3>Thời Trang - Thời thượng</h3>
    </div>
    <br>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6 p-0">
                <div class="categories__item categories__large__item set-bg">
                    <img alt="" src="../images/categories/banner1.jpg">
                    <div class="categories__text categories__text-overlay">
                        <h1>Women’s fashion</h1>
                        <p>Thời trang cho phụ nữ: Nét đẹp tinh tế và phong cách thời thượng.</p>
                        <a href="#">Shop now</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                        <div class="categories__item set-bg">
                            <img alt="" src="../images/categories/banner2.jpg">
                            <div class="categories__text categories__text-overlay">
                                <h4>Men’s fashion</h4>
                                <p>358 items</p>
                                <a href="#">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                        <div class="categories__item set-bg">
                            <img alt="" src="../images/categories/banner3.jpg">
                            <div class="categories__text categories__text-overlay">
                                <h4>Kid’s fashion</h4>
                                <p>273 items</p>
                                <a href="#">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                        <div class="categories__item set-bg">
                            <img alt="" src="../images/categories/banner4.jpg">
                            <div class="categories__text categories__text-overlay">
                                <h4>Cosmetics</h4>
                                <p>159 items</p>
                                <a href="#">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                        <div class="categories__item set-bg">
                            <img alt="" src="../images/categories/banner5.jpg">
                            <div class="categories__text categories__text-overlay">
                                <h4>Accessories</h4>
                                <p>792 items</p>
                                <a href="#">Shop now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Categories Section End -->

	<br>
	<br>

	<!-- Trend Section Begin -->
	<section class="trend spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="trend__content">
						<div class="section-title">
							<h3>Hot Trend</h3>
						</div>
						<div class="trend_item">
							<div class="card mb-3" style="max-width: 540px; border: none;">
								<div class="row g-0">
									<div class="col-md-3">
										<img src="../images/trend/ht-1.jpg"
											class="img-fluid rounded-start" alt="...">
									</div>
									<div class="col-md-9">
										<div class="card-body">
											<h6 class="card-title">Chain bucket bag</h6>
											<div class="rating">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
											<div class="product__price">$ 59.0</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="trend__item">
							<div class="card mb-3" style="max-width: 540px; border: none;">
								<div class="row g-0">
									<div class="col-md-3">
										<img src="../images/trend/ht-2.jpg"
											class="img-fluid rounded-start" alt="...">
									</div>
									<div class="col-md-9">
										<div class="card-body">
											<h6 class="card-title">Chain bucket bag</h6>
											<div class="rating">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
											<div class="product__price">$ 59.0</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="trend__item">
							<div class="card mb-3" style="max-width: 540px; border: none;">
								<div class="row g-0">
									<div class="col-md-3">
										<img src="../images/trend/ht-3.jpg"
											class="img-fluid rounded-start" alt="...">
									</div>
									<div class="col-md-9">
										<div class="card-body">
											<h6 class="card-title">Chain bucket bag</h6>
											<div class="rating">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
											<div class="product__price">$ 59.0</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="trend__content">
						<div class="section-title">
							<h3>Best seller</h3>
						</div>
						<div class="trend__item">
							<div class="card mb-3" style="max-width: 540px; border: none;">
								<div class="row g-0">
									<div class="col-md-3">
										<img src="../images/trend/ht-4.jpg"
											class="img-fluid rounded-start" alt="...">
									</div>
									<div class="col-md-9">
										<div class="card-body">
											<h6 class="card-title">Chain bucket bag</h6>
											<div class="rating">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
											<div class="product__price">$ 59.0</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="trend__item">
							<div class="card mb-3" style="max-width: 540px; border: none;">
								<div class="row g-0">
									<div class="col-md-3">
										<img src="../images/trend/ht-5.jpg"
											class="img-fluid rounded-start" alt="...">
									</div>
									<div class="col-md-9">
										<div class="card-body">
											<h6 class="card-title">Chain bucket bag</h6>
											<div class="rating">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
											<div class="product__price">$ 59.0</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="trend__item">
							<div class="card mb-3" style="max-width: 540px; border: none;">
								<div class="row g-0">
									<div class="col-md-3">
										<img src="../images/trend/ht-6.jpg"
											class="img-fluid rounded-start" alt="...">
									</div>
									<div class="col-md-9">
										<div class="card-body">
											<h6 class="card-title">Chain bucket bag</h6>
											<div class="rating">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
											<div class="product__price">$ 59.0</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="trend__content">
						<div class="section-title">
							<h3>Feature</h3>
						</div>
						<div class="trend__item">
							<div class="card mb-3" style="max-width: 540px; border: none;">
								<div class="row g-0">
									<div class="col-md-3">
										<img src="../images/trend/ht-7.jpg"
											class="img-fluid rounded-start" alt="...">
									</div>
									<div class="col-md-9">
										<div class="card-body">
											<h6 class="card-title">Chain bucket bag</h6>
											<div class="rating">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
											<div class="product__price">$ 59.0</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="trend__item">
							<div class="card mb-3" style="max-width: 540px; border: none;">
								<div class="row g-0">
									<div class="col-md-3">
										<img src="../images/trend/ht-8.jpg"
											class="img-fluid rounded-start" alt="...">
									</div>
									<div class="col-md-9">
										<div class="card-body">
											<h6 class="card-title">Chain bucket bag</h6>
											<div class="rating">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
											<div class="product__price">$ 59.0</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="trend__item">
							<div class="card mb-3" style="max-width: 540px; border: none;">
								<div class="row g-0">
									<div class="col-md-3">
										<img src="../images/trend/ht-9.jpg"
											class="img-fluid rounded-start" alt="...">
									</div>
									<div class="col-md-9">
										<div class="card-body">
											<h6 class="card-title">Chain bucket bag</h6>
											<div class="rating">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
											<div class="product__price">$ 59.0</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	</body>
	</html>