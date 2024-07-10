<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: black;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: black;
            font-weight: bold;
            color: white;
        }
        td {
            background-color: #fcfcfc;
        }
        tr:hover td {
            background-color: #f1f1f1;
        }
        .actions a {
            text-decoration: none;
            color: #007bff;
            padding: 5px 10px;
            border: 1px solid orange;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }
        .actions a:hover {
            background-color: orange;
            color: #fff;
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
            <h1>QUẢN LÝ ĐƠN HÀNG</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Tên khách hàng</th>
                <th>Ngày tạo</th>
                <th>Tổng tiền</th>
                <th>Trạng thái</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="order" items="${orders}">
                <tr>
                    <td>${order.id}</td>
                    <td>${order.account.fullname}</td>
                    <td><fmt:formatDate value="${order.createDate}" pattern="dd/MM/yyyy"/></td>
                    <td><fmt:formatNumber value="${order.totalAmount}" currencyCode="VND"/> VND</td>
                    <td>${order.status}</td>
                    <td class="actions"><a href="/orders/${order.id}">Chi tiết đơn hàng</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
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
