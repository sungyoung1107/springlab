<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">Product inventory history management</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="/">Dashboard</a></li>
        </ol>
        <div class="card mb-4">
            <div class="card-body">
                상품 재고 이력 관리
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                Product inventory history management
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                    <tr>
                        <th>제품 번호</th>
                        <th>제품 원가</th>
                        <th>실 재고 수량</th>
                        <th>재고 등록(변경)일자</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>제품 번호</th>
                        <th>제품 원가</th>
                        <th>실 재고 수량</th>
                        <th>재고 등록(변경)일자</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="obj" items="${sdetail}">
                    <tr>
                        <td>${obj.product_id}</td>
                        <td><fmt:formatNumber value="${obj.product_costprice}" type="number"
                                              pattern="###,###원"/></td>
                        <td>${obj.product_amount}</td>
                        <td>${obj.stock_updateday}</td>
                        </c:forEach>
                    </tbody>
                </table>
                <div style="text-align: right">
                    <a href="/stock/add" class="btn btn-success">재고 등록(변경)</a>
                </div>
            </div>
        </div>
    </div>
</main>