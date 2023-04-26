<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://fonts.googleapis.com/css2?family=Bitter:wght@600&family=Nanum+Myeongjo:wght@800&display=swap"
      rel="stylesheet">

<script>

</script>

<div class="col-sm-8 text-left">
    <div class="container">
        <div class="row content">
            <div class="col-sm-6 text-left">
                <h2>Item All page</h2>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>img</th>
                        <th>id</th>
                        <th>name</th>
                        <th>price</th>
                        <th>regdate</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${allitem}">
                        <tr>
                            <td><img src="/uimg/${obj.imgname}" style="width:50px; height:50px"></td>
                            <td><a href="/item/get?id=${obj.id}">${obj.id}</a></td>
                            <td>${obj.name}</td>
                            <td><fmt:formatNumber value="${obj.price}" type="currency" /></td>
                            <td><fmt:formatDate  value="${obj.regdate}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<%--</html>--%>