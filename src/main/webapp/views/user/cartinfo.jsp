<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">User Cart Info</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="/">Dashboard</a></li>
        </ol>
        <div class="card mb-4">
            <div class="card-body">
                전체 카트 조회
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                User Cart Info
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Contact</th>
                        <th>PRODUCT ID</th>
                        <th>PRODUCT NAME</th>
                        <th>PRODUCT PRICE</th>
                        <th>PRODUCT QUANTITY</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Contact</th>
                        <th>PRODUCT ID</th>
                        <th>PRODUCT NAME</th>
                        <th>PRODUCT PRICE</th>
                        <th>PRODUCT QUANTITY</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="obj" items="${ccartlist}">
                        <tr>
                            <td>${obj.user_id}</td>
                            <td>${obj.user_name}</td>
                            <td>${obj.user_contact}</td>
                            <td>${obj.product_id}</td>
                            <td>${obj.product_name}</td>
                            <td>${obj.product_price}</td>
                            <td>${obj.cart_quantity}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>