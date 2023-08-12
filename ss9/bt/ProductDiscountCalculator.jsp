<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 8/12/2023
  Time: 4:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<h1>Product Discount Calculator</h1>
    <form action="/Calculate" method="post">
        <label>Product Description: </label><br>
        <input type="text" name="PD" placeholder="Product Description"><br>
        <label>List Price: </label><br>
        <input type="text" name="LP" placeholder="List Price"><br>
        <label>Discount Percent:: </label><br>
        <input type="text" name="DP" placeholder="Discount Percent"><br>
        <input type="submit" value="Calculate Discount">
    </form>
</body>
</html>
