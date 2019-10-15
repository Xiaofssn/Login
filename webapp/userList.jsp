<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <c:forEach items="${userlist}" var="obj">
        <table>
            <tr>
                <td>${obj.id}</td>
                <td>${obj.userName}</td>
                <td>${obj.password}</td>
            </tr>
        </table>
    </c:forEach>
</body>
</html>
