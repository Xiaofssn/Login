<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <c:forEach items="${userlist}" var="obj" varStatus="count">
            <tr <c:if test="${count.index % 2 == 1 }">style="background-color:rgb(219,241,212);"</c:if>>
                <td id="userid${count.index}">${obj.id}</td>
                <td>${obj.userName}</td>
                <td>${obj.password}</td>
                <td><button id="updateUser${count.index}" value="${obj.id}" onclick="">修改</button></td>
                <td><button id="deleteUser${count.index}" value="${obj.id}" onclick="del(this)">删除</button></td>
            </tr>
    </c:forEach>
</table>
</body>
<script src="${pageContext.request.contextPath}/js/jQuery_v3.1.1.min.js" charset="utf-8"></script>
<script type="text/javascript">
    function del (e) {
        if(confirm("是否确定删除")){
            console.log("this:"+$(e).val());
            $.ajax({
                url:"${pageContext.request.contextPath}/deleteUser",
                data:{"id":$(e).val()},
                type:"POST",
                success:function (result) {
                    if(result){
                        document.location="${pageContext.request.contextPath}/selectAll";
                    }else{
                        alert("删除失败");
                    }
                }
            })
        }
    }
</script>
</html>
