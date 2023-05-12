<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 통화, 날짜 -->

<script>
    let cart_form = {
        init : function(){}
    }
    $(function(){
        cart_form.init()
    })
</script>

<div class="col-sm-8 text-left">
    <div class="container">
        <div class="row content">
            <div class="col-sm-9 text-left">
                <h2>Cart All page</h2>
                <c:set var = "total" value="0"/>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>img</th>
                        <th>item_id</th>
                        <th>name</th>
                        <th>price</th>
                        <th>count</th>
                        <th>sum</th>
                        <th>regdate</th>
                        <th>delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${allcart}">
                        <tr>
                            <td><img src="/uimg/${obj.item_imgname}" style="width:50px; height:50px"></td>
                            <td>${obj.item_id}</td>
                            <td>${obj.item_name}</td>
                            <td><fmt:formatNumber value="${obj.item_price}" pattern="###,###원" /></td>
                            <td>${obj.cnt}</td>
                            <td>${obj.item_price * obj.cnt}</td>
                            <td><fmt:formatDate  value="${obj.rdate}" pattern="yyyy-MM-dd" /></td>
                            <td><a href="/item/delcart?id=${obj.id}" class="btn btn-info" role="button">delete</a></td>
                        </tr>
                        <c:set var="total" value="${total + (obj.item_price * obj.cnt)}"></c:set>
                    </c:forEach>
                    </tbody>
                </table>
                <h4><fmt:formatNumber value="${total}" pattern="###,###원"/></h4>
            </div>
        </div>
    </div>
</div>