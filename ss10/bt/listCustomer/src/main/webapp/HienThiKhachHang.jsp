<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 8/14/2023
  Time: 2:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

    <style>
        img{
            width: 100px;
            height: 100px;
        }
        td{
            width: 100px;
            height: 100px;
        }
    </style>
</head>
<body>
<h1>Danh sách khách hàng</h1>
    <table border="1px">
        <tr>
            <th>tên</th>
            <th>ngày sinh</th>
            <th>địa chỉ</th>
            <th>ảnh</th>
        </tr>
        <c:forEach items="${list}" var="student" varStatus="loop">
            <tr>
                <td><c:out value="${student.name}"/></td>
                <td><c:out value="${student.date}"/></td>
                <td><c:out value="${student.address}"/></td>
                <td><img src="${student.picture}"> </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
