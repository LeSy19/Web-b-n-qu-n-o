<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Trang chủ</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../views/css/footer.css">
    <link rel="icon" type="image/x-icon" href="/images/brand.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        h3 {font-family: cursive; font-size: 24px; font-weight: normal; color: #333; text-align: center;margin-top: 50px;margin-bottom: 50px;}
        .product__item { margin-bottom: 20px;}
        .product__details {padding: 20px; background-color: #f9f9f9;border-radius: 10px;}
        .product__details img {max-width: 100%;height: auto;margin-bottom: 15px; }
        .product__details span {display: block; margin-bottom: 10px; }
        .buttons .btn {width: 100%;}
        .categories__text { position: absolute; top: 50%; left: 20px; transform: translateY(-50%); padding: 10px; color: #fff;
                            font-family: cursive; text-align: left;  max-width: calc(100% - 40px);}
        .categories__text h1  font-size: 24px;margin-bottom: 5px; }
        .categories__text h4, .categories__text a {color: #000; }
        .categories__text p { font-size: 14px; margin-bottom: 10px; color: #666;}
    </style>
</head>
<body>
<%@ include file="header.jsp" %>

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <br>
        <br>
        <div class="row">
            <h3>SẢN PHẨM HOT <i class="bi bi-fire"></i></h3>
        </div>
        <br>
        <!-- Product -->
        <div class="container mt-4">
            <hr>
            <div class="row">
                <c:forEach var="product" items="${search}">
                    <div class="col-md-3">
                        <!-- Hiển thị thông tin của sản phẩm -->
                        <div class="card">
                            <a href="/detail/${product.id}">
                                <img src="<c:url value='/images/${product.image}'/>" class="card-img-top" alt="${product.name}">
                            </a>
                            <div class="card-body">
                                <a href="/detail/${product.id}" class="text-decoration-none">
                                    <p class="card-title">${product.name}</p>
                                </a>
                                <p class="card-text">Giá: <fmt:formatNumber value="${product.price}" pattern="###,### VND"/></p>
                                <!-- Thêm các nút hoặc liên kết khác nếu cần -->
                                <div class="buttons d-flex flex-row">
                                    <a href="/cart/add/${product.id}" class="btn btn-success cart-button btn-block">Thêm giỏ hàng</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->

<br>

<!-- Categories Section Begin -->
<%@ include file="sidebar.jsp" %>
<!-- Trend Section End -->
<br>
<br>

<!-- Footer Section Begin -->
<%@ include file="footer.jsp" %>
<!-- Footer Section End -->

</body>
</html>
