<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 8/24/2023
  Time: 4:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<button><a href="/">quay lại</a></button>
<form action="?action=update" method="post">
    <input type="hidden" name="id" value="${users.id}">
    tên : <input type="text" name="name" value="${users.name}"><br>
    email : <input type="text" name="email" value="${users.email}"><br>
    country : <input type="text" name="country" value="${users.country}">
    <input type="submit" value="sửa">
</form>
</body>
</html>
