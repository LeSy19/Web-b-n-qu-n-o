<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home page Products</title>
    <link rel="stylesheet" href="/view/css/shopee.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style type="text/css">
        /* CSS cho menu */
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
    width: 210px;
    height:800px;
    padding: 20px 5px; /* Thêm padding cho phần nội dung bên trong aside */
    box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
    position: absolute;
    top: 135px;
    left: 0;
}

aside ul {
    list-style-type: none;
    padding: 0;
    margin: 0; /* Xóa margin mặc định của danh sách */
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


        /* CSS cho wrapper */
        .wrapper {
            margin-left: 200px; /* Để aside không che phủ nội dung */
            padding-top: 80px; /* Để nội dung không bị che phủ bởi navbar */
        }
    </style>
</head>
<body>

<nav>
    <ul>
        <li><a href="#">Trang chủ</a></li>
        <li><a href="/hdchitiet">Đơn hàng</a></li>
        <li><a href="#">Liên hệ</a></li>
        <li><a href="#">Tài khoản</a></li>
        <li><a href="#">Quản lý</a></li>
         <a href="/cart/view" style="text-decoration: none; margin-top: -5px;text-align: center; color: orangered;">
                <div class="gio">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30px" height="40" fill="currentColor" class="bi bi-cart3"
                         viewBox="0 0 16 16">
                        <path
                                d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                    </svg>
                    <span class="badge tn">${count}</span>
                   <!-- <div style="text-algin:right: 10px;">Giỏ Hàng</div> --> 
                </div>
            </a>
    </ul>
</nav>

<aside>
    <ul>
    <div style="font-weight:bold;">
        <li ><a href="#">DANH MỤC SẢN PHẨM</a></li>
        </div>
        <li><a href="#">Áo khoác</a></li>
        <li><a href="#">Áo len</a></li>
        <li><a href="#">Quần jean</a></li>
        <li><a href="#">Áo thun</a></li>
    </ul>
</aside>

<div class="wrapper">
    <div class="container">
        <div class="row g-1">
            <c:forEach var="item" items="${items}">
                <div class="col-md-3">
                    <div class="card p-3" style="height: 392px;">
                        <div class="text-center" style="height: 202px;">
                            <img src="/views/img/${item.img}" width="200">
                        </div>
                        <div class="product-details">
                            <span class="font-weight-bold d-block"> ${item.name}</span> <span>${item.price} VND</span> 
                            
                            <br><br>
                            <div class="buttons d-flex flex-row">
                                <a href="/cart/add/${item.id}"
                                   class="btn btn-success cart-button btn-block"> Thêm giỏ hàng
                                </a>
                            </div>
                          <!--<div class="weight">
                                <small>1 piece 2.5kg</small>
                            </div>  -->  
                        </div>
                    </div>
                </div>
            </c:forEach>
           
        </div>
    </div>
</div>

<script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function (event) {
        const cartButtons = document.querySelectorAll('.cart-button');
        cartButtons.forEach(button => {
            button.addEventListener('click', cartClick);
        });

        function cartClick() {
            let button = this;
            button.classList.add('clicked');
        }
    });
</script>
</body>
</html>
