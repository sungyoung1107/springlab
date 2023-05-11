<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script> // 되도록이면 single quotation

    // 문서가 준비되면~
    $(function(){
        jsp01.init(${num});
    })
</script>
<div class="col-sm-8 text-left">
    <div class="container">
        <h2 id="jsp01">JSP01</h2>
<%--        <h1>Num : ${num}</h1>--%>
<%--        <h1>cust : ${cust}</h1>--%>
<%--        <h1>custId : ${cust.id}</h1>   <!-- 이때는 반드시  getter가 있어야 함 -->--%>
<%--        <h1>custName : ${cust.name}</h1> <!-- 이때는 반드시  getter가 있어야 함 -->--%>
<%--        <h1>serverTime : ${cdate}</h1> <!-- 이때는 반드시  getter가 있어야 함 -->--%>
<%--        <h3>custName : <c:out value="${cust.name}"/>></h3> <!--JSP JSTL -->--%>
<%--        <h3><fmt:formatDate  value="${cdate}" pattern="yyyy-MM-dd hh:mm:ss" /></h3>--%>
<%--        <h3><fmt:parseNumber integerOnly="true" type="number" value="${num}" /></h3>--%>
<%--        <h3><fmt:formatNumber value="${num}" type="currency" /></h3>--%>
        <h3><fmt:formatNumber type="number" pattern="###.###$" value="${num}" /></h3>
        <h3>${num * 2}</h3>
        <h3><c:set var="mynum" value="${num * 3}"/></h3>
        <h5><c:out value="${mynum}"/></h5>
    </div>
</div>
<%--</html>--%>