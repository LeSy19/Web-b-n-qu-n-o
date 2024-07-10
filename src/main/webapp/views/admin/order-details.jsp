<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Website</title>
    <!-- Thêm các thư viện cần thiết -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
    <style>
        .form-container {
	max-width: 600px;
	margin: 50px auto;
	padding: 20px;
	border: 1px solid #dee2e6;
	border-radius: 0.375rem;
	box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
}

.table-container {
	max-width: 900px;
	margin: 50px auto;
}

select {
	width: 100px;
}
        body {
            display: flex;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        aside {
            width: 200px;
            background-color: #343a40;
            color: white;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }
        aside a {
            color: white;
            text-decoration: none;
            display: block;
            margin-bottom: 10px;
        }
        aside a:hover {
            background-color: #495057;
            padding-left: 10px;
        }
        main {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: space-between;
        }

        .content {
            flex: 1;
            margin: 0 auto;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f4f4f4;
        }

        .text-center {
            text-align: center;
        }

        .text-bold {
            font-weight: bold;
        }

        .invoice-header {
            margin-bottom: 20px;
        }

        .invoice-header h2 {
            margin-bottom: 5px;
        }

        .invoice-details {
            margin-bottom: 20px;
        }

        .invoice-details th {
            width: 30%;
        }

        .invoice-details td {
            width: 70%;
        }

        .invoice-details th, .invoice-details td {
            border: none;
        }

        .invoice-table th {
            background-color: #f4f4f4;
            font-weight: bold;
            border-top: 2px solid #ddd;
            border-bottom: 2px solid #ddd;
        }

        .invoice-table td {
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
        }

        .invoice-total {
            font-weight: bold;
            text-align: right;
        }
    </style>
</head>
<body>
    <!-- Phần Aside -->
    <aside class="border-end" style="width: 250px; height: 100vh;">
        <div class="p-3">
            <h5 class="mb-3">QUẢN LÝ</h5>
            <ul class="list-unstyled">
                <li class="mb-3"><a href="/editproduct/index">Sản phẩm</a></li>
                <li class="mb-3"><a href="/account/index">Tài khoản</a></li>
                <li class="mb-3"><a href="/orders">Hóa đơn</a></li>
                <li class="mb-3"><a href="/report">Thống kê</a></li>
            </ul>
        </div>
    </aside>

    <!-- Phần Content -->
    <main>
        <!-- Nội dung bên phải -->
        <div>
            <div class="content">
                <div class="invoice-header text-center">
                    <h1>HÓA ĐƠN</h1>
                </div>
                <div class="invoice-details">
                    <table>
                        <tr>
                            <th class="text-center">Mã Đơn Hàng:</th>
                            <td class="text-bold">${order.id}</td>
                        </tr>
                        <tr>
                            <th class="text-center">Tên Khách Hàng:</th>
                            <td class="text-bold">${order.account.fullname}</td>
                        </tr>
                        <tr>
                            <th class="text-center">Email:</th>
                            <td class="text-bold">${order.account.email}</td>
                        </tr>
                        <tr>
                            <th class="text-center">Địa chỉ:</th>
                            <td class="text-bold">${order.account.adress}</td>
                        </tr>
                        <tr>
                            <th class="text-center">Ngày đặt hàng:</th>
                            <td class="text-bold"><fmt:formatDate value="${order.createDate}" pattern="dd/MM/yyyy" /></td>
                        </tr>
                        <tr>
                            <th class="text-center">Trạng Thái :</th>
                            <td class="text-bold">${order.status}</td>
                        </tr>
                        <tr>
                            <th class="text-center">Phương thức vận chuyển:</th>
                            <td class="text-bold">Đã bao gồm phí vận chuyển</td>
                        </tr>
                        <tr>
                            <th class="text-center">Phương thức thanh toán:</th>
                            <td class="text-bold">Thanh toán khi nhận hàng</td>
                        </tr>
                    </table>
                </div>
                <div class="invoice-table">
                    <h2>Chi Tiết Đơn Hàng</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Tên Sản Phẩm</th>
                                <th>Giá</th>
                                <th>Số Lượng</th>
                                <th>Thành Tiền</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="orderDetail" items="${order.orderDetails}">
                                <tr>
                                    <td>${orderDetail.product.name}</td>
                                    <td><fmt:formatNumber value="${orderDetail.price}" currencyCode="VND" /> VND</td>
                                    <td>${orderDetail.quantity}</td>
                                    <td><fmt:formatNumber value="${orderDetail.price * orderDetail.quantity}" currencyCode="VND" /> VND</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="invoice-total">
                    <p>
                        Tổng Tiền: <fmt:formatNumber value="${order.totalAmount}" currencyCode="VND" /> VND
                    </p>
                </div>
            </div>
        </div>
    </main>
    <script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9rTQeD"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-Xmx2Tgl62ZA2v+XRoKA74ZBLbLt0o4W4Hj5MDi91iCFs2bkl+S44vIKMcuCjOSzH"
		crossorigin="anonymous"></script>
</body>
</html>
