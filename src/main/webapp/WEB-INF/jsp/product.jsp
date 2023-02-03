<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>

<head>
    <meta charset="UTF-8">
       <meta http-equiv="X-UA-Compatible" content="IE=edge">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <title>Document</title>
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
           integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<jsp:include page="header.jsp" />

<body>
    <div class="container" style="margin-top: 20px;">
        <div class="row">
            <div class="col-xs-12 col-sm-8 col-md-6">
            </div>
        </div>
        <div class="footter" style="width: 100%;display: flex; justify-content: left;">
            <a class="btn btn-primary" href="#myModalAddProduct" class="trigger-btn" data-toggle="modal">Add Product</a>
        </div>
        <div class="modal fade" id="myModalAddProduct">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Add New Product</h4>
                        <button type="button" class="btn-close" aria-label="Close" data-dismiss="modal"></button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <form:form action="newProducts" method="POST" modelAttribute="product">
                            <div class="form-group">
                                <label class="control-label">Name (*)</label>
                                <input name="name" type="text" class="form-control" placeholder="Name"
                                    required="true" />
                            </div>
                            <div class="form-group">
                                <label class="control-label">Price (*)</label>
                                <input name="price" type="number" class="form-control" placeholder="Price"
                                    required="true" />
                            </div>
                            <br>
                            <div class="footer" style="display:flex; justify-content: center;">
                                <button class="btn btn-primary" type="submit" style="width: 100%">Add</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-10">
            <c:if test="${not empty productList}">
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${productList}" varStatus="index">
                            <tr>
                                <th scope="row" style="padding-top:20px;">${product.id}</th>
                                <td style="padding-top:20px;">${product.name}</td>
                                <td style="padding-top:20px;">${product.price}</td>
                                <td>

                                         <button type="button" onclick="location.href='cart/add/${product.id}'"
                                         class="btn btn-outline-primary">Add To Cart</button>

                                    </div>
        </div>

        <button type="button" href="#edit${product.id}" class="btn btn-outline-warning" data-toggle="modal">Edit</button>
        <div class="modal fade" id="edit${product.id}">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Edit Product</h4>
                        <button type="button" class="btn-close" aria-label="Close" data-dismiss="modal"></button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <form:form action="edit/updateProduct/${product.id}" method="POST" modelAttribute="product">
                            <div class="form-group">
                                <label class="control-label">ID</label>
                                <input value="${product.id}" path="id" type="text" class="form-control" id="id"
                                    placeholder="ID" disabled="true" />
                                <hidden path="id" />
                            </div>
                            <div class="form-group">
                                <label class="control-label">Name (*)</label>
                                <input value="${product.name}" path="newName" name="newName" type="text"
                                    class="form-control" placeholder="Name" required="true" />
                            </div>
                            <div class="form-group">
                                <label class="control-label">Price (*)</label>
                                <input value="${product.price}" path="newPrice" name="newPrice" type="number"
                                    class="form-control" placeholder="Price" required="true" />
                            </div>
                            <br>
                            <div class="footer" style="display:flex; justify-content: center;">
                                <button class="btn btn-primary" type="submit" style="width: 100%">Save</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>

            <button type="button"  onclick="location.href='delete/${product.id}'" data-toggle="modal" class="btn btn-outline-danger"  data-name="${product.id}?">Delete</button>
        </td>

        </tr>
        </c:forEach>
        </tbody>
        </table>
        </c:if>
        <c:if test="${productList.size() == 0}">
            <br>
            <div class="alert alert-warning">
                There is no data </div>
        </c:if>
    </div>
</body>
</html>