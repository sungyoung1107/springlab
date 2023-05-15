<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 통화, 날짜 -->

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
                    <c:forEach var="c" items="${cpage.getList()}">
                        <tr>
                            <td><img src="/uimg/${c.imgname}" style="width:50px; height:50px"></td>
                            <td><a href="/item/get?id=${c.id}">${c.id}</a></td>
                            <td>${c.name}</td>
                            <td><fmt:formatNumber value="${c.price}" pattern="###,###원"/></td>
                            <td><fmt:formatDate value="${c.rdate}" pattern="yyyy-MM-dd"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <jsp:include page="../page.jsp"/>
            </div>
        </div>
    </div>
</div>
<%--</html>--%>