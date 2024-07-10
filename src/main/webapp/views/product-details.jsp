<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Chi tiết sản phẩm</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="icon" type="image/x-icon" href="/images/brand.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        .product-detail-section {
            margin-top: 50px;
            margin-bottom: 50px;
        }

        .product__details {
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .product__details img {
            max-width: 100%;
            height: auto;
            margin-bottom: 15px;
            border-radius: 10px;
        }

        .product__details h2 {
            font-size: 28px;
            margin-bottom: 15px;
            color: #333;
        }

        .product__details p {
            font-size: 18px;
            margin-bottom: 15px;
            color: #555;
        }

        .product__details .price {
            font-size: 24px;
            color: #e74c3c;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }

        .buttons {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>

<!-- Product Detail Section Begin -->
<section class="product-detail-section">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <img src="<c:url value='/images/${item.image}'/>" alt="${item.name}" class="img-fluid">
            </div>
            <div class="col-md-6">
                <div class="product__details">
                    <h2>${item.name}</h2>
                    <p class="price">Giá: <fmt:formatNumber value="${item.price}" pattern="###,### VND"/></p>
                   <Strong>Chất liệu:</Strong>  <p> ${item.material}</p>
                   <Strong>Mô tả sản phẩm: </Strong> <p>${item.description}</p>
                    <br><br> <br> <br> <br> <br>
                    <br>
                    <br>
                    
                    <div class="buttons">
                                <a href="<c:url value='/cart/addToCart'><c:param name='id' value='${item.id}'/></c:url>" class="btn btn-success cart-button btn-block">Thêm giỏ hàng</a>
                        <a href="/" class="btn btn-secondary btn-lg">Quay lại trang chủ</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Detail Section End -->

<%@ include file="footer.jsp" %>
</body>
</html>
