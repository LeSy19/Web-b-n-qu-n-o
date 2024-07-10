<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
        .table-container {
            margin: 20px auto;
            max-width: 1000px;
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }

        .table th {
            background-color: #343a40;
            color: #ffffff;
            border: none;
        }

        .table td {
            border: none;
            padding: 15px;
            background-color: #f1f1f1;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #e9ecef;
        }

        .table-bordered td, .table-bordered th {
            border: 1px solid #dee2e6;
        }

        h2 {
            color: #343a40;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <!-- Phần Aside -->
    <aside class="border-end" style="width: 250px; height: 100vh;">
        <div class="p-3">
            <h5 class="mb-3">Menu</h5>
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
            <h2 class="text-center my-4">THỐNG KÊ CÁC SẢN PHẨM BÁN CHẠY</h2>
            <form action="/report" method="get" class="mb-4">
                <div class="row align-items-end justify-content-center">
                    <div class="col-md-2">
                        <select class="form-select" name="month" required>
                            <option value="" disabled selected>Chọn tháng</option>
                            <c:forEach begin="1" end="12" var="m">
                                <option value="${m}" ${m == selectedMonth ? 'selected' : ''}>Tháng ${m}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <select class="form-select" name="year" required>
                            <option value="" disabled selected>Chọn năm</option>
                            <c:forEach begin="2020" end="2030" var="y">
                                <option value="${y}" ${y == selectedYear ? 'selected' : ''}>${y}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <button class="btn btn-primary" type="submit">Xem báo cáo</button>
                    </div>
                </div>
            </form>
            <div class="table-container">
            <table class="table table-striped table-bordered">
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th>Tên sản phẩm</th>
                        <th>Tổng doanh thu</th>
                        <th>Số lượng bán</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${items}" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td>${item.groupName}</td>
                            <td><fmt:formatNumber value="${item.sum}" pattern="###,### VND"/></td>
                            <td>${item.count}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
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
