<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
}body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.cart-container {
    width: 60%;
    margin: auto;
    background: #fff;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
    margin-top: 50px;
}

h1 {
    text-align: center;
}

.cart-item {
    display: flex;
    align-items: center;
    border-bottom: 1px solid #ddd;
    padding: 10px 0;
}

.cart-item img {
    width: 100px;
    height: 100px;
    object-fit: cover;
    margin-right: 20px;
}

.item-details {
    flex: 1;
}

.item-details h2 {
    margin: 0 0 10px 0;
}

.item-details p {
    margin: 5px 0;
}

input[type="number"] {
    width: 50px;
    padding: 5px;
    margin-top: 10px;
}

.total {
    text-align: right;
    padding: 10px 0;
}

.checkout-btn {
    display: block;
    width: 100%;
    padding: 10px;
    background: #5cb85c;
    color: #fff;
    border: none;
    cursor: pointer;
    font-size: 16px;
}

.checkout-btn:hover {
    background: #4cae4c;
}

</style>
<body>
	<%@ include file="header.jsp" %>

    <div class="cart-container">
        <h1>Giỏ hàng của bạn</h1>
        <div class="cart-item">
            <img src="/images/sweater.jpg" alt="Sản phẩm 1">
            <div class="item-details">
                <h2>Áo sweater in hoa nổi</h2>
                <p>Size: M</p>
                <p>Giá: 100.000 VND</p>
               Số lượng: <input type="number" value="1" min="1">
            </div>
        </div>
        <div class="cart-item">
            <img src="/images/aolen.jpg" alt="Sản phẩm 2">
            <div class="item-details">
                <h2>Áo len sọc thu đông</h2>
                <p>Size: L</p>
                <p>Giá: 200.000 VND</p>
               Số lượng: <input type="number" value="1" min="1">
            </div>
        </div>
         <div class="cart-item">
            <img src="/images/tuihop.jpg" alt="Sản phẩm 3">
            <div class="item-details">
                <h2>Quần túi hộp from rộng</h2>
                <p>Size: L</p>
                <p>Giá: 250.000 VND</p>
               Số lượng: <input type="number" value="1" min="1">
            </div>
        </div>
        <div class="total">
            <h2>Tổng cộng: 550.000 VND</h2>
        </div>
        <button class="checkout-btn">Thanh toán</button>
    </div>
    	<%@ include file="footer.jsp" %>
</body>
</html>