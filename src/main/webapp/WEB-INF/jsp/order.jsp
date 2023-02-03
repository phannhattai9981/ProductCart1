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
    <div class="container" style="margin-top: 10px;">
        <h2 style="margin-top: 20px; margin-bottom: 20px;">Order Manager</h2>
        <c:if test="${type.equals('orders')}">
            <div class="col-xs-12 col-sm-12 col-md-10">
                <c:if test="${not empty orderList}">
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Customer</th>
                                <th scope="col">Address</th>
                                <th scope="col">OrderDate</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${orderList}" varStatus="checkout">
                                <tr>
                                    <th scope="row" style="padding-top:15px;">${order.id}</th>
                                    <td style="padding-top:15px;">${order.customerName}</td>
                                    <td style="padding-top:15px;">${order.customerAddress}</td>
                                    <td style="padding-top:15px;">${order.orderDate}</td>
                                    <td>
                                        <button class="btn btn-sm btn-primary"
                                            onclick="location.href='cart/view_orderId=${order.id}'">View</button>
                                        <a class="btn btn-sm btn-danger"  onclick="location.href='orderlist/delete/${order.id}'"
                                            class="trigger-btn" data-toggle="modal" data-id="${order.id}?">Delete</a>
                                    </td>


                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${orderList.size() == 0}">
                    <br>
                    <div class="alert alert-warning">
                        There is no data </div>
                </c:if>
            </div>
        </c:if>
</body>

</html>