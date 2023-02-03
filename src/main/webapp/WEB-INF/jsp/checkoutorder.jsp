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
        <form:form action="checkout" method="POST" modelAttribute="order">
            <div class="form-group">
                <label class="control-label">Customer (*)</label>
                <form:input path="customerName" type="text" class="form-control"
                    placeholder="Customer" />
            <small style="color: red;">
                <form:errors path="customerName" class="text-error" />
            </small>
            </div>
            <div class="form-group">
                <label class="control-label">Address (*)</label>
                <form:input path="customerAddress" type="text" class="form-control"
                    placeholder="Address"/>
                <small style="color: red;">
                    <form:errors path="customerAddress" class="text-error" />
                </small>
            </div>
            <div class="form-group">
                <label class="control-label">OrderDate (*)</label>
                <input name="orderDate" type="date" id="myDate" class="form-control"
                    value="2023-01-27" />
            </div>
            <br>
            <div class="footer" style="display:flex; justify-content: center;">
                <button class="btn btn-primary" type="submit" style="width: 100%">Check
                    Out</button>
            </div>
        </form:form>
    </div>
</body>

</html>