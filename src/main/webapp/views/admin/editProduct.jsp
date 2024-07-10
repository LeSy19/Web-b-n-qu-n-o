<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
                <!-- Thông báo lỗi -->
                <c:if test="${not empty message}">
                    <div class="alert alert-danger" role="alert">${message}</div>
                </c:if>
                <h2 class="form-title text-center">Product Form</h2>
                <form:form action="/editproduct/create" method="post"
                    modelAttribute="product" enctype="multipart/form-data">
                    <div class="mb-3">
                        <form:label path="id" class="form-label">ID:</form:label>
                        <form:input path="id" class="form-control" placeholder="Product ID"/>
                        
                    </div>
                    <div class="mb-3">
                        <form:label path="name" class="form-label">Name</form:label>
                        <form:input path="name" class="form-control"
                            placeholder="Product name" />
                        <form:errors path="name" class="badge text-bg-danger" />
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <form:label path="price" class="form-label">Price</form:label>
                            <form:input path="price" class="form-control"
                                placeholder="Product price" />
                            <form:errors path="price" class="badge text-bg-danger" />
                        </div>
                        <div class="col-md-6">
                            <form:label path="quantity" class="form-label">Quantity</form:label>
                            <form:input path="quantity" class="form-control"
                                placeholder="Product quantity" />
                            <form:errors path="quantity" class="badge text-bg-danger" />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <form:label path="material" class="form-label">Material</form:label>
                            <form:input path="material" class="form-control"
                                placeholder="Product material" />
                            <form:errors path="material" class="badge text-bg-danger" />
                        </div>
                        <div class="col-md-6">
                            <form:label path="size" class="form-label">Size</form:label>
                            <form:input path="size" class="form-control"
                                placeholder="Product size" />
                            <form:errors path="size" class="badge text-bg-danger" />
                        </div>
                    </div>
                    <div class="mb-3">
                        <form:label path="category.id" class="form-label">Category</form:label>
                        <form:select path="category.id" class="form-select">
                            <form:option value="" label="Choose category" />
                            <c:forEach items="${categories}" var="category">
                                <form:option value="${category.id}">${category.name}</form:option>
                            </c:forEach>
                        </form:select>
                    </div>
                    <div class="mb-3">
                        <form:label path="description" class="form-label">Description</form:label>
                        <form:textarea path="description" class="form-control" />
                        <form:errors path="description" class="badge text-bg-danger" />
                    </div>
                    <div class="mb-3">
                        <label for="imageFile">Ảnh:</label> <input type="file"
                            id="imageFile" name="imageFile" />
                        <c:if test="${not empty product.image}">
                            <img src="/images/${product.image}" width="100" />
                        </c:if>
                        
                    </div>
                    <div class="mb-2 mt-3">
                        <button type="submit" class="btn btn-primary"
                            formaction="/editproduct/create">Create</button>
                        <button type="submit" class="btn btn-success"
                            formaction="/editproduct/update">Update</button>
                        <button type="submit" class="btn btn-danger"
                            formaction="/editproduct/delete/${product.id}">Delete</button>
                        <a type="submit" class="btn btn-secondary"
                            href="/editproduct/index">Reset</a>
                    </div>
                </form:form>
            </div>
            <div class="table-container">
                <table class="table table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th class="material-column">Material</th>
                            <th>Size</th>
                            <th>Category</th>
                            <th class="description-column">Description</th>
                            <th>Image</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody class="table-group-divider">
                        <c:forEach items="${products}" var="p">
                            <tr>
                                <td>${p.id}</td>
                                <td>${p.name}</td>
                                <td>${p.price}</td>
                                <td>${p.quantity}</td>
                                <td class="material-column">
                                    <c:choose>
                                        <c:when test="${fn:length(p.material) > 20}">
                                            ${fn:substring(p.material, 0, 20)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${p.material}
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${p.size}</td>
                                <td>${p.category.name}</td>
                                <td class="description-column">
                                    <c:choose>
                                        <c:when test="${fn:length(p.description) > 50}">
                                            ${fn:substring(p.description, 0, 50)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${p.description}
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td><img src="/images/${p.image}" width="100" /></td>
                                <td><a href="/editproduct/edit/${p.id}">Edit</a></td>
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
