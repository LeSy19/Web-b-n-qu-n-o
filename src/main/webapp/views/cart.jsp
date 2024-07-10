<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../views/css/footer.css">
    <link rel="icon" type="image/x-icon" href="/images/brand.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        /* Custom styles */
        .product__item { margin-bottom: 20px; }
        .product__details { padding: 20px; background-color: #f9f9f9; border-radius: 10px; }
    </style>
</head>
<body>
<div id="successAlert" class="alert alert-success" style="display: none;">
    Đơn hàng của bạn đã được đặt thành công!
    <button type="button" class="close" onclick="closeSuccessAlert()">
        <span aria-hidden="true">&times;</span>
    </button>
</div>

<%@ include file="header.jsp" %>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Giỏ Hàng</h4>
                    <p class="text-muted">${Count} sản phẩm</p>
                    <hr>
                    <c:forEach var="items" items="${cart.items}">
                        <div class="row border-top border-bottom py-3">
                            <div class="col-md-2">
                                <img class="img-fluid" src="../images/${items.product.image}" alt="${items.product.name}">
                            </div>
                            <div class="col-md-4">
                                <p class="text-muted">ID: ${items.product.id}</p>
                                <p>${items.product.name}</p>
                                <p>Giá: ${items.product.price} VND</p>
                                <p>Kích thước: ${items.product.size}</p>
                            </div>
                            <div class="col-md-3">
                                <a href="/cart/update/${items.product.id}/minus" class="btn btn-sm btn-outline-primary">-</a>
                                <span class="border px-2">${items.soLuong}</span>
                                <a href="/cart/update/${items.product.id}/plus" class="btn btn-sm btn-outline-primary">+</a>
                            </div>
                            <div class="col-md-3">
                                ${items.product.price * items.soLuong} VND
                                <a href="/cart/remove/${items.product.id}" class="text-danger"><i class="bi bi-x"></i></a>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="text-end">
                        <a href="/" class="text-muted">&larr; Trở về trang chủ</a>
                        <a href="/cart/clear" class="text-muted ms-4">Xóa giỏ hàng</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <form id="checkoutForm" action="/checkout" method="post">
                    <div class="card-body">
                        <h5 class="card-title">Mua Hàng</h5>
                        <div class="row mb-3">
                            <div class="col">Tổng tiền:</div>
                            <div class="col text-end">${Amount}</div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">Phí vận chuyển:</div>
                            <div class="col text-end">
                                <select id="shippingFee" class="form-select" name="shippingFee" onchange="updateTotal()">
                                    <option value="20000">Giao hàng tiết kiệm - 20.000 VND</option>
                                    <option value="40000">Giao hàng hỏa tốc - 40.000 VND</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">Voucher:</div>
                            <div class="col">
                                <input type="text" id="code" class="form-control" placeholder="Nhập mã">
                            </div>
                        </div>
                        <div class="row border-top pt-3">
                            <div class="col">Tổng giá:</div>
                            <div class="col text-end"><span id="totalAmount">${Amount + 20000}</span> VND</div>
                        </div>
                        <button type="submit" formaction="/checkout" class="btn btn-primary mt-3">THANH TOÁN</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>
<script>
    function updateTotal() {
        var amount = ${Amount};
        var shippingFee = parseInt(document.getElementById("shippingFee").value);
        var totalAmount = amount + shippingFee;
        document.getElementById("totalAmount").innerText = totalAmount;
    }
    // Hiển thị form thông báo success
    function showSuccessAlert() {
        var successAlert = document.getElementById('successAlert');
        successAlert.style.display = 'block';
    }

    // Ẩn form thông báo success khi nhấn nút "OK"
    function closeSuccessAlert() {
        var successAlert = document.getElementById('successAlert');
        successAlert.style.display = 'none';
    }
</script>
</body>
</html>
