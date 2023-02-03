<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>

<head>
    <link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link href='<c:url value="/resources/css/main.css" />' rel='stylesheet'>
    <link href='<c:url value="/resources/css/delete.css" />' rel='stylesheet'>
    <script type="text/javascript" src="/resources/js/time.js"></script>
    <link href='<c:url value="/resources/images/logocat.png" />' rel='icon'>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="webjars/jquery/3.6.0/jquery.js" />
    </script>
    <script type="text/javascript" src="webjars/popper.js/2.9.3/umd/popper.min.js" />
    </script>
    <title>index</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<jsp:include page="header.jsp" />

<body>

    <div class="container">
        <h2 style="margin-top: 20px;">Your Cart Item</h2>

        <div class="col-xs-12 col-sm-12 col-md-10">
            <c:if test="${not empty cartItem}">
                <div class="rows">
                    <div class="col-sm-9">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Amount</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach var="item" items="${cartItem}">
                                    <form action="cart/update/${item.getProduct().getId()}" method="post">
                                        <input type="hidden" name="id" value="${item.product.id}" />
                                        <tr>
                                            <td>${item.product.id }</td>
                                            <td>${item.product.name }</td>
                                            <td>${item.product.price}</td>
                                            <td><input name="quantity" value="${item.quantity}"
                                                    onblur="this.form.submit()" style="width: 50px;"></td>
                                            <td>${item.product.price * item.quantity}</td>
                                            <td><a class="btn btn-primary btn-sm" onclick="location.href='cart/remove/${item.product.id}'"
                                                    class="trigger-btn" data-toggle="modal">Remove</a></td>


                                                    </div>
                                                </div>
                                            </div>

                                        </tr>
                                    </form>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="total" style="display: flex; flex-direction: row; padding-left: 56%;">
                            <div class="total_head" style="font-weight: bold;">Total:</div>
                            <div class="total_value" style="margin-left: 102px; font-weight: bold;">${total}</div>
                        </div>
                        <hr />
                        <a class="btn btn-primary" href="cart/clear">Clear All
                            Cart</a> <a class="btn btn-primary" href="/product/">Add
                            more</a>
                            <a class="btn btn-info" style="color: white;" href="cart/checkout" >Check Out</a>


                        <div class="modal fade" id="checkOut">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title">Customer Information | Check Out</h4>
                                        <button type="button" class="btn-close" aria-label="Close"
                                            data-dismiss="modal"></button>
                                    </div>
                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        <form:form action="cart/checkout" method="POST" modelAttribute="orders">
                                            <div class="form-group">
                                                <label class="control-label">Customer (*)</label>
                                                <input name="customerName" type="text" class="form-control"
                                                    placeholder="Customer" />
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label">Address (*)</label>
                                                <input name="customerAddress" type="text" class="form-control"
                                                    placeholder="Address" required="true" />

                                            </div>
                                            <div class="form-group">
                                                <label class="control-label">OrderDate (*)</label>
                                                <input path="orderDate" type="date" id="myDate" class="form-control"
                                                    value="2023-01-27" />
                                            </div>
                                            <br>
                                            <div class="footer" style="display:flex; justify-content: center;">
                                                <button class="btn btn-primary" type="submit" style="width: 100%">Check
                                                    Out</button>
                                            </div>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
            <c:if test="${cartItem.size() == 0}">
                <br>
                <div class="alert alert-warning">
                    There is no data </div>
            </c:if>
        </div>
</body>

</html>