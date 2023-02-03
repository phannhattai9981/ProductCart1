<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <div class="container">
        <h2 style="margin-top: 20px;">${customer.getCustomerName()} Cart</h2>
        <div class="customer" style="display: flex; flex-direction: row; margin-bottom: 20px">
            <lable style="margin-right: 10px;">Name:</lable>
            <div class="name_text" style="color:blue; font-weight: bold;">${customer.getCustomerName()}</div>
            <lable style="margin-left: 160px; margin-right: 10px;">Address:</lable>
            <div class="address_text" style="color:blue; font-weight: bold;">${customer.customerAddress}</div>
            <lable style="margin-left: 160px; margin-right: 10px;">Order Date:</lable>
            <div class="orderDate_text" style="color:blue; font-weight: bold;">${customer.orderDate}</div>
        </div>
        <h6 style="opacity: 0.4; color: black; margin-bottom: 20px;">Please Check Carefully Before Complete Your Order!
        </h6>
        <div class="col-xs-12 col-sm-12 col-md-10">
            <c:if test="${not empty orderDetails}">
                <div class="rows">
                    <div class="col-sm-9">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Amount</>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach var="detail" items="${orderDetails}">
                                    <form action="cart/update/${item.productId}" method="post">
                                        <input type="hidden" name="id" value="${detail.id}" />
                                        <tr>
                                            <td>${detail.id }</td>
                                            <td>${detail.product.name }</td>
                                            <td><input name="quantity" value="${detail.quantity}"
                                                    onblur="this.form.submit()" style="width: 50px;"></td>
                                            <td>${detail.product.price }</td>
                                            <td>${detail.product.price*detail.quantity}</td>
                                            <td><a class="btn btn-primary btn-sm" href="#delCart${detail.id}"
                                                    class="trigger-btn" data-toggle="modal">Remove</a></td>

                                            <div id="delCart${detail.id}" class="modal fade">
                                                <div class="modal-dialog modal-confirm">
                                                    <div class="modal-content">
                                                        <div class="modal-header flex-column">
                                                            <div class="icon-box">
                                                                <i class="fal fa-times">&#129409;</i>
                                                            </div>
                                                            <h4 class="modal-title w-100">Delete Order?</h4>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                aria-hidden="true">&times;</button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>Do you want to delete item "${detail.product.name}"?</p>
                                                        </div>
                                                        <div class="modal-footer justify-content-center">
                                                            <button type="button" class="btn btn-secondary"
                                                                data-dismiss="modal">Cancel</button>
                                                            <button type="button" class="btn btn-danger"
                                                                onclick="location.href='removeOrderDetail${detail.id}'">Delete</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </tr>
                                    </form>
                                </c:forEach>
                            </tbody>
                        </table>
                        <hr />
                        <a class="btn btn-primary" href="/product/">Add
                            more</a>
                    </div>
                </div>
            </c:if>
            <c:if test="${orderDetails.size() == 0}">
                <br>
                <div class="alert alert-warning">
                    There is no data</div>
            </c:if>
        </div>
    </div>
</body>

</html>
