<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 8/25/2023
  Time: 7:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <title>quản lí người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
</head>
<body>
<a href="/" class="btn btn-primary">quay lại</a>
<table border="1px" class="table table-hover">
    <thead>
    <tr>
        <th>STT</th>
        <th>tên</th>
        <th>email</th>
        <th>quốc gia</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="users" varStatus="loop">
        <tr>
            <td><c:out value="${loop.count}"/> </td>
            <td><c:out value="${users.name}"/> </td>
            <td><c:out value="${users.email}"/></td>
            <td><c:out value="${users.country}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
