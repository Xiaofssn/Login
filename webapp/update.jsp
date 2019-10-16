<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form>
    <table>

        <tr>
            <td id="userid">${obj.id}</td>
            <td id="userName">${obj.userName}</td>
            <td ><input id="password" type="text" value="${obj.password}"></td>
            <td>
                <button type="submit" id="update">修改</button>
            </td>
            <td>
                <button type="reset">删除</button>
            </td>
        </tr>
    </table>
</form>
</body>
<script src="${pageContext.request.contextPath}/js/jQuery_v3.1.1.min.js" charset="utf-8"></script>
<script type="text/javascript">
    $("#update").click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/updateUser",
            type:"POST",
            data:{
                "userName":$("#userName").text(),
                "password":$("#password").val()
            },
            success:function (result) {
                if(result){
                    alert("修改成功！");
                    document.location="${pageContext.request.contextPath}/selectAll";
                }else{
                    alert("修改失败！");
                    return false;
                }
            }
        })
    })
</script>
</html>
