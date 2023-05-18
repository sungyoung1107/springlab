<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">Stock Management</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="/">Dashboard</a></li>
        </ol>
        <div class="card mb-4">
            <div class="card-body">
                재고 관리
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                Stock Management
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                    <tr>
                        <th>제품 번호</th>
                        <th>제품 이름</th>
                        <th>제품 원가</th>
                        <th>제품 가격</th>
                        <th>실 재고수량</th>
                        <th>장바구니 수량</th>
                        <th>예상 재고잔여수량(실 재고수량-장바구니 수량)</th>
                        <th>비고</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>제품 번호</th>
                        <th>제품 이름</th>
                        <th>제품 원가</th>
                        <th>제품 가격</th>
                        <th>실 재고수량</th>
                        <th>장바구니 수량</th>
                        <th>예상 재고잔여수량</th>
                        <th>비고</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="obj" items="${slist}">
                        <tr>
                            <td><a  href="/stock/detail?id=${obj.product_id}">${obj.product_id}</a></td>
                            <td>${obj.product_name}</td>
                            <td><fmt:formatNumber value="${obj.product_costprice}" type="number"
                                                  pattern="###,###원"/></td>
                            <td><fmt:formatNumber value="${obj.product_price}" type="number" pattern="###,###원"/></td>
                            <td>${obj.product_amount}</td>
                            <td>${obj.cart_quantity}</td>
                            <td>${obj.product_expectedamount}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${obj.product_expectedamount == 0}">입고 필요</c:when>
                                    <c:when test="${obj.product_expectedamount lt 0}">재고 부족</c:when>
                                    <c:when test="${obj.product_expectedamount lt 10}">재고 충전 필요(예상 잔여 재고 10개 미만)</c:when>
                                    <c:otherwise>
                                        재고 충분함
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>