<!-- src/main/resources/templates/HDChiTiet.html -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Hóa Đơn</title>
    <style>
        /* CSS styles */
        /* src/main/resources/static/css/style.css */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
        }

        .container {
            display: flex;
            flex-direction: column;
            width: 100%;
        }

        nav {
            background-color: orange;
            padding: 10px 0;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        nav ul {
            display: flex;
            list-style-type: none;
            justify-content: center;
            padding: 0;
            margin: 0;
        }

        nav ul li {
            margin: 0 15px;
        }

        nav ul li a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }

        aside {
            width: 200px;
            background-color: #f8f8f8;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            height: 100%;
            position: fixed;
        }

        aside ul {
            list-style-type: none;
            padding: 0;
        }

        aside ul li {
            margin-bottom: 10px;
        }

        aside ul li a {
            text-decoration: none;
            color: #333;
            display: block;
            padding: 10px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        aside ul li a:hover {
            background-color: #e2e2e2;
        }

        main {
            margin-left: 220px;
            padding: 20px;
            flex-grow: 1;
        }

        h1 {
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table thead {
            background-color: #f8f8f8;
        }

        table th,
        table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        table th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        .action-btn {
            background-color: #ffc107;
            border: none;
            padding: 5px 10px;
            margin-right: 5px;
            cursor: pointer;
            border-radius: 3px;
            transition: background-color 0.3s;
        }

        .action-btn:hover {
            background-color: #e0a800;
        }

        .action-btn:last-child {
            background-color: #dc3545;
            color: #fff;
        }

        .action-btn:last-child:hover {
            background-color: #c82333;
        }
    </style>
</head>

<body>
    <div class="container">
        <nav>
            <ul>
                <li><a href="#">Trang chủ</a></li>
                <li><a href="#">Blogs</a></li>
                <li><a href="#">Liên hệ</a></li>
                <li><a href="#">Tài khoản</a></li>
                <li><a href="#">Quản lý</a></li>
            </ul>
        </nav>
        <aside>
            <ul>
                <li><a href="#">Đơn Hàng</a></li>
                 <li><a href="giohang">Giỏ Hàng</a></li>
                <li><a href="#">Sản Phẩm Yêu Thích</a></li>
                <li><a href="#">Thông Tin Cá Nhân</a></li>
                <li><a href="#">Đăng Xuất</a></li>
            </ul>
        </aside>
        <main>
            <h1>Thông tin đơn hàng</h1>
            <table>
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Mã hàng</th>
                        <th>Ngày đặt</th>
                        <th>Giá</th>
                        <th>Trạng thái</th>
                        <th>Hoạt động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td>${order.stt}</td>
                            <td>${order.maHang}</td>
                            <td>${order.ngayDatHang}</td>
                            <td>${order.gia}</td>
                            <td>${order.trangThai}</td>
                            <td>
                                <button class="action-btn">Hóa đơn</button>
                                <button class="action-btn">Hủy</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>
    </div>
</body>

</html>
