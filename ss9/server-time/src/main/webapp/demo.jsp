<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý sinh viên</title>
    <style>
        table{
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<h1>Danh sách sinh viên</h1>
<table border="1px">
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Giới tính</th>
        <th>Điểm</th>
    </tr>
    <c:forEach items="${list}" var="student" varStatus="loop">
        <tr>
            <td><c:out value="${loop.count}"/></td>
            <td><c:out value="${student.name}"/></td>
<%--            Gender--%>
            <c:if test="${student.gender == true}">
                <td>Nam</td>
            </c:if>
            <c:if test="${student.gender == false}">
                <td>Nữ</td>
            </c:if>

            <td><c:out value="${student.point}"/></td>
<%--            Point--%>
            <c:choose>
                <c:when test="${student.point >= 8}">
                    <td>Giỏi</td>
                </c:when>
                <c:when test="${student.point >= 6}">
                    <td>Khá</td>
                </c:when>
                <c:otherwise>
                    <td>Trung bình</td>
                </c:otherwise>
            </c:choose>

        </tr>
    </c:forEach>
</table>
</body>
</html>