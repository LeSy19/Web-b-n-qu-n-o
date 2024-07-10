<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Navbar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .navbar {
            margin-top: 0;
            padding-top: 0;
        }
       
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg bg-dark">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="#">
                            <i class="bi bi-house-door-fill"></i> SĐT: 0905008230
                        </a>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a href="?lang=en" class="nav-link"><s:message code="nav.tienganh"></s:message></a>
                    </li>
                    <li class="nav-item">
                        <a href="?lang=vi" class="nav-link"><s:message code="nav.tiengviet"></s:message></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $("a[href*=lang]").on("click", function() {
                var param = $(this).attr("href");
                $.ajax({
                    url: "/" + param,
                    success: function() {
                        location.reload();
                    }
                });
                return false;
            });
        });
    </script>
</body>
</html>
