<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

</script>
<div class="col-sm-8 text-left">
    <div class="container">
        <h2>detail</h2>
        <img src="/uimg/${gmarker.img}">
        <h4>${gmarker.id}</h4>
        <h4><a href="${gmarker.target}">${gmarker.title}</a></h4><br>
        <div class="row content">
            <div class="col-sm-6 text-left">
                <h2>Menu</h2>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>img</th>
                        <th>item</th>
                        <th>price</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="c" items="${mlist}">
                        <tr>
                            <td><img src="/uimg/${c.imgname}" style="width:30px; height:30px"></td>
                            <td>${c.item}</td>
                            <td>${c.price}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<%--</html>--%>