<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

</script>
<div class="col-sm-8 text-left">
    <div class="container">
        <h2>JSP02</h2>
        <!-- if문 -->
        <c:if test="${rcust !=null}">
            <h4>${rcust.id}</h4>
            <c:if test ="${rcust.id == 'id01'}">
              <h4>콜센터 직원</h4>
            </c:if>
        </c:if>
        <!-- if-else문 -->
        <c:choose>
            <c:when test="{num == 3}">
                <h3>Num is 3</h3>
            </c:when>
            <c:when test="{num == 2}">
                <h3>Num is 2</h3>
            </c:when>
            <c:otherwise>
                <h3>Num is 1</h3>
            </c:otherwise>
        </c:choose>

        <h4>End page</h4>
    </div>
</div>
<%--</html>--%>