<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<script type="text/javascript" src="<%=basePath%>js/jQuery_v3.1.1.min.js"></script>
<script type="text/javascript">
    $(function () {

        //登录验证
        $("#sub").click(function(){
            $.post("${pageContext.request.contextPath}/findById",{userName:$("#userName").val(),password:$("#password").val()},function (result) {
                if (result=="true"){
                    document.location="${pageContext.request.contextPath}/selectAll";
                }else{
                    alert("用户名或密码错误");
                    return false;
                }
            })
        })
    })
</script>
<body>
<h2><a href="${pageContext.request.contextPath}/selectAll">查询</a></h2>
<form id="userForm">
    用户名:<input type="text" id="userName" name="userName"><br>
    密码:<input type="text" id="password" name="password"><br>
    <input type="button" id="sub" name="sub" value="登录">
</form>
</body>
</html>
