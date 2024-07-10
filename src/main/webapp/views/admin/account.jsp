<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
            <div class="form-container">
                <c:if test="${not empty errorMessage}">
                    <div style="color: red;">
                        <p>${errorMessage}</p>
                    </div>
                </c:if>
                <form:form action="/account/index" method="post"
                    modelAttribute="item">
                    <div class="mb-3">
                        <form:label path="username" class="form-label">Username:</form:label>
                        <form:input path="username" class="form-control"
                            placeholder="Username" />
                        <form:errors path="username" class="badge text-bg-danger" />
                    </div>
                    <div class="mb-3">
                        <form:label path="password" class="form-label">Password:</form:label>
                        <form:input path="password" class="form-control"
                            placeholder="Password" />
                        <form:errors path="password" class="badge text-bg-danger" />
                    </div>
                    <div class="mb-3">
                        <form:label path="fullname" class="form-label">Fullname:</form:label>
                        <form:input path="fullname" class="form-control"
                            placeholder="Fullname" />
                        <form:errors path="fullname" class="badge text-bg-danger" />
                    </div>
                    <div class="mb-3">
                        <form:label path="email" class="form-label">Email:</form:label>
                        <form:input path="email" class="form-control" placeholder="Email" />
                        <form:errors path="email" class="badge text-bg-danger" />
                    </div>
                    <div class="mb-3">
                        <form:label path="phone" class="form-label">Phone:</form:label>
                        <form:input path="phone" class="form-control" placeholder="Email" />
                        <form:errors path="phone" class="badge text-bg-danger" />
                    </div>
                    <div class="mb-3">
                        <form:label path="adress" class="form-label">Adress:</form:label>
                        <form:input path="adress" class="form-control" placeholder="Email" />
                        <form:errors path="adress" class="badge text-bg-danger" />
                    </div>
                    <div class="form-group">
                        <form:label path="role">Role:</form:label>
                        <div class="form-check form-check-inline">
                            <form:radiobutton path="role" value="true"
                                class="form-check-input" />
                            <label class="form-check-label">Admin</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <form:radiobutton path="role" value="false"
                                class="form-check-input" />
                            <label class="form-check-label">Customer</label>
                        </div>
    
                    </div>
                    <div class="mb-2 mt-3">
                        <button type="submit" formaction="/account/create"
                            class="btn btn-primary">Create</button>
                        <button type="submit" formaction="/account/update"
                            class="btn btn-success">Update</button>
                        <button type="submit" formaction="/account/delete/${item.username}"
                            class="btn btn-danger">Delete</button>
                        <a type="submit" class="btn btn-secondary" href="/account/index">Reset</a>
                        
                    </div>
                </form:form>
            </div>
            <div class="table-container">
                <table class="table table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Fullname</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Adress</th>
                            <th>Date</th>
                            <th>Role</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody class="table-group-divider">
                        <c:forEach items="${items}" var="acc">
                            <tr>
                                <td>${acc.username}</td>
                                <td>${acc.password}</td>
                                <td>${acc.fullname}</td>
                                <td>${acc.email}</td>
                                <td>${acc.phone}</td>
                                <td>${acc.adress}</td>
                                <td>${acc.createDate}</td>
                                <td>${acc.role ? 'Admin' : 'Customer'}</td>
                                <td><a href="/account/edit/${acc.username}">Edit</a></td>
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

