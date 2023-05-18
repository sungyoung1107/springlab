<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">User All</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="/">Dashboard</a></li>
        </ol>
        <div class="card mb-4">
            <div class="card-body">
                전체 고객 조회
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                User All
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Contact</th>
                        <th>Address</th>
                        <th>Birth Date</th>
                        <th>Admin Check</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Contact</th>
                        <th>Address</th>
                        <th>Birth Date</th>
                        <th>Admin Check</th>
                    </tr>
                    </tfoot>
                    <tbody>
                        <c:forEach var ="obj" items="${clist}">
                            <tr>
                                <td><a href="/user/detail?id=${obj.user_id}">${obj.user_id}</a></td>
                                <td>${obj.user_name}</td>
                                <c:choose>
                                    <c:when test="${obj.user_gender eq 'M'}">
                                        <td>남자</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>여자</td>
                                    </c:otherwise>
                                </c:choose>
                                <td>${obj.user_contact}</td>
                                <td>${obj.user_address}</td>
                                <fmt:parseDate var="parsedDate" value="${obj.user_birthday}" pattern="yyyy-MM-dd HH:mm:ss" />
                                <td><fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd" /></td>
                                <c:choose>
                                    <c:when test="${obj.admin_check eq 0}">
                                        <td>고객</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>관리자</td>
                                    </c:otherwise>
                                </c:choose>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>